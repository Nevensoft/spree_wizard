SpreeWizard.Views.Products ||= {}

class SpreeWizard.Views.Products.ShowView extends Backbone.View
  template: JST["backbone/templates/products/show"]

  el: '#example-item'

  initialize: ->
    if @model.get('name')
      @render()
    else
      @model.fetch success: (model, response, actions) =>
        @render()
 
  render: ->
    $(@el).html( @template(@model.toJSON() ))
    return this