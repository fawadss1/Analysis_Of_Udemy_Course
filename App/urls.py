from django.views.generic import RedirectView
from django.conf.urls.static import static
from django.conf import settings
from django.urls import path
from . import views

urlpatterns = [path('', RedirectView.as_view(url='Auth', permanent=False)),
               path('Auth', views.loginUser, name="SignIn"),
               path('SignUp', views.signUp, name="Signup"),
               path('Logout', views.userLogout, name="Logout"),
               path('Teacher_Dashboard/Add-Category', views.add_category, name="Add Category"),
               path('Teacher_Dashboard/View-Categories', views.view_categories, name="View Categories"),
               path('Teacher_Dashboard/View-Categories/update-Category/<int:id>', views.update_category,
                    name="Update Categories"),
               path('Teacher_Dashboard/Add-Cource', views.add_cource, name="Add Cource"),
               path('Teacher_Dashboard/View-Cource', views.view_cource, name="View Cource"),
               path('Teacher_Dashboard/View-Categories/update-Cource/<int:courseId>', views.update_cource,
                    name="Update Cource"),

               path('Student_Dashboard/View-Categories', views.view_courseCategoriesStd, name="View Categories Std"),
               path('Student_Dashboard/View-Cources', views.view_courceStd, name="View Cources Std"),
               ] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
