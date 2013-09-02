# spree_wizard

# fire off AJAX event to add a wizard-taxon HTML div
$(document).on 'click', '#add-taxon', (e) -> 
  e.preventDefault()
  $.get('add_taxon', type: 'json')

