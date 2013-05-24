# Rails The Originate Way

This is a sample application with recommended gems and configurations. Where appropriate branches have been made for specific topics or application specific set ups.

You are free to clone this as is and merge the approriate branches for your project or it may be better for you to start a new project but use this project as a guideline for gems and configuration you may want to use.

## Setup

### PostgreSQL

Assumes you have a role 'sample' with password '123456'

### Redis

Assumes you have Redis installed. Redis is used for Sidekiq. The Procfile is set up to have Foreman run the Redis Server for you. Just make sure you have a .redis directory where it will store your dump files and logs.

### Environment

When environement variables are needed, they should be added to your .env file as Foreman will use this to set the environment appropriately. A sample.env file has been included.

## Comments

Comments have been added through out several of the configuration files explaining why certain things were done the way they were done.

