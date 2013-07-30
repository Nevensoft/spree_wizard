SpreeWizard.Views.Products ||= {}

class SpreeWizard.Views.Products.DetailView extends Marionette.ItemView
  template: JST["backbone/templates/products/detail_view"]
  
  el: '#product-frame'
  
  events: 
    'click button' : 'select_this_product'
    
  select_this_product: =>
    alert 'clicked button'
    
