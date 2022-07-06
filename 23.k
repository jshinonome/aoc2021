s:0:`:23.txt

/<- print functions
b:("#############";
    "#...........#";
    "###.#.#.#.###"),
    ((n-1)#,"  #.#.#.#.#"),
    ,"  #########"

pb:{(-1)@/:.[;;:;]/[b;p;".ABCD"@x];}
pbc:{pb x;(-1) "cost: ",$y;}
/-> print functions

/ not allowed positions
nap:2*1+!4

/ move to room, current board, cost, source index
mr:{
    a:x z;
    p0:p z;
    i1:r[a;(vr*a)?x r a];
    if[^i1;:()];
    p1:p i1;
    i:hi@$[z>p1[1]-1;&(z>hi)&(hi>p1[1]-1);&(z<hi)&(hi<p1[1]-1)];
    if[&/0=x@i;:(@[x;z,i1;:;0,a];y+c[a]*+/abs(p1-p0))];
    :()
 }

/ move to hall, current board, cost, source index
mh:{
    a:x z;
    p0:p z;
    if[(z in r a)&x[r a]in a*vr;:()];
    op:x[hi]>0;
    h0:hi@&(hi<0W^*hi@&op&hi>p0[1]-1)&hi>-0W^*|hi@&op&hi<p0[1]-1;
    if[0=#h0;:()];
    :+(@[x;;:;0,a]'(z,'h0);y++/c[a]*abs(p0-+p[h0]))
 }

/ take all possible moves to room
amr:{h0:hi@&0<x[0]@hi;:{$[0<#n:mr[;;y] . x;n;x]}/[x;h0]}

/ skip if any move to room step, reduce 50% time
/ current board, cost
ma:{
    mr0:amr[(x;y)];
    if[~mr0~(x;y);:,amr mr0];
    r0:r0@&0<r0:*:'r@'&:'0<x@r;
    mh0:(,/)@mh[x;y]'r0;
    :amr'mh0
 }

/ cost
c:0 1 10 100 1000

/ Q1
n:2

t:@[(11#0),(,/)n#,(1+!4);nap;:;-1]

p:(1,'1+!11),(,/)(2+!n),/:\:3+2*!4

r:(,n#0),+(n,4)#&t in 1 2 3 4

/ valid room patterns
vr:{1_x,1#x}0^(:':\n#1)

hi:&t=0

s1:@[".ABCD"?s ./:p;nap;:;-1]

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

b2c[t]

/ Q1 alternative
b2c:()!`long$()
/ 33184 ms 9003648
{
    b0:x?&/x;
    if[b0~t;:x];
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

b2c[t]

/ Q2

n:4

t:@[(11#0),(,/)n#,(1+!4);nap;:;-1]

p:(1,'1+!11),(,/)(2+!n),/:\:3+2*!n

r:(,n#0),+(n,4)#&t in 1 2 3 4

s2:@[".ABCD"?((3#s),("  #D#C#B#A#";"  #D#B#A#C#"),-2#s) ./:p;nap;:;-1]

/ valid room patterns
vr:{1_x,1#x}0^(:':\n#1)

/ board to cost
b2c:()!`long$()

/ 4742 ms 32572064
{
    if[0=#x;:()];
    b2c0:(,/)ma .'x;
    b2c0:&/'(b2c0@'1)@=b2c0@'0;
    b2c0:(&b2c0<0W^b2c[!b2c0])#b2c0;
    if[0<#b2c0;b2c,:b2c0];
    +(!b2c0;. b2c0)
 }/[,(s2;0)]

b2c[t]
