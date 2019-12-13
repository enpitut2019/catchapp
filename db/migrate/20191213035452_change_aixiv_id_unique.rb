class ChangeAixivIdUnique < ActiveRecord::Migration[5.2]
  def change
    change_column :papers, :aixiv_id, :text, unique: true
  end
end
