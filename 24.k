i:(&"inp w"~/:i)_i:0:`24.txt

/-> not used
gf:{
    x:{{""/:x@1 3 0 5 1 4 2 6 4}(" "\:x),,:'":;[]"}'x;
    . "{[w;x;y;z]",((,/)x),":(w;x;y;z)}"
 }

add:{x+y}
mul:{x*y}
/ div is a build in function
eql:{x=y}

f14:gf'1_'i
/<- not used

mod:{x-y*x div y}

/ $[m>9;*26;div 26]
m:"J"$6_'i@'5
p:"J"$6_'i@'15

/ Q1
10/:-1_*+{
    if[(1+#m)=#z;:z];
    c:(#z)-1;
    l:z@(#z)-1;
    x0:l 0;
    x1:l 1;
    if[x0=0;:(-2_z),,(-1 0)+z@(#z)-2];
    if[x[c]>9;:z,,(9;y[c]+x0+x1*26)];
    d:x[c]+mod[x1;26];
    if[(9<d)|(1>d)|d>x0;:(-2_z),,(-1 0)+z@(#z)-2];
    :(-1_z),((d;x1);(9;x1 div 26))
 }[m;p]/[,(9 0)]

/ Q2
10/:-1_*+{
    if[(1+#m)=#z;:z];
    c:(#z)-1;
    l:z@(#z)-1;
    x0:l 0;
    x1:l 1;
    z;
    if[x0=10;:(-2_z),,(1 0)+z@(#z)-2];
    if[x[c]>9;:z,,(1;y[c]+x0+x1*26)];
    d:x[c]+mod[x1;26];
    if[(9<d)|(1>d)|d<x0;:(-2_z),,(1 0)+z@(#z)-2];
    :(-1_z),((d;x1);(1;x1 div 26))
 }[m;p]/[,(1 0)]
