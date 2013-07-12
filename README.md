## SpreeProductSelectionWizard

### Backbone Methodologies
We create SpreeProductSelectionWizard with these options in mind.
- a Backbone.View is __always__ rendered in initialize callback


--------------------------------------------------------------------------------
__Standard Spree Exention Stuff__

### Installation

Add spree_product_selection_wizard to your Gemfile:

```ruby
gem 'spree_product_selection_wizard'
```

Bundle your dependencies and run the installation generator:

```shell
bundle
bundle exec rails g spree_product_selection_wizard:install
```


### Development
To setup a spree site for working on the spree extension, you'll want to create 
a 'dummy' app.

```shell
# within spree_product_selection_wizard
rake test_app
```

This creates a Spree rails app with the Spree extension already setup in the
```spec/dummy``` app. To apply new migrations to the ```spre/dummy``` app,

```shell
rake app:db:migrate
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
require 'spree_product_selection_wizard/factories'
```


### Credits
Copyright (c) 2013 Weston Platter, released under the MIT License.
