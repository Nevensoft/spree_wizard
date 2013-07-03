class AddFieldsToSpreeWizard < ActiveRecord::Migration
  def change
    add_column :spree_wizards, :taxonomy_id, :integer

    create_table :spree_wizard_taxons do |t|
      t.integer :wizard_id
      t.integer :taxon_id
      
      t.timestamps
    end
  end
end
