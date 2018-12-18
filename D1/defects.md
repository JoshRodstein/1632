
<br><br>

 SUMMARY: Rotating the board doesn't drop all of the pieces down when pieces are supposed to hit other pieces. <br>
 DESCRIPTION:  FOUND FROM "TEST-FLIP-COMMAND-WINS-GAME": When rotating, and pieces are in the same column, but have a gap between them, the piece on the left will hover above the same amount of spaces as the gap was before. <br>
 REPRODUCTION STEPS: 1) Place a checker in a column not equal to one of the first two. <br>
-----                     2) Place a checker to the left of the original checker, ensuring a gap between the two. <br>
-----                     3) Rotate the board by typing in rot. <br>
 EXPECTED BEHAVIOR:  The piece on the right should fall to the new floor, and the piece on the left should fall, stopping at the first piece. <br>
 OBSERVED BEHAVIOR: The piece on the right falls to the floor, and the piece on the left maintains the gap between the two, not falling all the way to the piece <br><br>




<br><br><br>

  SUMMARY: Entering any capital letters in rot doesn't work. <br>
  DESCRIPTION: FOUND FROM "TEST-ROT-COMMAND-ROTES-BOARD": Entering a capital letter as a character in rot causes the board to not rotate, and place a checker in the first column.<br>
  REPRODUCTION STEPS: 1) Start a game. <br>
  ----- 2) Enter rot with a capital letter as one of the characters. <br>
  EXPECTED BEHAVIOR: The board should rotate, and drop pieces down, while adding no new pieces. <br>
  OBSERVED BEHAVIOR: A piece is dropped into the 0th column, and the board doesn't rotate. <br>
  
  
  
 <br><br><br>
 
 SUMMARY: Creating a board with greater than 9 columns. <br>
  DESCRIPTION: FOUND FROM "TEST-BOARD-BIGGER-THAN-9": Creating a board with more than 9 columns lists columns after 9 as not one digit numbers. <br>
  REPRODUCTION STEPS: 1) Start a game with any number over 9 for board size. <br>
  EXPECTED BEHAVIOR: The board should rotate, and drop pieces down, while adding no new pieces. <br>
  OBSERVED BEHAVIOR: A piece is dropped into the 0th column, and the board doesn't rotate. <br>

<br><br><br>

  SUMMARY: Creating four in a row, rising to the right <br>
  DESCRIPTION: FOUND "FROM TEST-DIAGONAL-RIGHT-CONNECT-FOUR": Creating a connect four , rising to the right DOES NOT win the game.<br>
  REPRODUCTION STEPS: place pieces like so... <br>
       ..... <br>
       ...XO <br>
       ..XOX <br>
       .XOOO <br>
       XOOXX <br>
  EXPECTED BEHAVIOR: Message printed to console: "Player x Won!" <br>
  OBSERVED BEHAVIOR: Game continues until connect four created horizxontal, vertical or falling left diagonal.<br>
