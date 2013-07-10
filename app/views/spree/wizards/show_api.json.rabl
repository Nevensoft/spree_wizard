# show.json.rabl
#
### Example Output
#
# {"id":1,"name":"new wizard","taxons":[ 
#     {"id":4,"name":"Bags","permalink":"categories/bags","taxonomy_id":1},
#     {"id":6,"name":"Clothing","permalink":"categories/clothing","taxonomy_id":1}
#   ]
# }
#

object @wizard

attributes :id, :name

child :taxons do 
  attributes :id, :name, :permalink, :taxonomy_id
end
