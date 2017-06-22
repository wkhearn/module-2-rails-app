class ExperienceSignup < ApplicationRecord
  belongs_to :user
  belongs_to :experience
end
