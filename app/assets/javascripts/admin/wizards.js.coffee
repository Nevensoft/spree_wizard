# spree_wizard

# formats the UI aspects of the search textfield

#= require select2
($) ->  
  # Make select beautiful
  format_wizards = (wizard) ->
    new_wizard = wizard.text.replace("->", "<i class=\"icon-arrow-right\">")
    new_wizard
  $("select.select2").select2 allowClear: true
  $("#wizard_taxon_ids").on change: (e) ->
    $(".select2-search-choice .with-tip").powerTip
      smartPlacement: true
      fadeInTime: 50
      fadeOutTime: 50


# makes AJAX call to get Spree::Taxons based on user text input
$(document).ready ->
  if $("#wizard_taxon_ids").length > 0
    $("#wizard_taxon_ids").select2
      placeholder: Spree.translations.taxon_placeholder
      multiple: true
      initSelection: (element, callback) ->
        url = Spree.url(Spree.routes.taxons_search,
          ids: element.val()
        )
        $.getJSON url, null, (data) ->
          callback data
          
      ajax:
        url: Spree.routes.taxons_search
        datatype: "json"
        data: (term, page) ->
          q:
            name_cont: term
        results: (data, page) ->
          results: data
          
      formatResult: (taxon) ->
        taxon.pretty_name
      
      formatSelection: (taxon) ->
        taxon.pretty_name

