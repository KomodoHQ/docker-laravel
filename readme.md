<p align="center"><img src="https://laravel.com/assets/img/components/logo-laravel.svg"></p>

# Laravel Docker

This is a super simple zero configuration Docker boilerplate for Laravel 5.8, intended for getting an environment started quickly and training purposes. 

## Requirements

Check these requirements before starting: 

* Ensure that [Docker](https://docs.docker.com/docker-for-mac/install/) is installed
* Ensure that no other containers/projects are running: `docker ps`
* Ensure that there are no other servers reserving port 80 and 3306
* An IDE you're comfortable with, e.g. PhpStorm, VSCode, etc
* [Sequel Pro](https://www.sequelpro.com/) or similar MySQL GUI

## Getting Started

Follow these steps for a branch new installation: 

1. In terminal, browse to a place to install the project
2. Run: `git clone git@github.com:KomodoHQ/docker-laravel.git myapp`
3. Enter your project: `cd myapp`
4. Start the project: `./scripts/start.sh`

Once the project is booted, you should see the Laravel welcome screen at [http://localhost](http://localhost).

_**NOTE:** Before starting your work, ensure that you have created a new Git repository for your project using the steps below:_

### Create Git Repository

1. Delete the unwanted .git directory: `rm -rf .git`
2. Initialise your own project repositry: `git init`
3. Add the Laravel framework files: `git add .`
4. Commit to the repo: `git commit -m "Initial Laravel files"`
5. Begin the work and commit regularly!

## Connect to MySQL

In some cases you may want to connect to your MySQL server via a GUI, you can do this using [Sequel Pro](https://www.sequelpro.com/). 

When setting up a new connection, set thet host to `127.0.0.1` and you will find the username/password credentials within the environment section of the `docker-compose.yml` file located in this project. 

## Useful Scripts

The project contains some helper scripts for common tasks which you can run from your host machine at the project root:

`./scripts/start.sh` - Start the project, on first run will install composer packages and run the initial database migrations.

`./scripts/down.sh` - Kill the project containers.

`./scripts/down-with-volumes.sh` - Kill the project containers and also delete all associated volumes, this will also remove MySQL database data.

`./scripts/clean.sh` - Clean the project and return it back to the previous state before the project was booted, will clear caches and composer packages. 

--
Happy coding!