# README

## Getting Started

1. Install Ruby 2.0.0 and Rails 4.1.0
2. Install [Ruby 2.0.0](https://github.com/sstephenson/rbenv) and [Rails 4.1.0](http://rubyonrails.org)
3. Clone the project from github: `git clone git@github.com:TapWater/TapWater-Rails.git`.
4. Install the gems in the GEMFILE with bundler: `bundle install`
5. Setup the database environment: `rake db:create && rake db:migrate`
6. Start the rails server: `rails server`
7. Access the application at "localhost:3000" in your web browser

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