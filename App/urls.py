from django.views.generic import RedirectView
from django.conf.urls.static import static
from django.conf import settings
from django.urls import path
from . import views

urlpatterns = [path('', RedirectView.as_view(url='Auth', permanent=False)),
               path('Auth', views.loginUser, name="SignIn"),
               path('SignUp', views.signUp, name="Signup"),
               path('Logout', views.userLogout, name="Logout"),
               path('Teacher/Add-Category', views.add_category, name="Add Category"),
               path('Teacher/View-Categories', views.view_categories, name="View Categories"),
               path('Teacher/View-Categories/Update-Category/<int:id>', views.update_category, name="Update Categories"),
               path('Teacher/Add-Cource', views.add_cource, name="Add Cource"),
               path('Teacher/View-Cource', views.view_courses, name="View Cource"),
               path('Teacher/View-Cources/Update-Course/<int:courseId>', views.update_cource, name="Update Cource"),
               path('Teacher/View-Paid-Fee', views.te_view_fee_paid, name="View Paid Fee"),
               path('Teacher/View-Feedbacks', views.te_view_feedback, name="View Feebacks"),

               path('Student', views.std_dashboard, name="Std Dashboard"),
               path('Student/View-Categories', views.std_categories, name="Std Categories"),
               path('Student/View-Fee-Payment', views.std_view_fee, name="Std Fee Payment"),
               path('Student/Categories/View-Courses/<int:catId>', views.std_cources, name="View Cources Std"),
               path('Student/View-Course/Details/<int:courseId>', views.std_course_detial, name="View Course Detail"),
               path('Student/View-Course/Details/Pay-Fee/<int:course>', views.pay_fee, name="Pay Fee"),
               ] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
