# Recursion basics

We are gonna specifically talk about how to know when to take parameters and when to create variables inside body of the functions during recursion.

In simple words, if you need a variable to be changed in every function call then take that in parameters on the other hand if you want a variable in that function call only, create that inside body of the function.

Let's take an example of iterative approach, suppose you have to print numbers from 1 to 10, what will you do. You will most probably use a for loop and your code will somewhat look like:
```dart
void main() {
  int n = 10;

  for(int i = 0; i < n; i++) {
    print(i+1);
  }
}
```
In this example in every iteration of a for loop, value of `i` is incresing by 1 with respect to its previous value until it becomes equal to `n` then the for loop ends. That means as I said earlier `i` is changing in every function call. So if you want to solve same question but with recursion take a variable as in this example `i` in parameters, so the code becomes:
```dart
void print1to10(int i) {
  if (i == 0) {
    return;
  }

  print1to10(i - 1);
  print(i);
}

void main() {
  int n = 10;
  print1to10(n);
}
```

So what exactly is happening here is, since I want `i` to change in every recursive call I took that as a parameter so that I can now change that in every function call. So the function starts with  `i`'s value as 10 but since we want to print from 1 to 10 I subtracted 1 from `i` in every function call until it reaches 0, then I returned the function call to break recursive calls and then it starts printing the value of `i` it got as parameters. Or in other words, I am calling `print1to10(10)` which is calling `print1to10(9)` which is calling `print1to10(8)` ... until it reaches `print1to10(0)` and then it hits the break condition so the recursive calls stops and then function call should return to `print1to10(1)` that is from where it was called and then function `print1to10(1)` prints `i` 1 in this case and ends which leads to return this function call to the `print1to10(2)` which will prints `2` and returned to `print1to10(3)` ... until `print1to10(10)` prints `10` and then function call returnes to main and program end.

So to convert iterative approach to recursive one I took loop variable `i` that is changing in every function call and passed it as argument in every function call.

Let's take another example. This time we have to do binary search using recursion, but first lets see how its done in iterative approach.

## Approach

In a given sorted array we will check its middle index's value calculated using start and end index of array if its equal to target return true, if its greater then target check left side otherwise right side and repeat the process until start becomes greater then end. 

## Code:
```dart
bool bsearch(List<int> a, int target) {
  int s = 0;
  int e = a.length - 1;
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

void main() {
  List<int> a = [1, 2, 3, 4, 5, 6, 8, 12];
  int target = 6;
  print(bsearch(a, target));
}
```

As you can see the `s` and `e` are changing in every iteration while `m` is calculated using `s` and `e` every time loop starts. So in recursive version of this `s` and `e` should be taken as parameters.

So the recursive approach will be:
```dart
bool reversiveBinarySearch(List<int> a, int target) {
  return helperBinary(a, 0, a.length - 1, target);
}

bool helperBinary(List<int> a, int s, int e, int target) {
  if (s > e) {
    return false;
  }

  int m = (s + e) ~/ 2;

  if (a[m] == target) {
    return true;
  }
  if(a[m] > target) {
    return helperBinary(a, s, m - 1, target);
  } else {
    return helperBinary(a, m + 1, e, target);
  }
}

void main() {
  List<int> a = [1, 2, 3, 4, 5, 6, 8, 12];
  int target = 2;
  print(reversiveBinarySearch(a, target));
}
```

I took a helper function here but its not necessary there are few more cases where you can do like this. Since, in iterative approach `s` and `e` were changing in every iteration I passed them as arguments every time a function call is made and `m` is calculated inside body of the function since current function call does not depends on previous value of `m` so it doesn't make any sense to pass that right?

So with this I hope now you know when to pass variables as arguments. Thank you for reading this far.