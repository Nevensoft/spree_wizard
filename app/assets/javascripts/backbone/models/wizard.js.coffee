# ==============================================================================
# High Level Overview
# -------------------------------------
# 
# Each spree wizard step has, 
# == Step
#    > taxon
#    > products (belonging to said said)
#    > display name
#    > features

# NOTES (remember to take these out before publishing)
# 
# the wizards page shows a list of wizards
# 
# user clicks on a single wizard, and user is redirected to wizard show page.


class SpreeWizard.Models.Wizard extends Backbone.Model
  paramRoot: 'wizard' 
  urlRoot: '/wizards'

  initializeSteps: (steps) ->
    # steps is array of wizard steps
    steps_collection = new SpreeWizard.Collections.StepCollections(steps, [])
    steps_index_view = new SpreeWizard.Views.Steps.IndexView(steps: steps_collection)
    steps_index_view.render()

class SpreeWizard.Collections.WizardCollection extends Backbone.Collection
  model: SpreeWizard.Models.Wizard
  url: '/wizards'

  getOrFetch: (id, options) ->
    if @get(id)
      model = @get id
    else
      model = new model(id: id)
      @add model
      model.fetch()
    model
