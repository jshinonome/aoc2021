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

s:@[".ABCD"?s ./:p8;nap;:;-1]

c:0 1 10 100 1000

r8:(,0 0),+2 4#&t8 in 1 2 3 4

h8:&t8=0

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
    i:h8@$[z>p1[1]-1;&(z>h8)&(h8>p1[1]-1);&(z<h8)&(h8<p1[1]-1)];
    if[&/0=x@i;:(@[x;z,i1;:;0,a];y+c[a]*+/abs(p1-p0))];
    :()
 }

mh:{[x;y;z]
    a:x z;
    p0:p8 z;
    if[(z in r8 a)&x[r8 a]in a*sr8;:()];
    op:x[h8]>0;
    h0:h8@&(h8<0W^*h8@&op&h8>p0[1]-1)&h8>-0W^*|h8@&op&h8<p0[1]-1;
    if[0=#h0;:()];
    :+(@[x;;:;0,a]'(z,'h0);y++/c[a]*abs(p0-+p8[h0]))
 }

/ take all possible moves to room
amr:{h0:h8@&0<x[0]@h8;:{$[0<#n:mr[;;y] . x;n;x]}/[x;h0]}

/ skip if any move to room step, reduce 50% time
/ current board, cost
ma:{
    mr0:amr[(x;y)];
    if[~mr0~(x;y);:,amr mr0];
    r0:r0@&0<r0:*:'r8@'&:'0<x@r8;
    mh0:(,/)@mh[x;y]'r0;
    :amr'mh0
 }

/ board to cost
b2c:()!`long$()

/ 33184 9003648
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
 }/[((,s)!,0)]

/ Q1
b2c[t8]

/ Q1 alternative
b2c:()!`long$()
/ 1246 14099312
{
    if[0=#x;:()];
    b2c0:(,/)ma .'x;
    b2c0:&/'(b2c0@'1)@=b2c0@'0;
    b2c0:(&b2c0<0W^b2c[!b2c0])#b2c0;
    if[0<#b2c0;b2c,:b2c0];
    +(!b2c0;. b2c0)
 }/[,(s;0)]

b2c[t8]
