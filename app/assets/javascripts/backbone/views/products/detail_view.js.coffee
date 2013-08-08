SpreeWizard.Views.Products ||= {}

class SpreeWizard.Views.Products.DetailView extends Marionette.ItemView
  template: JST["backbone/templates/products/detail_view"]
  
  el: '#product-detail-frame'
  el_select = '#detail-option'
  el_src = '#product-photo > img'
  el_name = '.product-name'
  el_price = '#upgrade-price > h3 > span'
  
  select_this_product: (e) ->
    id = $(el_select).find(':selected').val()
    if(id == 'default')
      alert('Please choose a product option')
      return
    src = $(el_src).attr('src')
    name = $(el_name).text()
    price = parseFloat($(el_price).text())
    $('.taxon.selected > .selected-product-id').attr('name', 'variants[' + id + ']')
    $('.taxon.selected > .selected-product').attr('price', price)
    $('.taxon.selected > .selected-product > img').attr('src', src)
    $('.taxon.selected > .taxon-description > p').html(name)
    subtotal = 0

    prices = $('.selected-product')
    _.each(prices, (price) ->
      subtotal += parseFloat($(price).attr('price'))
    )

    subtotal = subtotal.toFixed(2)
    $('.subtotal > h3 > span').text(subtotal)
    $('html, body').animate({
            scrollTop: $('#wizard-frame').offset().top - 20 + 'px'
        }, 'fast');
  
  create_variant_options: (variants) ->
    $(el_select).append("<option value='default'>Choose variation</option>")
    
    _.each(variants, (variant) ->
      names = []
      _.each(variant.option_values, (option_value)  -> names.push(option_value.name) )
      $(el_select).append("<option value='" + variant.id + "''>" + names.join(' - ') + "</option>")
    )
    
  create_product_options: (product) ->
    $(el_select).append("<option selected value=" + product.get('id') + ">" + product.get('name') + "</option>")
    
  select_option: (e) ->
    option = e.target.options[e.target.selectedIndex]
    $(option).attr('selected', 'selected')
  
  update_price: (e) ->
    model = @model
    variants = @model.get('variants')  
    variant_id = parseInt($(el_select).prop('value'))
    _.find(variants, (variant) -> 
      if(variant.id == variant_id)
        # diff = parseInt(variant.price) -  parseInt( model.get('price') )    
        $('#upgrade-price > h3').html("<strong>Price:</strong>  $<span>" + variant.price + "</span>")
    )
    
    
  render_product_options: ->
    variants = @model.get('variants')
    
    if variants.length > 0
      @create_variant_options(variants)
    else
      @create_product_options(@model)
      
    
  onRender: () ->
    @render_product_options()
    
    @.$('.product-add').on 'click', (e) =>
      @select_this_product(e)
      
    @.$('#detail-option').on 'change', (e) =>
      @select_option(e)
      @update_price(e)
    
