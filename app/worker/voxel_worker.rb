class VoxelWorker
  include Sidekiq::Worker
  def perform(voxel_id)
    voxel = Voxel.find(voxel_id)
    
    
    voxel.update_attributes(x: voxel.x + rand(-1..1), y: voxel.y + rand(-1..1), z: 0)
    VoxelWorker.perform_in(1.seconds, voxel.id)
  end
end