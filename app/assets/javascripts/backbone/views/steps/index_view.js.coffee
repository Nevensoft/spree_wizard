SpreeWizard.Views.Steps ||= {}

class SpreeWizard.Views.Steps.IndexView extends Marionette.CompositeView
  itemView: SpreeWizard.Views.Steps.StepView
  template: JST["backbone/templates/steps/index"]
  el: '#steps'
