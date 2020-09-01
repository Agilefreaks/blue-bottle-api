# Description

Server for interview that "randomly" fails to simulate different HTTP interactions.

## Dependencies
- PostgreSQL

## Setup
- `cp .env.example .env`
- modify database connection string for local usage
- `rake db:schema:load`
- `rake db:seed`
- `rails s`
- go to http://localhost:3000/v1/docs

## Deploy
Deploy is configured to run automatically from pushes to master and deploys here:

https://blue-bottle-api-test.herokuapp.com/v1/docs