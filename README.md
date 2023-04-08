## `fourier-series-animation`

This Processing file contains code for drawing a Fourier series. It draws a series of circles that, when combined, form a wave shape. The code also includes a function for rendering the composite wave.

### Setup

Before running the code, there are a few parameters that can be adjusted:

- `circleCount`: the number of circles to be drawn. This value is set to 50 by default.
- `mainCircle_x`, `mainCircle_y`, and `mainCircle_radius`: the x and y coordinates of the center of the main circle and its radius, respectively.
- `renderBorder`: the starting point for rendering the composite wave.

### Code

The code creates a `Vector` object called `circleRadius` to store the radii of the circles. In the `setup()` function, this vector is filled with values using a formula from the Fourier series.

In the `draw()` function, the program calculates the x and y coordinates for each circle and draws them using the `ellipse()` function. It also stores the y value of the last circle in a `Vector` object called `yheights`. Finally, it calls the `printWave()` function to render the composite wave.

The `printWave()` function draws each point in the `yheights` vector as a circle, and connects the points with a line. The `renderBorder` parameter determines where the rendering starts on the x-axis.

### Usage

To use this Processing code, open it in the Processing editor and run it. The output window will show the circles being drawn and the composite wave being rendered. Adjust the parameters in the code to modify the appearance of the output.
