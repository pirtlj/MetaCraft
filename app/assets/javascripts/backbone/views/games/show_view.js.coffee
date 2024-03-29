Metacraft.Views.Games ||= {}
class Metacraft.Views.Games.ShowView extends Backbone.Marionette.View
	template: JST["backbone/templates/games/show"]
	@rendering = false
	
	#TODO on mouse out set drag to false
	@dragging = false
	@startX = 0;
	@startY = 0;
	
	events:
		"mouseup": "onMouseUp",
		"mousedown": "onMouseDown",
		"mousemove": "onMouseMove",
		"mousewheel" : "onMouseWheel"
	
	modelEvents:
		"change": "onModelChanged"	
	
	initialize: (options) ->
		@radiusMax = 1000
		@radiusDefault = 500
		@radius = @radiusDefault
		@theta = 90
		@phi =  90
		
		# width, height, fov, near, far, orthonear, orthofar
		width = window.innerWidth / 2
		height =  window.innerHeight / 2
		fov = 70
		near = 1
		far = 2000
		orthonear = -1000 
		orthofar = 3000
		
		@scene = new THREE.Scene()
		@camera = new THREE.CombinedCamera(width, height, fov, near, far, orthonear, orthofar)
		
		@camera.position.x = @radius * Math.sin( @theta * Math.PI / 360 ) * Math.cos( @phi * Math.PI / 360 )
		@camera.position.y = @radius * Math.sin( @phi * Math.PI / 360 )
		@camera.position.z = @radius * Math.cos( @theta * Math.PI / 360 ) * Math.cos( @phi * Math.PI / 360 )
		
		@camera.toOrthographic()
		@camera.lookAt( @scene.position )
		
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
		directionalLight.position.x = 0
		directionalLight.position.y = 0
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
		
		@el.appendChild( @renderer.domElement )
	
	
	render: =>
		console.log "Metacraft.Views.Games.ShowView.render"
		if not @rendering
			@rendering = true
			@renderer.render( @scene, @camera )
			@rendering = false
		
		return this
	
	animate: () =>
		requestAnimationFrame( @animate )
		@render()
		#stats.update()
	
	
	onMouseUp: (event) ->
		@dragging = false
	
	
	onMouseDown: (event) ->
		@dragging = true
		@clientX = event.clientX
		@clientY = event.clientY
	
	
	onMouseMove: (event) ->
		if @dragging
			
			#Sometimes mouse delta is NaN.  -pirtlj
			#TODO this is not right but it works -pirtlj
			
			dXMouse = ((@clientX - event.clientX) | 0)
			dYMouse = ((@clientY - event.clientY) | 0)

			dXNormalizedMouse = ( dXMouse / window.innerWidth  ) * 2
			dYNormalizedMouse = ( dYMouse / window.innerHeight ) * 2
			
			dXCamera = ((dXMouse * Math.cos(@theta * Math.PI / 360)) + (dYMouse * Math.sin(@theta * Math.PI / 360)))
			dZCamera = ((dXMouse * -1 * Math.sin(@theta * Math.PI / 360)) + (dYMouse * Math.cos(@theta * Math.PI / 360)))
			
			@camera.position.x += (dXCamera * 3 / @zoomRatio())* Math.sin( @theta * Math.PI / 360 ) * Math.cos( @phi * Math.PI / 360 )
			@camera.position.z += (dZCamera * 3 / @zoomRatio())* Math.cos( @theta * Math.PI / 360 ) * Math.cos( @phi * Math.PI / 360 )
			
			@camera.updateMatrix()
			@render()
		
		@clientX = event.clientX
		@clientY = event.clientY
	
	
	onMouseWheel: (event) ->
		event.preventDefault()
		@radius -= (event.originalEvent.wheelDeltaY | 0)
		
		@camera.setZoom(@zoomRatio())
		@camera.updateMatrix()
		@render()
	
	
	zoomRatio: ->
		@radiusDefault / @radius 
	
	
	onModelChanged: ->
		voxels = @model.get("maps").at(0).get("voxels")
		
		for  i in [0...voxels.size()]
			new Metacraft.Views.Voxels.VoxelView({model: voxels.at(i), scene: @scene})
		
		@animate()
	
	
	
