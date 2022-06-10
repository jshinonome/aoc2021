/ Q1
/ "B"$'' -> cast all chars to boolean
/ 2/: -> convert to decimal
(2/:b)*2/:~b:0.5<%[;#*b]@+/'b:+"B"$''0:`:03.txt

/ Q2
/ oxygen generator rating ((#b)#1b){$[1=+/x;x;x&y=~0.5>(+/x&y)%+/x]}/+b:"B"$''0:`:03.txt
/ CO2 scrubber rating ((#b)#1b){$[1=+/x;x;x&y=0.5>(+/x&y)%+/x]}/+b:"B"$''0:`:03.txt
(2/:b@*&((#b)#1b){$[1=+/x;x;x&y=0.5>(+/x&y)%+/x]}/+b)*2/:b@*&((#b)#1b){$[1=+/x;x;x&y=~0.5>(+/x&y)%+/x]}/+b:"B"$''0:`:03.txt
