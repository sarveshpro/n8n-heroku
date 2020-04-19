FROM node:12.16-alpine

# Update everything and install needed dependencies
RUN apk add --update graphicsmagick tzdata git bash su-exec

# Set a custom user to not have n8n run as root
USER root

# Install n8n and the also temporary all the packages
# it needs to build it correctly.
RUN apk --update add --virtual build-dependencies python build-base ca-certificates && \
	npm_config_user=root npm install -g n8n \
	apk del build-dependencies

# copy start script to container
COPY ./start.sh /

# make the script executable
RUN chmod +x /start.sh

# define execution entrypoint
ENTRYPOINT ["/start.sh"]
