SpreeWizard.Views.Steps ||= {}

class SpreeWizard.Views.Steps.StepView extends Backbone.View
  template: JST["backbone/templates/steps/step"]

  events: 
    "click .box" : "some_event"

  tagName: '.step'
    
  some_event: () ->
    # @model.does_something()
    # this.does_some_view_action()

  render: -> 
    $(@el).html(@template( @model.toJSON() ))

    return this
