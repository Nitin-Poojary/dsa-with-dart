import 'dart:math';

void nqueensPrint(List<List<bool>> board, int n, int r) {
  if (r == n) {
    printBoard(board);
    return;
  }

  for (int c = 0; c < board.length; c++) {
    if (!areQueensConflicting(board, n, r, c)) {
      board[r][c] = true;
      nqueensPrint(board, n, r + 1);
      board[r][c] = false;
    }
  }
}

bool areQueensConflicting(List<List<bool>> board, int n, int r, int c) {
  for (int i = 0; i < r; i++) {
    if (board[i][c]) {
      return true;
    }
  }

  int maxLeft = min(r, c);
  int maxRigth = min(r, n - 1 - c);

  for (int i = 0; i <= maxLeft; i++) {
    if (board[r - i][c - i]) {
      return true;
    }
  }

  for (int i = 0; i <= maxRigth; i++) {
    if (board[r - i][c + i]) {
      return true;
    }
  }
  return false;
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
