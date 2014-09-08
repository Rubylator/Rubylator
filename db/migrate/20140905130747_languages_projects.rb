class LanguagesProjects < ActiveRecord::Migration
  def change
    create_table :languages_projects do |t|
      t.references :language, index: true
      t.references :project, index: true
    end
  end
end
