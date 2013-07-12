SpreeWizard.Views.Variants || {}

class SpreeWizard.Views.Variants.VariantView extends Backbone.View
  template: JST["backbone/templates/variants/variant"]

  # el: '#product-detail'
  el: '#product-frame'

  render: () ->
    $(@el).html(@template( @model.toJSON() ))
    return this
