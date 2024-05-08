FROM python:3.9.11

ENV PYTHONUNBUFFERED 1

RUN mkdir -p /root/workspace
COPY requirements.txt /root/workspace/
WORKDIR /root/workspace

RUN pip install -r requirements.txt

RUN mkdir -p /root/shell
COPY boot.sh /root/shell/
RUN chmod +x /root/shell/boot.sh
ENTRYPOINT ["/root/shell/boot.sh"]