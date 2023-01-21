# Quicksort Algorithm

Prerequisite for this is [recursion basics](https://github.com/Nitin-Poojary/dsa-with-dart/blob/master/docs/recursion/basics/recursion_arguments_basics.md).

## Algorithm

Working of quicksort is like that of selection sort but instead of largest element in the array we are gonna choose elements at random and place that element to its correct position in the array by placing it such that all the elements at its left side should be lesser then pivot and all the elements at its right should be greater then the pivot. After that we will sort remaining array that is left and right side of pivot by repeating the same process.

## Approach

We will take middle element as our pivot because it gives best time complexity. Then we will check keep two pointer `s` to check from start and `e` to check from end. Now, these two pointers will look for violation that is `e` will find element that is lesser then pivot in right side of the array and `s` will find element that is greater then pivot in left side of the array after both pointers have found violations swap them.

## Code
```dart
void quickSort(List<int> a, int low, int high) {
  if (low >= high) {
    return;
  }

  int s = low, e = high;
  int m = (s + e) ~/ 2;
  int pivot = a[m];

  while (s <= e) {
    while (a[s] < pivot) {
      s++;
    }
    while (a[e] > pivot) {
      e--;
    }

    if (s <= e) {
      int temp = a[s];
      a[s] = a[e];
      a[e] = temp;
      s++;
      e--;
    }
  }

  quickSort(a, low, e);
  quickSort(a, s, high);
}

void main() {
  List<int> a = [5, 4, 21, 7, 13, 2, 8, 1, 3, 9, 17];
  print('Before: $a');
  quickSort(a, 0, a.length - 1);
  print('After: $a');
}

```

## Output
```dart 
Before: [5, 4, 21, 7, 13, 2, 8, 1, 3, 9, 17]
After: [1, 2, 3, 4, 5, 7, 8, 9, 13, 17, 21]
```

## Observations

As you can see no new array has been created, all the operations are done with the help of pointer variables for the same array and at every recursion call only the original array has been modified. We are passing `low` and `hight` in every recursion call inorder to keep range of indexes between which sorting has to be performed.