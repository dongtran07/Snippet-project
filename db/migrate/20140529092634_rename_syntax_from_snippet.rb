class RenameSyntaxFromSnippet < ActiveRecord::Migration
  def change
  	rename_column :snippets, :syntax, :syntax_id
  end
end
