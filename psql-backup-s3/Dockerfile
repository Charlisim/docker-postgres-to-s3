FROM ubuntu:18.04


RUN apt-get update && apt-get install postgresql-client python3-pip -y

RUN pip3 install awscli
RUN mkdir /data
RUN mkdir /app
COPY * /app/
WORKDIR /app/
RUN chmod +x /app/backup.sh
ENTRYPOINT ["/bin/sh", "backup.sh" ]