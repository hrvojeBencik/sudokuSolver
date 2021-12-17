import 'package:flutter_test/flutter_test.dart';
import 'package:sudoku_solver/src/utils/sudoku_solver.dart';

void main() {
  group('Testing 9x9 puzzles', () {
    test('Should find a solution - Easy mode', () {
      List<List<int>> _grid = [
        [3, 0, 6, 5, 0, 8, 4, 0, 0],
        [5, 2, 0, 0, 0, 0, 0, 0, 0],
        [0, 8, 7, 0, 0, 0, 0, 3, 1],
        [0, 0, 3, 0, 1, 0, 0, 8, 0],
        [9, 0, 0, 8, 6, 3, 0, 0, 5],
        [0, 5, 0, 0, 9, 0, 6, 0, 0],
        [1, 3, 0, 0, 0, 0, 2, 5, 0],
        [0, 0, 0, 0, 0, 0, 0, 7, 4],
        [0, 0, 5, 2, 0, 6, 3, 0, 0],
      ];

      expect(SudokuSolver.solve(_grid, 0, 0), true);
    });

    test('Should find a solution - Hard mode', () {
      List<List<int>> _grid = [
        [0, 4, 0, 8, 0, 0, 0, 0, 0],
        [0, 9, 0, 0, 0, 0, 0, 3, 0],
        [3, 0, 8, 0, 0, 7, 0, 0, 2],
        [0, 3, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 6, 0, 0, 0, 7],
        [1, 0, 5, 9, 0, 0, 0, 2, 0],
        [0, 0, 0, 0, 0, 9, 5, 0, 0],
        [0, 0, 4, 0, 0, 0, 0, 0, 0],
        [8, 0, 2, 5, 0, 0, 0, 1, 0],
      ];

      expect(SudokuSolver.solve(_grid, 0, 0), true);
    });

    test('Should fail to find a solution', () {
      List<List<int>> _grid = [
        [3, 0, 6, 5, 0, 8, 4, 0, 0],
        [5, 2, 0, 0, 0, 0, 0, 0, 0],
        [0, 8, 7, 0, 1, 0, 0, 3, 1],
        [0, 0, 3, 0, 1, 0, 0, 8, 0],
        [9, 0, 0, 8, 6, 3, 0, 0, 5],
        [0, 5, 0, 0, 9, 0, 6, 0, 0],
        [1, 3, 0, 0, 0, 0, 2, 5, 0],
        [0, 0, 0, 0, 0, 0, 0, 7, 4],
        [0, 0, 5, 2, 0, 6, 3, 0, 0],
      ];

      expect(SudokuSolver.solve(_grid, 0, 0), false);
    });
  });
}
