class CreateAcademicProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :academic_projects do |t|
      t.string :title
      t.text :description
      t.string :role
      t.references :student

      t.timestamps
    end
  end
end
