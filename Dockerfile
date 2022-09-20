FROM ubuntu:20.04
RUN apt-get update && apt-get install -y python3 python3-pip
RUN pip install flask==2.1.*
COPY app.py /
ENV FLASK_APP=app
EXPOSE 9091
CMD flask run --host 0.0.0.0 --port 9091
