FROM ubuntu:18.04


RUN apt-get update && apt-get install postgresql-client python3-pip cron -y

RUN pip3 install awscli
RUN mkdir /data
RUN mkdir /app
COPY * /app/

WORKDIR /app/
RUN chmod +x /app/backup.sh
RUN chmod +x /app/start.sh

# Add crontab file in the cron directory
RUN touch /etc/cron.d/backup-cron

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/backup-cron

# Create the log file to be able to run tail
RUN touch /var/log/cron.log


CMD /app/start.sh