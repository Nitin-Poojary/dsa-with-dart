String stringSubsequence(String p, String up) {
  if (up == '') {
    return p;
  }

  if (up[0].toLowerCase() != 'a') {
    p += up[0];
  }

  return stringSubsequence(p, up.substring(1, up.length));
}

String stringSubsequenceSecond(String s) {
  if (s == '') {
    return s;
  }

  String ch;
  if (s[0].toLowerCase() == 'a') {
    ch = '';
  } else {
    ch = s[0];
  }

  return ch + stringSubsequenceSecond(s.substring(1, s.length));
}

void main() {
  String sample =
      'This is some sample text where every letter a and A that is either its capital or small should be removed.';
  print('String before: $sample');
  // print('String after: ${stringSubsequence('', sample)}');
  print('String after: ${stringSubsequenceSecond(sample)}');
}
