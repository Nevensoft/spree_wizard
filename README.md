SpreeWizard
============

[![Build Status](https://travis-ci.org/westonplatter/spree_wizard.png?branch=master)](https://travis-ci.org/westonplatter/spree_wizard)

### JS/Backbone Methodologies

... more to come on this... 

--------------------------------------------------------------------------------

__Standard Spree Exention Stuff__

### Installation

Add spree_wizard to your Gemfile:

```ruby
gem 'spree_wizard'
```

Bundle your dependencies and run the installation generator:

```shell
bundle
bundle exec rails g spree_wizard:install
```


### Development
To setup a spree site for working on the spree extension, you'll want to create
a 'dummy' app.

```shell
# within spree_wizard
rake test_app
```

This creates a Spree rails app with the Spree extension already setup in the
```spec/dummy``` app. To apply new migrations to the ```spre/dummy``` app,

```shell
cd spec/dummy
rake db:migrate
```

To get the sample data fro developing SpreeWizard, do the following,
```shell
cd spec/dummy
rake db:seed
rake spree_sample:load
rake spree_wizard:sample_load
```


### Testing
Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

```shell
bundle
bundle exec rake test_app
bundle exec rspec spec
```

When testing your applications integration with this extension you may use it's factories.
Simply add this require statement to your spec_helper:

```ruby
require 'spree_wizard/factories'
```


### Credits
Copyright (c) 2013 Weston Platter, released under the MIT License.
