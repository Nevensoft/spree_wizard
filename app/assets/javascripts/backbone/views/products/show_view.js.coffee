Wizard.Views.Products ||= {}

class Wizard.Views.Products.ShowView extends Backbone.View
  template: JST["backbone/templates/products/show"]

  el: '#product-container'

  initialize: ->
  	console.log("hello")
  	@render()
 
  render: ->
    @$el.html(@template)
    console.log(@products)
    return this
