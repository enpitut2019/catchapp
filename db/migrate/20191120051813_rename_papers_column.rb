class RenamePapersColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :papers, :cite, :cite_count
    rename_column :papers, :cited, :cited_count
  end
end
