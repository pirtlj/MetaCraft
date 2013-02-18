

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
				vector = new THREE.Vector3(cX + Math.cos(angle) * radius, cY + Math.sin(angle) * radius 0)
				geometry.vertices.push(vector)
	
				line = new THREE.Line(geometry, material)
				scene.add(line)
		
		
		drawMap = (cX, cY, width, height, radius, scene) ->
			for x in [0..width]
				for y in [0..height]
					dX = x * radius * 1.5 + cX
					dY = y * radius * 2 * Math.sin(Math.PI / 3) + (x % 2) * Math.sin(Math.PI / 3) * radius + cY
					drawHex(dX, dY, radius, scene)
		
		drawMap(0, 0, 20, 20, 40, scene)
		renderer.render(scene, camera)


