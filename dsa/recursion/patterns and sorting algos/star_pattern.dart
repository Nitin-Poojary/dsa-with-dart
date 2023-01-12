import 'dart:io';

void printTriangle(int row, int col) {
  if (row == 0) {
    return;
  }

  if (col < row) {
    printTriangle(row, col + 1);
    stdout.write('* ');
  } else {
    printTriangle(row - 1, 0);
    print('');
  }
}

void main() {
  int n = 5;
  printTriangle(n, 0);
}

void printTrianglei(int n) {
  for (int row = 0; row < n; row++) {
    for (int col = 0; col < n - row; col++) {
      stdout.write('* ');
    }
    print('');
  }
}
