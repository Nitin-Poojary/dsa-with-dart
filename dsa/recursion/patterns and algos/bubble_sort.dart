void bubbleSortRecursion(List<int> a, int i, int j) {
  if (i == 0) {
    return;
  }

  if (j < i) {
    if (a[j + 1] < a[j]) {
      swap(a, j + 1, j);
    }
    bubbleSortRecursion(a, i, j + 1);
  } else {
    bubbleSortRecursion(a, i - 1, 0);
  }
}

void swap(List<int> arr, int a, int b) {
  int temp = arr[a];
  arr[a] = arr[b];
  arr[b] = temp;
}

void main() {
  List<int> a = [5, 4, 3, 2, 1];
  print('Before: $a');
  bubbleSortRecursion(a, a.length - 1, 0);
  print('After: $a');
}
