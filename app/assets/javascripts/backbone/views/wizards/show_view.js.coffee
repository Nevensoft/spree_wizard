SpreeWizard.Views.Wizards ||= {}

class SpreeWizard.Views.Wizards.ShowView extends Marionette.ItemView
  template: JST["backbone/templates/wizards/show_view"]
  el: '#wizard'
  
  onRender: ->
    @model.initializeSteps()
    wizard_info = new SpreeWizard.Views.ReivewBoxes.ShowView()
    wizard_info.render()
    @set_authenticity_token()

  set_authenticity_token: ->
  	token = $('meta[name="csrf-token"]').attr('content')
  	$("input[name='authenticity_token']").val(token)

    
