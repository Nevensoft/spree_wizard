SpreeWizard.Views.Wizards ||= {}

class SpreeWizard.Views.Wizards.ShowView extends Backbone.View
  template: JST["backbone/templates/wizards/show_view"]

  el: '#wizard'

  initialize: (options) ->
    # _.bindAll(@, 'beforeRender', 'render', 'afterRender') ->
    _.bindAll(this, 'render', 'afterRender')
    
    @render = _.wrap(@render, (render) =>
      # @.beforeRender()
      render()
      @afterRender()
    )
    @render()

  # beforeRender: () ->
  #   alert 'breforeRender()' 

  render: ->
    $(@el).html(@template( @model.toJSON() ))
    return @
    
  afterRender: ->
    v1 = new SpreeWizard.Views.ReivewBoxes.ShowView()
    v1.render()
