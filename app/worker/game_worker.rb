class GameWorker
  @queue = :game_queue
  def self.perform(game_id)
    game = Game.find(game_id)
    
    game.maps.first.voxels.each do |voxel|
      voxel.update_attributes(x: rand(-10..10), y: rand(-10..10), z: rand(10))
    end
    Resque.enqueue(GameWorker, game_id)
  end
end

