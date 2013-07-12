SpreeWizard.Views.Variants ||= {}

class SpreeWizard.Views.Variants.IndexView extends Backbone.View
  template: JST["backbone/templates/variants/index"]

  el: '#product-frame'
  
  initialize: () ->
    @options.variants.bind('reset', @addAll)
    
  addAll: () =>
    @options.variants.each(@addOne)

  addOne: (model) =>
    view = new SpreeWizard.Views.Variants.VariantView(model : model)
    $('#variants').append(view.render().el)

  render: =>
    $(@el).html(@template(variants: @options.variants.toJSON() ))
    @addAll()

    return this
