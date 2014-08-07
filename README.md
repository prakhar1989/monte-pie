Monte-Pie
===
> Pi approximation using the Monte Carlo method

### Method

A Monte Carlo method relies on repeated random sampling to simulate some process or compute a value.  See Wikipedia: http://en.wikipedia.org/wiki/Monte_Carlo_method

Pi can be computed using Monte Carlo simulation through a series of experiments.  Here is a single experiment:
 
  - Choose a pair of random floating point numbers between 0 and 1
  - Call the numbers x and y, think of (x,y) as a point on the plane in the unit square
  - Test whether the point falls within the unit circle by measuring the distance from the point to the origin: ![equation](http://cl.ly/image/2p322I1e0B1a/eq1.png)
 
Now suppose you do `m` experiments and in `n` of those experiments, the random point chosen falls within the upper right quarter of the unit circle. Since the area of a circle is known to be `pi * r^2` and the area of a square is `r^2` (and here we are dealing with a radius/square side of length 1), the following equations hold:

![equation](http://cl.ly/image/1o2n182N022g/eq2.png)

### Libraries
- [p5.js](http://p5js.org)
- Coffeescript

### Demo
[Play it here](http://montepie.herokuapp.com/)
