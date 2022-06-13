s:0:`:11.txt

/ flash
f:{
    l:{0b,-1_x}'x;
    r:{(1_x),0b}'x;
    d:(,(#x)#0b),-1_x;
    u:(1_x),,(#x)#0b;
    dl:{0b,-1_x}'d;
    dr:{(1_x),0b}'d;
    ul:{0b,-1_x}'u;
    ur:{(1_x),0b}'u;
    (~x)*l+r+d+u+dl+dr+ul+ur
 }

/ Q1
*100{
    d:x 1;
    d:d+1;
    b:{y|9<f[y]+x}[d]/d>9;
    d:(~b)*d*~9<d:f[b]+d;
    (x[0]++//0=d;d)
 }/(0;s)


/ Q2
*{
    d:x 1;
    if[0= |//d;:x];
    d:d+1;
    b:{y|9<f[y]+x}[d]/d>9;
    d:(~b)*d*~9<d:f[b]+d;
    (x[0]+:1;d)
 }/(0;s)
