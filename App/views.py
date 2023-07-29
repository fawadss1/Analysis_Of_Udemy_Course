from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.contrib.auth import get_user_model
from django.shortcuts import render, redirect
from django.contrib import messages
from . import models
import datetime

User = get_user_model()

x = datetime.datetime.now()
todayDate = x.strftime('%Y-%m-%d')


def loginUser(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(request, username=username, password=password)
        if user is not None:
            if user.is_student:
                login(request, user)
                return redirect('Std Dashboard')
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
        name = request.POST.get('name').title()
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
        name = request.POST.get('name').title()
        image = request.FILES['image']
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
        timestamp = request.POST.get('timeStamp')
        date = request.POST.get('date')
        subject = request.POST.get('subject')
        image = request.FILES['image']
        courceCatObj = models.Cource_Category.objects.get(Category_Name=courceCat)
        models.Course_Detail.objects.get_or_create(Course_Category=courceCatObj, Course_Title=title, Price=price,
                                                   Number_of_lecturers=no_of_lec, Course_Level=cource_level,
                                                   Content_Duration=content_duration, Timestamp=timestamp,
                                                   Published=published, Date=date, Subject=subject, Image=image,
                                                   No_of_Subscribers=0, No_of_Reviews=0)
        messages.success(request, "Cource Has Been Added")
        return redirect('View Cource')
    data = models.Cource_Category.objects.all()
    return render(request, 'Teacher/add_cource.html', {'courceCat': data})


@login_required(login_url='/Auth')
def view_courses(request):
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
        date = request.POST.get('date')
        time_stamp = request.POST.get('timeStamp')
        subject = request.POST.get('subject')
        image = request.FILES['image']
        courceCatObj = models.Cource_Category.objects.get(Category_Name=courceCat)
        data.Course_Category = courceCatObj
        data.Course_Title = title
        data.Price = price
        data.Number_of_lecturers = no_of_lec
        data.Course_Level = cource_level
        data.Content_Duration = content_duration
        data.Timestamp = time_stamp
        data.Date = date
        data.Published = published
        data.Subject = subject
        data.Image = image
        data.save()
        messages.success(request, "Cource Has Been Updated")
    if request.method == 'POST' and 'delCource' in request.POST:
        data.delete()
        messages.error(request, "Cource Has Been Deleted")
        return redirect('View Cource')
    cat = models.Cource_Category.objects.all()
    return render(request, 'Teacher/update_cource.html', {'data': data, 'cat': cat})


@login_required(login_url='/Auth')
def te_view_fee_paid(request):
    feeObj = models.FeePaid.objects.all()
    return render(request, 'Teacher/paid_fee.html', {'fee': feeObj})


@login_required(login_url='/Auth')
def te_view_feedback(request):
    feedbacks = models.Feedback.objects.all()
    return render(request, 'Teacher/feed_backs.html', {'feedbacks': feedbacks})


####################################################Teacher End ###########################################
@login_required(login_url='/Auth')
def std_dashboard(request):
    stdObj = models.Student.objects.get(user=request.user)
    return render(request, 'Student/dashboard.html', {'stdData': stdObj})


@login_required(login_url='/Auth')
def std_categories(request):
    data = models.Cource_Category.objects.all()
    return render(request, 'Student/view_categories.html', {'categories': data})


@login_required(login_url='/Auth')
def std_cources(request, catId):
    courseCat = ''
    stdObj = models.Student.objects.get(user=request.user)
    subsData = models.Subsribe.objects.filter(Course__Course_Category_id=catId, Student=stdObj)
    if request.method == 'POST':
        course = request.POST.get('course')
        if subsData:
            courseObj = models.Course_Detail.objects.get(Course_Title=course)
            courseObj.No_of_Subscribers -= 1
            courseObj.save()
            delsubs = models.Subsribe.objects.filter(Course=courseObj, Student=stdObj)
            delsubs.delete()
            messages.error(request, f"You Have Successfully Un Subscribed ({course})")
        else:
            courseObj = models.Course_Detail.objects.get(Course_Title=course)
            courseObj.No_of_Subscribers += 1
            courseObj.save()
            models.Subsribe.objects.get_or_create(Date=todayDate, Course=courseObj, Student=stdObj)
            messages.success(request, f"You Have Successfully Subscribed ({course})")
    data = models.Course_Detail.objects.filter(Course_Category=catId)
    context = {'data': data, 'subsData': subsData}
    return render(request, 'Student/view_cources.html', context)


@login_required(login_url='/Auth')
def std_course_detial(request, courseId):
    stdObj = models.Student.objects.get(user=request.user)
    course = models.Course_Detail.objects.get(id=courseId)
    reviews = models.Feedback.objects.filter(Course=course).order_by('-id')
    subsData = models.Subsribe.objects.filter(Course=course, Student=stdObj)
    if request.method == "POST" and 'subscribe' in request.POST:
        if subsData:
            course.No_of_Subscribers -= 1
            course.save()
            delsubs = models.Subsribe.objects.filter(Course=course, Student=stdObj)
            delsubs.delete()
            messages.error(request, f"You Have Unsubscribed ({course})")
        else:
            course.No_of_Subscribers += 1
            course.save()
            models.Subsribe.objects.get_or_create(Date=todayDate, Course=course, Student=stdObj)
            messages.success(request, f"You Have Subscribed ({course})")

    if request.method == "POST" and 'comments' in request.POST:
        comments = request.POST.get('comments')
        rating = request.POST.get('rating')
        if rating == '':
            rating = 0
        models.Feedback.objects.get_or_create(Course=course, Student=stdObj, Comments=comments, Rating=rating)
        course.No_of_Reviews += 1
        course.save()
        messages.success(request, f"Your Feedback Has Been Submited Successfully")
    context = {'course': course, 'reviews': reviews, 'subsData': subsData}
    return render(request, 'Student/view_cources_detail.html', context)


@login_required(login_url='/Auth')
def pay_fee(request, course):
    course = models.Course_Detail.objects.get(id=course)
    stdObj = models.Student.objects.get(user=request.user)
    if request.method == "POST":
        iban = request.POST.get('iban')
        amount = request.POST.get('amount')
        models.FeePaid.objects.get_or_create(Course=course, Student=stdObj, Amount=amount, IBAN=iban)
        messages.success(request, f"Your Payment Has Been Completed Successfully")
    return render(request, 'Student/pay_fee.html', {'course': course, 'stdObj': stdObj})


@login_required(login_url='/Auth')
def std_view_fee(request):
    stdObj = models.Student.objects.get(user=request.user)
    feeObj = models.FeePaid.objects.filter(Student=stdObj)
    return render(request, 'Student/paid_fee.html', {'fee': feeObj, 'std': stdObj})
