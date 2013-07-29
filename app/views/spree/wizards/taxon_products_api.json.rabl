# taxon_products_api.json.rabl
#
# All related objects have been ActiveRecord eager loaded.
# Therefore, taxon.products.variants makes no trips to the database.
#
# {"id":5,"name":"Mugs","products":
#   [
#     {"id":13,"name":"Ruby on Rails Mug","variants":
#      [
#         {"id":27,"price":"13.99"},
#         {"id":28,"price":"13.99"},
#         {"id":29,"price":"13.99"}
#       ]
#    },
#    {"id":14,"name":"Ruby on Rails Stein","variants":[]},
#     {"id":15,"name":"Spree Stein","variants":[]},
#     {"id":16,"name":"Spree Mug","variants":[]}
#   ]
# }
#

object @taxon

child :products do 
  attributes :id, :name, :price
  
  node(:attachment_url) { |p| p.images.try(:first).try(:attachment).try(:url) } 
  node(:announcement )  { false }

  child :variants do 
    attributes :id, :price
  end
end
