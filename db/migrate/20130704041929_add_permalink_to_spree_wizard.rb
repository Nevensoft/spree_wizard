class AddPermalinkToSpreeWizard < ActiveRecord::Migration
  def change
    add_column :spree_wizards, :permalink, :string
  end
end
