class CreateSnippets < ActiveRecord::Migration
  def change
    create_table :snippets do |t|
      t.string :poster
      t.integer :syntax
      t.string :content
      t.boolean :private

      t.timestamps
    end
  end
end
