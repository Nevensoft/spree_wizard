class Wizard.Models.Product extends Backbone.Model
  paramRoot: 'product'


class Wizard.Collections.ProductsCollection extends Backbone.Collection
  model: Wizard.Models.Product
  url: '/wizards'
