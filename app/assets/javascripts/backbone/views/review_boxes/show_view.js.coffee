SpreeWizard.Views.ReivewBoxes ||= {}

class SpreeWizard.Views.ReivewBoxes.ShowView extends Backbone.View
  template: JST['backbone/templates/review_boxes/show_view']
  
  el: '#review-share-box'
  
  events: 
    'click #review-finish' : 'review_finish'
    
  review_finish: ->
    alert 'clicked the review and finish "button"'
    
  render: ->
    $(@el).html(@template)
    
    
    
  
