# CI/CD for Drupal 9
A testing Repo for CI/CD with a Drupal 9 site

## Development using Lando
````
git clone https://github.com/brookestevens/d9-actions.git`

lando start         # This will install packages from composer.json. This may take a while

lando install-site  # If this is the first time setting up the site, run this to install it

login with username: admin and password: password
````

### Drush
`lando drush`

## Testing
This is handled with Github Actions. When anything is pushed to `main` the tests will run via `phpunit`. However, if you would like to
run local tests, you may do `lando test` or `composer test`

## Production
`composer install --no-dev -o    # this does not install development dependencies like testing packages`
