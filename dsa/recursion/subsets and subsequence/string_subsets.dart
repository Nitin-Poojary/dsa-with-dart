void stringSubsets(String p, String up) {
  if (up == '') {
    print(p);
    return;
  }

  stringSubsets(p + up[0], up.substring(1));
  stringSubsets(p, up.substring(1));
}

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
