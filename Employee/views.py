from django.shortcuts import render, redirect
from django.http import HttpResponse
from LeadAdmin.models import *
from django.contrib.auth import authenticate,login,logout
from django.contrib import messages
import mysql.connector
from operator import itemgetter
from .models import Worker_Register
# Create your views here.

def Employee(request):
    return render(request,"emp/helloemp.html")


def login_emp(req):
    con = mysql.connector.connect(host="localhost", user="root", password="", database="lead_systems")
    cursor = con.cursor()
    con2 = mysql.connector.connect(host="localhost", user="root", password="", database="lead_systems")
    cursor2 = con2.cursor()
    

    sqlcommand = "select username from leadadmin_employee_register"
    sqlcommand2 = "select password from leadadmin_employee_register"
    cursor.execute(sqlcommand)
    cursor2.execute(sqlcommand2)

    e =[]
    p= []
    for i in cursor:
        e.append(i)
    for j in cursor2:
        p.append(j)

    res = list(map(itemgetter(0), e))
    res2 = list(map(itemgetter(0), p))
    print(res)
    print(res2)
    if req.method == "POST":
        username = req.POST['username']
        password = req.POST['password']
        i = 1
        k=len(res)
        while i < k:
            if res[i]==username and res2[i]==password:
                return render(req, 'emp/helloemp.html', {'username':username})
                break
            i+=1
        else:
            messages.info(req, "Check username or password")
            return redirect('/employees/emplogin/')
    return render(req, 'emp/login.html')

       
def logout_call(request):
	logout(request)
	return redirect('/login/')



# Login SYSTEM for Worker 

def Worker_register(request):
    user = Employee_Register.objects.filter(id=4)
    print(user)
    if request.method == "POST":
        username = request.POST['username']
        email = request.POST['email']
        password = request.POST['pwd']
        create_by = request.POST['create']
        

        emp = Worker_Register(username=username,email=email,password=password,create_by_id=create_by)
        emp.save()
        messages.success(request, f"{username} Employee Register Successful")
        return redirect('/employees/register_user/')
    else:
        return render(request, 'emp/signup.html', {'user':user})