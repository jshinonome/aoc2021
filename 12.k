d:{x@&~x=`start}'`end_={((,). x)!(,).|x}("SS";"-") 0:`:12.txt

il:{96<($x)0}

/ Q1
+/`end={
    if[y=`start;:(,/).z.s[x]'[x y;x y]];
    if[y=`end;:z];
    n:n@&~(n in z)&il'n:x y;
    if[0=#n;:()];
    :(,/).z.s[x]'[n;z,/:n];
 }[d;`start;()]


/ Q2
+/`end={
    if[y=`start;:(,/).z.s[x]'[x y;x y]];
    if[y=`end;:z];
    if[{$[#k:&1<#:'=(),x;1<+/il'k;0b]}z;:()];
    if[{$[#k:&2<#:'=(),x;|/il'k;0b]}z;:()];
    n:x y;
    :(,/).z.s[x]'[n;z,/:n];
 }[d;`start;()]
