class Map < ActiveRecord::Base
  attr_accessible :game_id, :type

  belongs_to :game
  has_many :voxels

  class << self
    def generate()
      ActiveRecord::Base.transaction do
        map = create()
        xMax = 10
        yMax = 10
        z = 0
        for x in 0..xMax
          for y in 0..yMax
            map.voxels.create(:x => x, :y => y, :z => z)
          end
        end
        return map
      end
    end
  end
end
