FROM python:2.7

MAINTAINER Bhavin Kotak <bhavinkotak07@gmail.com>

EXPOSE 8000


WORKDIR /app

COPY requirements.txt ./

RUN pip install --no-cache-dir -r requirements.txt

COPY . /app/

WORKDIR /app

CMD [ "python", "app.py"]
