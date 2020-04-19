# n8n-heroku

### n8n(Nodemation) - Free and Open Workflow Automation Tool

This is a heroku focused container implementation for the n8n Automation Tool. Just connect your fork of this repo to heroku and let it work as a charm!

## Requirements

you need to prepare your heroku app before deploying this project. given below in 3 simple steps!

### STEP 1: CHANGE your App Stack to container
you can change your app's stack using heroku cli, make sure you have heroku cli installed.

#### login into heroku account
    heroku login

#### change app stack
    heroku stack:set contaner --app APP_NAME
replace APP_NAME with your heroku app name

### STEP 2: ADD Config Vars for enabling basic authentication (Optional)
You need to set the following Environment Variables(Config Vars) in your App settings

    N8N_BASIC_AUTH_ACTIVE=true
    N8N_BASIC_AUTH_USER=SET_USERNAME
    N8N_BASIC_AUTH_PASSWORD=SET_PASSWORD


    
