SpreeWizard.Views.Wizards ||= {}

class SpreeWizard.Views.Wizards.ShowView extends Marionette.ItemView
  template: JST["backbone/templates/wizards/show_view"]
  el: '#wizard'
  
  onRender: ->
    @model.initializeSteps();
    v1 = new SpreeWizard.Views.ReivewBoxes.ShowView()
    v1.render()
