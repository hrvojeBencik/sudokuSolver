import 'package:flutter/cupertino.dart';
import 'package:sudoku_solver/src/utils/sudoku_solver.dart';

class SolverProvider with ChangeNotifier {
  SelectedGridPosition? _selectedGridPosition;

  set selectPosition(SelectedGridPosition? position) {
    _selectedGridPosition = position;
    notifyListeners();
  }

  SelectedGridPosition? getSelectedPosition() {
    return _selectedGridPosition;
  }

  bool solvePuzzle(List<List<int>> _grid) {
    final bool isSolved = SudokuSolver.solve(_grid, 0, 0);
    notifyListeners();

    return isSolved;
  }

  void autofillGrid(List<List<int>> grid) {
    final List<List<int>> _grid = [
      [4, 0, 0, 0, 0, 0, 9, 0, 0],
      [0, 0, 0, 0, 3, 0, 0, 0, 0],
      [0, 1, 0, 0, 6, 5, 0, 4, 0],
      [0, 0, 0, 3, 0, 0, 0, 5, 0],
      [0, 0, 6, 0, 5, 2, 7, 0, 0],
      [0, 2, 0, 9, 0, 0, 0, 0, 0],
      [0, 0, 0, 2, 0, 0, 0, 0, 0],
      [0, 6, 0, 0, 4, 1, 0, 9, 0],
      [0, 0, 7, 0, 0, 0, 0, 0, 8],
    ];

    for (int i = 0; i < _grid.length; i++) {
      for (int j = 0; j < _grid.length; j++) {
        grid[i][j] = _grid[i][j];
      }
    }
    notifyListeners();
  }
}

class SelectedGridPosition {
  final int row;
  final int col;

  SelectedGridPosition(this.row, this.col);
}
