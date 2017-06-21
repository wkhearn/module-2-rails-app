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


end
