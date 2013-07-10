class SpreeWizard.Models.Product extends Backbone.Model
  paramRoot: 'product'
  urlRoot: '/api/products/'

class SpreeWizard.Collections.ProductsCollection extends Backbone.Collection
  model: SpreeWizard.Models.Product
  url: '/api/products'
