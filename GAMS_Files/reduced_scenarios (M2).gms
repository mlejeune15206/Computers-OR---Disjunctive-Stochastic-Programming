$title Simple Scenario Tree Construction Example (SRTREE,SEQ=390)

$onText
This model takes some scenario data (that comes from a true tree),
builds a fan and lets ScenRed2 construct a tree. One without loss of
information, the other with some reduction requirement. The data is
taken from the GAMS/ScenRed2 manual, just the node numbering is
different.


H. Heitsch, W. Roemisch, and C. Strugarek
Stability of Multistage Stochastic Programs
SIAM Journal on Optimization 17 (2006), 511-525

Keywords: stochastic programming, scenario tree construction, GAMS ScenRed2
$offText


* Initialize ScenRed2
$set sr2prefix test
$libInclude scenred2



* number of orignial scenarios
$set sc 5000
* number of scenarios after reduction
ScenredParms('red_num_leaves') = 50;

scalar sc /%sc%/;
Set n row entries / n0*n%sc% /;
set r column entries    /r1*r225/;
parameter rv2(n,r) 'random values trasposed'
          rv(r,n) 'random values';

* read in scenarios
$CALL GDXXRW M2_data.xlsx par=rv2 rng=a1:hr5002 Cdim=1 Rdim=1 trace=0
$GDXIN M2_data.gdx
$LOAD rv2
$GDXIN

*display rv2;
* transpose rv
option rv < rv2;
*display rv;


* Initialize fan paramters needed to given as inputs
* to scenario reduction algorithm
Set anc(n,n) 'ancestor relation';
loop(n, anc(n+1,'n0') = yes; );

Parameter prob(n) 'node probability';
loop(n, prob(n) = 1/sc; );
prob('n0') = 1;

*display n;
*display anc;
*display prob;

Set anc_noloss(n,n), anc_red(n,n);
Parameter prob_noloss(n), prob_red(n);

* Scenred2 call
ScenredParms('out_scen') = 1;
$libInclude runscenred2 reduced tree_con n anc prob anc_red prob_red rv

display anc_red;
display prob_red;

* write probabilities to excel
Execute_Unload 'outdata.gdx';
Execute 'GDXXRW outdata.gdx par=prob_red rng=Sheet1!a1';

* ORIGINAL SCENARIOS, NO REDUCTION
*ScenredParms('red_percentage') = 0;
*ScenredParms('out_scen') = 1;
*$libInclude runscenred2 original tree_con n anc prob anc_noloss prob_noloss rv
*abort$(card(anc_noloss) <> 8) 'scenred tree construction gave incorrect noloss tree', anc_noloss;
*display anc_noloss;

