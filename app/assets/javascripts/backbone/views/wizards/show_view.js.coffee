SpreeWizard.Views.Wizards ||= {}

class SpreeWizard.Views.Wizards.ShowView extends Backbone.View
  template: JST["backbone/templates/wizards/show_view"]

  el: '#wizard'

  initialize: ->
    @render()

  render: ->
    $(@el).html(@template( @model.toJSON() ))
    return @
