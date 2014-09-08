class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :key
      t.string :text
      t.references :project, index: true
      t.references :lanugage, index: true

      t.timestamps
    end
  end
end
