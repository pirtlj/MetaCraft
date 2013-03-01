if false
	jQuery ->
		init()
		animate()

	init = () ->
		window.container = document.createElement( 'div' )
		document.body.appendChild( container )

		window.camera = new THREE.OrthographicCamera( window.innerWidth / - 2, window.innerWidth / 2, window.innerHeight / 2, window.innerHeight / - 2, - 500, 1000 )
		window.camera.position.x = 200
		window.camera.position.y = 100
		window.camera.position.z = 200

		window.scene = new THREE.Scene()

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
		scene.add( line )

		# Cubes

		geometry = new THREE.CubeGeometry( 50, 50, 50 )
		material = new THREE.MeshLambertMaterial( { color: 0xffffff, shading: THREE.FlatShading, overdraw: true } )

		for  i in [0...100]
			cube = new THREE.Mesh( geometry, material )
			cube.scale.y = Math.floor( Math.random() * 2 + 1 )
			cube.position.x = Math.floor( ( Math.random() * 1000 - 500 ) / 50 ) * 50 + 25
			cube.position.y = ( cube.scale.y * 50 ) / 2
			cube.position.z = Math.floor( ( Math.random() * 1000 - 500 ) / 50 ) * 50 + 25
			window.scene.add( cube )

		

		# Lights

		ambientLight = new THREE.AmbientLight( 0x888888 )
		window.scene.add( ambientLight )

		directionalLight = new THREE.DirectionalLight( 0x444444 )
		directionalLight.position.x = 1
		directionalLight.position.y = 1
		directionalLight.position.z = 1
		directionalLight.position.normalize()
		window.scene.add( directionalLight )

		directionalLight = new THREE.DirectionalLight( 0x222222 )
		directionalLight.position.x = 0
		directionalLight.position.y = 1
		directionalLight.position.z = 0
		directionalLight.position.normalize()
		window.scene.add( directionalLight )

		window.renderer = new THREE.CanvasRenderer()
		renderer.setSize( window.innerWidth, window.innerHeight )

		window.container.appendChild( renderer.domElement )

		if false
			stats = new Stats()
			stats.domElement.style.position = 'absolute'
			stats.domElement.style.top = '0px'
			window.container.appendChild( stats.domElement )

		window.addEventListener( 'resize', onWindowResize, false )

	onWindowResize = () ->
		window.camera.left = window.innerWidth / - 2
		window.camera.right = window.innerWidth / 2
		window.camera.top = window.innerHeight / 2
		window.camera.bottom = window.innerHeight / - 2
		
		window.camera.updateProjectionMatrix()
		
		window.renderer.setSize( window.innerWidth, window.innerHeight )

	animate = () ->
		requestAnimationFrame( animate );
		render()
		#stats.update()

	render = () ->
#		timer = Date.now() * 0.0001
		timer = 3/4 * Math.PI
		
		window.camera.position.x = Math.cos( timer ) * 200
		window.camera.position.z = Math.sin( timer ) * 200
		window.camera.lookAt( window.scene.position )
		
		window.renderer.render( window.scene, camera )
		

if false
	jQuery -># set the scene size

		# get the DOM element to attach to
		# - assume we've got jQuery to hand
		$container = $('#canvas')
		
		WIDTH = $container.innerWidth()
		HEIGHT = $container.innerHeight()

		# set some camera attributes
		VIEW_ANGLE = 45
		ASPECT = WIDTH / HEIGHT
		NEAR = 0.1
		FAR = 100000
		# create a WebGL renderer, camera
		# and a scene
		window.renderer = new THREE.WebGLRenderer()
		window.camera = new THREE.PerspectiveCamera(VIEW_ANGLE, ASPECT, NEAR, FAR)
#		window.camera = new THREE.CubeCamera()
		window.scene = new THREE.Scene()

		# add the camera to the scene
		scene.add(camera)
		
		# the camera starts at 0,0,0
		# so pull it back
		camera.position.z = 1000

		# start the renderer
		renderer.setSize(WIDTH, HEIGHT)

		# attach the render-supplied DOM element
		$container.append(renderer.domElement)

		pointLight = new THREE.PointLight(0xFFFFFF)

		# set its position
		pointLight.position.x = 10
		pointLight.position.y = 50
		pointLight.position.z = 130

		# add to the scene
		scene.add(pointLight)
	
		drawHex = (cX, cY, radius, scene) ->
			material = new THREE.LineBasicMaterial(color: 0x0000ff)
			geometry = new THREE.Geometry()
			for i in [0..6]
				angle = (Math.PI / 180) * 60 * i
				vector = new THREE.Vector3(cX + Math.cos(angle) * radius, cY + Math.sin(angle) * radius + 0)
				geometry.vertices.push(vector)
				line = new THREE.Line(geometry, material)
				scene.add(line)
		
		
		drawCube = (cX, cY, length, scene) ->
			geometry = new THREE.CubeGeometry(50,50,50,50,50,50)
			material = new THREE.LineBasicMaterial(color: 0x0000ff)
			line = new THREE.Line(geometry, material)
			scene.add(line)
		
		
		drawSquare = (cX, cY, length, scene) ->
			geometry = new THREE.Geometry()
			material = new THREE.LineBasicMaterial(color: 0x0000ff)
			geometry.vertices.push(new THREE.Vector3(cX, cY + length))
			geometry.vertices.push(new THREE.Vector3(cX + length, cY + length))
			geometry.vertices.push(new THREE.Vector3(cX + length, cY + 0))
			geometry.vertices.push(new THREE.Vector3(cX + 0, cY + 0))
			geometry.vertices.push(new THREE.Vector3(cX + 0, cY + length))
			line = new THREE.Line(geometry, material)
			scene.add(line)
		
		
		drawGrid = (cX, cY, width, height, length, scene) ->
			cX -= width * length / 2
			cY -= height * length / 2
			for x in [0..width]
				for y in [0..height]
					drawSquare(cX + x * length, cY + y * length, length, scene)	
			
			drawOrigin(0 ,0 ,0, 100, scene)
			
		
		
		drawMap = (cX, cY, width, height, radius, scene) ->
			for x in [0..width]
				for y in [0..height]
					dX = x * radius * 1.5 + cX
					dY = y * radius * 2 * Math.sin(Math.PI / 3) + (x % 2) * Math.sin(Math.PI / 3) * radius + cY
					drawHex(dX, dY, radius, scene)
		
		
		drawOrigin = (cX, cY, cZ, length, scene) ->
			geometry = new THREE.Geometry()
			material = new THREE.LineBasicMaterial(color: 0x00ffff)
			geometry.vertices.push(new THREE.Vector3(cX - length / 2, 0))
			geometry.vertices.push(new THREE.Vector3(cX + length / 2, 0))
			line = new THREE.Line(geometry, material)
			scene.add(line)
			
			geometry = new THREE.Geometry()
			material = new THREE.LineBasicMaterial(color: 0xff00ff)
			geometry.vertices.push(new THREE.Vector3(0, cY - length / 2))
			geometry.vertices.push(new THREE.Vector3(0, cY + length / 2))
			line = new THREE.Line(geometry, material)
			scene.add(line)
			
			geometry = new THREE.Geometry()
			material = new THREE.LineBasicMaterial(color: 0xffff00)
			geometry.vertices.push(new THREE.Vector3(0, 0, cZ - length / 2))
			geometry.vertices.push(new THREE.Vector3(0, 0, cZ + length / 2))
			line = new THREE.Line(geometry, material)
			scene.add(line)
			
		
#		drawMap(0, 0, 20, 20, 40, scene)
		
#		drawCube(0,0,0, scene)

#		drawSquare(0,0,100,scene)
		drawGrid(0, 0, 20, 20, 40, scene)
		renderer.render(scene, camera)


