# TapWater

The TapWater Rails Application provides authentication and synchronization for the [TapWater Android App](https://github.com/TapWater/TapWater-Android) and the [TapWater iOS App](https://github.com/TapWater/TapWater-iOS)

## Getting Started

1. Install [Ruby 2.0.0](https://github.com/sstephenson/rbenv) and [Rails 4.1.0](http://rubyonrails.org)
2. Clone the project from github: `git clone git@github.com:TapWater/TapWater-Rails.git`.
3. Install the gems in the GEMFILE with bundler: `bundle install`
4. Create a `config/database.yml` file. See `config/database.yml.exmaple` for a template.
5. Setup the database environment: `rake db:create && rake db:migrate`
6. Start the rails server: `rails server`
7. Access the application at "localhost:3000" in your web browser

## Data Model

The data model consists of 3 models. Drinks, Users, and Devices.

### Users

A user is a single tapwater user.
They log into and out of the iOS and Android applications to keep track of their drink history

##### Fields

- username
- password_digest

### Drinks

A drink represents a single drink with a quatity of 4oz, 8oz, or 16oz.

##### Fields

- category ('drink', 'glass', 'bottle')
- user_id
- uuid
- drink_date

### Devices

A device is each of the devices the user is logged in on.

##### Fields

- device_token
- device_type
- user_id

## Environment

##### Ruby

This project is built with [Ruby 2.0.0](http://ruby-lang.org).

We suggest installing a ruby version manager.
Our preference is [rbenv](https://github.com/sstephenson/rbenv) or [rvm](http://rvm.io).

##### Rails

This project uses the [Rails 4.1.0](http://rubyonrails.org) web framework. 

##### Database

This project is built to be used with a PostgreSQL database.
The database can be installed using homebrew.

The PostgreSQL gem is used to connect the application to the database.
It is included in the GEMFILE.