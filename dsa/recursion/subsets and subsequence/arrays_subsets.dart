void subsetsOfArray(List<int> a, int index, List<List<int>> ans) {
  if (index == a.length) {
    print(ans);
    return;
  }

  List<List<int>> toAdd = [];

  for (int i = 0; i < ans.length; i++) {
    toAdd = [...toAdd, ans[i]];
  }
  for (int i = 0; i < toAdd.length; i++) {
    toAdd[i] = [...toAdd[i], a[index]];
  }

  subsetsOfArray(a, index + 1, [...ans, ...toAdd]);
}

List<List<int>> subsetsOfArray2(List<int> a, int index, List<List<int>> ans) {
  if (index == a.length) {
    return ans;
  }

  List<List<int>> toAdd = [];

  for (int i = 0; i < ans.length; i++) {
    toAdd = [...toAdd, ans[i]];
  }
  for (int i = 0; i < toAdd.length; i++) {
    toAdd[i] = [...toAdd[i], a[index]];
  }

  return subsetsOfArray2(a, index + 1, [...ans, ...toAdd]);
}

void subsetsWithoutRecursion(List<int> a) {
  List<List<int>> ans = [[]];

  for (int num in a) {
    int n = ans.length;
    for (int i = 0; i < n; i++) {
      List<int> toAdd = [...ans[i]];
      toAdd.add(num);
      ans.add(toAdd);
    }
  }
  print(ans);
}

void subsetsDuplicates(List<int> a) {
  List<List<int>> ans = [[]];
  int start = 0, end = 0;

  for (int i = 0; i < a.length; i++) {
    int n = ans.length;
    if (i > 0 && a[i] == a[i - 1]) {
      start = end + 1;
    }
    end = n - 1;

    for (int j = start; j < n; j++) {
      List<int> toAdd = [...ans[j]];
      toAdd.add(a[i]);
      ans.add(toAdd);
    }
  }

  print(ans);
}

void main() {
  List<int> sampleArray = [1, 2, 2];
  subsetsDuplicates(sampleArray);
}
