class AddAncestryToWord < ActiveRecord::Migration
  def change
    add_column :words, :ancestry, :string
    add_index :words, :ancestry
  end
end
