FROM ubuntu:20.04

COPY . .

RUN apt-get update
RUN apt install -y curl
RUN curl -sL https://deb.nodesource.com/setup_14.x -o nodesource_setup.sh
RUN bash nodesource_setup.sh 
RUN apt install -y nodejs   
