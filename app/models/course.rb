class Course < ApplicationRecord
    paginates_per 10

    has_many  :tutors, dependent: :destroy
    accepts_nested_attributes_for :tutors

    validates :name, presence: true, uniqueness: true
    validates :duration, presence: true
end
