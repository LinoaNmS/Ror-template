# RAYLS-GENERATOR

This project is a generator of ror project using docker & docker-compose.


## Requirements

- docker
- docker-compose

## How to install

Open `.env` file and modify variables value :

### New project configuration
`BUILD_APP_OPTIONS` : Options to pass to `rails new` command (default: `--skip-bundle`) refer to [rails new options_helper](docs/rails_new_options_helper.md)

### Project configuration
`PROJECT_NAME`: Is the name of project (Update container_name, directory of project in container)

`PROJECT_PORT`: Is the port of project (default: `3000`)
### Database configuration
`PG_DATABASE`: The name of your database

`PG_USER`: The username of postgres who can access to database

`PG_PASSWORD`: The password of `PG_USER` (default: `password`)

`PG_PORT`: Port to access to postgres (default: `5432`)

`PG_HOST`: Host of postgres (default: `db`)
