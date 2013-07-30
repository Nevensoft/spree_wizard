class SpreeWizard.Models.Product extends Backbone.Model
  # paramRoot: 'product' # paramRoot does work as rails-backbone described
  urlRoot: '/api/products'

class SpreeWizard.Collections.ProductsCollection extends Backbone.Collection
  model: SpreeWizard.Models.Product
  url: '/api/products'

  set_taxon_products: (taxon_id) ->
    $('#product-frame').html('')
    url  = "/wizards/taxon/" + taxon_id + "/products"

    $.ajax url,
      type: 'GET'
      success: (data, textStatus, jqXHR) =>
        @render_fetched_products(data.products)

        # TODO need to come up with render logic when data.products.size = 0

  render_fetched_products: (products) ->
    product_collection = new SpreeWizard.Collections.ProductsCollection(products)    
    collection_view = new SpreeWizard.Views.Products.IndexView(collection: product_collection)
    collection_view.render()
