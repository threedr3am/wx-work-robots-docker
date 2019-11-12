FROM ubuntu:16.04

RUN apt-get update \
  && apt-get upgrade -y \
  && apt-get install openjdk-8-jdk -y

ENV ROBOT_DIR=/app \
  LOG_DIR=/app/logs

COPY . $ROBOT_DIR

WORKDIR $ROBOT_DIR

CMD nohup java -jar bin/push-work-msg-docker.jar >> $LOG_DIR/run.log 2>&1

