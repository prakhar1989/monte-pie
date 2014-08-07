Canvas =
  width: 1200
  height: 800
  totalRuns: 0
  insideCircle: 0
  textSize: 14
  gridPadding: 20
  pointRadius: 5
  radius: 320
  getOrigin: () ->
    x: this.width/2
    y: this.height/2

distance = (x, y) -> Math.sqrt(x*x + y*y)

drawGrid = () ->
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

window.setup = () ->
  createCanvas Canvas.width + 1, Canvas.height + 1
  noStroke()
  drawGrid()

  # setup text
  textFont "monospace"

window.draw = () ->
  Canvas.insideCircle += if runExperiment() then 1 else 0
  Canvas.totalRuns += 1

  pie = (4.0 * Canvas.insideCircle) / Canvas.totalRuns

  fill 255
  rect Canvas.width - 270, 1, 270, 120
  stroke 0, 0, 0, 0
  fill 196, 77, 88
  textSize Canvas.textSize
  text "Total Experiments (m): " + Canvas.totalRuns, Canvas.width - 260, 30
  text "Points inside circle (n): " + Canvas.insideCircle, Canvas.width - 260, 50
  text "Estimated Pie = 4 x n / m", Canvas.width - 260, 70
  textSize Canvas.textSize + 2
  text "\u03a0 = " + pie, Canvas.width - 260, 100

  if Canvas.totalRuns > 1000
    noLoop()
