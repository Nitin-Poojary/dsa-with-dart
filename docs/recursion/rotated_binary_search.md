# Binary Search in a sorted rotated array using recursion

## Iterative approach

The iterative approach for the same would be, to find pivot element's index first that is rotation count, and then if `target` element is greater then `start` element do binary search between `start` and `pivot` otherwise between `pivot` and `end`. 

## Code

```dart
bool rbs(List<int> a, int target) {
  int pivot = findPivot(a);
  
  if(a[0] <= target && target <= a[pivot]) {
    return bsearch(a, 0, pivot, target);
  } else {
    return bsearch(a, pivot + 1, a.length - 1, target);
  }
}

bool bsearch(List<int> a, int s, int e, int target) {
  while(s <= e) {
    int m = (s + e) ~/ 2;
    
    if(a[m] == target) {
      return true;
    }
    if(a[m] > target) {
      e = m - 1;
    } else {
      s = m + 1;
    }
  }
  return false;
}

int findPivot(List<int> a) {
  int s = 0, e = a.length - 1;
  
  if(a[s] < a[e]) {
    return e;
  }
  
  while (s <= e) {
    int m = (s + e) ~/2;
    
    if(a[m] > a[m + 1]) {
      return m;
    }
    if(a[s] <= a[m]) {
      s = m + 1;
    } else {
      e = m - 1;
    }
  }
  
  return 0;
}

void main() {
  List<int> a = [15, 23, 26, 1, 2, 3, 4, 5, 6, 8, 12];
  int target = 26;
  print(rbs(a, target));
}

```

## Recursive approach

Here we will not find `pivot` element's index but instead we will have recursive call with respect to every cases that will appear, let's go through them one by one.

### Case 1:
If middle element of the array is the target element you are searching for, return true.

### Case 2:
Suppose you have to search an element in this array:
```dart
   [5, 6, 13, 14, 22, 24, 25, 1, 2, 3]
```

So here since left side of the array is sorted we can check whether element exists in this range if so, search left side otherwise search right side.

### Case 3:
```dart
   [24, 25, 1, 2, 3, 5, 6, 13, 14, 22,]
```

In this case right side of the array is sorted, so we will check if element exist in right side of the array if so, search right side otherwise search left side.

## Code
```dart
bool rbs(List<int> a, int target) {
  return helper(a, 0, a.length - 1, target);
}

bool helper(List<int> a, int s, int e, int target) {
  if (s > e) {
    return false;
  }

  int m = (s + e) ~/ 2;

  if (a[m] == target) {
    return true;
  }

  if (a[s] <= a[m]) {
    if (target >= a[s] && target <= a[m]) {
      return helper(a, s, m - 1, target);
    } else {
      return helper(a, m + 1, e, target);
    }
  }

  if (target >= a[m] && target <= a[e]) {
    return helper(a, m + 1, e, target);
  }

  return helper(a, s, m - 1, target);
}

void main() {
  List<int> a = [15, 23, 26, 1, 2, 3, 4, 5, 6, 8, 12];
  int target = 8;
  print(rbs(a, target));
}
```

If you don't know why I used helper function here or why I am passing `s` and `e` as arguments check [this](https://github.com/Nitin-Poojary/dsa-with-dart/blob/master/docs/recursion/recursion_arguments_basics.md).