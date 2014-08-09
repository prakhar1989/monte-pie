Canvas =
  width: 750
  height: 808
  totalRuns: 0
  insideCircle: 0
  textSize: 14
  gridPadding: 40
  pointRadius: 10
  input: null
  button: null
  reset: null
  radius: 320
  textArea:
    x: 10
    y: 30
    w: 280
    h: 140
  getOrigin: () ->
    x: this.width/2
    y: this.height/2

distance = (x, y) -> Math.sqrt(x*x + y*y)

drawGrid = () ->
  textFont "monospace"
  fill 244

  # axes
  fill 204, 101, 192, 5
  stroke 127, 63, 120
  rect Canvas.getOrigin().x - Canvas.radius, Canvas.getOrigin().y, 2 * Canvas.radius, 1
  rect Canvas.getOrigin().x, Canvas.getOrigin().y - Canvas.radius, 1, 2 * Canvas.radius

  # circle
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
  Canvas.input.position 40, 80
  Canvas.button = createButton 'Simulate'
  Canvas.button.position 150, 80
  Canvas.reset = createButton 'Reset'
  Canvas.reset.position 250, 80
  Canvas.frameRate = createSlider 30, 120, 60
  Canvas.frameRate.position 150, 120
  Canvas.reset.mousePressed resetCounts
  Canvas.button.mousePressed () ->
    frameRate Canvas.frameRate.value()
    `loop()`

showResults = () ->
  fill 255
  rect Canvas.textArea.x - 10, Canvas.textArea.y - 10, Canvas.textArea.w, Canvas.textArea.h
  stroke 0, 0, 0, 0
  fill 52, 73, 94

  # calc pi
  pi = (4.0 * Canvas.insideCircle) / Canvas.totalRuns
  
  textSize 18
  text "m = " + Canvas.totalRuns, Canvas.textArea.x + 10, Canvas.textArea.y + 20
  text "n = " + Canvas.insideCircle, Canvas.textArea.x + 10, Canvas.textArea.y + 50
  text "\u03a0 = 4 x n / m ", Canvas.textArea.x + 10, Canvas.textArea.y + 80
  text "\u03a0 = " + pi, Canvas.textArea.x + 10, Canvas.textArea.y + 110

resetCounts = () ->
  clear()
  drawGrid()
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
