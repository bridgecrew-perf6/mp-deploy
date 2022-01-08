# Docker Image
FROM nikolaik/python-nodejs:python3.9-nodejs16

# Installing Packages
RUN apt update && apt upgrade -y
RUN apt install git curl python3-pip ffmpeg -y

# Copying Requirements
COPY requirements.txt /requirements.txt

# Installing Requirements
RUN cd /
RUN pip3 install -U pip
RUN pip3 install -U -r requirements.txt
RUN mkdir /MusicPlayer
WORKDIR /MusicPlayer
COPY startup.sh /startup.sh

# Running Video Player Bot
CMD ["/bin/bash", "/startup.sh"]
