# Analysis

* This library allows for the analysis of spike trains
* It includes
    * getWindowSum
        * which sums the number of spikes in a window
    * indexToBoolean
        * which convers an array of spike indexes to a spaced array of spikes
            * given [3 ,5,6]
            * output [0,0,1,0,1,1]
    * loadTable
        * which puts gating variables into an array
        * used with [Paul Miller's](http://people.brandeis.edu/~pmiller/TEXTBOOK/CHAPTER4/index.html) PR_dend_gating
        * and PR_soma_gating methods
* -Jacob Smith jsmith2021@brandeis.edu