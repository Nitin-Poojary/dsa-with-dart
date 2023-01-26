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

void main() {
  List<int> sampleArray = [1, 2, 3];
  print(subsetsOfArray2(sampleArray, 0, [[]]));
}
