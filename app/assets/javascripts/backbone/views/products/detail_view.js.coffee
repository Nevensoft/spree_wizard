SpreeWizard.Views.Products ||= {}

class SpreeWizard.Views.Products.DetailView extends Marionette.ItemView
  template: JST["backbone/templates/products/detail_view"]
  
  el: '#product-detail-frame'
  
  el_select = '#detail-option'
  
  select_this_product: (e) ->
  
  create_variant_options: (variants) ->
    $(el_select).append("<option value='default'>Choose variation</option>")
    
    _.each(variants, (variant) ->
      names = []
      _.each(variant.option_values, (ov)  -> names.push(ov.name) )
      $(el_select).append("<option value='" + variant.id + "''>" + names.join(' - ') + "</option>")
    )
    
  create_product_options: (product) ->
    $(el_select).append("<option value='" + product.get('id') + "''>" + product.get('name') + "</option>")
    
  
  update_price: (e) ->
    model = @model
    variants = @model.get('variants')
    variant_id = parseInt($(el_select).prop('value'))
    _.find(variants, (variant) -> 
      if(variant.id == variant_id)
        # diff = parseInt(variant.price) -  parseInt( model.get('price') )
        $('#upgrade-price > h3').html("<strong>Price:</strong>  $" + variant.price)
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
      @select_this_product()
      
    @.$('#detail-option').on 'change', (e) =>
      @update_price(e)
    
