from django.contrib.auth.models import AbstractUser
from django.db import models


class User(AbstractUser):
    avatar = models.ImageField(upload_to='upload/%Y/%m',null=
                               True)

User._meta.get_field('email')._unique = True



class Category(models.Model):
    category_name = models.CharField(max_length=100, null=False, unique=True)
    parent_id = models.IntegerField()
    order = models.IntegerField()

    def __str__(self):
        return self.category_name


class MyModelBase(models.Model):
    subject = models.CharField(max_length=255, null=False)
    image = models.ImageField(upload_to='books/%Y/%m', default=None)
    created_date = models.DateTimeField(auto_now_add=True)
    update_date = models.DateTimeField(auto_now=True)
    active = models.BooleanField(default=True)

    def __str__(self):
        return self.subject

    class Meta:
        abstract = True


class Company(models.Model):
    company_name = models.CharField(max_length=200, unique=True)
    company_info = models.TextField(null=True)
    company_image = models.ImageField(upload_to='company/%Y/%m', default=None)

    def __str__(self):
        return self.company_name



class Author(models.Model):
    author_name = models.CharField(max_length=200, unique=True)
    author_info = models.TextField(null=True)
    author_image = models.ImageField(upload_to='author/%Y/%m', default=None)

    def __str__(self):
        return self.author_name


class Book(models.Model):
    class Meta:
        unique_together = ('category', 'book_name')
        ordering = ["-id"]

    book_name = models.CharField(max_length=100, null=False, unique=True)
    public_date = models.DateField(null=True)
    suggest = models.BooleanField(default=False)
    description = models.TextField(null=True, blank=True)
    category = models.ForeignKey(Category,on_delete=models.SET_NULL, null=True,related_name="books",)
    company = models.ForeignKey(Company, on_delete=models.SET_NULL, null=True,related_name="books")
    author = models.ForeignKey(Author, on_delete=models.SET_NULL, null=True,related_name="books")
    publishing_house = models.CharField(max_length=200,null=False)
    number_of_pages = models.IntegerField()
    quantity = models.IntegerField()
    price = models.FloatField()
    book_image = models.ImageField(upload_to='books/%Y/%m', blank=False,null=False)
    created_at = models.DateTimeField(auto_now_add=True)
    update_at = models.DateTimeField(auto_now=True)
    tags = models.ManyToManyField('Tag', related_name="lessons", blank=True)

    def __str__(self):
        return self.book_name


class Tag(models.Model):
    name = models.CharField(max_length=50,unique=True)


class Comment(models.Model):
    content = models.TextField()
    book = models.ForeignKey(Book,on_delete=models.CASCADE)
    creator = models.ForeignKey(User,on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)
    update_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.content


class ActionBase(models.Model):
    created_at = models.DateTimeField(auto_now_add=True)
    update_at = models.DateTimeField(auto_now=True)
    book = models.ForeignKey(Book, on_delete=models.CASCADE)
    creator = models.ForeignKey(User, on_delete=models.CASCADE)

    class Meta:
        abstract = True


class Action(ActionBase):
    LIKE, HAHA , HEART = range(3)
    ACTIONS = [
        (LIKE, 'like'),
        (HAHA, 'haha'),
        (HEART, 'heart')
    ]
    type = models.PositiveSmallIntegerField(choices=ACTIONS, default=LIKE)


class Rating(ActionBase):
    rate = models.PositiveSmallIntegerField(default=0)

class BookView(models.Model):
    created_at = models.DateTimeField(auto_now_add=True)
    update_at = models.DateTimeField(auto_now=True)
    views = models.IntegerField(default=0)
    book = models.OneToOneField(Book, on_delete=models.CASCADE)

class Order(models.Model):
    creator = models.ForeignKey(User, on_delete=models.CASCADE)
    price = models.FloatField()
    shipping_fee = models.FloatField()
    shipping_address = models.TextField()
    order_status = models.CharField(max_length=100, null=False)
    phone_receiver = models.CharField(max_length=100, null=False)
    name_receiver = models.CharField(max_length=100, null=False)
    created_at = models.DateTimeField(auto_now_add=True)
    update_at = models.DateTimeField(auto_now=True)
    note = models.TextField(null=True)

    class Meta:
        ordering = ["-id"]


class Order_Detail(models.Model):
    book = models.IntegerField()
    order = models.ForeignKey(Order, on_delete=models.CASCADE,related_name="orders")
    price = models.FloatField()
    quantity = models.IntegerField()
    name = models.TextField()