#!/bin/sh

# required for n8n to start on heroku alloted port
export N8N_PORT=$PORT

# kickstart nodemation
n8n