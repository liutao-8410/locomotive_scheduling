/*********************************************
 * OPL 12.6.3.0 Model
 * Author: 12399
 * Creation Date: 2021-5-18 at обнГ4:44:59
 *********************************************/
 int ys = ...;
 int bl = ...;
 float b[1..ys] = ...;
 float c[1..bl] = ...;
 float a[1..ys][1..bl] = ...;
 dvar float+ x[1..bl];
 maximize sum(i in 1..bl) c[i]*x[i];
 subject to{
 forall(j in 1..ys)
   sum(i in 1..bl) a[j][i]*x[i]  <= b[j];
 }