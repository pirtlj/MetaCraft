class GameWorker
  include Sidekiq::Worker
  def perform(game_id)
    game = Game.find(game_id)
    game.maps.first.voxels.each do |voxel|
      VoxelWorker.perform_async(voxel.id)
    end
  end
end