# 1 "function_call_1.c"
# 1 "/home/shaked/rems/litmus-tests-riscv/elf-tests/basic//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "function_call_1.c"
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
