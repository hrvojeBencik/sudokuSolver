import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sudoku_solver/src/providers/solver_provider.dart';
import 'package:sudoku_solver/src/ui/widgets/grid_tile.dart';

class SolverScreen extends StatefulWidget {
  const SolverScreen({Key? key}) : super(key: key);

  @override
  State<SolverScreen> createState() => _SolverScreenState();
}

class _SolverScreenState extends State<SolverScreen> {
  late Size size;

  final List<List<int>> _grid = [
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    size = MediaQuery.of(context).size;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SolverProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Enter numbers manually'),
        ),
        body: Consumer<SolverProvider>(
          builder: (context, provider, child) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Column(
                    children: _grid.map(
                      (element) {
                        int colIndex = 0;
                        return Row(
                          children: element.map((e) {
                            int row = _grid.indexOf(element);
                            int col = element.indexOf(e, colIndex++);
                            return CustomGridTile(
                                grid: _grid, row: row, col: col);
                          }).toList(),
                        );
                      },
                    ).toList(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _numberButton(1, provider),
                        _numberButton(2, provider),
                        _numberButton(3, provider),
                        _numberButton(4, provider),
                        _numberButton(5, provider),
                        _numberButton(6, provider),
                        _numberButton(7, provider),
                        _numberButton(8, provider),
                        _numberButton(9, provider),
                        _numberButton(0, provider),
                      ],
                    ),
                  ),
                  _solveButton(provider),
                  ElevatedButton(
                    onPressed: () {
                      provider.autofillGrid(_grid);
                    },
                    child: const Text('Autofill'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _numberButton(int num, SolverProvider provider) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: Colors.lightBlue.shade100,
        borderRadius: BorderRadius.circular(50),
      ),
      child: RawMaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        onPressed: () {
          if (provider.getSelectedPosition() != null) {
            _grid[provider.getSelectedPosition()!.row]
                [provider.getSelectedPosition()!.col] = num;
            provider.selectPosition = null;
          }
        },
        child: num != 0 ? Text(num.toString()) : const Icon(Icons.close),
      ),
    );
  }

  Widget _solveButton(SolverProvider provider) {
    return ElevatedButton(
        onPressed: () {
          if (!provider.solvePuzzle(_grid)) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Puzzle is not solvable!'),
                duration: Duration(seconds: 2),
              ),
            );
          }
        },
        child: const Text('Solve'));
  }
}
