FROM python:3.9.11

ENV PYTHONUNBUFFERED 1

RUN mkdir -p /root/workspace
COPY requirements.txt /root/workspace/
WORKDIR /root/workspace

RUN pip install --upgrade pip\
    && pip install --upgrade setuptools\
    && pip install -r requirements.txt

#COPY boot.sh /root/workspace/
#RUN chmod +x /root/workspace/boot.sh
#ENTRYPOINT ["./boot.sh"]