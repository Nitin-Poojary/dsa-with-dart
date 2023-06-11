# Printing substrings of given string

## Approach

We will maintain two variables, processed (referred to as `p`) and unprocessed (referred to as `up`). The `up` variable stores the given string from which we need to find substrings. In `p`, we take the first element from `up` and generate all possible substrings by combining it with the existing string in `p`. We repeat this process for each element in `up` then print `p` because it contains one of the many substrings that can be formed from the given string.

## Code

```dart
void stringPermutations(String p, String up) {
  if (up.length == 0) {
    print(p);
    return;
  }

  for (int i = 0; i <= p.length; i++) {
    stringPermutations(
      p.substring(0, i) + up[0] + p.substring(i),
      up.substring(1),
    );
  }
}


void main() {
  String sampleString = 'abc';

  stringPermutations('', sampleString);
}
```

## Output

```dart
cba
bca
bac
cab
acb
abc
```

## Second Approach

Every thing will be same but instead of printing `p` as soon as it becomes final substring we will add it in a list and print that list at last.

## Code

```dart
List<String> stringPermutations2(String p, String up, List<String> plist) {
  if (up.length == 0) {
    return [p, ...plist];
  }

  for (int i = 0; i <= p.length; i++) {
    plist = [
      ...stringPermutations2(
        p.substring(0, i) + up[0] + p.substring(i),
        up.substring(1),
        plist,
      ),
    ];
  }

  return plist;
}

void main() {
  String sampleString = 'abc';

  print(stringPermutations2('', sampleString, []));
}
```

## Output

```dart
[abc, acb, cab, bac, bca, cba]
```
