class AddColumnPapers < ActiveRecord::Migration[5.2]
  def change
    add_column :papers, :journal, :string
    add_column :papers, :title_ja, :string
    add_column :papers, :cite,:integer
    add_column :papers, :cited,:integer 
  end
end
