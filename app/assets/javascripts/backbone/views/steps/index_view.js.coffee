SpreeWizard.Views.Steps ||= {}

class SpreeWizard.Views.Steps.IndexView extends Marionette.CompositeView
  itemView: SpreeWizard.Views.Steps.StepView
  template: JST["backbone/templates/steps/index"]
  el: '#steps'
  
  onRender: ->  
    _.each(@collection.models, ((model_step, index, list) ->
      url_param_key = "step" + (index+1).toString()
      variant_id = @getURLParameter(url_param_key)
      @getVariant(variant_id, model_step) if variant_id
    ), @)
    
  getURLParameter: (name) -> 
    decodeURIComponent((new RegExp("[?|&]#{name}=([^&;]+?)(&|##|;|$)").exec(location.search) || [null,""] )[1].replace(/\+/g, '%20'))||null;
      
  getVariant: (variant_id, model_step) ->
    
    # NOTE: Intentionally chose variant_id as the search param 
    #       Using the Spree based SKU number only specifies scope to the Master 
    #       Variant and client requirement was ability to level variant pre-selection
    
    $.ajax("/api/variants?q[id_eq]=" + variant_id, 
      dataType: 'json'
      context: @
      success: (data, textStatus, jqXHR) ->
        # NOTE: If returns just 1 variant as expected, "style" step view as pre-selected
        @selectVariant(data.variants[0], model_step) if data.count == 1
    )
  
  selectVariant: (variant_attributes, model_step) ->
    view_step = @children.findByModel(model_step)
    variant = new SpreeWizard.Models.Variant(variant_attributes)  
    
    _name = "variants[" + variant.get('id') + "]"
    view_step.$('.selected-product-id').attr('name', _name)
    
    _price = variant.get('price')
    view_step.$('.selected-product').attr('price', _price)
    
    _small_img_url = variant.get('images')[0].urls.small
    view_step.$('.selected-product > img').attr('src', _small_img_url)
    
    _variant_title = variant.get('name')
    view_step.$('.taxon-description > p').text(_variant_title)
