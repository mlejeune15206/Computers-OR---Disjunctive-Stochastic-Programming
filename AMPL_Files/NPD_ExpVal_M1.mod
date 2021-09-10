################################################################
##Model NPD1 - Expected Value Model1                           #
##November 23, 2017                                            #       ################################################################

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

param F >=0;          # fixed costs
param U >=0;          # maximum number of projects
param p >=0.5, <=1;   # probability level
param R;              # return level
param q{k in K_test} :=1/card(K_test);
param s{i in I} >=0, integer;  # starting time of i
param f{i in I} >=0, integer;  # completion time of i
param d{i in I} >=0, integer;  # duration of i
param Max3{k in K, t in T}; 
param M{k in K,t in T}:= -F*t + sum{tt in 1..t} min(0,Max3[k,tt]); #-20
param M_intermediary_tilde_xi{K,I}; 
param tilde_xi{k in K,i in I, t in T} := if t=f[i] then M_intermediary_tilde_xi[k,i] else 0; 

set Ti{i in I}:= {t in T: f[i] >= t >= s[i]};
set It{t in T}:= {i in I: f[i] >= t >= s[i]};
set Ct{t in Tilde_T}:= {i in I: f[i]=t};  
 
############################

var x{t in 1..r,i in It[t]} binary;
#########################################

minimize OBJ_VAR_EXPVAL: r;
##########################################

subject to 1c_DECOMP{t in 1..r}: 
sum{i in It[t]} x[t,i]=U;

subject to 1d_DECOMP{t in 1..r-1, i in It[t]: f[i]-1 >= t}: 
x[t,i] >= x[t+1,i];

subject to EXP_VALUE:
sum{k in K_test} (q[k]*
(sum{t in a..r} sum{i in Ct[t]} x[t,i] * tilde_xi[k,i,t]))-r*F 
>= R;
