List<String> mazeBacktracking(
  List<String> paths,
  String path,
  int r,
  int c,
  List<List<bool>> mazeBoard,
) {
  if (r == 2 && c == 2) {
    return [...paths, path];
  }

  if (mazeBoard[r][c]) {
    mazeBoard[r][c] = false;

    if (r < 2) {
      paths = mazeBacktracking(paths, path + 'R', r + 1, c, mazeBoard);
    }

    if (c < 2) {
      paths = mazeBacktracking(paths, path + 'D', r, c + 1, mazeBoard);
    }

    if (r > 0) {
      paths = mazeBacktracking(paths, path + 'L', r - 1, c, mazeBoard);
    }

    if (c > 0) {
      paths = mazeBacktracking(paths, path + 'U', r, c - 1, mazeBoard);
    }

    mazeBoard[r][c] = true;
  }

  return paths;
}

void mazeBacktrackingPrint(
  String path,
  int r,
  int c,
  List<List<int>> mazeBoard,
  int steps,
) {
  if (r == 2 && c == 2) {
    mazeBoard[r][c] = steps;
    print(mazeBoard);
    print(path);
    return;
  }

  if (mazeBoard[r][c] == 0) {
    mazeBoard[r][c] = steps;

    if (c < 2) {
      mazeBacktrackingPrint(path + 'R', r, c + 1, mazeBoard, steps + 1);
    }

    if (r < 2) {
      mazeBacktrackingPrint(path + 'D', r + 1, c, mazeBoard, steps + 1);
    }

    if (c > 0) {
      mazeBacktrackingPrint(path + 'L', r, c - 1, mazeBoard, steps + 1);
    }

    if (r > 0) {
      mazeBacktrackingPrint(path + 'U', r - 1, c, mazeBoard, steps + 1);
    }
    mazeBoard[r][c] = 0;
  }
}

void main() {
  List<List<bool>> mazeBoard = [
    [true, true, true],
    [true, true, true],
    [true, true, true],
  ];

  print(
    mazeBacktracking(
      [],
      '',
      0,
      0,
      mazeBoard,
    ),
  );

  // List<List<int>> mazeBoard = [
  //   [0, 0, 0],
  //   [0, 0, 0],
  //   [0, 0, 0],
  // ];

  // mazeBacktrackingPrint('', 0, 0, mazeBoard, 1);
}
