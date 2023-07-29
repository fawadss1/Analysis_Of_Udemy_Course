from django.db import models
from django.contrib.auth.models import AbstractUser


class CustomUser(AbstractUser):
    is_teacher = models.BooleanField(default=False)
    is_student = models.BooleanField(default=False)


class Cource_Category(models.Model):
    Category_Name = models.CharField(max_length=30)
    Image = models.ImageField(upload_to='Cource_Category', blank=True)

    def __str__(self):
        return self.Category_Name


class Course_Detail(models.Model):
    Course_Category = models.ForeignKey(Cource_Category, on_delete=models.CASCADE)
    Course_Title = models.CharField(max_length=50)
    Price = models.IntegerField()
    Number_of_lecturers = models.IntegerField()
    Course_Level = models.CharField(max_length=50)
    Content_Duration = models.CharField(max_length=50)
    Published = models.CharField(max_length=20)
    Timestamp = models.CharField(max_length=50)
    Date = models.DateField(auto_now=False)
    Subject = models.CharField(max_length=50)
    Image = models.ImageField(upload_to='Cource', blank=True)
    No_of_Subscribers = models.IntegerField()
    No_of_Reviews = models.IntegerField()

    def __str__(self):
        return self.Subject


class Teacher(models.Model):
    user = models.ForeignKey(CustomUser, on_delete=models.CASCADE)
    Name = models.CharField(max_length=25)
    Email = models.EmailField(unique=True)
    Address = models.CharField(max_length=50)

    def __str__(self):
        return self.Name


class Student(models.Model):
    user = models.ForeignKey(CustomUser, on_delete=models.CASCADE)
    Name = models.CharField(max_length=25)
    Email = models.EmailField(unique=True)
    Address = models.CharField(max_length=50)

    def __str__(self):
        return self.Name


class FeePaid(models.Model):
    Date = models.DateTimeField(auto_now=True)
    Course = models.ForeignKey(Course_Detail, on_delete=models.CASCADE)
    Student = models.ForeignKey(Student, on_delete=models.CASCADE)
    Amount = models.IntegerField()
    IBAN = models.IntegerField()


class Subsribe(models.Model):
    Date = models.DateField()
    Course = models.ForeignKey(Course_Detail, on_delete=models.CASCADE)
    Student = models.ForeignKey(Student, on_delete=models.CASCADE)

    def __str__(self):
        return f'{self.Student}, {self.Course}'


class Feedback(models.Model):
    Date = models.DateTimeField(auto_now=True)
    Course = models.ForeignKey(Course_Detail, on_delete=models.CASCADE)
    Student = models.ForeignKey(Student, on_delete=models.CASCADE)
    Comments = models.CharField(max_length=100)
    Rating = models.IntegerField()

    def __str__(self):
        return f'{self.Student}, {self.Course}'
