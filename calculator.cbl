      IDENTIFICATION DIVISION.
      PROGRAM-ID.                  CALC.

      *> ---------------------------------------------------------------
      *>    CALCULATOR OVERLAY
      *> ---------------------------------------------------------------
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER.             RMC-UNIX.
       OBJECT-COMPUTER.             RMC-UNIX.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  COMMON-DATA.
           02 OPERATOR-NUMBER           PIC 9(06) VALUE 1.
           02 DISP-AMT              PIC Z(8).99-.
           02 NEW-VALUE             PIC S9(8)V99.
           02 ACCUMULATOR           PIC S9(8)V99.
           02 KEYPRESS              PIC X.
              88 CLEAR-ACCUMULATOR VALUE IS "C".
              88 ENDING VALUE IS "Q".
              88 VALID-KEY VALUES ARE "+", "*", "/", "-".
       01  LIN                      PIC 99 COMP.

       PROCEDURE DIVISION.
       BEGIN.
           DISPLAY "*** SYSTEM CALCULATOR ***" LINE 1 POSITION 25
           DISPLAY "Uses + - / *   C=Clear  Q=Quit" LINE 2 POSITION 25.
           MOVE 4 TO LIN.
           MOVE 0 TO ACCUMULATOR.
      DISP-ACCUM.
           DISPLAY "Result: " LINE LIN POSITION 27.
           DISPLAY "   Function +-/*C" LINE LIN POSITION 29.
           ACCEPT KEYPRESS LINE LIN POSITION 27.
           DISPLAY " " LINE LIN POSITION 29 ERASE EOL.
           IF CLEAR-ACCUMULATOR GO TO BEGIN.
           IF ENDING GO TO END-CALC.
           IF NOT VALID-KEY GO TO DISP-ACCUM.
           DISPLAY "Enter new value: " LINE LIN POSITION 30.
           ACCEPT NEW-VALUE LINE LIN POSITION 30 SIZE 10.
           MOVE NEW-VALUE TO DISP-AMT.
           DISPLAY DISP-AMT LINE LIN POSITION 30.
           IF KEYPRESS = "+" ADD NEW-VALUE TO ACCUMULATOR.

           IF KEYPRESS = "-" SUBTRACT NEW-VALUE FROM ACCUMULATOR.
           IF KEYPRESS = "*" MULTIPLY NEW-VALUE BY ACCUMULATOR ROUNDED.
           IF KEYPRESS = "/" DIVIDE NEW-VALUE INTO ACCUMULATOR ROUNDED.
           ADD 1 TO LIN.
           IF LIN = 22 MOVE 4 TO LIN
                       DISPLAY " " LINE 1 POSITION 1 ERASE EOS.
           GO TO DISP-ACCUM.
       END-CALC.
           DISPLAY " " LINE LIN POSITION 27 ERASE EOL.
       EXIT-POINT.
           EXIT PROGRAM.
       FALLTHROUGH.
           STOP RUN.
