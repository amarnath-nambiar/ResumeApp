class CreateWorks < ActiveRecord::Migration[5.2]
  def change
    create_table :works do |t|
      t.string :company
      t.string :role
      t.date :join_date
      t.date :completion_date

      t.timestamps
    end
  end
end
