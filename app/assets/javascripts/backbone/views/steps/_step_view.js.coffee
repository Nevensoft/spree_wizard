SpreeWizard.Views.Steps ||= {}

class SpreeWizard.Views.Steps.StepView extends Marionette.ItemView
  template: JST["backbone/templates/steps/step"]
  
  className: 'taxon'
    
  events: 
    'click' : 'fetch_products'
    
  fetch_products: ->
    c = new SpreeWizard.Collections.ProductsCollection()
    c.set_taxon_products(@model.attributes.id)
