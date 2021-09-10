################################################################
##Model NPD2 - NEW VERSION - DECOMPOSITION                     #
##September 9, 2018                                            # 
##Reduced Scenario Set    					               #  ################################################################

param r >=0;
param KK >=0;         # = Number of scenarios
param KK_test >=0;    # = Number of scenarios considered
param II >=0;         # = Number of projects
param TT >=0;         # = Number of periods
param a  >=0;          

set K = 1 .. KK;
set K_test = 1 .. KK_test;

set I = 1 .. II;
set T = 1 .. TT;
set Tilde_T = a .. TT;

######   NEW
set Reduced_scenario_set;
param prob_sce{k in Reduced_scenario_set} >=0, default 0;
#### NOT needed in reduced scenario set
#param q{k in K_test} :=1/card(K_test);


param F >=0, default 500;          # fixed costs
param U >=0;          # maximum number of projects
param p >=0.05, <=1;   # probability level
param R;              # return level

#### OLD M2 MODEL
#### param s{i in I} >=0, integer;  # starting time of i
#### NEW M2 MODEL
param s{k in K,i in I} >=0, integer;#  starting time of i

param f_k{k in K,i in I} >=0, integer;#completion time of i in k 
param d_k{i in I,k in K}:= f_k[k,i]-s[k,i]+1;#duration of i in k

param Max3{k in K, t in T}; 
param M{k in K,t in T}:= -F*t + sum{tt in 1..t} min(0,Max3[k,tt]); #-20
param M_intermediary_tilde_xi{k in K,i in I}; 
param tilde_xi{k in K,i in I, t in T} := if t=f_k[k,i] then M_intermediary_tilde_xi[k,i] else 0; 

set Tik{i in I,k in K}:= {t in T: f_k[k,i] >= t >= s[k,i]};
set Itk{t in T,k in K}:= {i in I: f_k[k,i] >= t >= s[k,i]};
set Ctk{t in Tilde_T,k in K}:= {i in I: f_k[k,i]=t};  
set Stk{k in K,i in I, t in T}:= 
{kk in K: tilde_xi[k,i,t]=tilde_xi[kk,i,t]};  
 
############################

var y{k in Reduced_scenario_set, t in 1..r, i in Itk[t,k]} binary;
var beta{k in Reduced_scenario_set, t in r..r} binary;
#########################################

minimize OBJ_VAR_DEC2: r;
#sum{k in K_test} beta[k,r]; 
##########################################

subject to 6a_DEC{k in Reduced_scenario_set}:
#### OLD
#### sum{t in a..r} sum{i in Ctk[t,k]} y[k,t,i]*tilde_xi[k,i,t] >= R * beta[k,r] + (1-beta[k,r])*M[k,r]; 
#### NEW
sum{t in a..r} sum{i in Ctk[t,k]} y[k,t,i]*tilde_xi[k,i,t] >= R * beta[k,r] + (1-beta[k,r])*M[k,r]; 

subject to 6b_DEC{t in 1..r, k in Reduced_scenario_set}: 
sum{i in Itk[t,k]} y[k,t,i] = U;

subject to 6c_DEC{k in Reduced_scenario_set, t in 1..r-1, i in Itk[t,k]: f_k[k,i]-1 >= t}:
y[k,t,i] >= y[k,t+1,i];

subject to 2d_DEC:
#sum{k in K_test} q[k]*beta[k,r] >= p; 
sum{k in Reduced_scenario_set} prob_sce[k]*beta[k,r] >= p; 

########################################
########################################
subject to STREN_DEC{k in Reduced_scenario_set}:
(beta[k,r])^2 >= beta[k,r];
