class Tutor < ApplicationRecord
    belongs_to :course

    validates :email, presence: true, uniqueness: true
end
