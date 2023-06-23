List<String> diceThrowSecond(String p, int target, List<String> ans) {
  if (target == 0) {
    return [...ans, p];
  }

  for (int i = 1; i <= target; i++) {
    ans = [...diceThrowSecond(p + i.toString(), target - i, ans)];
  }

  return ans;
}

void diceThrow(String p, int target) {
  if (target == 0) {
    print(p);
    return;
  }

  for (int i = 1; i <= target; i++) {
    diceThrow(p + i.toString(), target - i);
  }
}

void main() {
  int target = 4;
  print(diceThrowSecond('', target, []));
  // diceThrow('', target);
}
