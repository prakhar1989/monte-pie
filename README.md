Monte-Pie
===
> Pi approximation using the Monte Carlo method

### Method

A Monte Carlo method relies on repeated random sampling to simulate some process or compute a value.  See Wikipedia: http://en.wikipedia.org/wiki/Monte_Carlo_method

Pi can be computed using Monte Carlo simulation through a series of experiments.  Here is a single experiment:
 
  - Choose a pair of random floating point numbers between 0 and 1
  - Call the numbers x and y, think of (x,y) as a point on the plane in the unit square
  - Test whether the point falls within the unit circle by measuring the distance from the point to the origin: ![equation](http://www.sciweavers.org/tex2img.php?eq=x%5E%7B2%7D%20%2B%20y%5E%7B2%7D%20%5Cleq%201%20&bc=White&fc=Black&im=jpg&fs=12&ff=arev&edit=0)
 
Now suppose you do `m` experiments and in `n` of those experiments, the random point chosen falls within the upper right quarter of the unit circle. Since the area of a circle is known to be `pi * r^2` and the area of a square is `r^2` (and here we are dealing with a radius/square side of length 1), the following equations hold:

![equation](http://www.sciweavers.org/tex2img.php?eq=%20%5Cfrac%7Bn%7D%7Bm%7D%20%3D%20%5Cfrac%7B%5Ctext%7Bquarter%20area%20of%20circle%7D%7D%7B%5Ctext%7Barea%20of%20square%7D%7D%20%3D%20%5Cfrac%7B%5Cfrac%7B1%7D%7B4%7D%20%5CPi%20%20r%5E%7B2%7D%20%7D%7Br%5E%7B2%7D%7D%20%3D%20%5Cfrac%7B%5CPi%7D%7B4%7D&bc=White&fc=Black&im=jpg&fs=12&ff=arev&edit=0)
### Libraries
- [p5.js](http://p5js.org)
- Coffeescript

### Demo
[Demo]()
