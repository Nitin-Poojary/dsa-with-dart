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

void main() {
  List<int> sampleArray = [1, 2, 3];
  subsetsWithoutRecursion(sampleArray);
}
