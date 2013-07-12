SpreeWizard.Views.Steps ||= {}

class SpreeWizard.Views.Steps.StepView extends Backbone.View
  template: JST["backbone/templates/steps/step"]

  el: '#steps'

  render: -> 
    $(@el).append(@template( @model.toJSON() ))
    return this
