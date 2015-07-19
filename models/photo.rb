class Photo < ActiveRecord::Base
  belongs_to :photographer
  has_and_belongs_to_many :albums

def top_photo?
  albums.length > 2
end

end
