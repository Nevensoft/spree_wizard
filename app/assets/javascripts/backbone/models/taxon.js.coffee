class SpreeWizard.Models.Taxon extends Backbone.Model 
  # paramRoot: 'taxon' # paramRoot not working as rails-backbone described
  # no url. spree doesn't nicely expose a single taxon.
    

class SpreeWizard.Collections.TaxonCollection extends Backbone.Model
  model: SpreeWizard.Models.Taxon

  initialize: (model, options) ->
