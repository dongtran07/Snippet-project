class AddIndexToSnippet < ActiveRecord::Migration
  def change
  	add_index :snippets, :token
  end
end
