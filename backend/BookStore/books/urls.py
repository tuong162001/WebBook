from django.conf.urls.static import static
from rest_framework import routers
from . import views
from django.contrib import admin
from django.urls import path, include



router = routers.DefaultRouter()
router.register("categories", views.CategoryViewSet, 'category')
router.register("books",views.BookViewSet,'book')
router.register("books",views.BookDetailViewSet,'book')
router.register("users",views.UserViewSet,'user')
router.register("comments",views.CommentViewSet,'comment')
router.register("orders",views.OrderViewSet,'order')
router.register("author",views.AuthorViewSet,'author')
router.register("company",views.CompanyViewSet,'company')

urlpatterns = [
    path('',include((router.urls))),
    path('oauth2-info/',views.AuthInfo.as_view())
]


