# Array Subsets

Prerequisite for this is [string subsets](https://github.com/Nitin-Poojary/dsa-with-dart/blob/master/docs/recursion/subsets%20and%20subsequence/string_subsets.md).

## Approach

Approach for this will be same as we did in string subsets in [prerequisite](https://github.com/Nitin-Poojary/dsa-with-dart/blob/master/docs/recursion/subsets%20and%20subsequence/arrays_subsets.md#array-subsets). But there's a slight change that we we will do, here we will take first element of the array find all subsets only using this element that is if array which we have to find subset of is `[1, 2, 3]` the after all the subsets of its first element will be `[[], [1]]` then we move on to second element and find all the subsets for it in this case so the subsets will become `[[], [1], [2], [1, 2]]` so, as we can see here we what exactly I did is I made copy of previous answer that is `[[], [1]]` and added `2` to it. Now, we will repeat same process with `3` i.e. third element in the array, so let's make copy of current one so the array becomes `[[], [1], [2], [1, 2], [], [1], [2], [1, 2]]` now add `3` to it `[[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]` so the subsets of the array `[1, 2, 3]` will be `[[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]`.

## Code
```dart
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

void main() {
  List<int> sampleArray = [1, 2, 3];
  subsetsOfArray(sampleArray, 0, [[]]);
}
```

## Output
```dart
[[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]
```

Slight variation of this code for when we have to return the ans list instead of printing will be

## Code
```dart
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

```

## Output
```dart
[[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]
```

As you might have guessed the approach we are using doesn't required recursion we can do same with via iterative approach.

## Code 
```dart
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
```

## Output
```dart
[[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]
```

## Handling Duplicates

## Appproach

Similar approach will be used except instead of adding elements from start of array we will first check if the previous element is same as current if so add current element to array created at previous step. So, to do this we will keep two variables `start` and `end` and maintain them in every iteration, if current element is same as previous element start adding element from `start` index.

## Code
```dart 
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
```

## Output 
```dart
[[], [1], [2], [1, 2], [2, 2], [1, 2, 2]]
```