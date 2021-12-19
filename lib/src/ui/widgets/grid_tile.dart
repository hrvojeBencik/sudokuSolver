import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sudoku_solver/src/providers/solver_provider.dart';

class CustomGridTile extends StatefulWidget {
  const CustomGridTile(
      {Key? key, required this.grid, required this.col, required this.row})
      : super(key: key);
  final List<List<int>> grid;
  final int col;
  final int row;

  @override
  _CustomGridTileState createState() => _CustomGridTileState();
}

class _CustomGridTileState extends State<CustomGridTile> {
  late Size size;
  late double _gridSide;
  late SolverProvider _currentPositionProvider;

  int _oldValue = 0;
  int _value = 0;

  bool _isSelected = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _currentPositionProvider = Provider.of<SolverProvider>(context);
    _oldValue = _value;
    _value = widget.grid[widget.row][widget.col];
    if (_checkIfValueHasChanged()) {
      _isSelected = false;
    }
    size = MediaQuery.of(context).size;
    _gridSide = (size.width - 20) / 9;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
          if (_isSelected) {
            _currentPositionProvider.selectPosition =
                SelectedGridPosition(widget.row, widget.col);
          } else {
            _currentPositionProvider.selectPosition = null;
          }
        });
      },
      child: Container(
        width: _gridSide,
        height: _gridSide,
        padding: EdgeInsets.only(
          top: 2,
          left: 2,
          right: widget.col == 2 || widget.col == 5 ? 4 : 2,
          bottom: widget.row == 2 || widget.row == 5 ? 4 : 2,
        ),
        color: Colors.black26,
        alignment: Alignment.center,
        child: AnimatedContainer(
          color: _isSelected ? Colors.lightBlue.shade100 : Colors.white,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 100),
          child: Text(
            _value == 0 ? '' : _value.toString(),
          ),
        ),
      ),
    );
  }

  bool _checkIfValueHasChanged() {
    return !(_oldValue == _value);
  }
}
