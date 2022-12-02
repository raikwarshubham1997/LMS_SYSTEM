from django.shortcuts import render, redirect
from django.contrib.auth.models import User
from django.http import HttpResponse
from django.contrib.auth.hashers import make_password
from django.contrib.auth import authenticate, login, logout
from django.contrib import messages
from django.http import HttpResponse
from .models import *

def hello(request):
    return HttpResponse('Welcome! Leader')



def LeadAdmin(request):
    return render(request, "leads/index.html")
    # return HttpResponse("Welcome Admin")


def Emp_register(request):
    if request.method == "POST":
        username = request.POST['username']
        email = request.POST['email']
        password = request.POST['pwd']
        created_by = request.user.id
        print(created_by)

        emp = Employee_Register(username=username,email=email,password=password,created_by_id=created_by)
        emp.save()
        messages.success(request, f"{username} Employee Register Successful")
        return redirect('/leadadmin/register_emp/')
    else:
        return render(request, 'leads/signup.html')



