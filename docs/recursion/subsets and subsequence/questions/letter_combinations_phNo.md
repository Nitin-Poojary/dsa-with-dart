# Letter combinations of a phone number

[Problem link]('https://leetcode.com/problems/letter-combinations-of-a-phone-number/')

## Approach

Since most of the numbers in phone pad have 3 alphabets we will assign 3 numbers to every number from 2 to 9 in phone pad starting from 0. So 2 has been assigned 0, 1, 2 and 3 have been assigned 3, 4, 5 and so on. Using these assigned numbers we can find letters which are associated with those numbers by adding the assigned numbers to the ascii value of 'a'. So if user enter 2 and 3 we know, we have to find subsets of 0, 1, 2 and 3, 4, 5 after adding to ascii value of 'a'.

## Code

```dart
List<String> phonePadLettersCombinations(
    String p, String up, List<String> ans) {
  if (up.length == 0) {
    return [...ans, p];
  }

  int letter = int.parse(up[0]);
  int terminatingValue = (letter - 1) * 3;
  int startValue = (letter - 2) * 3;

  if (letter == 7) {
    terminatingValue++;
  }
  if (letter == 9) {
    startValue++;
    terminatingValue += 2;
  }
  if (letter == 8) {
    startValue++;
    terminatingValue++;
  }

  for (int i = startValue; i < terminatingValue; i++) {
    String dialedLetter = String.fromCharCode('a'.codeUnitAt(0) + i);
    ans = [
      ...phonePadLettersCombinations(p + dialedLetter, up.substring(1), ans)
    ];
  }

  return ans;
}

void main() {
  print(phonePadLettersCombinations('', '27', []));
}
```

## Output

```dart
[ap, aq, ar, as, bp, bq, br, bs, cp, cq, cr, cs]
```
