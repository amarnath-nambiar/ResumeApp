class CreateEducations < ActiveRecord::Migration[5.2]
  def change
    create_table :educations do |t|
      t.string :college
      t.string :course
      t.date :joining_date
      t.date :completion_date
      t.float :aggregate

      t.timestamps
    end
  end
end
