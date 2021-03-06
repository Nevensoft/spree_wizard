# show.json.rabl
#
### Example Output
#
# {"id":1,"name":"new wizard","taxons":[ 
#     {"id":4, "name":"Bags", "permalink":"categories/bags", "taxonomy_id":1, "position":1, "variant_id":1},
#     {"id":6,"name":"Clothing","permalink":"categories/clothing","taxonomy_id":1, "position":2, "variant_id":14},
#   ]
# }
#

object @wizard

attributes :id, :name

child :wizard_taxons do 
  attributes :id, :position, :variant_id
    
  child :taxon do 
    attributes :id, :name, :permalink, :taxonomy_id, :position
  end
end
