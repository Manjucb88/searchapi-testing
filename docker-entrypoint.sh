#!/bin/bash

echo "Make Migrations"
python manage.py makemigrations
echo "Apply Migrations"
python manage.py migrate
echo "Starting server"
python manage.py runserver 0.0.0.0:8020 --noreload
