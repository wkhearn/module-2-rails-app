class ExperienceSignup < ApplicationRecord
  belongs_to :user
  belongs_to :experience
  validates :user_id, uniqueness: true
end
