################################################################
##Model NEW NPD2 - Expected Value Model1                       #
##September 10, 2018                                           #       ################################################################

param r>=0;
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

param F >=0;          # fixed costs
param U >=0;          # maximum number of projects
param p >=0.5, <=1;   # probability level
param R;              # return level
param q{k in K_test} :=1/card(K_test);



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

var y {k in K_test, t in 1..r,i in Itk[t,k]} binary;
#########################################

minimize OBJ_VAREXP2: r;
##########################################

#subject to 6a_DEC{k in K_test}:
#sum{t in a..r} sum{i in Ctk[t,k]}y[k,t,i]*tilde_xi[k,i,t]-r*F >= R;

subject to 6b_DEC{t in 1..r, k in K_test}: 
sum{i in Itk[t,k]} y[k,t,i] = U;

subject to 6c_DEC{k in K_test, t in 1..r-1, i in Itk[t,k]: f_k[k,i]-1 >= t}:
y[k,t,i] >= y[k,t+1,i];

subject to EXPVALUE2:
sum{k in K_test} (q[k]*
(sum{t in a..r} sum{i in Ctk[t,k]} y[k,t,i]*tilde_xi[k,i,t]))>= R;
