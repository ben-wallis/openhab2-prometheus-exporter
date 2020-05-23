FROM python:3.8.1-slim-buster

ADD openhab2-exporter.py /app/
ADD requirements.txt /app/
WORKDIR /app
EXPOSE 9091

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:9091", "openhab2-exporter:app"]