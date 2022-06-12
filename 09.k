m:"H"$''0:`:09.txt
/ Q1
{
    r:#x;c:#*x;
    b:(1_>':x),,c#1b;
    b&:(,c#1b),1_<':x;
    b&:{(1_>':x),1b}'x;
    b&:{1b,1_<':x}'x;
    +//(1+x)*b
 }m

l:{(0,&1< -':i)_i:&x}'~m=9

/ remove empty list
l:{x@&0<#:'x}'l

/ list of group in each line
t:+`r`s`e`g!+{(x@(0,1,-1+#x)),0}',/(!#l),''l

/ scan same group downward and upward
t:{
    if[&/0<x`g;:x];
    x[i:*&0=x`g;`g]:n:1+|/x`g;
    s:x[i;`r];
    e:*-1#x`r;
    x:{
        r0:|/y[&x=y`g;`r];
        p:+y[&(r0=y`r)&x=y`g]`s`e;
        if[0=#p;:y];
        :{[x;r0;y;z]
            update g:x from y where g=0,r=r0+1, ~(z[0]>e)|z[1]<s
        }[x;r0]/[y;p];
        }[n]/x;
    m:|/x[&n=x`g;`r];
    if[m=0;:x];
    x:{[x;y;r0]
        p:+y[&(r0=y`r)&x=y`g]`s`e;
        if[0=#p;:y];
        :{[x;r0;y;z]
            update g:x from y where g=0,r=r0-1, ~(z[0]>e)|z[1]<s
        }[x;r0]/[y;p];
        }[n]/[x;|1+!m-1];
    x
 }/t

b:0!select z:+/1+e-s by g from t
/ Q2
(*/)3# (b`z)@>b`z
