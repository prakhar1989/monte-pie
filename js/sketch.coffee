Canvas =
  width: 1200
  height: 800
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
       Canvas.getOrigin().x + Canvas.radius, Canvas.getOrigin().y + Canvas.radius
       Canvas.getOrigin().x - Canvas.radius, Canvas.getOrigin().y + Canvas.radius,


runExperiment = () ->
  # create point coordinates only in first quadrant
  x = Math.random() * Canvas.radius
  y = Math.random() * Canvas.radius

  noStroke()
  if (distance x, y) - Canvas.radius > 0 # outside the circle
    fill 226, 122, 63
  else # inside the circle
    fill 69, 178, 157

  pointX = Canvas.getOrigin().x + x
  pointY = Canvas.getOrigin().y - y

  # plot the point
  ellipse pointX, pointY, Canvas.pointRadius, Canvas.pointRadius

window.setup = () ->
  createCanvas Canvas.width + 1, Canvas.height + 1
  noStroke()
  drawGrid()
  for i in [0..1000]
    runExperiment()
