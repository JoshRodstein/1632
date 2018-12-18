# D1 Test Plan

**By: Will Taylor & Josh Rodstein**


## Requirement 1: Test Cases</br>
</br>

  **IDENTIFIER:**  TEST-INVALID-INPUT-ARG-TYPE</br>
  **DESCRIPTION:** Ensure that program does not accept anything other than non-negative
  integers as input args, and displays proper message when invalid input is entered.</br>
  **PRECONDITIONS:** User has necessary files to run program from CLI w/ arg and ruby > 2.5 </br>
  **EXECUTION STEPS:** Enter a negative integer < 0 (i.e -1..... etc) or ASCII Character and press enter</br>
  **POSTCONDITIONS:** Program informs user of proper usage and exits</br>


  **IDENTIFIER:** TEST-INVALID-NUM-OF-ARGS</br>
  **DESCRIPTION:** Ensure that program only accepts a single valid argument</br>
  **PRECONDITIONS:** User has necessary files to run program from CLI w/ arg and ruby > 2.5</br>
  **EXECUTION STEPS:** Enter > 1 non-negative integers as input args and prss enter </br>
  **POSTCONDITIONS:** Program informs user of proper usage and exits </br>


  **IDENTIFIER:** TEST-INVALID-BLANK-SPACE-INPUT-ARG </br>
  **DESCRIPTION:** Ensure program does not accept null/blank space as input </br>
  **PRECONDITIONS:** User has necessary files to run program from CLI w/ argand ruby > 2.5 </br>
  **EXECUTION STEPS:** Enter " " as input arg and press enter </br>
  **POSTCONDITIONS:** Program informs user of proper usage and exits </br>

d
**IDENTIFIER:** TEST-INVALID-0-INPUT-ARG </br>
**DESCRIPTION:** Ensure program does not accept null/blank space as input </br>
**PRECONDITIONS:** User has necessary files to run program from CLI w/ arg and ruby > 2.5 </br>
**EXECUTION STEPS:** Enter "0" as input arg and press enter </br>
**POSTCONDITIONS:** Program informs user of proper usage and exits </br>


-------------------------------------------------------------------------------

## Requirement 2

**IDENTIFIER:** TEST-INT-VALID-INPUT-ARG </br>
**DESCRIPTION:** Ensure the program accepts a single, < 100 non negative integer</br>
**PRECONDITIONS:** User has necessary files to run program from CLI w/ arg and ruby > 2.5</br>
**EXECUTION STEPS:** type `ruby connect_four.rb <int n < 99>` on cmd line and press enter </br>
**POSTCONDITIONS:** Board displayed with # of columns entered as arg. All spots
on the board are blank, denoted by '.' </br>


**IDENTIFIER:** TEST-LARGE-INT-VALID-INPUT-ARG </br>
**DESCRIPTION:** EDGE CASE: Ensure the program accepts a single, Large > 99, non negative integer </br>
**PRECONDITIONS:** User has necessary files to run program from CLI w/ argand ruby > 2.5  </br>
**EXECUTION STEPS:** type `ruby connect_four.rb <int n > 99>` on cmd line and press enter </br>
**POSTCONDITIONS:** Board displayed with # of columns entered as arg. All spots
on the board are blank, denoted by '.' </br>


**IDENTIFIER:** TEST-VERY-LARGE-INT-VALID-INPUT-ARG </br>
**DESCRIPTION:** Ensure the program accepts a single, Very Large > 999, non negative integer </br>
**PRECONDITIONS:** User has necessary files to run program from CLI w/ argand ruby > 2.5  </br>
**EXECUTION STEPS:** type `ruby connect_four.rb <int n > 999>` on cmd line and press enter </br>
**POSTCONDITIONS:** Board displayed with # of columns entered as arg. All spots
on the board are blank, denoted by '.' </br>




-------------------------------------------------------------------------------

## Requirement 3

**IDENTIFIER:** TEST-VALID-START </br>
**DESCRIPTION:** Ensure the program starts properly on X's turn.</br>
**PRECONDITIONS:** User has entered a valid input to pass through requirement 2.</br>
**EXECUTION STEPS:** type `ruby connect_four.rb <int n < 99>` on cmd line and press enter </br>
**POSTCONDITIONS:** Board displayed with # of columns entered as arg. The user who's turn is first is X.</br>


**IDENTIFIER:** TEST-TURN-SWAP </br>
**DESCRIPTION:** Ensure the program swaps correctly to O's turn after X's turn. </br>
**PRECONDITIONS:** User has started the program correctly and gotten to X's turn.  </br>
**EXECUTION STEPS:** Enter any move for X's turn to advance to O's turn. </br>
**POSTCONDITIONS:** Board displayed with whatever X had done, and the board says it is O's turn. </br>


**IDENTIFIER:** TEST-TURN-MULTI-SWAP </br>
**DESCRIPTION:** EDGE CASE: Ensure the program continues to swap turns properly indefinitely. </br>
**PRECONDITIONS:** User has started the program correctly and gone through both user's first turns. </br>
**EXECUTION STEPS:** Enter any move for the current turn to advance to the other players turn. </br>
**POSTCONDITIONS:** When you were on X's turn, the next move is O's, and vice versa. </br>



-------------------------------------------------------------------------------

## Requirement 4

**IDENTIFIER:** TEST-NEG-INT-INPUT </br>
**DESCRIPTION:** CORNER CASE: Ensure the program doesn't accept a negative int to drop the piece.</br>
**PRECONDITIONS:** User has started the program properly.</br>
**EXECUTION STEPS:** Enter any negative int in the field when asked which column to drop the checker in. </br>
**POSTCONDITIONS:** Game states that the number is an invalid move, and repeats the turn.</br>


**IDENTIFIER:** TEST-CHAR-INPUT</br>
**DESCRIPTION:** Ensure the program doesn't accept a character as a turn input. </br>
**PRECONDITIONS:** User has started the program correctly and gotten to X's turn.  </br>
**EXECUTION STEPS:** Enter any character as your choice for the move. </br>
**POSTCONDITIONS:** Game states that the character is an invalid move, and repeats the turn. </br>


**IDENTIFIER:** TEST-WRONG-STRING-INPUT </br>
**DESCRIPTION:** Ensure the program doesn't accept a string that isn't flip, or rot, ignoring case. </br>
**PRECONDITIONS:** User has started the program correctly and gotten to X's turn. </br>
**EXECUTION STEPS:** Enter a string that isn't flip or rot to see the response. </br>
**POSTCONDITIONS:** Game states the string is an invalid move, and repeats the turn. </br>




-------------------------------------------------------------------------------


## Requirement 5

**IDENTIFIER:** TEST-NORMAL-DROP </br>
**DESCRIPTION:** Ensure that when you drop a checker in a column, it falls to the lowest available space. </br>
**PRECONDITIONS:** User has started the program properly. </br>
**EXECUTION STEPS:** Enter a number for a non-full column. </br>
**POSTCONDITIONS:** Checker drops to the lowest available space and moves to the next player's turn.</br>


**IDENTIFIER:** TEST-FULL-DROP </br>
**DESCRIPTION:** Ensure that when attempting to drop into a full column, the turn repeats. </br>
**PRECONDITIONS:** User has gotten through enough turns to fill a column. </br>
**EXECUTION STEPS:** Enter the number for a full column during a turn. </br>
**POSTCONDITIONS:** Game states that the number is an invalid move, and repeats the turn. </br>


-------------------------------------------------------------------------------

### Requirement 6

**IDENTIFIER:** TEST-ROT-COMMAND-FLIPS-BOARD </br>
**DESCRIPTION:** Enter Flip in lowercase & Uppercase and combo l/u </br>
**PRECONDITIONS:** Board has been initialized and tokens have been placed in any position on the board in a non full column </br>
**EXECUTION STEPS:** type `flip`, `FLIP`, and `FlIp` at command prompt and press enter </br>
**POSTCONDITIONS:**  command shall cause the board to be flipped "upside down" and all pieces falling to the "floor" of the game board, game is NOT won, turn is alternated


**IDENTIFIER:** TEST-FLIP-COMMAND-TOKEN-GRAVITY </br>
**DESCRIPTION:** test that all pieces not in new floor after flip,
fall to new floor </br>
**PRECONDITIONS:** Board has been initialized and tokens have been placed in any position in non full column </br>
**EXECUTION STEPS:** type `flip` at command prompt and press enter </br>
**POSTCONDITIONS:** all pieces not in full column fall to new floor.  </br>


**IDENTIFIER:** TEST-FLIP-COMMAND-WINS-GAME </br>
**DESCRIPTION:** test that all pieces not in new floor after rotation,
fall to new floor </br>
**PRECONDITIONS:** Board has been initialized and tokens have been placed in
any position not in final column </br>
**EXECUTION STEPS:** type `rot` at command prompt and press enter </br>
**POSTCONDITIONS:** all pieces not in previous last column fall to new floor or fall to next token in row </br>


-------------------------------------------------------------------------------


### Requirement 7

**IDENTIFIER:** TEST-ROT-COMMAND-ROTES-BOARD </br>
**DESCRIPTION:** Enter Rotate in lowercase & Uppercase and combo l/u </br>
**PRECONDITIONS:** Board has been initialized and tokens have been placed in any position not in final column </br>
**EXECUTION STEPS:** type `rot`, `ROT`, and `RoT` at command prompt and press enter </br>
**POSTCONDITIONS:** command shall cause the board to be rotated 90 degrees to the right (i.e. clockwise) and all pieces falling to the new "floor" of the game board </br>


**IDENTIFIER:** TEST-ROT-COMMAND-TOKEN-GRAVITY </br>
**DESCRIPTION:** test that all pieces not in new floor after rotation,
fall to new floor </br>
**PRECONDITIONS:** Board has been initialized and tokens have been placed in
any position not in final column </br>
**EXECUTION STEPS:** type `rot` at command prompt and press enter </br>
**POSTCONDITIONS:** all pieces not in previous last column fall to new floor or fall to next token in row </br>


**IDENTIFIER:** TEST-ROT-COMMAND-WINS-GAME </br>
**DESCRIPTION:** Flip of board causes four pieces to align </br>
**PRECONDITIONS:** Board has been initialized and players tokens have been placed like so

     0123456789
     ..........
     ..........
     ..........
     ..........
     ..........
     ..........
     .........o
     xxx......o
     xoxx....oo

**EXECUTION STEPS:** Enter `flip` at command prompt and press enter </br>
**POSTCONDITIONS:** Player initiating flip wins game after player x aligns four tokens in bottom row </br>



-------------------------------------------------------------------------------



### Requirement 8

  **IDENTIFIER:** TEST-VERTICAL-CONNECT-FOUR</br>
  **DESCRIPTION:** Test that aligning four of the same token vertically wins that game for that player</br>
  **PRECONDITIONS:** Game board has been generated </br>
  **EXECUTION STEPS:** Place 4 x tokens in column 0 and 3 x tokens in column 1</br>
  **POSTCONDITIONS:** Correct player wins with message "Player # won!" printed to console</br>

  **IDENTIFIER:** TEST-HORIZONTAL-CONNECT-FOUR</br>
  **DESCRIPTION:** Test that aligning four of the same token horizontally wins that game for that player</br>
  **PRECONDITIONS:** Game board has been generated </br>
  **EXECUTION STEPS:** Place 4 x tokens in column 0,1,2,3 in the final row and 3 x tokens in column 0,1,2 in seocnd ot final row | repeat for rows 0 and 1</br>
  **POSTCONDITIONS:** Correct player wins with message "Player # won!" printed to console</br>


  **IDENTIFIER:** TEST-DIAGONAL-RIGHT-CONNECT-FOUR</br>
  **DESCRIPTION:** Test that aligning four of the same token Rising diagonal to the right wins that game for that player</br>
  **PRECONDITIONS:** Game board has been generated </br>
  **EXECUTION STEPS:**  place tokens like so:

      .....
      ...XO
      ..XOX
      .XOOO
      XOOXX

  **POSTCONDITIONS:** Correct player wins with message "Player # won!" printed to console</br>

  **IDENTIFIER:** TEST-DIAGONAL-LEFT-CONNECT-FOUR </br>
  **DESCRIPTION:** Test that aligning four fo the same token falling diagonal to the left wins the game for that player </br>
  **PRECONDITIONS:** game board ahs been generated </br>
  **EXECUTION STEPS:** Place tokens like so </br>
  
      .....
      .X...
      .XX..
      .OXXO
      .OOOX
  **POSTCONDITIONS:** Correct Player wins with message "Player # won!" printed to console. </br>



-------------------------------------------------------------------------------


### Requirement 9

  **IDENTIFIER:** TEST-BOARD-BIGGER-THAN-9 </br>
  **DESCRIPTION:** Test that creating a board bigger than 9x9 prints properly. </br>
  **PRECONDITIONS:** Code is available and terminal is opened. </br>
  **EXECUTION STEPS:** 1) Run "ruby connect_four.rb xx" where xx is a number greater than 9.
  **POSTCONDITIONS:** Board prints out a grid the size that was chosen, with only the 1's place value representing columns >9. </br>


  **IDENTIFIER:** TEST-DROP-AFTER-9 </br>
  **DESCRIPTION:** Test that dropping a token into a column number over 9 works. </br>
  **PRECONDITIONS:** Board is created and is bigger than 9x9. </br>
  **EXECUTION STEPS:** 1) Pick a number greater than 9 to drop a token into.
  **POSTCONDITIONS:** The token drops into the correct column number chosen. </br>


  **IDENTIFIER:** TEST-DROP-BEFORE-9 </br>
  **DESCRIPTION:** Test that dropping a token into a column number under 9 works for a greater than 9x9 board. </br>
  **PRECONDITIONS:** Board is created and is bigger than 9x9. </br>
  **EXECUTION STEPS:** 1) Pick a number less than 9 to drop a token into.
  **POSTCONDITIONS:** The token drops into the correct column number chosen. </br>
