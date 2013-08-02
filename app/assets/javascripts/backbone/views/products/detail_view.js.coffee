SpreeWizard.Views.Products ||= {}

class SpreeWizard.Views.Products.DetailView extends Marionette.ItemView
  template: JST["backbone/templates/products/detail_view"]
  
  el: '#product-detail-frame'
      
  select_this_product: (e) ->
    alert 'clicked button'
    
  onRender: () ->
    this.$('.product-add').on 'click', () =>
      this.select_this_product()
    
