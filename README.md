**Data-Driven Project Portfolio Selection: Stochastic Programming Formulations with Reliability and Time to Market Requirements.**

<!-- blank line --> 
---- 
<!-- blank line --> 


**Authors**: J. Kettunen, M.A. Lejeune 

M. Lejeune acknowledges the support of the National Science Foundation [Grant ECCS-2114100] and of the Office of Naval Research [Grant N000141712420] for this study.

<!-- blank line --> 
---- 
<!-- blank line --> 

**Cite**

To cite this paper and the data saved in this repository, please  using the following BibTex citation: 

@article{C&R2021,
 
 author =        {J. Kettunen and M.A. Lejeune},

 journal =     {Computers \& Operations Research},

 title =         {Data-Driven Project Portfolio Selection: Stochastic Programming Formulations with Reliability and Time to Market Requirements},

year =          {2021 -- revised and resubmitted},
}  

<!-- blank line --> 
---- 
<!-- blank line --> 


**Content**

This repository includes
1.   **AMPL Data Files** under the folder “FinalDataFiles.” We consider ten instances, and index the data folders from 1 to 10, accordingly. 


2.	**AMPL Mod File** (FinalModFile.mod)

3.	**AMPL Main Run Files** such as “FinalAlternativeFormulations_COM.run.” Several run files are created to solve a particular set of MIP formulations, allowing efficient batch  	runs. For example, “FinalAlternativeFormulations_COM.run” is used to solve the following four MIP formulations under a particular set of parameter setting: 

	- Cost minimizing basic completely comonotone MILP (CCM)

	- Budget-constrained basic completely comonotone MILP (CCM)

	- Budget-Constrained. 

	The comments on the mod file along with the problem definitions in the main run files provide insights about the alternative MIP formulations considered in our study.

4.	We created additional run files to get results for a batch of main run files under different parameter settings. These files are provided under the folder “Batch-RunFiles.” For illustrative purposes, each type of file is given for a particular instance index such as DataSet5; we basically modify the index information to get results for the other instances.

5.	All the output files obtained in our computational study are available under the folder “OutputFiles.” Since there is a very large number of output files (almost two thousand problem instances), for convenience, we also provided the excel files including the key results retrieved from the output files. 

