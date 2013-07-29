class SpreeWizard.Models.ReviewBox extends Backbone.Model
  # paramRoot: 'step' # paramRoot not working as rails-backbone described
  # no url. comes from wizard initialization

class SpreeWizard.Collections.ReviewBoxCollection extends Backbone.Collection
  model: SpreeWizard.Models.ReviewBox
  # no url. comes from wizard initialization
