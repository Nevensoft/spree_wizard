Wizard.Views.Products ||= {}

class Wizard.Views.Products.IndexView extends Backbone.View
  template: JST["backbone/templates/products/index"]

  el: $('#product-container'),

  initialize: () ->
    console.log('Hello there')
    @options.products.bind('reset', @addAll)

  addAll: () =>
    @options.products.each(@addOne)

  addOne: (product) =>
    view = new Wizard.Views.Products.ProductView({model : product})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(products: @options.products.toJSON() ))
    @addAll()

    return this
