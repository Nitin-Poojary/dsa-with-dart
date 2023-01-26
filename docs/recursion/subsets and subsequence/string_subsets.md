# String Subsets

## Approach

Let's take an example question, suppose `abc` is the string given which we have to find subsets for, so we can keep them as two parts where we either take a string character or not take it let's call them processed as `p` and unprocessed as `up`. So at first `up` will be `abc` and `p` will be and empty string, then we will take `a` from it so the `p` will be `a` and `up` will be `bc` now once we take it now we will ignore it so the `p` will be empty string again and `up` will be `bc`. We will continue this until `up` becomes empty and then print `p`.

## Code
```dart
void stringSubsets(String p, String up) {
  if (up == '') {
    print(p);
    return;
  }

  stringSubsets(p + up[0], up.substring(1));
  stringSubsets(p, up.substring(1));
}

void main() {
  String sampleString = 'abc';
  stringSubsets('', sampleString);
}
```

## Output
```dart
abc
ab
ac
a
bc
b
c
```

Now let's try to do the same but this time instead of printing we will return a list of `p` and then print it.

## Code 
```dart
List<String> stringSubsets2(String p, String up, List<String> plist) {
  if (up == '') {
    return [...plist, p];
  }

  return [
    ...stringSubsets2(p + up[0], up.substring(1), plist),
    ...stringSubsets2(p, up.substring(1), plist)
  ];
}

void main() {
  String sampleString = 'abc';
  print(stringSubsets2('', sampleString, []));
}
```

## Output
```dart
[abc, ab, ac, a, bc, b, c, ]
```

## Explanation

Here, after `up` becomes empty we are adding the `p` to the `plist` that is processed list that we are getting as an argument and returning it and then again adding those returned list together, that is call from when we take it and when we ignore it.

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