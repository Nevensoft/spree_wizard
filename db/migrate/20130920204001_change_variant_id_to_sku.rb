class ChangeVariantIdToSku < ActiveRecord::Migration
  def up
    remove_column :spree_wizard_taxons, :variant_id, :integer
    add_column :spree_wizard_taxons, :sku, :string
  end
  
  def down
    add_column :spree_wizard_taxons, :variant_id, :integer
    remove_column :spree_wizard_taxons, :sku, :string
  end
end
