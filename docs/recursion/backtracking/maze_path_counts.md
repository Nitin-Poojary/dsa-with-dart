# Maze Path Counts

This document will cover some prerequisite knowledge for backtracking and provide a few cases to help understand the need for backtracking.

## Problem

Given a maze of either 2x2 or 3x3 size, the task is to find the number of paths that can be taken to reach from the top left cell to the bottom right cell. The only allowed movements are rightward and downward within the maze.

## Approach

The approach to solve this problem is as follows. We start from the top left cell and move either rightward or downward. We explore all possible routes by recursively moving in either direction until we reach the last column or the last row.

In a 3x3 maze, if we reach the rightmost column, the only remaining path is to move downward. Similarly, if we reach the bottom row, the only remaining path is to move rightward. We can check whether we have reached either the rightmost column or the bottom row to determine if we have reached the destination cell.

We continue exploring all possible routes until we reach the destination cell. At each step, we increment a count variable to keep track of the number of paths found. Finally, we return the count as the result.

## Code

```dart
int mazeCount(int r, int c, int mazeLength) {
  if (r == mazeLength - 1 || c == mazeLength - 1) {
    return 1;
  }

  return mazeCount(r + 1, c, mazeLength) + mazeCount(r, c + 1, mazeLength);
}

void main() {
  print(mazeCount(0, 0, 3));
}
```

## Output

```dart
6
```

## Print paths

## Modified Approach

Instead of exploring all possible routes until we reach the last column or the last row, we will continue exploring until we reach the destination cell. We can maintain a variable to represent the destination cell coordinates.

During the exploration, we will keep track of the directions taken at each step. We can use a string to store the directions. For example, we can use 'R' to represent moving right and 'D' to represent moving down.

## Code 1

```dart
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

void main() {
  mazePathPrint('', 0, 0, 3);
}
```

## Output

```dart
RRDD
RDRD
RDDR
DRRD
DRDR
DDRR
```

## Code 2

```dart
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
  print(mazePathReturn([], '', 0, 0, 3));
}
```

## Output

```dart
[RRDD, RDRD, RDDR, DRRD, DRDR, DDRR]
```

## Need for backtracking

As you can see when we are only allowed to move either right or down directions there's nothing to worry about. But what if we can move in all directions like up, right, down, left. Then the real problem arise, if we can move in all directions that means we can also move in direction we came from and that will cause infinite recursion. We wil be solving this issue in [backtracking](https://github.com/Nitin-Poojary/dsa-with-dart/blob/master/docs/recursion/backtracking/maze_backtracking.md) docs.
