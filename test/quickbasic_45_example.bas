' -*- mode: basic-qb45 -*-
' Create a file named Price.Dat
' and open it to receive new data:

OPEN "Price.Dat" FOR OUTPUT AS #1

DO
    ' Continue putting new records in Price.Dat until the
    ' user presses ENTER without entering a company name:
    '
    INPUT "Company (press <<ENTER>> to quit): ", Company$

    IF Company$ <> "" THEN
        ' Enter the other fields of the record:
        INPUT "Style: ", Style$
        INPUT "Size: ", Size$
        INPUT "Color: ", Clr$
        INPUT "Quantity: ", Qty
        ' Put the new record in the file
        ' with the WRITE # statement:
        WRITE #1, Company$, Style$, Size$, Clr$, Qty
    END IF
LOOP UNTIL Company$ = ""
' Close Price.Dat (this ends output to the file):
CLOSE #1
END

' --------------

' Program demonstrates various forms of CASE items
INPUT "Enter acceptable level of risk (1-10): ", Total
SELECT CASE Total

CASE IS >= 10
    PRINT "Maximum risk and potential return"
    PRINT "Choose stock investment plan"

CASE  6 TO 9
    PRINT "High risk and potential return"
    PRINT "Choose corporate bonds"

CASE  2 TO 5
    PRINT "Moderate risk and return"
    PRINT "Choose mutual fund"

CASE 1
    PRINT "No risk, low return"
    PRINT "Choose IRA"

CASE ELSE
    PRINT "RESPONSE OUT OF RANGE"

END SELECT
