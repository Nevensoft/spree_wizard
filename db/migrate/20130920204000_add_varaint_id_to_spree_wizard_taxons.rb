class AddVaraintIdToSpreeWizardTaxons < ActiveRecord::Migration
  def change
    add_column :spree_wizard_taxons, :variant_id, :integer
  end
end
