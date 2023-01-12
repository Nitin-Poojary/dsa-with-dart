# Printing Triangle patterns with stars (*) using recursion:

Prerequisite for this is [here](https://github.com/Nitin-Poojary/dsa-with-dart/blob/master/docs/recursion/basics/recursion_arguments_basics.md)

So by following same approach first let's print the same using iteration and then convert it into recursive approach.

## Approach

So the approach is pretty straight forward, suppose we have to print stars (*) `n` times that means if the `n` is 5 the pattern should look like:
```dart
* * * * * 
* * * * 
* * * 
* * 
* 
``` 
So as we can see since we have to print in rows and columns form that means we must require two for loops, one to run `n` time that is the row times and other to run `n - row` time that is `total number of rows - current row`

## Code
```dart
import 'dart:io';

void printTrianglei(int n) {
  for (int row = 0; row < n; row++) {
    for (int col = 0; col < n - row; col++) {
      stdout.write('* ');
    }
    print('');
  }
}

void main() {
  int n = 5;
  printTrianglei(n);
}
```
## Observations
As our previous observation [here](https://github.com/Nitin-Poojary/dsa-with-dart/blob/master/docs/recursion/patterns%20and%20algos/rotated_binary_search.md) we can see that we have two variables `row` and `col` which are changing in every iteration with respect to its previous value, so we will pass them as arguments to every function calls.

## Approach

The approach for this is also pretty straight forward, as we will print row by row where first row will contain `n` stars and decrement of row from there by one for every row until `row`'s value becomes `0`. So basically `row`'s value will contain number of stars to be printed in each row so we will start with `col`'s value as `0` print `*` and increment `col` by 1 until `col` is equal to `row` then reset `col` and decrement `row` and do the same.  

## Code
```dart
import 'dart:io';

void printTriangle(int row, int col) {
  if (row == 0) {
    return;
  }

  stdout.write('* ');
  if (col < row - 1) {
    printTriangle(row, col + 1);
  } else {
    print('');
    printTriangle(row - 1, 0);
  }
}

void main() {
  int n = 5;
  printTriangle(n, 0);
}
```