SpreeWizard.Views.Wizards ||= {}

class SpreeWizard.Views.Wizards.ShowView extends Marionette.ItemView
  template: JST["backbone/templates/wizards/show_view"]
  el: '#wizard'
  
  onRender: ->
    @renderReviewBoxes()
    @getAndRenderSteps()
    @setAuthenticityToken()
  
  renderReviewBoxes: ->
    wizard_info = new SpreeWizard.Views.ReivewBoxes.ShowView()
    wizard_info.render()
  
  getAndRenderSteps: ->
    @model.initializeSteps()
    
  setAuthenticityToken: ->
    token = $('meta[name="csrf-token"]').attr('content')
    $("input[name='authenticity_token']").val(token)  
