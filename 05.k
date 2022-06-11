/ '' -> apply to a deeper level of a list
/ // -> raze a list recursively
m:# [;0]@2#1+|//p0:p@&{ |/x[0]=x[1] }'p:"J"$","\:''"->"\:'0:`:05.txt
/ Q1
/ . -> access 2+d list by index
+//1<m{x:x{.[x;y;1+]}/{+x+s*\:!:'1+(|/)l*s:(0<l)-0>l:y-x} . y;x}/p0

/ Q2
+//1<m{x:x{.[x;y;1+]}/{+x+s*\:!:'1+(|/)l*s:(0<l)-0>l:y-x} . y;x}/p