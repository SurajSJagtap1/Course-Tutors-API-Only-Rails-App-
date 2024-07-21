class AddCourseToTutors < ActiveRecord::Migration[7.0]
  def change
    add_reference :tutors, :course, null: false, foreign_key: true
  end
end
