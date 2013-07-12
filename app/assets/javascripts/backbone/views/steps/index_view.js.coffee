SpreeWizard.Views.Steps ||= {}

class SpreeWizard.Views.Steps.IndexView extends Backbone.View
  el: '#steps'
  template: JST["backbone/templates/steps/index"]

  initialize: () ->
    @options.steps.bind('reset', @addAll)
    
  addAll: () =>
    @options.steps.each(@addOne)

  addOne: (model) =>
    view = new SpreeWizard.Views.Steps.StepView(model : model)
    view.render()

  render: =>
    $(@el).html(@template(steps: @options.steps.toJSON() ))
    @addAll()

    return this
