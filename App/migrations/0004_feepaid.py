# Generated by Django 4.2.3 on 2023-07-28 17:12

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('App', '0003_course_detail_date_alter_course_detail_published'),
    ]

    operations = [
        migrations.CreateModel(
            name='FeePaid',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('Date', models.DateTimeField(auto_now=True)),
                ('Amount', models.IntegerField()),
                ('IBAN', models.IntegerField()),
                ('Course', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='App.course_detail')),
                ('Student', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='App.student')),
            ],
        ),
    ]
