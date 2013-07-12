# ==============================================================================
# High Level Overview
# -------------------------------------
# 
# == Wizard
#    > steps
# 
# == Step
#    > taxon
#    > products (belonging to step
# 
# 
# ------------------------------------------------------------------------------


class SpreeWizard.Models.Wizard extends Backbone.Model
  paramRoot: 'wizard' 
  urlRoot: '/wizards'

  initializeSteps: () ->
    steps = new SpreeWizard.Collections.StepCollections(@attributes.taxons)
    view = new SpreeWizard.Views.Steps.IndexView(steps: steps)
    view.render()
    
class SpreeWizard.Collections.WizardCollection extends Backbone.Collection
  model: SpreeWizard.Models.Wizard
  url: '/wizards'
