class CreateSpreeWizardsTable < ActiveRecord::Migration
  def change
    create_table :spree_wizards do |t|
      t.string :name

      t.timestamps
    end
  end
end
