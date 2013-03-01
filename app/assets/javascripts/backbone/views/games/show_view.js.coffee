Metacraft.Views.Games ||= {}

class Metacraft.Views.Games.ShowView extends Backbone.Marionette.ItemView
	template: JST["backbone/templates/games/show"]
	
	modelEvents:
		"change": "modelChanged"

	
	modelChanged: ->
		voxels = @model.get("maps").at(0).get("voxels")
		
		# Cubes

		geometry = new THREE.CubeGeometry( 50, 50, 50 )
		material = new THREE.MeshLambertMaterial( { color: 0xffffff, shading: THREE.FlatShading, overdraw: true } )
		
		for  i in [0...voxels.size()]
			cube = new THREE.Mesh( geometry, material )
#			cube.scale.y = Math.floor( Math.random() * 2 + 1 )

			voxel = voxels.at(i)
			cube.position.x =  voxel.get("x") * 50 + 25
			cube.position.y = voxel.get("z") * 50 + 25
			cube.position.z = voxel.get("y") * 50 + 25
			@scene.add( cube )
			
		
		@renderer.render( @scene, @camera )

	
	
	
	initialize: (options) ->		
		@camera = new THREE.OrthographicCamera( window.innerWidth / - 2, window.innerWidth / 2, window.innerHeight / 2, window.innerHeight / - 2, - 500, 1000 )
		@camera.position.x = 200
		@camera.position.y = 100
		@camera.position.z = 200

		@scene = new THREE.Scene()

		# Grid

		size = 1000
		step = 50

		geometry = new THREE.Geometry()

		for i in [-size...size] by step
			geometry.vertices.push( new THREE.Vector3( - size, 0, i ) )
			geometry.vertices.push( new THREE.Vector3(   size, 0, i ) )
			geometry.vertices.push( new THREE.Vector3( i, 0, - size ) )
			geometry.vertices.push( new THREE.Vector3( i, 0,   size ) )

		material = new THREE.LineBasicMaterial( { color: 0x000000, opacity: 0.2 } )

		line = new THREE.Line( geometry, material )
		line.type = THREE.LinePieces
		@scene.add( line )
		
		
		# Lights

		ambientLight = new THREE.AmbientLight( 0x888888 )
		@scene.add( ambientLight )

		directionalLight = new THREE.DirectionalLight( 0x444444 )
		directionalLight.position.x = 1
		directionalLight.position.y = 1
		directionalLight.position.z = 1
		directionalLight.position.normalize()
		@scene.add( directionalLight )

		directionalLight = new THREE.DirectionalLight( 0x222222 )
		directionalLight.position.x = 0
		directionalLight.position.y = 1
		directionalLight.position.z = 0
		directionalLight.position.normalize()
		@scene.add( directionalLight )
	
		@renderer = new THREE.CanvasRenderer()
		@renderer.setSize( window.innerWidth, window.innerHeight )
		
		timer = 3/4 * Math.PI

		@camera.position.x = Math.cos( timer ) * 200
		@camera.position.z = Math.sin( timer ) * 200
		@camera.lookAt( @scene.position )

		
	
	render: ->
		console.log "Metacraft.Views.Games.ShowView#render"
		@el.appendChild( @renderer.domElement )
#		timer = Date.now() * 0.0001

		@renderer.render( @scene, @camera )
		
#		$(@el).html(@template(@model.toJSON() ))
		return this
