class SpreeWizard.Models.Product extends Backbone.Model
  # paramRoot: 'product' # paramRoot does work as rails-backbone described
  urlRoot: '/api/products'

class SpreeWizard.Collections.ProductsCollection extends Backbone.Collection
  model: SpreeWizard.Models.Product
  url: '/api/products'

  set_taxon_products: (taxon_id) ->
    $('#product-detail-frame').html('')
    url  = "/wizards/taxon/" + taxon_id + "/products"

    $.ajax url,
      type: 'GET'
      success: (data, textStatus, jqXHR) =>
        @render_fetched_products(data.products)

        # TODO need to come up with render logic when data.products.size = 0

  render_fetched_products: (products) ->
    #The width must be 176 * the number of products + 50 for right arrow
    product_list_width = 50 + products.length * 176
    product_collection = new SpreeWizard.Collections.ProductsCollection(products)    
    collection_view = new SpreeWizard.Views.Products.IndexView(collection: product_collection)
    collection_view.render()
    $('#product-list').css('width', product_list_width + 'px')
    if(products.length > 4)
      $('#product-arrow-left').on 'click', () =>
        @shift_products_left()
      $('#product-arrow-right').on 'click', () =>
        @shift_products_right()
      $('#product-list-container').on 'scroll', () =>
        @check_moved_products()
    else
      $('#product-arrow-right span').css('background-position', '-174px -232px')

  shift_products_left: ->
    product_list_previous_shift = $('#product-list-container').scrollLeft()
    product_list_shift_amount = 704
    $('#product-list-container').animate({scrollLeft: product_list_previous_shift - product_list_shift_amount}, 600, 'swing')

  shift_products_right: ->
    product_list_previous_shift = $('#product-list-container').scrollLeft()  
    product_list_shift_amount = 704
    $('#product-list-container').animate({scrollLeft: product_list_previous_shift + product_list_shift_amount}, 600, 'swing')

  check_moved_products: ->
    product_list_previous_shift = $('#product-list-container').scrollLeft()
    total_width_left = parseInt($('#product-list').css('width').replace("px", "")) - 50 - 840 - product_list_previous_shift
    if(total_width_left <= 0)
      $('#product-arrow-right span').css('background-position', '-174px -232px')
    else
      $('#product-arrow-right span').css('background-position', '-287px -232px')
    if(product_list_previous_shift == 0)
      $('#product-arrow-left span').css('background-position', '-120px -232px')
    else
      $('#product-arrow-left span').css('background-position', '-6px -232px')



