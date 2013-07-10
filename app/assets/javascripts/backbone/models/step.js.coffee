class SpreeWizard.Models.Step extends Backbone.Model
  paramRoot: 'step'
  # no url. comes from wizard initialization

  loadTaxon: (id) ->
    @taxon = new SpreeWizard.Models.Step({id: id})

class SpreeWizard.Collections.StepCollections extends Backbone.Collection
  model: SpreeWizard.Models.Step
  # no url. comes from wizard initialization

  # initialize: (models, options) ->