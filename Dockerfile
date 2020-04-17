# FROM ubuntu:latest

# Install Node.js
#RUN apt-get -y --no-install-recommends install \
 # curl 
# RUN sudo apt-get install --yes curl
# RUN curl --silent --location https://deb.nodesource.com/setup_4.x | sudo bash -
# RUN apt-get install --yes nodejs
# RUN apt-get install --yes build-essential

# FROM node:lts

FROM n8nio/n8n

# RUN adduser --disabled-password docker
# USER docker

# Bundle app source
# Trouble with COPY http://stackoverflow.com/a/30405787/2926832
# COPY . /src

# RUN cd /home/docker

# RUN cd /home

# RUN mkdir my-app

# RUN cd my-app

# RUN ls -l

# Install app dependencies
# RUN cd /src; npm install; npm install -g n8n;
# RUN npm install -g n8n;

# RUN export PATH=./node_modules/.bin:$PATH

# Binds to port 8080
# EXPOSE  5678

#  Defines your runtime(define default command)
# These commands unlike RUN (they are carried out in the construction of the container) are run when the container
# CMD ["node", "/src/index.js"]

# RUN n8n
ENTRYPOINT ["/tini", "--"]
CMD ["n8n"]