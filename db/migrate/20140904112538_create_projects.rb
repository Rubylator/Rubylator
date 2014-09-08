class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.belongs_to :language
      t.string :name

      t.timestamps
    end
  end
end
