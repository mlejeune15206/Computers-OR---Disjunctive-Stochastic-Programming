**Data-Driven Project Portfolio Selection: Stochastic Programming Formulations with Reliability and Time to Market Requirements.**

<!-- blank line --> 
---- 
<!-- blank line --> 


**Authors**: J. Kettunen, M.A. Lejeune 

M. Lejeune acknowledges the support of the National Science Foundation [Grant ECCS?2114100] and of the Office of Naval Research [Grant N000141712420] for this study.

<!-- blank line --> 
---- 
<!-- blank line --> 

**Cite**

To cite this paper and the data saved in this repository, please  using the following BibTex citation: 

@article{NRL2021,
 
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

	We next outline how to associate the output files with the tables and figures presented in the paper.
 	1.  Figure 1: Optimal objective function value (robustified CVaR of TWCT) for varying radius and budget.
	The corresponding output files are available under the following folders: 

		- “…OutputFiles\ModelAnalysis\DataSet1,” where the combined key results are summarized in the excel file “…OutputFiles\summary_outputs_modelanalysis.” 

		- “…OutputFiles\ModelAnalysis\DataSet1\Fixing,” where “fixing” refers to setting all the control decisions to 1, i.e., the setting with “no compression decisions.” 			The combined key results are summarized in the excel file “…OutputFiles\summary_outputs_fixing.”

	2.  Table 1: Computational performance – comonotone data, Table 2: Impact of modeling parameters on performance of CCM-RLT, and Table 5: Computational performance on non-	  comonotone instances.

		- “…OutputFiles\ComputationalPerformance,” where the combined key results are summarized in the excel file “…OutputFiles\summary_outputs_computational_performance.”

	3.  Figure 3: Robustified CVaR of TWCT versus Total Compression Cost for increasing   (trade-off coefficient) values in {0.1, 0.2,…0.9,1}.

		- The corresponding output files are available under the folder “…OutputFiles\ModelAnalysis\DataSet1\ParetoAnalysis”, where the combined key results are summarized in 	                 the excel file “…OutputFiles\summary_outputs_pareto.”

	4.  Figure 4: Optimal objective function values and solutions for illustrative example.

		- The corresponding output files are available under the folder “…OutputFiles\ToyExample.”

	5.  Table 4: Impact of radius ( ) on performance of CCM-RLT and Figure 5: Solution times for varying radius.

		- The corresponding output files are available under the folder “…OutputFiles\ \ComputationalPerformance\KappaAnalysis,” where the combined key results are summarized 	                 in the excel file “…OutputFiles\ summary_outputs_computational_performance_kappaimpact.”



