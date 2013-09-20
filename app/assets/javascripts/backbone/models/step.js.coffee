class SpreeWizard.Models.Step extends Backbone.Model
  paramRoot: 'step'
  # no url. comes from wizard initialization

class SpreeWizard.Collections.StepCollections extends Backbone.Collection
  model: SpreeWizard.Models.Step
  # no url. comes from wizard initialization
