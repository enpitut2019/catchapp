class CreateFigures < ActiveRecord::Migration[5.2]
  def change
    create_table :figures do |t|
      t.string :figure
      t.text :explanation
      t.references :paper, foreign_key: true

      t.timestamps
    end
  end
end
