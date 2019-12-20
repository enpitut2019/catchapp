class AddAnalizedColumnToPaper < ActiveRecord::Migration[5.2]
  def change
    add_column :papers, :analized, :boolean, default: false
  end
end
