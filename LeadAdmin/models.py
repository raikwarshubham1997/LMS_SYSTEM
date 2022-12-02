from django.db import models
from django.contrib.auth.models import User

# Create your models here.
class Employee_Register(models.Model):
    created_by = models.ForeignKey(User, on_delete=models.CASCADE)
    username = models.CharField(max_length=50)
    email =  models.EmailField(max_length=200)
    password = models.CharField(max_length=30)