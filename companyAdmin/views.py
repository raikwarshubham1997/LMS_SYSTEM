from django.shortcuts import render, redirect
from .models import *
from django.contrib.auth.models import User
from django.contrib import messages
from datetime import datetime
from django.utils import timezone
from django.contrib.auth.hashers import make_password
from django.contrib.auth import authenticate, login, logout
from django.core.mail import send_mail
from django.db.models import Q
from django.http import HttpResponseRedirect
from .resources import LeadResource
from tablib import Dataset
from django.http import HttpResponse
import xlwt

#show all user's
def Get_all_users(request):
    my_users = User.objects.all()
            
    return render(request, "comAdmin/users.html", {'my_users':my_users})


def UserDetails(request, id):
    getData  = User.objects.get(id=id)            
    return render(request, "comAdmin/users_detail.html", {'getData':getData})


def simple_upload(request):
    if request.method == "POST":
        lead_resource = LeadResource()
        dataset = Dataset()
        new_lead = request.FILES['myfile']

        if not new_lead.name.endswith('xlsx'):
            messages.info(request, 'Wrong file must be xlsx format!!')
            return render(request, 'comAdmin/upload_csv.html')
            
        
        
        imported_data = dataset.load(new_lead.read(),format='xlsx')
        for data in imported_data:
            print(data)
            print('this',request.user.id)
            value = LeadCreate(
                data[0],
                data[1],
                data[2],
                data[3],
                data[4],
                data[5],
                data[6],
                data[7],
                data[8],
                data[9],
                data[10],
                data[11],
                data[12],
                data[13],
                data[14],
                data[15]
                
                )
            value.save()
        messages.success(request, "File Uploaded Successfull...")
    return render(request, "comAdmin/upload_csv.html")


'''Function for Export X '''

def Export_xlsx(request):
    response = HttpResponse(content_type='application/ms-excel')   #– This tells browsers that the document is an MS-EXCEL file, instead of an HTML file.
    response['Content-Disposition']= 'attachment; filename="leads.xls"'  #This contains CSV filename and downloads files with that name.

    wb = xlwt.Workbook(encoding='utf-8')         # Creating a Workbook of encoding utf-8
    ws = wb.add_sheet('Leads')                 # Creating a Sheet named “Leads” and all the data will be written inside this sheet.

    # sheet header, first row
    row_num = 0

    font_style = xlwt.XFStyle()
    font_style.font.bold= True

    columns = ['id','first_name', 'middle_name','last_name', 'gender', 'birthday', 'email', 'contact', 'alternat_no','address', 'permanent_address', 'intrested','lead_sources','remarks','assigned','status','date_create']

    for col_num in range(len(columns)):
        ws.write(row_num, col_num, columns[col_num], font_style)

    #sheet body, remaining rows
    font_style =xlwt.XFStyle()

    rows = LeadCreate.objects.all().values_list('id','first_name', 'middle_name','last_name', 'gender', 'birthday', 'email', 'contact', 'alternat_no','address', 'permanent_address', 'intrested','lead_sources','remarks','assigned','status','date_create')
    for row in rows:
        row_num += 1
        for col_num in range(len(row)):
            ws.write(row_num, col_num, row[col_num], font_style)

    wb.save(response)
    return response


def Demo_xlsx(request):
    response = HttpResponse(content_type='application/ms-excel')   #– This tells browsers that the document is an MS-EXCEL file, instead of an HTML file.
    response['Content-Disposition']= 'attachment; filename="leads.xls"'  #This contains CSV filename and downloads files with that name.

    wb = xlwt.Workbook(encoding='utf-8')         # Creating a Workbook of encoding utf-8
    ws = wb.add_sheet('Leads')                 # Creating a Sheet named “Leads” and all the data will be written inside this sheet.

    # sheet header, first row
    row_num = 0

    font_style = xlwt.XFStyle()
    font_style.font.bold= True

    columns = ['id','first_name', 'middle_name','last_name', 'gender', 'birthday', 'email', 'contact', 'alternat_no','address', 'permanent_address', 'intrested','lead_sources','remarks','assigned','status','date_create']

    for col_num in range(len(columns)):
        ws.write(row_num, col_num, columns[col_num], font_style)

    #sheet body, remaining rows
    font_style =xlwt.XFStyle()

    
    wb.save(response)
    return response
        


"""

Code for lead creation Update Show Delete
"""


def CreateLeads(request):
    my_users = User.objects.all()
    if request.method == 'POST':
        fnm = request.POST['fname']
        mnm = request.POST['mname']
        lnm = request.POST['lname']
        gen = request.POST['gender']
        dob = request.POST['dob']
        email = request.POST['email']
        contact = request.POST['contact']
        alt_contact = request.POST['acontact']
        address = request.POST['address']
        per_address = request.POST['paddress']
        intr = request.POST['intrest']
        lesor = request.POST['leadsource']
        rem = request.POST['remark']
        ass = request.POST['assigned_id']
        status = request.POST['status']
        date = datetime.now()
        print(date)
        

        if LeadCreate.objects.filter(email=email).exists():
                messages.info(request, 'Username is already taken')
                return redirect('/superadmin/new_lead/')
        else:
            ulead = LeadCreate(first_name=fnm,
                            middle_name=mnm,
                            last_name=lnm,
                            gender=gen,
                            birthday=dob,
                            email=email,
                            contact=contact,
                            alternat_no=alt_contact,
                            address=address,
                            permanent_address=per_address,
                            intrested=intr,
                            lead_sources=lesor,
                            remarks=rem,
                            assigned_id=ass,
                            status=status,
                            date_create=date)
            ulead.save()
            messages.success(request, "Lead Created Successfully")
            return redirect('/superadmin/new_lead/')
    
    else:
        return render(request, "comAdmin/new_lead_info.html", {'my_users': my_users})







def get_all_lead(request):
    if 'q' in request.GET:
        q = request.GET['q']
        # print(q)
        # data = Data.objects.filter(last_name__icontains=q)
        multiple_q = Q(Q(first_name__icontains=q) | Q(lead_sources__icontains=q) | Q(status__icontains=q) | Q(intrested__icontains=q))
        cobjs = LeadCreate.objects.filter(multiple_q)
    else:
        cobjs = LeadCreate.objects.all().order_by("id").reverse()

    all_lead = LeadCreate.objects.all()
    # for i in all_lead:
    #     print(i)
    return render(request, "comAdmin/list_of_leads.html",{'all_lead':all_lead, 'cobjs':cobjs})

# Admin Registration

def ShowLeadInfo(request, id):
    data = LeadCreate.objects.get(id=id)
    return render(request, "comAdmin/show_lead_info.html", {'data':data})


def EditLeadInfo(request, id):
    my_users = User.objects.all()
    print(my_users)
    if request.method == 'POST':
        fnm = request.POST['fname']
        mnm = request.POST['mname']
        lnm = request.POST['lname']
        gen = request.POST['gender']
        dob = request.POST['dob']
        email = request.POST['email']
        contact = request.POST['contact']
        alt_contact = request.POST['acontact']
        address = request.POST['address']
        per_address = request.POST['paddress']
        intr = request.POST['intrest']
        lesor = request.POST['leadsource']
        rem = request.POST['remark']
        ass = request.POST['assigned_id']
        status = request.POST['status']
        date = datetime.now()
        # led_id = LeadCreate.objects.get(id=id)
        
        uplead = LeadCreate.objects.filter(id=id)
        
        uplead.update(first_name=fnm,
                            middle_name=mnm,
                            last_name=lnm,
                            gender=gen,
                            birthday=dob,
                            email=email,
                            contact=contact,
                            alternat_no=alt_contact,
                            address=address,
                            permanent_address=per_address,
                            intrested=intr,
                            lead_sources=lesor,
                            remarks=rem,
                            assigned_id=ass,
                            status=status,
                            date_create=date)
        messages.success(request, f"{fnm} Lead Updated Successfully")
        # return redirect('/superadmin/edit_leadinfo//')
        return redirect(request.META.get('HTTP_REFERER', 'redirect_if_referer_not_found'))  
    else:
        mylead = LeadCreate.objects.get(id=id)    
        return render(request, "comAdmin/lead_info_edit.html", {'mylead':mylead, 'my_users':my_users})


def DeleteLeadInfo(request, id):
    data = LeadCreate.objects.get(id=id)
    data.delete()
    messages.success(request, f"{data.remarks}Lead Deleted Succsessfull")
    return redirect('/superadmin/get_all_lead/')




# def CallLogs(request, id):
    
#     if request.method == 'POST':
#         ltype = request.POST['ltype']
#         remark = request.POST['remark']
#         starttime = request.POST['starttime']
#         endtime = datetime.now()
#         # print(endtime)
#         ledId =LeadCreate.objects.get(id=id)
#         usr = User.objects.get(id=request.user.id)
#         # print(ledId, usr)
#         if Call_Details.objects.filter(led_id=ledId).exists():
#             messages.info(request, 'Call Log is already taken')
#             return redirect('/superadmin/get_all_lead/')

#         logobj = Call_Details(cls=ltype,rem=remark,str_dt=starttime,end_dt=endtime,led_id=ledId,created_by=usr)
#         logobj.save()
#         messages.success(request, "Your Log Created Successfully..")
#         return redirect('/superadmin/get_all_lead/')

#     else:
#         x = datetime.now().time()
#         current_time = x.strftime("%H:%M:%S")
#         redir = LeadCreate.objects.get(id=id)

#         return render(request, "comAdmin/call_logs_feedback.html",{"datet":current_time, 'redir':redir})


def CallLogs(request, id):
    
    if request.method == 'POST':
        ltype = request.POST['ltype']
        remark = request.POST['remark']
        starttime = request.POST['starttime']
        endtime = datetime.now()
        # print(endtime)
        ledId =LeadCreate.objects.get(id=id)
        usr = User.objects.get(id=request.user.id)
        # print(ledId, usr)
        if Call_Details.objects.filter(led_id=ledId).exists():
            messages.info(request, 'Call Log is already taken')
            return redirect('/superadmin/get_all_lead/')
        
        logobj = Call_Details(cls=ltype,rem=remark,str_dt=starttime,end_dt=endtime,led_id=ledId,created_by=usr)
        logobj.save()
        print(logobj.end_dt)
        messages.success(request, "Your Log Created Successfully..")
        return redirect('/superadmin/get_all_lead/')

    else:
        x = datetime.now().time()
        current_time = x.strftime("%I:%M:%S")
        redir = LeadCreate.objects.get(id=id)          # get lead id 
        iflog = Call_Details.objects.filter(led_id=redir)   # filter by lead id check call log available or not
        print(iflog)
        return render(request, "comAdmin/call_logs_feedback.html",{"datet":current_time, 'iflog':iflog})



def Edit_callLog(request, id):
    if request.method == 'POST':
        ltype = request.POST['ltype']
        remark = request.POST['remark']
        # starttime = request.POST['starttime']
        # endtime = request.POST['endtime']
        # print(endtime)
        # ledId =LeadCreate.objects.filter(id=id)
        # usr = User.objects.get(id=request.user.id)
        # print(ledId, usr)
        # if Call_Details.objects.filter(led_id=ledId).exists():
        #     messages.info(request, 'Call Log is already taken')
        #     return redirect('/superadmin/get_all_lead/')
        log_uplead = Call_Details.objects.filter(id=id)
        log_uplead.update(cls=ltype,rem=remark)              #str_dt=starttime,end_dt=endtime
        
        messages.success(request, "Your Log Created Successfully..")
        return redirect('/superadmin/get_all_lead/')

    else:
        print("Wrking this")
        # ab = LeadCreate.objects.filter(id=id)
        # print(ab)
        ab = Call_Details.objects.get(id=id)    
        print(ab.cls) 
        return render(request, "comAdmin/call_logs_edit.html",{'ab':ab})


def Delete_log(request, id):
    data = Call_Details.objects.get(id=id)
    data.delete()
    messages.success(request, f"{data.remarks}Lead Deleted Succsessfull")
    return redirect('/superadmin/get_all_lead/')


def Notes_CallLogs(request, id):
    
    if request.method == 'POST':
        msg = request.POST['message']
        wirtetime = datetime.now()
        ledId =LeadCreate.objects.get(id=id)
        usr = User.objects.get(id=request.user.id)
        # print(ledId, usr)
        if Notes_Details.objects.filter(led_id=ledId).exists():
            messages.info(request, 'Note Log is already taken')
            return redirect('/superadmin/get_all_lead/')
        
        noteobj = Notes_Details(msg=msg,date=wirtetime,led_id=ledId,created_by=usr)
        noteobj.save()
        # print(noteobj.date)
        messages.success(request, f"Note Write by {usr} Successfully")
        return redirect('/superadmin/get_all_lead/')

    else:
        x = datetime.now().time()
        current_time = x.strftime("%I:%M:%S")
        redir = LeadCreate.objects.get(id=id)          # get lead id 
        iflog = Notes_Details.objects.filter(led_id=redir)   # filter by lead id check call log available or not
        print(iflog)
        return render(request, "comAdmin/add_note.html",{"datet":current_time, 'iflog':iflog})



def Edit_Note(request, id):
    if request.method == 'POST':
        msg = request.POST['message']
        wirtetime = datetime.now()
        
        log_uplead = Notes_Details.objects.filter(id=id)
        log_uplead.update(msg=msg,date=wirtetime)              #str_dt=starttime,end_dt=endtime
        
        messages.success(request, "Your Note Updated Successfull..")
        return redirect('/superadmin/get_all_lead/')

    else:
       
        data = Notes_Details.objects.get(id=id)    
        print(data.msg) 
        return render(request, "comAdmin/note_edit.html",{'data':data})



def Delete_log(request, id):
    data = Notes_Details.objects.get(id=id)
    data.delete()
    messages.success(request, f"{data.msg}Lead Deleted Succsessfull")
    return redirect('/superadmin/get_all_lead/')




def SignUp(request):
    if request.method == 'POST':
        name = request.POST['fname']
        lname = request.POST['lname']
        email = request.POST['email']
        username = request.POST['username']
        password = request.POST['pwd']
        date = datetime.now()
        
        if User.objects.filter(username=username).exists():
                messages.info(request, 'Username is already taken')
                return redirect('/leadsignup/')
        elif User.objects.filter(email=email).exists():
            messages.info(request, 'Email is already taken')
            return redirect('/superadmin/leadsignup/')
        else:
            uobj = User(first_name=name, last_name=lname, email=email, username=username, password=make_password(password), is_manager=True, date_joined=date)
            uobj.save()
            data= uobj.first_name
            messages.success(request, f"{data} Your Account Has Been Created!")
            send_mail(
                    'Response Mail',
                    f'Hi {name} \nWeclcome to Our Lead Management System Your Leader Account Has been Created successfully.\nUsername: {username}\nPassword: {password}',
                    'techpanda.sr@gmail.com',
                    [email],
                    fail_silently=False,
                )
            return redirect('/superadmin/leadsignup/')
    else:
        return render(request, 'comAdmin/ledsignup.html')



def CompanyAdmin(request):
    users = User.objects.all().count()
    leds = LeadCreate.objects.all().count()
    call = Call_Details.objects.all().count()
    
    return render(request, "comAdmin/dashboard.html", {'users':users,'leds':leds,'call':call})


def AddCompany(request):
    data01 = Country.objects.all()
    data02 = State.objects.all()
    data03 = City.objects.all()
    if request.method == "POST":
        owner = request.POST['name']
        company = request.POST['company']
        country = request.POST['country_id']
        state = request.POST['state_id']
        city = request.POST['city_id']
        address = request.POST['address']
        email = request.POST['email']
        phone = request.POST['phone']

        comp_obj = Company_Detail(owner=owner,company_name=company,email=email,phone_no=phone,address=address,city_id=city,country_id=country,state_id=state)
        comp_obj.save()
        messages.success(request, "Company Create Successfull!!!!")
        return redirect('/superadmin/showcompany/')
    else:
        return render(request, "comAdmin/add_companies.html",{'data01':data01,'data02':data02,'data03':data03})

def ShowCompany(request):
    all_company = Company_Detail.objects.all()
    return render(request, "comAdmin/show_companies.html",{'all_company':all_company})

def EditCompany(request, id):
    data01 = Country.objects.all()
    data02 = State.objects.all()
    data03 = City.objects.all()
    if request.method == "POST":
        owner = request.POST['name']
        company = request.POST['company']
        country = request.POST['country_id']
        state = request.POST['state_id']
        city = request.POST['city_id']
        address = request.POST['address']
        email = request.POST['email']
        phone = request.POST['phone']
        
        myobj = Company_Detail.objects.filter(id=id)
        myobj.update(owner=owner,company_name=company,email=email,phone_no=phone,address=address,city_id=city,country_id=country,state_id=state)
        messages.success(request, "Company Updated Successfull!!!!")
        return redirect('/superadmin/showcompany/')
    else:
        data = Company_Detail.objects.get(id=id)
        return render(request, "comAdmin/companies_update.html", {'data':data,'data01':data01,'data02':data02,'data03':data03})


def DeleteCompany(request, id):
    conobj = Company_Detail.objects.get(id=id)
    conobj.delete()
    messages.success(request, "Data has been deleted")
    return redirect('/superadmin/showcompany/')
   



# Country features

def CreateCountry(request):
    if request.method == "POST":
        country = request.POST['name']

        if Country.objects.filter(name=country).exists():
            messages.info(request, 'Country is already taken')
            return redirect('/superadmin/country/')
        else:
            cobj = Country(name=country)
            cobj.save()
            messages.success(request, "Country Has Been Added")
            return redirect('/superadmin/country/')
    else:
        return render(request, "comAdmin/add_country.html")


def ShowCountry(request):
    data = Country.objects.all()
    return render(request, "comAdmin/show_country.html", {'data': data})


def EditCountry(request, id):
    if request.method == "POST":
        country = request.POST['country']
        if Country.objects.filter(name=country).exists():
            messages.info(request, 'Country is already taken')
            return redirect('/superadmin/showcountry/')
        else:
            conobj = Country.objects.filter(id=id)
            conobj.update(name=country)
            messages.success(request, "Country Has Been Updated")
            return redirect('/superadmin/showcountry/')
    else:
        c = Country.objects.get(id=id)
        # print(c.name)
        return render(request, "comAdmin/country_update.html", {'c':c})


def DeleteCountry(request, id):
    conobj = Country.objects.get(id=id)
    conobj.delete()
    messages.success(request, "Data has been deleted")
    return redirect('/superadmin/showcountry/')



# state features

def CreateState(request):
    con_data = Country.objects.all()
    if request.method == "POST":
        statenm = request.POST['name']
        # country = request.POST['country_id']
        

        if State.objects.filter(name=statenm).exists():
            messages.info(request, 'State is already taken')
            return redirect('/superadmin/state/')
        else:
            cobj = State(name=statenm)
            cobj.save()
            messages.success(request, "State Has Been Added")
            return redirect('/superadmin/state/')
    else:
        return render(request, "comAdmin/add_state.html", {'con_data': con_data})


def ShowState(request):
    data2 = State.objects.all()
    return render(request, "comAdmin/show_state.html", {'data2':data2})


def EditState(request, id):
    # con_data = Country.objects.all()
    if request.method == "POST":
        state = request.POST['name']
        # country = request.POST['country_id']
        if Country.objects.filter(name=state).exists():
            messages.info(request, 'State is already taken')
            return redirect('/superadmin/showstate/')
        else:
            conobj = State.objects.filter(id=id)
            conobj.update(name=state)
            messages.success(request, "Country Has Been Updated")
            return redirect('/superadmin/showstate/')
    else:
        data2 = State.objects.get(id=id)
        print(data2.con_id)
        return render(request, "comAdmin/state_update.html", {'data2':data2})


def DeleteState(request, id):
    conobj = State.objects.get(id=id)
    conobj.delete()
    messages.success(request, "Data has been deleted")
    return redirect('/superadmin/showstate/')
    # return render(request, "comAdmin/show_state.html")



# city features

def CreateCity(request):
    if request.method == "POST":
        city = request.POST['name']
        

        if City.objects.filter(name=city).exists():
            messages.info(request, 'City is already taken')
            return redirect('/superadmin/city/')
        else:
            cobj = City(name=city)
            cobj.save()
            messages.success(request, "City Has Been Added")
            return redirect('/superadmin/city/')
    else:
        return render(request, "comAdmin/add_city.html")
    # return render(request, "comAdmin/add_city.html")


def ShowCity(request):
    city_data = City.objects.all()
    return render(request, "comAdmin/show_city.html", {'city_data':city_data})


def EditCity(request, id):
    
    if request.method == "POST":
        city = request.POST['name']
        if Country.objects.filter(name=city).exists():
            messages.info(request, 'City is already taken')
            return redirect('/superadmin/showcity/')
        else:
            conobj = City.objects.filter(id=id)
            conobj.update(name=city)
            messages.success(request, "City Has Been Updated")
            return redirect('/superadmin/showcity/')
    else:
        data2 = City.objects.get(id=id)
        # print(data2.con_id)
        return render(request, "comAdmin/city_update.html", {'data2':data2})
    # return render(request, "comAdmin/city_update.html")


def DeleteCity(request, id):
    conobj = City.objects.get(id=id)
    conobj.delete()
    messages.success(request, "Data has been deleted")
    return redirect('/superadmin/showcity/')
    return render(request, "comAdmin/show_city.html")


