FROM n8nio/n8n:latest

USER root

RUN cd /usr/local/lib/node_modules/n8n && npm install n8n-nodes-document-generator
RUN cd /usr/local/lib/node_modules/n8n && npm install @google/earthengine && npm install -g @turf/turf

WORKDIR /home/node/packages/cli
ENTRYPOINT []

# copy start script to container
COPY ./start.sh /

# make the script executable
RUN chmod +x /start.sh

# define execution entrypoint
CMD ["/start.sh"]
