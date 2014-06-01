class CreateSyntaxes < ActiveRecord::Migration
  def change
    create_table :syntaxes do |t|
      t.string :name

      t.timestamps
    end
  end
end
