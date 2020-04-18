FROM node:12.16-alpine

# Update everything and install needed dependencies
RUN apk add --update graphicsmagick tzdata git bash su-exec

# # Set a custom user to not have n8n run as root
USER root

# Install n8n and the also temporary all the packages
# it needs to build it correctly.
RUN apk --update add --virtual build-dependencies python build-base ca-certificates && \
	npm_config_user=root npm install -g n8n && \
	apk del build-dependencies

COPY ./start.sh /
RUN chmod +x /start.sh
ENTRYPOINT ["/start.sh"]
