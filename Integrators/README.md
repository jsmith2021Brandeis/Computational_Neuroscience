# Integrators

* This library of functions use various differential equation models of neurons

  * Leaky Integrate and Fire Model
  * Hodgkins-Huxley Model

* The equations are implemented in

  [Paul Miller's Computational Neuroscience Figures]: http://people.brandeis.edu/~pmiller/TEXTBOOK/index.html
  * and used here

* I want to emphasize modularity by writing one general integrate function, forwardEulerGeneral, and then passing any model to that function for integration

  * However, as a practical concern i mostly avoid this approach

* The Forward Euler Method

  * takes a function handle, a voltage drop function handle, and other necessary parameters to plot the solution to the differential equation
  * The below image was made using this function, using the Leaky Integrate and Fire Model and a second function handle to create artificial spikes
  * ![Forward Euler Example](C:\Users\jsmit\Dropbox\Spring Semester 2018\NBIO 136B\Matlab Workspace\library\Documentation\ForwardEulerExample.PNG)

* -Jacob Smith jsmith2021@brandeis.edu