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
