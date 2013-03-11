class GameWorker
  extend Resque::Plugins::JobStats
  
  @queue = :game_queue
  def self.perform(game_id)
    game = Game.find(game_id)
    
    game.maps.first.voxels.each do |voxel|
      Resque.enqueue(VoxelWorker, voxel.id)
    end
  end
end
