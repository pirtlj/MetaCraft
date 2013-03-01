class Game < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :maps
end
