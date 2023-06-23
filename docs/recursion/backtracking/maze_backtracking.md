# Backtracking

## Prerequisite

Prerequite to this is [here](https://github.com/Nitin-Poojary/dsa-with-dart/blob/master/docs/recursion/backtracking/maze_path_counts.md)

## Problem and Approach

When we can move in all directions, including the direction from which we came, it can lead to infinite recursion. This creates a problem as we may end up in an endless loop. To address this, we need to maintain a record of the cells we have already visited. By using a visited array or set, we can mark the cells we have explored and avoid revisiting them. Before moving to a neighboring cell, we can check if it has already been visited. If so, we can skip it and continue exploring other directions. This approach ensures that we can explore all possible paths without getting trapped in an infinite loop. When we mark a cell as visited during a specific recursive call, it is crucial to mark it as unvisited after that call. This ensures that the next recursive call is not affected by the previous calls. By properly managing the visited status of cells, we can accurately explore all possible paths without interference or unintended effects from previous recursive iterations.

## Code 1

```dart
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
  List<List<int>> mazeBoard = [
    [0, 0, 0],
    [0, 0, 0],
    [0, 0, 0],
  ];

  mazeBacktrackingPrint('', 0, 0, mazeBoard, 1);
}
```

## Output

```dart
[[1, 2, 3], [0, 0, 4], [0, 0, 5]]
RRDD
[[1, 2, 3], [0, 5, 4], [0, 6, 7]]
RRDLDR
[[1, 2, 3], [6, 5, 4], [7, 8, 9]]
RRDLLDRR
[[1, 2, 0], [0, 3, 4], [0, 0, 5]]
RDRD
[[1, 2, 0], [0, 3, 0], [0, 4, 5]]
RDDR
[[1, 2, 0], [4, 3, 0], [5, 6, 7]]
RDLDRR
[[1, 0, 0], [2, 3, 4], [0, 0, 5]]
DRRD
[[1, 0, 0], [2, 3, 0], [0, 4, 5]]
DRDR
[[1, 4, 5], [2, 3, 6], [0, 0, 7]]
DRURDD
[[1, 0, 0], [2, 0, 0], [3, 4, 5]]
DDRR
[[1, 0, 0], [2, 5, 6], [3, 4, 7]]
DDRURD
[[1, 6, 7], [2, 5, 8], [3, 4, 9]]
DDRUURDD
```

## Short Explanation

The purpose of the `step` variable is to keep track of the specific step or iteration at which a particular cell is being visited. This variable helps in maintaining the chronological order of cell visits, allowing us to accurately analyze and track the progress of the algorithm or process.

## Code 2

```dart
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
}
```

## Output

```dart
[RRDD, RRDLDR, RRDLLDRR, RDRD, RDDR, RDLDRR, DRRD, DRDR, DRURDD, DDRR, DDRURD, DDRUURDD]
```
