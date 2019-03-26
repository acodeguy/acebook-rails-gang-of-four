# AceBook

Second team project at the Maker's academy - a Facebook clone, where users can login and make posts. 

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

Once we have enough functionality for a release (e.g. a new feature as been added), we will push it to master. This will trigger CI on Travis, which will then push it to the production environment on Heroku if the tests pass. 

## Trello board with user stories

https://trello.com/b/Q7ByP6kt/acebook-gang-of-four


