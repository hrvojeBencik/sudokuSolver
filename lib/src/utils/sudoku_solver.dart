class SudokuSolver {
  // This is the number of rows and columns
  static const _n = 9;

  // This function receives two dimensional array filled with puzzle values, if there is no value in some positions it should be 0
  // When first calling this function row and col should be set as 0, but they are needed if we want to use recursion
  static bool solve(List<List<int>> grid, int row, int col) {
    // If the end of matrix is reached
    if (row == _n - 1 && col == _n) return true;

    // Move to next row when we reache 9th column
    if (col == _n) {
      row++;
      col = 0;
    }

    // Check if current tile is already filled
    if (grid[row][col] != 0) {
      return solve(grid, row, col + 1);
    }

    // Check if it is safe to put value in the current position and move to the next column
    for (int i = 1; i < 10; i++) {
      if (_isTileSafe(grid, row, col, i)) {
        grid[row][col] = i;

        if (solve(grid, row, col + 1)) {
          return true;
        }
      }
      // Is assumption is wrong we reset the value back to 0
      grid[row][col] = 0;
    }
    return false;
  }

  // Checks if it is legal to put num to the row/col position in grid
  static bool _isTileSafe(List<List<int>> grid, int row, int col, int num) {
    for (int i = 0; i <= 8; i++) {
      if (grid[row][i] == num) return false;
    }

    for (int i = 0; i <= 8; i++) {
      if (grid[i][col] == num) return false;
    }

    int startRow = row - row % 3;
    int startCol = col - col % 3;

    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (grid[i + startRow][j + startCol] == num) return false;
      }
    }

    return true;
  }
}
