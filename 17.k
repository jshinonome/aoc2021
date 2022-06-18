t:{"J"$".."\:*1_\:"="\:x}'","\:*-1#":"\:*0:`17.txt

t:(20 30;-10 -5)
/ Q1
(+/)@!-*t 1

/ Q2
/ min forward steps by initial forward velocity
fi:{$[1>*-1#y;0W;(~x[1]<s)&~x[0]>s:+/y;y;s>x[1];0W;y,(-1#y)-1]}[t 0]/'1+!232

fi:(*:'fi)!#:'fi:fi@&~0W~'fi

/ max forward steps by initial forward velocity
fa:{
    y:(),y;
    l:y@(#y)-1;
    $[1>*-1#y;0W;
        (~x[1]<s)&(~x[0]>s)&((l=1)|x[1]<(s:+/y)+l-1);y
        ;s>x[1];0W;y,l-1]
 }[t 0]/'1+!232

fa:(*:'fa)!#:'fa:fa@&~0W~'fa

oo:(! fa)@&(! fa)=. fa

fa:@[fa;(! fa)@&(! fa)=. fa;-[;1]]

/ initial forward velocities by steps
f:fi+!:'1+fa - fi

f:=(!).+(,/)(!f),/:'. f

/ min downward steps by initial forward velocity
di:{
    s:+/y;
    $[s<x[0];-0W;
        (~x[1]<s)&~x[0]>s;y;
        y,(-1#y)-1]
 }[t 1]/'-|!1+-t[1;0]

di:(*:'di)!#:'di:di@&~-0W~'di

di:di+{(-!x)!(. x)+(2*-!x)+1}(0,*!di)_di

/ max downward steps by initial forward velocity
da:{
    y:(),y;
    s:+/y;
    l:y@(#y)-1;
    $[s<x[0];-0W;
        (~x[1]<s)&(~x[0]>s)&x[0]>s+l-1;y;
        y,l-1]
 }[t 1]/'-|!1+-t[1;0]

da:(*:'da)!#:'da:da@&~-0W~'da

da:da+{(-!x)!(. x)+(2*-!x)+1}(0,*!da)_da

/ initial downward velocities by steps
d:di+!:'1+da - di

d:=(!).+(,/)(!d),/:'. d

n:*oo

/ forward = 0 when falls in target area
n1:(#?(&da>n-1),&di>n-1)*#oo

n0:#?(,/)(,/)((!n)#f),\:/:'(!n)#d

n1+n0
