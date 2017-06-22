# require 'rest-client'
# require 'json'

class Restaurant < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews
  has_attached_file :image, styles: { large: "500x500>", medium: "300x300>", thumb: "100x100#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  geocoded_by :search_address
  after_validation :geocode

  def search_address
    search_string = ""
    search_string << self.name
    # search_string << " "
    # search_string << self.address
    search_string << " "
    search_string << "New York, New York 10004"
  end

  def static_map_for
   params = {
     :center => [self.latitude, self.longitude].join(","),
     :zoom => 17,
     :size => "500x500",
     :markers => [self.latitude, self.longitude].join(","),
     :sensor => true
     }

   query_string =  params.map{|k,v| "#{k}=#{v}"}.join("&")
   image_tag = "http://maps.googleapis.com/maps/api/staticmap?#{query_string}"
 end

 def walking_instructions
   params = {
     :origin => [40.7052799, -74.0140249].join(","),
     :destination => [self.latitude, self.longitude].join(","),
     :mode => "walking"
    }
     query_string =  params.map{|k,v| "#{k}=#{v}"}.join("&")
     image_tag = "http://maps.googleapis.com/maps/api/directions/json?#{query_string}"
 end

 def access_hash
   gmaps_hash = RestClient.get(walking_instructions)
   map_instructions = JSON.parse(gmaps_hash)
 end

 def miles
   access_hash["routes"][0]["legs"][0]["distance"]["text"]
 end

 def minutes
    array = access_hash["routes"][0]["legs"][0]["duration"]["text"].split(' ')
    array[0].to_i
 end

 def hash_address
    access_hash["routes"][0]["legs"][0]["end_address"]
  end

  def total_wait
    minutes + self.average_wait.to_i
  end

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

  def self.most_reviewed_restaurants #used on a class to generate list
    joins(:reviews).group('restaurants.id').order('count_id DESC').limit(5).count(:id).collect {|k,v| Restaurant.find(k)}
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

  def self.walk_time_high_rating
    # joins(:reviews).group('restaurants.id').where('rating >= 4').where('wait <= 10').where("cuisine == 'American'").where('walk >= 15')
  end


end
