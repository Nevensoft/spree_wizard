# ==============================================================================
# High Level Overview
# -------------------------------------
# 
# == Wizard
#    > steps
# 
# == Step
#    > taxon
#    > products (belonging to step)
# 
# == Product
#    > variants
# 
# == Variant
#    > (product details not found on the product)
# 
# ------------------------------------------------------------------------------


class SpreeWizard.Models.Wizard extends Backbone.Model
  # paramRoot: 'wizard' # paramRoot not working as rails-backbone described 
  urlRoot: '/wizards'

  initializeSteps: ->
    steps = new SpreeWizard.Collections.StepCollections(@attributes.taxons)
    view = new SpreeWizard.Views.Steps.IndexView(collection: steps)
    view.render()
    
class SpreeWizard.Collections.WizardCollection extends Backbone.Collection
  model: SpreeWizard.Models.Wizard
  url: '/wizards'
