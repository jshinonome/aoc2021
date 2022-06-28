s:0:`:23.txt

b8:("#############";
    "#...........#";
    "###.#.#.#.###";
    "  #.#.#.#.#";
    "  #########")

t8:0 0 -1 0 -1 0 -1 0 -1 0 0 1 2 3 4 1 2 3 4

/ not allowed positions
nap:2*1+!4

p8:(1,'1+!11),(2 3;2 5;2 7;2 9;3 3;3 5;3 7;3 9)

s1:@[".ABCD"?s ./:p8;nap;:;-1]

c:0 1 10 100 1000

r8:(,0 0),+2 4#&t8 in 1 2 3 4

hi:&t8=0

/ available room
ar8:(0 1;0 0)

/ stable room
sr8:(0 1;1 1)

pb8:{(-1)@/:.[;;:;]/[b8;p8;".ABCD"@x];}
pbc8:{pb8 x;(-1) "cost: ",$y;}

/ current board, cost, source index
mr:{
    a:x z;
    p0:p8 z;
    i1:r8[a;(ar8*a)?x r8 a];
    if[^i1;:()];
    p1:p8 i1;
    i:hi@$[z>p1[1]-1;&(z>hi)&(hi>p1[1]-1);&(z<hi)&(hi<p1[1]-1)];
    if[&/0=x@i;:(@[x;z,i1;:;0,a];y+c[a]*+/abs(p1-p0))];
    :()
 }

mh:{[x;y;z]
    a:x z;
    p0:p8 z;
    if[(z in r8 a)&x[r8 a]in a*sr8;:()];
    op:x[hi]>0;
    h0:hi@&(hi<0W^*hi@&op&hi>p0[1]-1)&hi>-0W^*|hi@&op&hi<p0[1]-1;
    if[0=#h0;:()];
    :+(@[x;;:;0,a]'(z,'h0);y++/c[a]*abs(p0-+p8[h0]))
 }

/ take all possible moves to room
amr:{h0:hi@&0<x[0]@hi;:{$[0<#n:mr[;;y] . x;n;x]}/[x;h0]}

/ skip if any move to room step, reduce 50% time
/ current board, cost
ma:{
    mr0:amr[(x;y)];
    if[~mr0~(x;y);:,amr mr0];
    r0:r0@&0<r0:*:'r8@'&:'0<x@r8;
    mh0:(,/)@mh[x;y]'r0;
    :amr'mh0
 }

/ Q1
/ board to cost
b2c:()!`long$()
/ 1246 ms 14099312
{
    if[0=#x;:()];
    b2c0:(,/)ma .'x;
    b2c0:&/'(b2c0@'1)@=b2c0@'0;
    b2c0:(&b2c0<0W^b2c[!b2c0])#b2c0;
    if[0<#b2c0;b2c,:b2c0];
    +(!b2c0;. b2c0)
 }/[,(s1;0)]

b2c[t8]

/ Q1 alternative
b2c:()!`long$()
/ 33184 ms 9003648
{
    b0:x?&/x;
    if[b0~t8;:x];
    b2c0:ma[b0;x[b0]];
    b2c0:b2c0@&0<#:'b2c0;
    x[,b0]:0N;
    if[0=#b2c0;:x];
    b2c0:(!) . +b2c0;
    b2c0:(&b2c0<0W^b2c[!b2c0])#b2c0;
    b2c,:b2c0;
    x,:b2c0;
    x
 }/[((,s1)!,0)]

b2c[t8]

/ Q2

n:4

t16:@[(11#0),(,/)n#,(1+!n);nap;:;-1]

p16:(1,'1+!11),(,/)(2+!n),/:\:3+2*!n

r16:(,n#0),+(n,4)#&t16 in 1 2 3 4

s2:@[".ABCD"?((3#s),("  #D#C#B#A#";"  #D#B#A#C#"),-2#s) ./:p16;nap;:;-1]

/ available room
ar16:1_0^(:':\1 1 1 1)
/ stable room
sr16:-1_0^(:':\1 1 1 1)

/ current board, cost, source index
mr16:{
    a:x z;
    p0:p16 z;
    i1:r16[a;(ar16*a)?x r16 a];
    if[^i1;:()];
    p1:p16 i1;
    i:hi@$[z>p1[1]-1;&(z>hi)&(hi>p1[1]-1);&(z<hi)&(hi<p1[1]-1)];
    if[&/0=x@i;:(@[x;z,i1;:;0,a];y+c[a]*+/abs(p1-p0))];
    :()
 }

mh16:{[x;y;z]
    a:x z;
    p0:p16 z;
    if[(z in r16 a)&x[r16 a]in a*sr16;:()];
    op:x[hi]>0;
    h0:hi@&(hi<0W^*hi@&op&hi>p0[1]-1)&hi>-0W^*|hi@&op&hi<p0[1]-1;
    if[0=#h0;:()];
    :+(@[x;;:;0,a]'(z,'h0);y++/c[a]*abs(p0-+p16[h0]))
 }

/ take all possible moves to room
amr16:{h0:hi@&0<x[0]@hi;:{$[0<#n:mr16[;;y] . x;n;x]}/[x;h0]}

/ skip if any move to room step, reduce 50% time
/ current board, cost
ma16:{
    mr0:amr16[(x;y)];
    if[~mr0~(x;y);:,amr16 mr0];
    r0:r0@&0<r0:*:'r16@'&:'0<x@r16;
    mh0:(,/)@mh16[x;y]'r0;
    :amr16'mh0
 }

/ board to cost
b2c:()!`long$()

/ 4742 ms 32572064
\ts {
    if[0=#x;:()];
    b2c0:(,/)ma16 .'x;
    b2c0:&/'(b2c0@'1)@=b2c0@'0;
    b2c0:(&b2c0<0W^b2c[!b2c0])#b2c0;
    if[0<#b2c0;b2c,:b2c0];
    +(!b2c0;. b2c0)
 }/[,(s2;0)]

b2c[t16]
