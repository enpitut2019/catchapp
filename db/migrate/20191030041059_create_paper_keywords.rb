class CreatePaperKeywords < ActiveRecord::Migration[5.2]
  def change
    create_table :paper_keywords do |t|
      t.references :paper, foreign_key: true
      t.references :keyword, foreign_key: true

      t.timestamps
    end
  end
end
