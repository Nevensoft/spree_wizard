class SpreeWizard.Models.Variant extends Backbone.Model
  paramRoot: 'variant'
  # no urlRoot

class SpreeWizard.Collections.VariantCollection extends Backbone.Collection
  model: SpreeWizard.Models.Variant
  # no url 
