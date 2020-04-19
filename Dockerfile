FROM node:12.16-alpine

# Install n8n 
RUN npm install -g n8n

# copy start script to container
COPY ./start.sh /

# make the script executable
RUN chmod +x /start.sh

# define execution entrypoint
ENTRYPOINT ["/start.sh"]
