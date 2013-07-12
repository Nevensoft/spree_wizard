SpreeWizard.Views.Products ||= {}

class SpreeWizard.Views.Products.IndexView extends Backbone.View
  template: JST["backbone/templates/products/index"]

  el: '#product-list'

  initialize: () ->
    @options.products.bind('reset', @addAll)
    
  addAll: () =>
    @options.products.each(@addOne)

  addOne: (model) =>
    view = new SpreeWizard.Views.Products.ProductView(model : model)
    $(@el).append(view.render().el)

  render: =>
    $(@el).html(@template(products: @options.products.toJSON() ))
    @addAll()

    return this


