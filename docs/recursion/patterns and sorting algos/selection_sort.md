# Selection sort using recursion

Prerequisite for this is [bubble sort](https://github.com/Nitin-Poojary/dsa-with-dart/blob/master/docs/recursion/patterns%20and%20algos/bubble_sort.md)

## Algorithm

In Selection we pick largest element in the array and place it at the last position, and repeat the process by putting second largest element at the second last position, third last at third last position and so on. So like in bubble sort after every cycle we will have largest element will be at its correct position.

## Approach

In bubble sort example in prerequisite we are checking whether current element is greater then its next all the way till the end, we can modify that and can find largest element and then swap it with last index.

## Code

```dart
void selectionSort(List<int> ar, int i, int j, int max) {
  if (i == 0) {
    return;
  }

  if (j <= i) {
    if (ar[max] < ar[j]) {
      max = j;
    }
    selectionSort(ar, i, j + 1, max);
  } else {
    int temp = ar[i];
    ar[i] = ar[max];
    ar[max] = temp;
    selectionSort(ar, i - 1, 0, 0);
  }
}

void main() {
  List<int> a = [5, 4, 7, 2, 1, 3, 8];
  print('Before: $a');
  selectionSort(a, a.length - 1, 0, 0);
  print('After: $a');
}
```

## Output

```dart
Before: [5, 4, 7, 2, 1, 3, 8]
After: [1, 2, 3, 4, 5, 7, 8]
```

## Observations

As you can see we want to find largest element so we have to keep largest element's value somehow in every recursion call ahead, therefore we are passing that as arguments.