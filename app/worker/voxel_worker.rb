class VoxelWorker
  @queue = :voxel_queue
  def self.perform(voxel_id)
    voxel = Voxel.find(voxel_id)
    voxel.update_attributes(x: rand(-10..10), y: rand(-10..10), z: rand(10))
    Resque.enqueue(VoxelWorker, voxel_id)
  end
end

