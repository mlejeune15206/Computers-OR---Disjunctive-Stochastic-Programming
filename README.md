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

volume =  {revised and resubmitted},

year =          {2021}

}  

<!-- blank line --> 
---- 
<!-- blank line --> 


**Content**

This repository includes:
1.   **AMPL Data Files** (with extension ".dat") in the folder named "AMPL_Files" that contain the data instances used in this study. 


2.	**AMPL Model Files** (with extension ".mod") in the folder named "AMPL_Files" that contain the formulations of the models proposed in this study and the formulation of the proposed valid inequalities. 

3.	**AMPL Script Files** (with extension ".run") in the folder named "AMPL_Files" that contain the implmentation of the decompostion method propod in this study. 

4.	**GAMS Command File** (with extension ".run") in the folder named "GAMS_Files") that implements the scenarion generation method proposed by Heitsch et al. (2008) and that we slightly adapted to this study. The scenario generation method is presented in:

H. Heitsch, W. Roemisch, C. Strugarek. Stability of Multistage Stochastic Programs. *SIAM Journal on Optimization* 17, 511-525. 2006.

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; and the original package file scenred2 is available at:
www.gams.com/latest/docs/T_SCENRED2.html.

5.	**GAMS Model File** (with extension ".gms) in the folder named "GAMS_Files". 

6.	**GAMS Parameter File** (with extension ".opt") in the folder named "GAMS_Files" that specifies the options used for GAMS. 

7.	**Excel File** (with extension ".xls") in the folder named "GAMS_Files" that contain the input data "M1_data.xlsx" and "M2_data.xlsx" for the waterfall and agile scenarios, respectively.