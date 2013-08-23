# HTML name base string 
"<%= j( @base = 'wizard[wizard_taxons_attributes][' + @time_stamp + ']' ) %>"

# Javascript to insert new wizard-taxon div
$('.wizard-taxons .field').append "\ 
  <div class='wizard-taxon-new wizard-taxon'>\
    <%= j select_tag(@base + '[taxon_id]', options_for_select(Spree::Taxon.order(:name).collect {|t|[t.name + ' -  ' + t.permalink, t.id]}) )%>\
    <%= j text_field_tag(@base + '[position]') %>\
  </div>\
  <br/>"
  
