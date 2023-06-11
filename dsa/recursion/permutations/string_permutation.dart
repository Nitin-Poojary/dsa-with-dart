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

  stringPermutations('', sampleString);
  // print(stringPermutations2('', sampleString, []));
}
