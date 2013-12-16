class SpreeWizard.Models.Product extends Backbone.Model
  paramRoot: 'product'
  urlRoot: '/api/products'

class SpreeWizard.Collections.ProductsCollection extends Backbone.Collection
  model: SpreeWizard.Models.Product
  url: '/api/products'
  
  set_taxon: (taxon) ->
    @taxon = taxon
    @fetch_taxon_products(@taxon.id)

  fetch_taxon_products: (taxon_id) ->
    $('#product-detail-frame').html('')
    url  = "/wizards/taxon/" + taxon_id + "/products"

    $.ajax url,
      type: 'GET'
      format: 'json'
      success: (data, textStatus, jqXHR) =>
        @render_fetched_products(data.products, taxon)
        
        # TODO need to come up with render logic when data.products.size = 0

  render_fetched_products: (products) ->
    #The width must be 176 * the number of products + 50 for right arrow
    product_list_width = 50 + products.length * 176
    product_collection = new SpreeWizard.Collections.ProductsCollection(products)    
    product_collection.taxon = @taxon
    collection_view = new SpreeWizard.Views.Products.IndexView(collection: product_collection)
    collection_view.render()
  
