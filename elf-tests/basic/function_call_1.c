int n = 3;

int f(int a) {
  int x;
  x = a;
  n = n + a;
  return n;
}

int main() {
  int b;
  b = f(5);

  int (*p)(int) = &f;
  b = (*p)(5);
  return 1;
}


