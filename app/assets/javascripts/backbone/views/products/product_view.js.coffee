SpreeWizard.Views.Products ||= {}

class SpreeWizard.Views.Products.ProductView extends Backbone.View
  template: JST["backbone/templates/products/product"]

  className: 'product'

  events: 
    "click" : "display_product_detail"

  display_product_detail: () ->
    view = new SpreeWizard.Views.Products.DetailView(model: @model)
    view.render()

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
