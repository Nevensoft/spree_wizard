# taxon_products_api.json.rabl
#
# All related objects have been ActiveRecord eager loaded.
# Therefore, taxon.products.variants makes no trips to the database.
#
#   {
#     products: [
#       {
#         id: 1,
#         name: "Ruby on Rails Tote",
#         price: "15.99",
#         description: "Modi ...",
#         sku: "ROR-00011",
#         taxon_ids: [4],
#         attachment_url: "/spree/products/21/product/ror_tote.jpeg?1377193735",
#         announcement: false,
#         variants: [ ]
#       },
#       {
#         id: 2,
#         name: "Ruby on Rails Bag",
#         price: "22.99",
#         description: "Modi ...",
#         sku: "ROR-00012",
#         taxon_ids: [4],
#         attachment_url: "/spree/products/23/product/ror_bag.jpeg?1377193736",
#         announcement: false,
#         variants: [ ]
#       },
#     ]
#  }
    
object @taxon

child :products do 
  attributes :id, :name, :price, :description, :sku, :taxon_ids
  
  node(:attachment_url) { |p| p.images.try(:first).try(:attachment).try(:url) } 
  node(:announcement )  { false }
  
  child :variants do 
    attributes :id, :price, :is_master
    
    child :option_values do 
      attributes :name
    end
  end
  
end
