from django.forms import IntegerField
from rest_framework.serializers import ModelSerializer, SerializerMethodField, IntegerField
from .models import Category, Book, Tag, Comment, User, Action, Rating, BookView, Order, Order_Detail, Author, Company
from django.core import serializers
from rest_framework.serializers import PrimaryKeyRelatedField
from rest_framework.serializers import Serializer





class BookSerializer(ModelSerializer):
    # book_image = SerializerMethodField()
    company_id = IntegerField()
    author_id = IntegerField()
    category_id = IntegerField()

    # author = SerializerMethodField()
    #
    # def get_author(self, book):
    #     return AuthorSerializer(book.author, context={"request": self.context.get('request')}).data


    def get_company_id(self, obj):
        comp = Company.objects.filter()
        request = self.context['request']
        temp = Company(pk=request)
        company_id = request.data['company_id']
        if comp is not None:
            comps = comp.get(pk=company_id)
            temp = Company(pk=company_id)
            return str(comps)

    def get_author_id(self, obj):
        auth = Author.objects.filter()
        request = self.context['request']
        temp = Author(pk=request)
        author_id = request.data['author_id']
        if auth is not None:
            auths = auth.get(pk=author_id)
            temp = Author(pk=author_id)
            return str(temp)

    def get_category_id(self, obj):
        cate = Category.objects.filter()
        request = self.context['request']
        temp = Category(pk=request)
        category_id = request.data['category_id']
        if cate is not None:
            books = cate.get(pk=category_id)
            temp = Category(pk=category_id)
            return str(books)

    def get_book_image(self, book):
        request = self.context['request']
        name = book.book_image.name
        if book.book_image:
            if name.startswith("static/"):
                path = '/%s' % name
            else:
                path = '/static/%s' % name

            return request.build_absolute_uri(path)

    class Meta:
        model = Book
        fields = ["id", "book_name", "public_date", "number_of_pages", "quantity", "price", "book_image", "author_id"
            ,"company_id", "category_id", "description"]




class CategorySerializer(ModelSerializer):

    class Meta:
        model = Category
        fields = "__all__"



class TagSerializer(ModelSerializer):
    class Meta:
        model = Tag
        fields = "__all__"


class AuthorSerializer(ModelSerializer):
    class Meta:
        model = Author
        fields = "__all__"


class CompanySerializer(ModelSerializer):

    class Meta:
        model = Company
        fields = "__all__"


class BookDetailSerializer(BookSerializer):
    tags = TagSerializer(many=True)
    rate = SerializerMethodField()

    def get_rate(self, lesson):
        request = self.context.get("request")
        if request and request.user.is_authenticated:
            r = lesson.rating_set.filter(creator=request.user).first()
            if r:
                return r.rate

        return -1

    class Meta:
        model = BookSerializer.Meta.model
        fields = BookSerializer.Meta.fields + ['tags', 'publishing_house', 'suggest',"rate"]


class CommentSerializer(ModelSerializer):
    creator = SerializerMethodField()

    def get_creator(self, comment):
        return UserSerializer(comment.creator, context={"request": self.context.get('request')}).data

    class Meta:
        model = Comment
        fields = "__all__"


class UserSerializer(ModelSerializer):
    def create(self, validated_data):
        user = User(**validated_data)
        user.set_password(user.password)
        user.save()

        return user

    class Meta:
        model = User
        fields = ["id", "first_name" , "last_name" , "username" , "password" , "email" , "date_joined","is_superuser", "avatar"]

        extra_kwargs = {
            'password': {'write_only': 'true'}
        }


class ActionSerializer(ModelSerializer):
    class Meta:
        model = Action
        fields = "__all__"


class RatingSerializer(ModelSerializer):
    class Meta:
        model = Rating
        fields = ["id", "rate", "created_at"]

class BookViewSerializer(ModelSerializer):
    class Meta:
        model = BookView
        fields = ["id", "views", "book"]

class OrderSerializer(ModelSerializer):
    class Meta:
        model = Order
        fields = "__all__"

class OrderDetailSerializer(ModelSerializer):
    class Meta:
        model = Order_Detail
        fields = "__all__"