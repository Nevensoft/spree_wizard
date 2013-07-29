class SpreeWizard.Models.Product extends Backbone.Model
  paramRoot: 'product'
  urlRoot: '/api/products'

class SpreeWizard.Collections.ProductsCollection extends Backbone.Collection
  model: SpreeWizard.Models.Product
  url: '/api/products'
  
  initialize: (models, arg) ->
    # _.bindAll('set_taxon_products', @render_taxon_products)

  set_taxon_products: (taxon_id) ->
    url  = "/wizards/taxon/" + taxon_id + "/products"

    $.ajax url,
      type: 'GET'
      success: (data, textStatus, jqXHR) =>
        @render_fetched_products(data.products)

        # TODO need to come up with render logic when data.products.size = 0

  render_fetched_products: (products) ->
    product_collection = new SpreeWizard.Collections.ProductsCollection(products)
    collection_view = new SpreeWizard.Views.Products.IndexView(products: product_collection)
    collection_view.render()
    



