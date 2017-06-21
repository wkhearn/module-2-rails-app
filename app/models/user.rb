class User < ApplicationRecord
  has_many :reviews
  has_many :restaurants, through: :reviews
  belongs_to :cohort, optional: true

  has_secure_password
end
