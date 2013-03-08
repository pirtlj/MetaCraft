Metacraft.Views.Voxels ||= {}

class Metacraft.Views.Voxels.VoxelView extends Backbone.Marionette.View
	initialize: (options)->
		console.log "Metacraft.Views.Games.VoxelView.initialize"
		super(options)
		
		geometry = new THREE.CubeGeometry( 50, 50, 50 )
		material = new THREE.MeshLambertMaterial( { color: 0xffffff, shading: THREE.FlatShading } )
		
		@cube = new THREE.Mesh( geometry, material )
		options.scene.add( @cube )
		
		@update()
		
		@model.on('sync:socket', @update, @)
	
	
	update: =>
		@cube.position.x = @model.get("x") * 50 + 25
		@cube.position.y = @model.get("z") * 50 + 25
		@cube.position.z = @model.get("y") * 50 + 25
	
	