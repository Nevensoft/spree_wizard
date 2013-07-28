/*
 * spree_wizards
 */


// formats the UI aspects of the search textfield
//
//= require select2
jQuery(function($) {
  // Make select beautiful
  $('select.select2').select2({
    allowClear: true
  });

  function format_wizards(wizard) {
    new_wizard = wizard.text.replace('->', '<i class="icon-arrow-right">')
    return new_wizard;
  }

  $("#wizard_taxon_ids").on({
    change: function(e){
      $('.select2-search-choice .with-tip').powerTip({
        smartPlacement: true,
        fadeInTime: 50,
        fadeOutTime: 50
      })
    }
  })
})


// makes AJAX call to get Spree::Taxons based on user text input
//
$(document).ready(function() {
  if ($("#wizard_taxon_ids").length > 0) {
    $("#wizard_taxon_ids").select2({
      placeholder: Spree.translations.taxon_placeholder,
      multiple: true,
      initSelection: function(element, callback) {
        url = Spree.url(Spree.routes.taxons_search, { ids: element.val() })
        return $.getJSON(url, null, function(data) {
          return callback(data);
        })
      },
      ajax: {
        url: Spree.routes.taxons_search,
        datatype: 'json',
        data: function(term, page) {
          return { q:
            { name_cont: term }
          }
        },
        results: function (data, page) {
          return { results: data }
        }
      },
      formatResult: function(taxon) {
        return taxon.pretty_name
      },
      formatSelection: function(taxon) {
        return taxon.pretty_name
      }
    })
  }
})
