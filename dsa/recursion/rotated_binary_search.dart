bool rbs(List<int> a, int target) {
  return helper(a, 0, a.length - 1, target);
}

bool helper(List<int> a, int s, int e, int target) {
  if (s > e) {
    return false;
  }

  int m = (s + e) ~/ 2;

  if (a[m] == target) {
    return true;
  }

  if (a[s] <= a[m]) {
    if (target >= a[s] && target <= a[m]) {
      return helper(a, s, m - 1, target);
    } else {
      return helper(a, m + 1, e, target);
    }
  }

  if (target >= a[m] && target <= a[e]) {
    return helper(a, m + 1, e, target);
  }

  return helper(a, s, m - 1, target);
}

void main() {
  List<int> a = [15, 23, 26, 1, 2, 3, 4, 5, 6, 8, 12];
  int target = 8;
  print(rbs(a, target));
}
