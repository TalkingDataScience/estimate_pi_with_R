# How to Estimate pi Using Monte Carlo Simulation in R

In this repo you can see the code used in a post on my blog [talkingDataScience.com](https://talkingdatascience.com/how-to-estimate-pi-using-monte-carlo-simulation-in-r/), which was also published in [Towards Data Science](https://towardsdatascience.com/estimating-pi-using-monte-carlo-simulation-in-r-91d1f32406af).

### How to find an expression for pi
The area of a circle is calculated by pi*r^2, and the area of the bounding square is (2r)^2 = 4r^2. Dividing the area of the circle by the area of the square we get the ratio of the two areas:

$\frac{area of circle}{area of square}=\frac{\pi*r^2}{4*r^2}$

This means we can estimate pi using the formula:

$\pi\approx\frac{simulated points within circle}{total number of simulated points}$

By simulating random numbers within this square, we get approximated values for the area of the circle and the area of the square. Hence, we can estimate $\pi$ by taking the ratio of simulated points that fall within the circle and the total number of simulated points, and multiply by 4. 

To identify which points fall within the circle we use the equation of the circle: $(x-a)^2+(y-b)^2 = r^2$, where $(a, b)$ is the circle center

In our example the circle center is (0, 0) and the radius is 1, so simulated points that satisfy $\sqrt{x^2+y^2} <= 1$ are within the circle. 
