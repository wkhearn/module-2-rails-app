class User < ApplicationRecord
  has_many :reviews
  has_many :experience_signups
  has_many :experiences, through: :experience_signups
  has_many :restaurants, through: :reviews
  belongs_to :cohort, optional: true

  has_secure_password

  has_attached_file :profile_pic, styles: { medium: "300x300#", thumb: "100x100#" }, default_url: "/assets/:style/missing_profile.jpg"
  validates_attachment_content_type :profile_pic, content_type: /\Aimage\/.*\z/


  def user_recent_reviews
    self.reviews.where("user_id = ?", current_user).order(created_at: :desc).limit(3)
  end

  def average_rating #used on a specific user "User.first.average_rating"
    sprintf "%.2f", self.reviews.average(:rating).to_f
  end

  def self.most_diverse
    # joins(:reviews).group('restaurants.id').order('AVG(rating) DESC').limit(5)
    # joins(:reviews).group('restaurants.id').order('AVG(wait)').limit(5)
    # sprintf "%.0f", self.reviews.average(:wait).to_f
    # most_reviews = joins(:reviews).group('restaurants.id').order('count_id DESC').limit(5).count(:id).collect {|k,v| Restaurant.find(k)}

  end

  def self.most_active
    joins(:reviews).group('users.id').order('count_id DESC').limit(5).count(:id).collect {|k,v| User.find(k)}
  end

  def self.most_traveled
    # joins(:reviews).group('restaurants.id').where('rating >= 4').where('wait <= 10').where("cuisine == 'American'").where('walk >= 15')
  end

  def self.happiest_reviewer
    joins(:reviews).group('users.id').order('AVG(rating) DESC').limit(5)
  end

  def self.snobiest_reviewer
    joins(:reviews).group('users.id').order('AVG(rating)').limit(5)
  end

end
