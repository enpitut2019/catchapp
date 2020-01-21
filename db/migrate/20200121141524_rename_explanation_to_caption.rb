class RenameExplanationToCaption < ActiveRecord::Migration[5.2]
  def change
    rename_column :figures, :explanation, :caption
    add_column :figures, :caption_ja, :text
  end
end
