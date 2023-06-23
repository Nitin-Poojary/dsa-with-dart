int mazeCount(int r, int c, int mazeLength) {
  if (r == mazeLength - 1 || c == mazeLength - 1) {
    return 1;
  }

  return mazeCount(r + 1, c, mazeLength) + mazeCount(r, c + 1, mazeLength);
}

void mazePathPrint(String path, int r, int c, int mazeLength) {
  if (r == mazeLength - 1 && c == mazeLength - 1) {
    print(path);
    return;
  }

  if (c < mazeLength - 1) {
    mazePathPrint(path + 'R', r, c + 1, mazeLength);
  }

  if (r < mazeLength - 1) {
    mazePathPrint(path + 'D', r + 1, c, mazeLength);
  }
}

List<String> mazePathReturn(
    List<String> paths, String path, int r, int c, int mazeLength) {
  if (r == mazeLength - 1 && c == mazeLength - 1) {
    return [...paths, path];
  }

  if (c < mazeLength - 1) {
    paths = [...mazePathReturn(paths, path + 'R', r, c + 1, mazeLength)];
  }

  if (r < mazeLength - 1) {
    paths = [...mazePathReturn(paths, path + 'D', r + 1, c, mazeLength)];
  }

  return paths;
}

void main() {
  // print(mazeCount(0, 0, 3));
  // mazePathPrint('', 0, 0, 3);
  print(mazePathReturn([], '', 0, 0, 3));
}
