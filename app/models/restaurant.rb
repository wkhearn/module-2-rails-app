class Restaurant < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews

  def self.top_5_restaurants #used on class "Restaurant.top_restaurants" to generate list
    joins(:reviews).group('restaurants.id').order('AVG(rating) DESC').limit(5)
  end

  # sql = <<-SQL
  # SELECT * FROM restaurants
  # JOIN reviews
  # ON reviews.restaurant_id = restaurants.id
  # GROUP BY restaurants.id
  # ORDER BY 'AVG(reviews.rating) DESC'
  # SQL

  def average_rating #used on a specific restaurant "Restaurant.first.average_rating"
    # reviews.average(:rating).to_f.round(2)
    sprintf "%.2f", self.reviews.average(:rating).to_f
  end

  def self.most_popular_restaurants #used on a class to generate list
    popular = joins(:reviews).group('restaurants.id').order('count_id DESC').limit(5).count(:id)
    popular_objects = popular.collect {|k,v| Restaurant.find(k)}
  end

  def self.shortest_wait_times
    joins(:reviews).group('restaurants.id').order('AVG(wait)').limit(5)
  end

  def self.longest_wait_times
    joins(:reviews).group('restaurants.id').order('AVG(wait) DESC').limit(5)
  end

  def average_wait
    sprintf "%.0f", self.reviews.average(:wait).to_f
  end
end
