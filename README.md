# AceBook [![Build Status](https://travis-ci.org/acodeguy/acebook-rails-gang-of-four.svg?branch=master)](https://travis-ci.org/acodeguy/acebook-rails-gang-of-four)

Second team project at the Maker's academy - a Facebook clone, where users can login and make posts. 

## Technologies

- Ruby on Rails 5.1.1
- Heroku
- Travis CI
- Devise

## How to run

First, clone this repository. Then:

```bash
> bundle install
> bin/rails db:create
> bin/rails db:migrate

> bundle exec rspec # Run the tests to ensure it works
> bin/rails server # Start the server at localhost:3000
```

## Dev ops and deployment

We have two key branches, staging and master. We create branches for each feature from staging, and then merge to staging from each feature branch after each passing unit test. 

Once we have enough functionality for a release (e.g. a new feature as been added), we will push it to master via a pull request. This will trigger CI on Travis, which will then push it to the production environment on Heroku if the tests pass. 

## How to access app
This repo is a backend api which is running on Heroku at the following location (https://acebook-gang-of-four.herokuapp.com).

The react frontend github can be found at https://github.com/simon-norman/acebook-gang-of-four-frontend.

To access the react front end please visit (https://acebook-production.herokuapp.com/sign-in)

## Trello board with user stories

https://trello.com/b/Q7ByP6kt/acebook-gang-of-four

# FUTURE COHORTS - What you should do!!!!

* Rails (and Devise) take care of many of the concerns of building an app (Useful but limited the fun of coding and could allow you to do things without understanding what is happening)

* Setting up CI/CD early gave us a product we could quickly show to a client

* New Features need new branches. Never working in staging 😉😉

* Linking assets to individuals (eg heroku accounts/github project) can limit flexibility of the team when dividing up work.

* If you can think of it, there will be a library; DON’T REINVENT THE WHEEL!!!

* Need to recognise the limitation of free services eg Travis CI

* Coding react is fun.   Testing react is not!

* Don’t be afraid to switch pairs during a task; don’t let the fact that a task isn’t finished stop you from sharing the knowledge and avoiding a feeling of stagnation

* Timebox blockers and potential solutions to avoid critical morale degradation

* Be bold in your decisions; being uncomfortable is ok (Ed wasn’t lying)

* Pairing is very effective; being able to complement each other’s strengths or compensate for weaknesses (which shared learning helps to eliminate)
