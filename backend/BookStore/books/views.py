from typing import Union

from django.http import Http404
from rest_framework import viewsets, generics, status, permissions
from rest_framework.views import APIView
from rest_framework.parsers import MultiPartParser,FormParser
from .models import Category, Book, Tag, Comment, User, Action, Rating, BookView,Order,Order_Detail, Author, Company
from .serializers import CategorySerializer, BookSerializer, BookDetailSerializer,\
    CommentSerializer, UserSerializer, RatingSerializer, ActionSerializer, BookViewSerializer, OrderSerializer\
    ,OrderDetailSerializer,AuthorSerializer,CompanySerializer

from .paginator import BasePagination
from rest_framework.decorators import action
from rest_framework.response import Response
from django.conf import settings
from django.db.models import F


class CategoryViewSet(viewsets.ViewSet, generics.ListAPIView):
    queryset = Category.objects.all()
    serializer_class = CategorySerializer

    @action(methods=['get'], detail=True, url_path='books')
    def get_books(self, request, pk):
        books = Category.objects.get(pk=pk).books.filter()
        q = request.query_params.get('kw')
        if q is not None:
            books = books.filter(book_name__icontains=q)

        return Response(BookSerializer(books, many=True, context={"request": request}).data, status=status.HTTP_200_OK)


class BookViewSet(viewsets.ViewSet, generics.ListAPIView, generics.CreateAPIView):
    serializer_class = BookSerializer
    pagination_class = BasePagination
    parser_classes = [MultiPartParser, FormParser, ]

    def get_queryset(self):
        books = Book.objects.filter()

        q = self.request.query_params.get('q')
        if q is not None:
            books = books.filter(book_name__icontains=q)

        category_id = self.request.query_params.get('category_id')
        if category_id is not None:
            books = books.filter(category_id=category_id)

        return books

    # def create(self, request, *args, **kwargs):
    #     serializer = self.get_serializer(data=request.data)
    #     serializer.is_valid(raise_exception=True)
    #     self.perform_create(serializer)
    #     headers = self.get_success_headers(serializer.data)
    #     return Response(serializer.data, status=status.HTTP_201_CREATED, headers=headers)

    # def post(self, request, format=None):
    #     print(request.data)
    #     serializer = self.get_serializer(data=request.data)
    #     if serializer.is_valid():
    #         serializer.save()
    #         return Response(serializer.data, status=status.HTTP_201_CREATED)
    #     else:
    #         return Response(serializer.data, status=status.HTTP_400_BAD_REQUEST)


class AuthorViewSet(viewsets.ViewSet, generics.ListAPIView, generics.CreateAPIView):
    queryset = Author.objects.all()
    serializer_class = AuthorSerializer
    parser_classes = [MultiPartParser]


class CompanyViewSet(viewsets.ViewSet, generics.ListAPIView, generics.CreateAPIView):
    queryset = Company.objects.all()
    serializer_class = CompanySerializer
    parser_classes = [MultiPartParser]


class OrderViewSet(viewsets.ViewSet, generics.RetrieveAPIView, generics.ListAPIView):
    queryset = Order.objects.all()
    serializer_class = OrderSerializer

    def get_permissions(self):
        if self.action in ['add_order']:
            return [permissions.IsAuthenticated()]

        return [permissions.AllowAny()]

    @action(methods=['post'], detail=False, url_path="add-order")
    def add_order(self, request):
        order_status = request.data.get('order_status')
        shipping_address = request.data.get('shipping_address')
        price = request.data.get('price')
        shipping_fee = request.data.get('shipping_fee')
        name_receiver = request.data.get('name_receiver')
        phone_receiver = request.data.get('phone_receiver')
        if order_status and price and phone_receiver and shipping_address :
            c = Order.objects.create(order_status=order_status,
                                     shipping_address=shipping_address,
                                     price=price, shipping_fee=shipping_fee,
                                     name_receiver=name_receiver, phone_receiver=phone_receiver,
                                    creator=request.user)

            return Response(OrderSerializer(c, context={"request": request}).data,
                            status=status.HTTP_201_CREATED)

        return Response(status=status.HTTP_400_BAD_REQUEST)

    @action(methods=['post'], detail=True, url_path="add-detail")
    def add_orderdetail(self, request,pk):
        quantity = request.data.get('quantity')
        price = request.data.get('price')
        book= request.data.get('book')
        name = request.data.get('name')
        if price and quantity and book:
            c = Order_Detail.objects.create(quantity=quantity,
                                     price = price, book=book,
                                            name=name,
                                            order=self.get_object()
                                            )

            return Response(OrderDetailSerializer(c, context={"request": request}).data,
                            status=status.HTTP_201_CREATED)

        return Response(status=status.HTTP_400_BAD_REQUEST)




class BookDetailViewSet(viewsets.ViewSet, generics.RetrieveAPIView, generics.UpdateAPIView):
    queryset = Book.objects.filter()
    serializer_class = BookDetailSerializer

    def get_permissions(self):
        if self.action in ['add_comment', 'add_action', 'add_rating']:
            return [permissions.IsAuthenticated()]

        return [permissions.AllowAny()]



    def patch_update(self, request ,*args ,**kwargs):
        return super().patch_update(request, *args, **kwargs)


    @action(methods=['post'],detail=True,url_path='tags')
    def add_tag(self, request, pk):
        try:
            course = self.get_object()
        except Http404:
            return Response(status=status.HTTP_404_NOT_FOUND)

        else:
            tags = request.data.get('tags')
            if tags is not None:
                for tag in tags:
                    t, _ = Tag.objects.get_or_create(name=tag)
                    course.tags.add(t)

                course.save()

                return Response(self.serializer_class(course,context={"request": request}).data, status=status.HTTP_201_CREATED)

        return Response(status=status.HTTP_404_NOT_FOUND)

    @action(methods=['post'], detail=True,url_path='add-comment')
    def add_comment(self, request, pk):
        content = request.data.get('content')
        if content:
            c = Comment.objects.create(content=content, book=self.get_object(), creator=request.user)
            return Response(CommentSerializer(c, context={"request": request}).data, status=status.HTTP_201_CREATED)

        return Response(status=status.HTTP_400_BAD_REQUEST)

    @action(methods=['post'], detail=True, url_path='action')
    def add_action(self, request, pk):
        try:
            action_type = int(request.data['type'])
        except Union[IndexError, ValueError]:
            return Response(status=status.HTTP_400_BAD_REQUEST)
        else:
            action = Action.objects.create(type=action_type, creator=request.user, book=self.get_object())

            return Response(ActionSerializer(action).data,status=status.HTTP_200_OK)

    @action(methods=['post'], detail=True, url_path='rating')
    def add_rating(self, request, pk):
        try:
            rate = int(request.data['rating'])
        except Union[IndexError, ValueError]:
            return Response(status=status.HTTP_400_BAD_REQUEST)
        else:
            r = Rating.objects.update_or_create(defaults={"rate": rate}, creator=request.user, book=self.get_object())

            return Response(RatingSerializer(r).data, status=status.HTTP_200_OK)

    @action(methods=['get'], detail=True, url_path='views')
    def inc_view(self, request, pk):
        v, created = BookView.objects.get_or_create(book=self.get_object())
        v.views = F('views') + 1
        v.save()

        v.refresh_from_db()

        return Response(BookViewSerializer(v).data,status=status.HTTP_200_OK)

    @action(methods=['get'], detail=True, url_path="comments")
    def get_comments(self, request, pk):
        l = self.get_object()
        return Response(
            CommentSerializer(l.comment_set.order_by("-id").all(), many=True, context={"request": self.request}).data,
            status=status.HTTP_200_OK)


class UserViewSet(viewsets.ViewSet, generics.CreateAPIView):
    queryset = User.objects.filter(is_active=True)
    serializer_class = UserSerializer
    parser_classes = [MultiPartParser, ]

    def get_permissions(self):
        if self.action == 'get_current_user':
            return [permissions.IsAuthenticated()]
        return [permissions.AllowAny()]

    @action(methods=['get'], detail=False, url_path="current_user")
    def get_current_user(self, request):
        return Response(self.serializer_class(request.user, context={"request": request}).data,
                        status=status.HTTP_200_OK)


class CommentViewSet(viewsets.ViewSet, generics.DestroyAPIView, generics.UpdateAPIView):
    queryset = Comment.objects.all()
    serializer_class = CommentSerializer
    permission_classes = [permissions.IsAuthenticated]

    def destroy(self, request, *args, **kwargs):
        if request.user == self.get_object().creator:
            return super().destroy(request, *args, **kwargs)

        return Response(status=status.HTTP_403_FORBIDDEN)

    def patch_update(self, request, *args, **kwargs):
        if request.user == self.get_object().creator:
            return super().patch_update(request, *args, **kwargs)

        return Response(status=status.HTTP_403_FORBIDDEN)


class AuthInfo(APIView):
    def get(self, request):
        return Response(settings.OAUTH2_INFO, status=status.HTTP_200_OK)