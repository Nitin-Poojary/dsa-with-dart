# N Queens Problem

## Prerequisite

Prerequisite for this is [here](https://github.com/Nitin-Poojary/dsa-with-dart/blob/master/docs/recursion/backtracking/maze_backtracking.md)

## Problem

Place `n` queens in an nxn board such that no two queens are cancelling each other.

## Approach

Place first queen in first row. Then place second queen in second row such that it should not be able to cancel first queen and vice versa. Then repeat the step for 3rd and 4th queen. If a queen can not be placed in a particular row backtrack and rearrange previous queen. Repeat the steps until all queens are placed.

## Code

```dart
import 'dart:math';

void nqueensPrint(List<List<bool>> board, int n, int r) {
  if (r == n) {
    printBoard(board);
    return;
  }

  for (int c = 0; c < board.length; c++) {
    if (isQueenSafe(board, n, r, c)) {
      board[r][c] = true;
      nqueensPrint(board, n, r + 1);
      board[r][c] = false;
    }
  }
}

bool isQueenSafe(List<List<bool>> board, int n, int r, int c) {
  for (int i = 0; i < r; i++) {
    if (board[i][c]) {
      return false;
    }
  }

  int maxLeft = min(r, c);
  int maxRigth = min(r, n - 1 - c);

  for (int i = 0; i <= maxLeft; i++) {
    if (board[r - i][c - i]) {
      return false;
    }
  }

  for (int i = 0; i <= maxRigth; i++) {
    if (board[r - i][c + i]) {
      return false;
    }
  }
  return true;
}

void printBoard(List<List<bool>> board) {
  for (int i = 0; i < board.length; i++) {
    String toPrint = '';
    for (int j = 0; j < board[i].length; j++) {
      if (board[i][j]) {
        toPrint += 'Q ';
      } else {
        toPrint += 'x ';
      }
    }
    print(toPrint);
  }
  print('');
}

void main() {
  List<List<bool>> board = [
    [false, false, false, false],
    [false, false, false, false],
    [false, false, false, false],
    [false, false, false, false],
  ];

  int n = 4;
  int r = 0;

  nqueensPrint(board, n, r);
}
```

## Output

```dart
x Q x x
x x x Q
Q x x x
x x Q x

x x Q x
Q x x x
x x x Q
x Q x x
```
