# n8n-heroku

![Docker](https://github.com/sarveshpro/n8n-heroku/workflows/Docker/badge.svg) ![Heroku](https://github.com/sarveshpro/n8n-heroku/workflows/Heroku/badge.svg)

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

#### [ Open Source Contributors feel free to maintain this repository ]

New method, just click, configure and get your n8n running.
Also, now set app stack to container and simply connect this Github repo and deploy, heroku uses default configuration from app.json

default basic auth is user:pass

### n8n(Nodemation) - Free and Open Workflow Automation Tool

This is a [Heroku](https://heroku.com/) focused container implementation for the [n8n Automation Tool](https://n8n.io/). Just connect your fork to heroku and let it work as a charm!

## Requirements
* Heroku CLI

## Setup

this is old setup guide not required now, connect this GitHub repo to heroku to autoconfigure. or click the above button to deploy without GitHub.

### STEP 1: CHANGE your App Stack to container
you can change your app's stack using heroku cli, make sure you have heroku cli installed.

#### login into heroku account
    heroku login

#### change app stack
    heroku stack:set contaner --app APP_NAME
replace APP_NAME with your heroku app name

### STEP 2: ADD Config Vars for enabling basic authentication (Optional)
It's recommended that you enable basic authentication when deployingn n8n on web. You need to set the following Environment Variables(Config Vars) in your App settings.

    N8N_BASIC_AUTH_ACTIVE=true
    N8N_BASIC_AUTH_USER=SET_USERNAME
    N8N_BASIC_AUTH_PASSWORD=SET_PASSWORD
    
Using filesystem/sqlite as storage will destroy any workflows on new builds/releases it it recommended to use mongodb or postgreSQL as the drivers are built into the code.

    DB_TYPE=mongodb
    DB_MONGODB_CONNECTION_URL=mongodb://MONGODB_USERNAME:MONGODB_PASSWORD@HOST:PORT/MONGODB_DATABASE

you will get the connection string in the heroku mongodb addon or any service you choose. using heroku addons is recommended as they auto configure ENV Variables for you. just copy MONGODB_URI to DB_MONGODB_CONNECTION_URL. that's it.

Same process is to be followed for using postgreSQL.
    
    DB_TYPE=postgresdb
    DB_POSTGRESDB_HOST=POSTGRES_HOST
    DB_POSTGRESDB_PORT=POSTGRES_PORT
    DB_POSTGRESDB_DATABASE=POSTGRES_DB
    DB_POSTGRESDB_USER=POSTGRES_USER
    DB_POSTGRESDB_PASSWORD=POSTGRES_PASSWORD

If some of your triggers depend on published app domain you may need to explicitly set url for yours n8n instance

    WEBHOOK_URL=https://your-app.herokuapp.com
    

### STEP 3: DONE! Now CONNECT GitHub repo and Deploy.

## Using Container Registry

you can also deploy this project using container registry (requires aditional requirements installed). Just clone/download this repository on your local machine.

### Additional Requirements (for building on local)
* docker
* docker-compose

### Steps
cd into your project directory

    cd n8n-heroku/

login into heroku account
    
    heroku login

create heroku app

    heroku create APP_NAME

change app stack

    heroku stack:set container --app APP_NAME
    
set config vars(optional)

    heroku config:set N8N_BASIC_AUTH_ACTIVE=true
    heroku config:set N8N_BASIC_AUTH_USER=SET_USERNAME
    heroku config:set N8N_BASIC_AUTH_PASSWORD=SET_PASSWORD

Login the container

    heroku container:login

build and push container image to heroku

    heroku container:push web --app APP_NAME
    
release new build

    heroku container:release web --app APP_NAME
    
<br />

Maybe now you can specify which N8N version to install by Setting a Environment Variable N8N_VERSION or with a build time argument of the same. Not tested yet though, create an issue if it does't work. CI is passing so it is working correctly with default values.

_Update - To set n8n version you can pass a argument when deploying using container registry_

    heroku container:push web --arg N8N_VERSION=0.60.0 --app APP_NAME

### Sources

https://github.com/n8n-io/n8n
