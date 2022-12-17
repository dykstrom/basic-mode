' This file will load in basic-generic-mode

' Calculate the square root of a number N using Newton's method
LET N = 2.0

' Initialize
LET guess = N
LET result = N / 2.0

' Repeat while the result is not good enough
WHILE ABS(guess - result) > 0.001
    LET guess = result

    ' Calculate the next guess in the series
    LET divisor = guess * guess - N
    LET dividend = 2.0 * guess
    LET result = guess - divisor / dividend

    PRINT "Guess="; guess; ", next guess="; result
WEND

PRINT
PRINT "The square root of "; N; " = "; result
PRINT "Calling sqr("; N; ") returns "; SQR(N)
