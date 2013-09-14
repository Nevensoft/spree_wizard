SpreeWizard.Views.Products ||= {}

class SpreeWizard.Views.Products.IndexView extends Marionette.CompositeView
  template: JST["backbone/templates/products/index"]
  
  el: '#product-container'
  
  itemView: SpreeWizard.Views.Products.ProductView
  itemViewContainer: '#product-list'
  
  onRender: () ->
    product_list_width = @collection.length * 176
    $('#product-list').css('width', product_list_width + 'px')
    if(@collection.length > 3)
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
    product_list_shift_amount = 528
    $('#product-list-container').animate({scrollLeft: product_list_previous_shift - product_list_shift_amount}, 600, 'swing')
  shift_products_right: ->
    product_list_previous_shift = $('#product-list-container').scrollLeft()  
    product_list_shift_amount = 528
    $('#product-list-container').animate({scrollLeft: product_list_previous_shift + product_list_shift_amount}, 600, 'swing')
  check_moved_products: ->
    product_list_previous_shift = $('#product-list-container').scrollLeft()
    total_width_left = parseInt($('#product-list').css('width').replace("px", "")) - 528 - product_list_previous_shift
    if(total_width_left <= 0)
      $('#product-arrow-right span').css('background-position', '-174px -232px')
    else
      $('#product-arrow-right span').css('background-position', '-287px -232px')
    if(product_list_previous_shift == 0)
      $('#product-arrow-left span').css('background-position', '-120px -232px')
    else
      $('#product-arrow-left span').css('background-position', '-6px -232px')
