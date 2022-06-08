# Install Tailscale
# https://tailscale.com/kb/1107/heroku/
FROM alpine:latest as tailscale
WORKDIR /app
COPY . ./
ENV TSFILE=tailscale_1.26.0_amd64.tgz
RUN wget https://pkgs.tailscale.com/stable/${TSFILE} && \
  tar xzf ${TSFILE} --strip-components=1
COPY . ./

FROM node:lts-alpine

# pass N8N_VERSION Argument while building or use default
ARG N8N_VERSION=0.170.0

# Update everything and install needed dependencies
RUN apk add --update graphicsmagick tzdata

# Set a custom user to not have n8n run as root
USER root

# Install n8n and the also temporary all the packages
# it needs to build it correctly.
RUN apk --update add --virtual build-dependencies python3 build-base ca-certificates && \
	npm_config_user=root npm install --location=global n8n@${N8N_VERSION} && \
	apk del build-dependencies && \
	rm -rf /var/cache/apk/*

# Specifying work directory
WORKDIR /data

COPY --from=tailscale /app/tailscaled /data/tailscaled
COPY --from=tailscale /app/tailscale /data/tailscale
RUN mkdir -p /var/run/tailscale /var/cache/tailscale /var/lib/tailscale

# copy start script to container
COPY ./start.sh /

# make the script executable
RUN chmod +x /start.sh

EXPOSE 5678/tcp

# define execution entrypoint
CMD ["/start.sh"]
