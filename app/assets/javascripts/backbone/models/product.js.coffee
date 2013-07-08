class SpreeWizard.Models.Product extends Backbone.Model
  paramRoot: 'spree_product'


class SpreeWizard.Collections.ProductsCollection extends Backbone.Collection
  model: SpreeWizard.Models.Product
  url: '/api/products'

