class AddUserIdToSnippets < ActiveRecord::Migration
  def change
    add_column :snippets, :user_id, :integer,:default => 0
  end
end
