class SpreeWizard.Models.Taxon extends Backbone.Model 
  paramRoot: 'taxon'
  # no url. spree doesn't nicely expose a single taxon.

  initialize: ->
    

class SpreeWizard.Collections.TaxonCollection extends Backbone.Model
  model: SpreeWizard.Models.Taxon

  initialize: (model, options) ->
