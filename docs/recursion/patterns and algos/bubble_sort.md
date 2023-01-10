# Bubble sort using recursion

Prerequisite for this is [here](https://github.com/Nitin-Poojary/dsa-with-dart/blob/master/docs/recursion/patterns%20and%20algos/start_pattern.md)

## Approach

In the example in prerequisite at first, function is running `5` times then decrement till `1` while printing that many stars(*) along the way. So we are gonna do just that except printing stars this time we will check if next element is greater then current one.

## Code

```dart
void bubbleSortRecursion(List<int> a, int i, int j) {
  if (i == 0) {
    return;
  }

  if (j < i) {
    if (a[j + 1] < a[j]) {
      swap(a, j + 1, j);
    }
    bubbleSortRecursion(a, i, j + 1);
  } else {
    bubbleSortRecursion(a, i - 1, 0);
  }
}

void swap(List<int> arr, int a, int b) {
  int temp = arr[a];
  arr[a] = arr[b];
  arr[b] = temp;
}

void main() {
  List<int> a = [5, 4, 3, 2, 1];
  print('Before: $a');
  bubbleSortRecursion(a, a.length - 1, 0);
  print('After: $a');
}

```

## Output

```dart
Before: [5, 4, 3, 2, 1]
After: [1, 2, 3, 4, 5]
```