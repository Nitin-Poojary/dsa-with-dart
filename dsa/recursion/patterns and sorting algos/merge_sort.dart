List<int> mergeSort(List<int> ar, int s, int e) {
  if (s == e) {
    return [ar[s]];
  }

  int m = (s + e) ~/ 2;

  List<int> left = mergeSort(ar, s, m);
  List<int> right = mergeSort(ar, m + 1, e);

  return merge(left, right);
}

List<int> merge(List<int> left, List<int> right) {
  List<int> merged = [];
  int i = 0, j = 0;

  while (i < left.length && j < right.length) {
    if (left[i] < right[j]) {
      merged.add(left[i++]);
    } else {
      merged.add(right[j++]);
    }
  }

  while (i < left.length) {
    merged.add(left[i++]);
  }
  while (j < right.length) {
    merged.add(right[j++]);
  }

  return merged;
}

void main() {
  List<int> a = [5, 4, 21, 7, 13, 2, 8, 1, 3, 9, 17];
  print('Before: $a');
  a = mergeSort(a, 0, a.length - 1);
  print('After: $a');
}
