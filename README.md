# CCE_workshop
Starter notebooks and scripts for working with CCE for SpEC.

### Getting started
At the time of writing this, there is a working CCE code for SpEC, which can be found and cloned at https://github.com/kbarkett/spec/tree/CCE/InputFiles/CCE. 
There are instructions for setting up and running CCE manually for each run in the ReadMe for this repo. One will need 
the worldtube data for the run to run CCE and get the News, which can be found in the CCEAnnex (instructions for download found here: https://www.black-holes.org/wiki/documentation/simulation_annex?s[]=annex).
From experience, only git annex add the worldtube data sets that you're currently using as they take up a lot of data.

### What's been done
CCE does indeed run for SpEC worldtube data output and will create a number of outputs, the most relevant being the News (in News.h5), which will have l<=14.
In the notebook, there is a function called "readNews" that is able to read in the News.h5 data and order it in the usual SXS way (starting at l=0,m=0, and ascending in l and m until l=14,m=14). It is dependent on the scri function index_is_monotonic.
In the notebook there is some analysis on relative and absolute errors between the time derivative (hdot) and News for CSFU15/Batch1/BBH_SKS_d14.3_q1.22_sA_0_0_0_sB_0_0_0, looking at the waveforms as a whole as well as amplitudes and phases. The comparisons are not promising for this particular run, showing large discrepancies between the News and hdot.

### To do
With regards to the differences between hdot and the News for any one run, the following needs to be considered: is the run covergent? What version of SpEC was it run with? What Lev, extraction radius, etc are used? Are the runs lined up?
- Things to make sure are working well are the lining up of the runs. Often the News will have run before the start of h or will run for a while afterwards, so lining them both up at 0 won't be sufficient. There are functions in GWFrames that can help line up the data more reliably.
- Next, an analysis of the News needs to be undertaken. This includes comparisons of all modes in terms of their extration radii and Lev. While running CCE manually for each instance works in test cases, a script for running CCE on the entire CCEAnnex and having all relevant News.h5 outputs will be necessary.
- It will help to understand the output of the News when there's equivalent h and hdot data available. Likewise, comparisons of all extrapolation orders and Levs for hdot and h should be done, as well as looking at differences for identical runs done with different versions of SpEC. 
- Comparing the previous two items with the current SpEC accuracy limit (such as the truncation error limit) is also relevant.
- If there's a subset of reliable runs for both hdot and the News, then compare those outputs in terms of the full complex modes as well as the amplitudes and phases. These should be good runs to showcase how well CCE performs.

### Tips and Tricks
- When running CCE on many files at once, in the main/wrapper script include a "git annex get [worltubedata]" before running and a "git annex drop [worldtube data]" after running CCE and correct output has been verified to minimize the memory usage.
- after creating the run directory with DoMultipleRuns, change the name of the directory to include the Lev and worldtube extraction radius
- Note that DoMultipleRuns.input needs to be edited before being run. One should change the max and min Lev to the current Lev, change the extraction radius to the one currently being considered, and can get the final time from the SpEC.out file in the SimulationAnnex version of the run.

### Relevant reading
https://arxiv.org/abs/1309.3605 
https://arxiv.org/abs/1605.04332
https://arxiv.org/abs/1512.06800
https://arxiv.org/abs/1502.06987
https://arxiv.org/abs/1406.7029
