class SpreeWizard.Models.Step extends Backbone.Model
  # paramRoot: 'step' # paramRoot not working as rails-backbone described
  # no url. comes from wizard initialization

class SpreeWizard.Collections.StepCollections extends Backbone.Collection
  model: SpreeWizard.Models.Step
  # no url. comes from wizard initialization
