10 ' -*- basic-m100 -*-
20 ' CRT-BASIC commands from the
30 ' NEC PC-8241 User Manual.
40 ' 
50 'Default to CRT, no Fkey line
60 '1:  40x24 text,	2: 32x24 text;
70 '3: 256x192 gfx, 	4: 64x48 gfx
80 SCREEN 4, 0
85 '
90 '0: transparent	 8: red
100 '1: black		 9: light red
110 '2: green		10: dark yellow
120 '3: light green	11: light yellow
130 '4: dark blue	12: dark green
140 '5: light blue	13: magenta
150 '6: dark red	14: grey
160 '7: cyan		15: white
170 Fg=3: Bg=5: Border=7
180 COLOR Fg, Bg, Border
185 '
190 X=50: Y=50: R=25: C=4
200 CMD CIRCLE (X, Y), R, C 
205 '
210 X=100:Y=100: R=25: C1=2:C2=4
220 CMD PAINT (X, Y), C1, C2
225 '
230 C = STATUS POINT (50, 25)
240 OPEN "LCD:" FOR OUTPUT AS #1
242 PRINT #1, "Color at 50, 25 is";C
243 CLOSE #1
245 '
250 X1=10: Y1=10: X2=20: Y2=20
260 ' B=BOX,  BF=BOX FILL
270 LINE (10, 10) - (20, 20), B
275 '
280 X=255: Y=191: C=15
290 PSET (X, Y), C
295 '
300 X=50: Y=25
310 'PRESET defaults to bg color
320 PRESET (X, Y)
330 '
500 OPEN "LCD:" FOR OUTPUT AS #1
510 PRINT #1, "Hit Enter to return LCD";
520 CLOSE #1
530 INPUT A$
540 SCREEN 0
