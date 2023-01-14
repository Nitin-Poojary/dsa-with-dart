void mergeSort(List<int> ar, int s, int e) {
  if (s == e) {
    return;
  }

  int m = (s + e) ~/ 2;

  mergeSort(ar, s, m);
  mergeSort(ar, m + 1, e);

  merge(ar, s, m, e);
}

void merge(List<int> ar, int s, int m, int e) {
  List<int> merged = [];
  int i = s, j = m + 1;

  while (i <= m && j <= e) {
    if (ar[i] < ar[j]) {
      merged.add(ar[i++]);
    } else {
      merged.add(ar[j++]);
    }
  }

  while (i <= m) {
    merged.add(ar[i++]);
  }
  while (j <= e) {
    merged.add(ar[j++]);
  }

  for (int k = 0; k < merged.length; k++) {
    ar[s + k] = merged[k];
  }
}

void main() {
  List<int> a = [5, 4, 21, 7, 13, 2, 8, 1, 3, 9, 17];
  print('Before: $a');
  mergeSort(a, 0, a.length - 1);
  print('After: $a');
}
