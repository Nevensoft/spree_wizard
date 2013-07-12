SpreeWizard.Views.Products ||= {}

class SpreeWizard.Views.Products.DetailView extends Backbone.View
  template: JST["backbone/templates/products/detail_view"]

  el: '#product-frame'

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
