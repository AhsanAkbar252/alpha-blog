class RenameCategories < ActiveRecord::Migration[6.0]
  def change
    change_table :categories do |t|
      t.rename :category , :name
    end
  end
end
