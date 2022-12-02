from django.urls import path
from . import views

urlpatterns = [    
    path('', views.LeadAdmin),
    path('register_emp/', views.Emp_register),
    
    
]