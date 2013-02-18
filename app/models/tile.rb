class Tile < ActiveRecord::Base
  attr_accessible :type, :x, :y




  class << self

    def seed
      width = 100
      height = 100


      ActiveRecord::Base.transaction do
        for x in 0..width
          for y in 0..height
            Tile.create(x: x, y: y)
          end
        end
      end


    end

  end
end
