SpreeProductSelectionWizard
===========================

Product Selection Wizard enables Spree Admins to define 
+ wizard-able product types
+ wizard selection order
+ discounts on prodcut groups

Installation
------------

Add spree_product_selection_wizard to your Gemfile:

```ruby
gem 'spree_product_selection_wizard'
```

Bundle your dependencies and run the installation generator:

```shell
bundle
bundle exec rails g spree_product_selection_wizard:install
```

Testing
-------

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

Copyright (c) 2013 Weston Platter, released under the MIT License.
