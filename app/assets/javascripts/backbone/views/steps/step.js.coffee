SpreeWizard.Views.Steps ||= {}

class SpreeWizard.Views.Steps.StepView extends Backbone.View
  template: JST["backbone/templates/steps/step"]

  events: 
    "click" : "fetch_products"

  className: 'taxon'

  fetch_products: () ->
    c = new SpreeWizard.Collections.ProductsCollection
    c.set_taxon_products(@model.attributes.id)
    
  render: -> 
    $(@el).append(@template( @model.toJSON() ))
    return this
