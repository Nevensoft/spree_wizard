SpreeWizard.Views.Steps ||= {}

class SpreeWizard.Views.Steps.StepView extends Marionette.ItemView
  template: JST["backbone/templates/steps/step"]
  
  className: 'taxon'
    
  events: 
    'click' : 'fetch_products'
    
  fetch_products: ->
    c = new SpreeWizard.Collections.ProductsCollection()
    c.set_taxon_products(@model.attributes.id)
  
    ##Keep track of selected taxons so that the "selected" class can be removed on the next selection
    window.previousElement.className = window.previousElement.className.replace(" selected", "") if (window.previousElement != undefined)
    @el.className += " selected";
    window.previousElement = @el;


