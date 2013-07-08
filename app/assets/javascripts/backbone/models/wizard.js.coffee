class SpreeWizard.Models.SpreeWizard extends Backbone.Model
  paramRoot: 'product'


class SpreeWizard.Collections.ProductsCollection extends Backbone.Collection
  model: SpreeWizard.Models.Product
  url: '/SpreeWizards'
