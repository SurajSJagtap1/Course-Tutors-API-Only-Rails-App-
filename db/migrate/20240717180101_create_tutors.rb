class CreateTutors < ActiveRecord::Migration[7.0]
  def change
    create_table :tutors do |t|
      t.string :name
      t.string :email
      t.integer :age
      t.string :expertise

      t.timestamps
    end
  end
end
