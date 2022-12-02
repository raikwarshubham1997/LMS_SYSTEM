from django.urls import path
from . import views

urlpatterns = [

    path('leadsignup/', views.SignUp),
    path('get_users/', views.Get_all_users),
    path('userdetails/<int:id>/', views.UserDetails, name="view_detail"),
    path('new_lead/', views.CreateLeads),
    path('get_all_lead/', views.get_all_lead),
    path('show_leadinfo/<int:id>/', views.ShowLeadInfo, name='show_leadinfo'),
    path('edit_leadinfo/<int:id>/', views.EditLeadInfo, name='edit_leadinfo'),
    path('delete_leadinfo/<int:id>/', views.DeleteLeadInfo, name='delete_leadinfo'),

    path('upload_file/', views.simple_upload),
    path('export_lead/', views.Export_xlsx),
    path('demofile/', views.Demo_xlsx),
    


    path('call_logs_create/<int:id>/',views.CallLogs, name='call_log'),
    path('edit_loginfo/<int:id>/', views.Edit_callLog, name='edit_log'),
    path('delete_loginfo/<int:id>/', views.Delete_log, name='delete_log'),


    path('notes_create/<int:id>/',views.Notes_CallLogs, name='notes'),
    path('notes_edit/<int:id>/',views.Edit_Note, name='edit_notes'),
    
    

    path('', views.CompanyAdmin),
    path('addcompany/', views.AddCompany),
    path('showcompany/', views.ShowCompany),
    path('editcompany/<int:id>/', views.EditCompany, name='comp_edit'),
    path('delcompany/<int:id>/', views.DeleteCompany, name='del_comp'),

    path('country/', views.CreateCountry),
    path('showcountry/', views.ShowCountry),
    path('editcountry/<int:id>/', views.EditCountry, name='country_edit'),
    path('delcountry/<int:id>/', views.DeleteCountry, name='del_country'),

    path('state/', views.CreateState),
    path('showstate/', views.ShowState),
    path('editstate/<int:id>/', views.EditState, name='State_edit'),
    path('delstate/<int:id>/', views.DeleteState, name='del_State'),

    path('city/', views.CreateCity),
    path('showcity/', views.ShowCity),
    path('editcity/<int:id>/', views.EditCity, name='City_edit'),
    path('delcity/<int:id>/', views.DeleteCity, name='del_City'),
]