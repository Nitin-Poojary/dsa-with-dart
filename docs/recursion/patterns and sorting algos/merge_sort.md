# Merge sort

Prerequisite for this is [here](https://github.com/Nitin-Poojary/dsa-with-dart/blob/master/docs/recursion/basics/recursion_arguments_basics.md).

## Algorithm

Merge sort divides the array in two parts from middle and then again divide that sub array into two parts from middle until only one element is left in the array. Then it starts to merge them by comparing with their adjacent array.

```dart

                                [5, 4, 3, 2, 1]
                        
                        [5, 4, 3]                 [2, 1]
                
                    [5, 4]      [3]           [2]         [1]

                [5]        [4]
```

In the above shown example whole array was divided into two parts then those sub parts are even futher divided into parts until only one element is left. So now that the array is divided into `n` parts assuming that the array contains `n` elements. Now we will merge the array the way it got divided and while doing that we will sort along the way. So, let's go from left to right and see how the array will get merged.

## Example of how algorithm will run

```dart
Step 1:
                                [5, 4, 3, 2, 1]
                        
                        [5, 4, 3]                 [2, 1]
                
                    [4, 5]      [3]           [2]         [1]

Step 2:
                                [5, 4, 3, 2, 1]
                        
                        [3, 4, 5]                 [2, 1]
                
                                              [2]         [1]
Step 3:
                                [5, 4, 3, 2, 1]
                        
                        [3, 4, 5]                 [1, 2]
Step 4: 
                                [1, 2, 3, 4, 5]
```

## Explanation for example

Since a lot is happening in this example so, I will divide this explanation into two parts. First we will go through what exactly is happening and how in the world array is getting sorted in [`How array is sorting?`](https://github.com/Nitin-Poojary/dsa-with-dart/blob/master/docs/recursion/patterns%20and%20sorting%20algos/merge_sort.md#1-how-array-is-sorting) then we will see [`How the subarrays are merging?`](https://github.com/Nitin-Poojary/dsa-with-dart/blob/master/docs/recursion/patterns%20and%20sorting%20algos/merge_sort.md#2-how-subarrays-are-merging).

## 1. How array is sorting?

Like I said earlier we are starting from leftmost subarray and sort array along the way, what that basically means is that as in every recursion call we are dividing array into two parts lets call them `left` and `right` so after dividing the whole array into single elements we are gonna return the function call and as we are returning function calls we will merge `left` and `right` subarray in sorted order.

## 2. How subarrays are merging?

Merge function will create a new array let's call it `merged` and check for first element of `left` and `right` subarrays, if element in `left` subarray is lesser then element in `right`  add first element of `left` subarray to `merged` and now check for second element in `left` subarray and first element of `right`, repeat this process until one of the subarray is empty after that add all the remaining element of the other subarray to `merged`.

## Code

```dart
List<int> mergeSort(List<int> ar, int s, int e) {
  if (s == e) {
    return [ar[s]];
  }

  int m = (s + e) ~/ 2;

  List<int> left = mergeSort(ar, s, m);
  List<int> right = mergeSort(ar, m + 1, e);

  return merge(left, right);
}

List<int> merge(List<int> left, List<int> right) {
  List<int> merged = [];
  int i = 0, j = 0;

  while (i < left.length && j < right.length) {
    if (left[i] < right[j]) {
      merged.add(left[i++]);
    } else {
      merged.add(right[j++]);
    }
  }

  while (i < left.length) {
    merged.add(left[i++]);
  }
  while (j < right.length) {
    merged.add(right[j++]);
  }

  return merged;
}

void main() {
  List<int> a = [5, 4, 21, 7, 13, 2, 8, 1, 3, 9, 17];
  print('Before: $a');
  a = mergeSort(a, 0, a.length - 1);
  print('After: $a');
}

```

## Ouput
```dart
Before: [5, 4, 21, 7, 13, 2, 8, 1, 3, 9, 17]
After: [1, 2, 3, 4, 5, 7, 8, 9, 13, 17, 21]
```

## Explanation for example

I hope if you are reading this you are confortable with arguments in recursion and know when to use them, as I explained them in prerequisite part. 

`mergeSort` function's call starts with finding middle index `m` to use that to divide array into `left` and `right` subparts, such as `left` subarray contains elements from index `s` to `m` and `right` subarray will contains elements from index `m + 1` to `e` where `s` is first elements's index, `e` is last element's index and `m` is middle element's index . Recursion call for `left` subarray is going to call until it hits base condition which is when `s == e` where `s` is start index of current subarray and `e` is end index of current subarray and the condition means when the subarray contains only one element in it return a array with that element. After completing `left` subarray's function call recursion call for `right` subarray will be called and repeat the same process. After having both `left` and `right` subarrays `mergeSort` function will call `merge` to merge `left` and `right` subarrays.

`merge` function will start comparing elements from first indexs of both the arrays until one of the subarray reaches its end then add all the remaining one's of the other.

## Problem

There is a good thing and a bad thing happening in this code as I am passing `s` and `e` indexes to represent start and end index of every subarray instead of passing whole array we can also pass `m` so that don't have to create `left` and `right` subarrays in every function call we can just use value of `m` to know left's end index and right's start index.

So the approach will be same but instead of using two subarray in every function call we will be using index value for it.

## Code for second method
```dart
void mergeSort(List<int> ar, int s, int e) {
  if (s == e) {
    return;
  }

  int m = (s + e) ~/ 2;

  mergeSort(ar, s, m);
  mergeSort(ar, m + 1, e);

  merge(ar, s, m, e);
}

void merge(List<int> ar, int s, int m, int e) {
  List<int> merged = [];
  int i = s, j = m + 1;

  while (i <= m && j <= e) {
    if (ar[i] < ar[j]) {
      merged.add(ar[i++]);
    } else {
      merged.add(ar[j++]);
    }
  }

  while (i <= m) {
    merged.add(ar[i++]);
  }
  while (j <= e) {
    merged.add(ar[j++]);
  }

  for (int k = 0; k < merged.length; k++) {
    ar[s + k] = merged[k];
  }
}

void main() {
  List<int> a = [5, 4, 21, 7, 13, 2, 8, 1, 3, 9, 17];
  print('Before: $a');
  mergeSort(a, 0, a.length - 1);
  print('After: $a');
}

```

## Ouput
```dart
Before: [5, 4, 21, 7, 13, 2, 8, 1, 3, 9, 17]
After: [1, 2, 3, 4, 5, 7, 8, 9, 13, 17, 21]
```

## Explanation 

As you can see everything is same here except we are not storing subarrys and we are passing `m` in `merge` function and used that to locate current subarray indexes in original parent array and made changes directly to parent array.