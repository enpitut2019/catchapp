class AddColumsAbstractAndUrl < ActiveRecord::Migration[5.2]
  def change
  	add_column :papers, :abstract_ja, :text
  	add_column :papers, :pdf_url, :text
  	remove_column :papers, :publishedAt, :date
  	add_column :papers, :published_at, :date
  end
end
