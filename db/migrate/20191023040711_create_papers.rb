class CreatePapers < ActiveRecord::Migration[5.2]
  def change
    create_table :papers do |t|
      t.text :abstract
      t.text :title
      t.date :publishedAt
      t.text :url

      t.timestamps
    end
  end
end
