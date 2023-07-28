from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.contrib.auth import get_user_model
from django.shortcuts import render, redirect
from django.contrib import messages
from . import models

User = get_user_model()


def loginUser(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(request, username=username, password=password)
        if user is not None:
            if user.is_student:
                login(request, user)
                return redirect('View Categories Std')
            elif user.is_teacher:
                login(request, user)
                return redirect('View Categories')
        else:
            messages.error(request, "Invalid Username Or Password")
    return render(request, 'signIn.html')


def userLogout(request):
    logout(request)
    return redirect('SignIn')


def signUp(request):
    if request.method == 'POST':
        name = request.POST.get('name')
        email = request.POST.get('email')
        password = request.POST.get('password')
        confirmPassword = request.POST.get('confrimPassword')
        role = request.POST.get('role')
        address = request.POST.get('address')

        if password != confirmPassword:
            messages.warning(request, "Sorry Passwords Are Not Matched Try Again")
        else:
            if role == "Teacher":
                # Create a teacher
                teacher = User.objects.create_user(username=email, password=confirmPassword, is_teacher=True)
                teacher_profile = models.Teacher.objects.create(user=teacher, Name=name, Email=email, Address=address)
                teacher_profile.save()
                messages.success(request, "Teacher Record Has Been Added")

            if role == "Student":
                # Create a student
                student = User.objects.create_user(username=email, password=confirmPassword, is_student=True)
                student_profile = models.Student.objects.create(user=student, Name=name, Email=email, Address=address)
                student_profile.save()
                messages.success(request, "Student Record Has Been Added")
    return render(request, 'signUp.html')


@login_required(login_url='/Auth')
def add_category(request):
    if request.method == 'POST':
        name = request.POST.get('name')
        image = request.FILES['cimage']
        models.Cource_Category.objects.create(Category_Name=name, Image=image)
        messages.success(request, "Category Has Been Created")
    return render(request, 'Teacher/add_catagory.html')


@login_required(login_url='/Auth')
def view_categories(request):
    data = models.Cource_Category.objects.all()
    return render(request, 'Teacher/view_catagories.html', {'data': data})


@login_required(login_url='/Auth')
def update_category(request, id):
    data = models.Cource_Category.objects.get(id=id)
    if request.method == 'POST' and 'name' in request.POST:
        name = request.POST.get('name')
        image = request.POST.get('image')
        data.Category_Name = name
        data.Image = image
        data.save()
        messages.success(request, "Category Has Been Updated")
    if request.method == 'POST' and 'delCategory' in request.POST:
        data.delete()
        messages.error(request, "Category Has Been Deleted")
        return redirect('View Categories')
    return render(request, 'Teacher/update_catagory.html', {'data': data})


@login_required(login_url='/Auth')
def add_cource(request):
    if request.method == 'POST':
        courceCat = request.POST.get('courceCat')
        title = request.POST.get('title')
        price = request.POST.get('price')
        no_of_lec = request.POST.get('no_of_lec')
        cource_level = request.POST.get('course_level')
        content_duration = request.POST.get('content_duration')
        published = request.POST.get('published')
        subject = request.POST.get('subject')
        image = request.FILES['image']
        courceCatObj = models.Cource_Category.objects.get(Category_Name=courceCat)
        models.Course_Detail.objects.create(Course_Category=courceCatObj, Course_Title=title, Price=price,
                                            Number_of_lecturers=no_of_lec, Course_Level=cource_level,
                                            Content_Duration=content_duration, Timestamp='-', Published=published,
                                            Subject=subject, Image=image)
        messages.success(request, "Cource Has Been Added")
    data = models.Cource_Category.objects.all()
    return render(request, 'Teacher/add_cource.html', {'courceCat': data})


@login_required(login_url='/Auth')
def view_cource(request):
    data = models.Course_Detail.objects.all()
    return render(request, 'Teacher/view_cources.html', {'data': data})


@login_required(login_url='/Auth')
def update_cource(request, courseId):
    data = models.Course_Detail.objects.get(id=courseId)
    if request.method == 'POST' and 'title' in request.POST:
        courceCat = request.POST.get('courceCat')
        title = request.POST.get('title')
        price = request.POST.get('price')
        no_of_lec = request.POST.get('no_of_lec')
        cource_level = request.POST.get('course_level')
        content_duration = request.POST.get('content_duration')
        published = request.POST.get('published')
        subject = request.POST.get('subject')
        image = request.FILES['image']
        courceCatObj = models.Cource_Category.objects.get(Category_Name=courceCat)
        data.Course_Category = courceCatObj
        data.Course_Title = title
        data.Price = price
        data.Number_of_lecturers = no_of_lec
        data.Course_Level = cource_level
        data.Content_Duration = content_duration
        data.Timestamp = '-'
        if published:
            data.Published = published
        data.Subject = subject
        data.Image = image
        data.save()
        messages.success(request, "Cource Has Been Updated")
    if request.method == 'POST' and 'delCource' in request.POST:
        data.delete()
        messages.error(request, "Cource Has Been Deleted")
        return redirect('View Categories')
    cat = models.Cource_Category.objects.all()
    return render(request, 'Teacher/update_cource.html', {'data': data, 'cat': cat})


@login_required(login_url='/Auth')
def view_courseCategoriesStd(request):
    data = models.Cource_Category.objects.all()
    return render(request, 'Student/view_catagories.html', {'data': data})


@login_required(login_url='/Auth')
def view_courceStd(request):
    data = models.Course_Detail.objects.all()
    return render(request, 'Student/view_cources.html', {'data': data})
