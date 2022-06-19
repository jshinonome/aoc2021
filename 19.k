s:"J"$","\:''2_'(&""~/:s)_s:(,""),0:`:19.txt

/ k only support float type matrix multiplication
/ create a mm for int
mm:{((#x),#*y)#+/'(,/)x*/:\:+y}

rx:(1 0 0;0 0 -1;0 1 0)
ry:(0 0 1;0 1 0;-1 0 0)
rz:(0 -1 0;1 0 0;0 0 1)

b:3 3#1 0 0 0
/ 8 x axis direction
m :mm\[b;4#,ry]
m,:mm\[b;4#,rz]

/ all 24 3d rotation matrixes
m:?(,/)@{mm\[x;4#,rx]}'m


s0:{
    if[(#y 2)=#d:*y;:y];
    t:*y 1;
    l:{
        (,/)@{$[#k:&11<d:#:'=(,/)x-/:\:t:mm[y;z];(t+\:*k;k);()]}[x;y]'z
    }[y[2]t;;x]'y[2];
    d,:t;
    i:&0<#:'l;
    y[2]:@[y[2];i;:;(l i)@'0];
    y[3]:y[3],,@[(#s)#,(0 0 0);i;:;(l i)@'1];
    y[1]:y[1],i;
    y[1]@~y[1] in d;
    y[1]:y[1]@&~y[1] in d;
    :(d;y[1];y[2];y[3])
 }[m]/[(();,0;s;())]

/ Q1
#?(,/)s0 2

/ Q2
sc:{i:&(0 0 0)~/:x;@[x;i;:;y i]}/[s0 3]

/ manhattan distance
md:{+//r*(1 -1)0>r:x-y}

|/(,/)sc md/:\: sc
