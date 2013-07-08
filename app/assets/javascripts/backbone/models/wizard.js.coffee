class Wizard.Models.Product extends Backbone.Model
  paramRoot: 'product'
  urlRoot: '/wizards'

class Wizard.Collections.ProductsCollection extends Backbone.Collection
  model: Wizard.Models.Product
  url: '/wizards'
