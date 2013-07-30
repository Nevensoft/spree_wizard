SpreeWizard.Views.Products ||= {}

class SpreeWizard.Views.Products.IndexView extends Marionette.CompositeView
  template: JST["backbone/templates/products/index"]
  
  el: '#product-container'
  
  itemView: SpreeWizard.Views.Products.ProductView
  itemViewContainer: '#product-list'
  
