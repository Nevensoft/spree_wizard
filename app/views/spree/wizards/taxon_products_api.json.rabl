# taxon_products_api.json.rabl
#
# All related objects have been ActiveRecord eager loaded. Therefore, 
# taxon.products.variants makes no trips to the database.
#

object @taxon
attributes :id, :name

child :products do 
  attributes :id, :name

  child :variants do 
    attributes :id, :price
  end
end