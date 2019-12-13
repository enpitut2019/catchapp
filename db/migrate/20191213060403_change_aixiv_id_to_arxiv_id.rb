class ChangeAixivIdToArxivId < ActiveRecord::Migration[5.2]
  def change
    rename_column :papers, :aixiv_id, :arxiv_id
  end
end
