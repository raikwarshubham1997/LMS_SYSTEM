from django.db import models
from django.contrib.auth.models import User
from datetime import *

# Create your models here.

class Country(models.Model):
    name = models.CharField(max_length=200)

    def __str__(self):
        return self.name


class State(models.Model):
    name = models.CharField(max_length=200)

    def __str__(self):
        return self.name

class City(models.Model):    
    # con_id = models.ForeignKey(County, on_delete=models.CASCADE, null=True)
    # st_id = models.ForeignKey(State, on_delete=models.CASCADE, null=True)
    name = models.CharField(max_length=200)

    def __str__(self):
        return self.name


class Company_Detail(models.Model):
    country = models.ForeignKey(Country, on_delete=models.CASCADE)
    state = models.ForeignKey(State, on_delete=models.CASCADE)
    city = models.ForeignKey(City, on_delete=models.CASCADE)
    owner = models.CharField(max_length=200)
    company_name = models.CharField(max_length=200)
    address = models.TextField(max_length=300)
    email = models.EmailField(max_length=200)
    phone_no =  models.CharField(max_length=12)


    def __str__(self):
        return self.company_name


class LeadCreate(models.Model):

    first_name = models.CharField(max_length=150)
    middle_name = models.CharField(max_length=150)
    last_name = models.CharField(max_length=150)
    gender = models.CharField(max_length=150)
    birthday =  models.DateField(max_length=150)
    email = models.EmailField(max_length=150)
    contact = models.CharField(max_length=12)
    alternat_no = models.CharField(max_length=12)
    address = models.CharField(max_length=300)
    permanent_address = models.CharField(max_length=500)
    intrested =  models.CharField(max_length=150)
    lead_sources = models.CharField(max_length=150)
    remarks =  models.TextField(max_length=500)
    assigned =  models.ForeignKey(User, on_delete=models.CASCADE)
    status =  models.CharField(max_length=150)
    date_create = models.DateField()
    # date_create = models.TimeField()


    def __str__(self):
        return self.first_name


class Call_Details(models.Model):
    cls = models.CharField(max_length=50)
    rem = models.CharField(max_length=250)
    str_dt = models.CharField(max_length=50)
    end_dt = models.DateTimeField(auto_now_add=True)
    led_id = models.ForeignKey(LeadCreate, on_delete=models.CASCADE)
    created_by = models.ForeignKey(User, on_delete=models.CASCADE)

    def __str__(self):
        return self.cls

class Notes_Details(models.Model):
    msg = models.CharField(max_length=500)
    date = models.DateTimeField(auto_now_add=True)
    led_id = models.ForeignKey(LeadCreate, on_delete=models.CASCADE)
    created_by = models.ForeignKey(User, on_delete=models.CASCADE)

    def __str__(self):
        return self.msg