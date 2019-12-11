class AddArxivIdColumnPapers < ActiveRecord::Migration[5.2]
  def change
    add_column :papers, :aixiv_id, :integer
  end
end
