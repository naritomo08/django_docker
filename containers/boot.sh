#!/bin/sh

cd /root/worlspace

python manage.py migrate
python manage.py runserver 0.0.0.0:8000