class SpreeWizard.Models.Product extends Backbone.Model
  paramRoot: 'product'
  urlRoot: '/api/products'

class SpreeWizard.Collections.ProductsCollection extends Backbone.Collection
  model: SpreeWizard.Models.Product
  url: '/api/products'
  
  initialize: (models, arg) ->
    # _.bindAll('set_taxon_products', @render_taxon_products)

  set_taxon_products: (taxon_id) =>
    that = this
    root = 'products'
    url  = "/wizards/taxon/" + taxon_id + "/products"

    $.ajax
      type: 'get'
      url: url
      success: (data, textStatus, jqXHR) ->
        that.render_index(data.products)

        # TODO need to come up with render logic when data.products.size = 0

  
  render_index: (products) =>
    v = new SpreeWizard.Views.Products.IndexView( products: new SpreeWizard.Collections.ProductsCollection(products))
    v.render()



