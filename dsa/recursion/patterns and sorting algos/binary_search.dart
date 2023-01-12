bool recursiveBinarySearch(List<int> a, int target) {
  return helperBinary(a, 0, a.length - 1, target);
}

bool helperBinary(List<int> a, int s, int e, int target) {
  if (s > e) {
    return false;
  }

  int m = (s + e) ~/ 2;

  if (a[m] == target) {
    return true;
  }
  if (a[m] > target) {
    return helperBinary(a, s, m - 1, target);
  } else {
    return helperBinary(a, m + 1, e, target);
  }
}

void main() {
  List<int> a = [1, 2, 3, 4, 5, 6, 8, 12];
  int target = 2;
  print(recursiveBinarySearch(a, target));
}
