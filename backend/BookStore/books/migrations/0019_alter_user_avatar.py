# Generated by Django 3.2.5 on 2022-11-06 00:53

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('books', '0018_auto_20221018_2040'),
    ]

    operations = [
        migrations.AlterField(
            model_name='user',
            name='avatar',
            field=models.ImageField(null=True, upload_to='upload/%Y/%m'),
        ),
    ]
