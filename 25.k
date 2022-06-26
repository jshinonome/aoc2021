sf:0:`:25.txt

p:{(-1#x),-1_x}
n:{(1_x),1#x}

m:{
    e:">"=x;
    a:"."=x;
    e:((p'e)&a)|(n'~a)&e;
    s:"v"=x;
    a:~s|e;
    s:(p[s]&a)|n[~a]&s;
    ".>v"@(e*1)+s*2
 }

1+*{
    n:x 0;
    sf0:x 1;
    sf1:m[sf0];
    $[sf1~sf0;(n;sf0);(n+1;sf1)]
 }/[10;(0;sf)]
