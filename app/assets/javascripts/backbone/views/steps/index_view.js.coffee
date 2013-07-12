SpreeWizard.Views.Steps ||= {}

class SpreeWizard.Views.Steps.IndexView extends Backbone.View
  template: JST["backbone/templates/steps/index"]

  el: '#steps'
  
  initialize: () ->
    @options.steps.bind('reset', @addAll)
    
  addAll: () =>
    @options.steps.each(@addOne)

  addOne: (model) =>
    view = new SpreeWizard.Views.Steps.StepView(model : model)
    $('#steps').append(view.render().el)

  render: =>
    $(@el).html(@template(steps: @options.steps.toJSON() ))
    @addAll()

    return this
