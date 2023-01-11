void selectionSort(List<int> ar, int i, int j, int max) {
  if (i == 0) {
    return;
  }

  if (j <= i) {
    if (ar[max] < ar[j]) {
      max = j;
    }
    selectionSort(ar, i, j + 1, max);
  } else {
    int temp = ar[i];
    ar[i] = ar[max];
    ar[max] = temp;
    selectionSort(ar, i - 1, 0, 0);
  }
}

void main() {
  List<int> a = [5, 4, 7, 2, 1, 3, 8];
  print('Before: $a');
  selectionSort(a, a.length - 1, 0, 0);
  print('After: $a');
}
