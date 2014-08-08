Canvas =
  width: 800
  height: 800
  totalRuns: 0
  insideCircle: 0
  textSize: 14
  gridPadding: 40
  pointRadius: 10
  input: null
  button: null
  radius: 320
  textArea:
    x: 10
    y: 20
    w: 250
    h: 90
  getOrigin: () ->
    x: this.width/2
    y: this.height/2

distance = (x, y) -> Math.sqrt(x*x + y*y)

drawGrid = () ->
  textFont "monospace"
  fill 244

  # vertical lines
  for i in [0..Canvas.height] by Canvas.gridPadding
    rect 0, i, Canvas.width, 1

  # horizontal lines
  for i in [0..Canvas.width] by Canvas.gridPadding
    rect i, 0, 1, Canvas.height

  # axes
  fill 200
  rect 0, Canvas.getOrigin().y - 1, Canvas.width, 2
  rect Canvas.getOrigin().x - 1, 0, 2, Canvas.height

  # circle
  fill 204, 101, 192, 5
  stroke 127, 63, 120
  ellipse Canvas.getOrigin().x, Canvas.getOrigin().y,
          2 * Canvas.radius, 2 * Canvas.radius

  # rectange
  quad Canvas.getOrigin().x - Canvas.radius, Canvas.getOrigin().y - Canvas.radius,
       Canvas.getOrigin().x + Canvas.radius, Canvas.getOrigin().y - Canvas.radius,
       Canvas.getOrigin().x + Canvas.radius, Canvas.getOrigin().y + Canvas.radius,
       Canvas.getOrigin().x - Canvas.radius, Canvas.getOrigin().y + Canvas.radius


runExperiment = () ->
  # create point coordinates only in first quadrant
  x = Math.random() * Canvas.radius
  y = Math.random() * Canvas.radius

  noStroke()
  if (distance x, y) - Canvas.radius > 0 # outside the circle
    fill 226, 122, 63
    inside = false
  else # inside the circle
    fill 69, 178, 157
    inside = true

  pointX = Canvas.getOrigin().x + x
  pointY = Canvas.getOrigin().y - y

  # plot the point
  ellipse pointX, pointY, Canvas.pointRadius, Canvas.pointRadius
  
  # return whether point inside or outside
  inside

setupDOM = () ->
  Canvas.input = createInput()
  Canvas.input.position 20, 70
  Canvas.button = createButton 'Simulate!'
  Canvas.button.position 150, 70
  Canvas.button.mousePressed () ->
    resetCounts()
    `loop()`

showResults = () ->
  fill 255
  rect Canvas.textArea.x - 10, Canvas.textArea.y - 10, Canvas.textArea.w, Canvas.textArea.h
  stroke 0, 0, 0, 0
  fill 196, 77, 88

  # calc pi
  pi = (4.0 * Canvas.insideCircle) / Canvas.totalRuns
  
  textSize 12
  text "Total Experiments (m): " + Canvas.totalRuns, Canvas.textArea.x, Canvas.textArea.y
  text "Points inside circle (n): " + Canvas.insideCircle, Canvas.textArea.x, Canvas.textArea.y + 20
  text "Estimated Pi = 4 x n / m", Canvas.textArea.x, Canvas.textArea.y + 40
  textSize 18
  text "\u03a0 = " + pi, Canvas.textArea.x, Canvas.textArea.y + 70

resetCounts = () ->
  Canvas.insideCircle = 0
  Canvas.totalRuns = 0

window.setup = () ->
  noLoop()
  createCanvas Canvas.width + 1, Canvas.height + 1
  noStroke()
  drawGrid()
  setupDOM()

window.draw = () ->
  Canvas.insideCircle += if runExperiment() then 1 else 0
  Canvas.totalRuns += 1
  showResults()
  if Canvas.totalRuns + 1 > parseInt Canvas.input.value() || 10
    noLoop()
