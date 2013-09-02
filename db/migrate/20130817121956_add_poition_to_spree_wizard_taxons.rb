class AddPoitionToSpreeWizardTaxons < ActiveRecord::Migration
  def up
    add_column :spree_wizard_taxons, :position, :integer
    Spree::WizardTaxon.reset_column_information
    
    Spree::Wizard.find_each do |wizard|
      wizard.wizard_taxons.each_with_index do |taxon, index|
        taxon.update_attribute(:position, index)
      end
    end
  end

  def down
    remove_column :spree_wizard_taxons, :position
  end
end
