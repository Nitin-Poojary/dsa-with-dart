void quickSort(List<int> a, int low, int high) {
  if (low >= high) {
    return;
  }

  int s = low, e = high;
  int m = (s + e) ~/ 2;
  int pivot = a[m];

  while (s <= e) {
    while (a[s] < pivot) {
      s++;
    }
    while (a[e] > pivot) {
      e--;
    }

    if (s <= e) {
      int temp = a[s];
      a[s] = a[e];
      a[e] = temp;
      s++;
      e--;
    }
  }

  quickSort(a, low, e);
  quickSort(a, s, high);
}

void main() {
  List<int> a = [5, 4, 21, 7, 13, 2, 8, 1, 3, 9, 17];
  print('Before: $a');
  quickSort(a, 0, a.length - 1);
  print('After: $a');
}
