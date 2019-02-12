Computational Neuroscience Library
=======================
* The goal of this project is to
    1.  Model the voltage of Neurons using the Forward Euler Method
    2.  Allow for as much code reuse as possible by using function handles to model different differential equations with the same forward Euler function

* The Forward Euler Method
  * takes a function handle, a voltage drop function handle, and other necessary parameters to plot the solution to the differential equation
  * The below image was made using this function, using the Leaky Integrate and Fire Model and a second function handle to create artificial spikes
  * ![](C:\Users\jsmit\Dropbox\Spring Semester 2018\NBIO 136B\Matlab Workspace\library\Documentation\ForwardEulerExample.PNG)

* The EulerManyPlots Method, which uses the Forward Euler method to generate an argument number of plots, with titles for every 

    * ![](C:\Users\jsmit\Dropbox\Spring Semester 2018\NBIO 136B\Matlab Workspace\library\Documentation\ManyEulerExample.PNG)
    * This function also makes it easy to plot the firing rate over the selected interval
    * ![](C:\Users\jsmit\Dropbox\Spring Semester 2018\NBIO 136B\Matlab Workspace\library\Documentation\ManyEulerExampleFiringRates.PNG)

* The PlotXY newFig function, which just shortens the number of lines it takes to create and label a figure

* The SpaceFromMean function, which generates an array spaced around the mean with n elements

    * so this would return a vector of (0,.5,1,1.5,2)

        ```
        spaceFromMean(1,5)
        ```

    * This function is useful in the EulerMany Plots function

* -Jacob Smith jsmith2021@brandeis.edu