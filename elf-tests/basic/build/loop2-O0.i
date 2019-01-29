# 1 "loop.c"
# 1 "/home/shaked/rems/litmus-tests-riscv/elf-tests/basic//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "loop.c"
int t = 0;
int main() {
  int i = 0;
  for (i=0; i < 2; i++)
    t = t + i;
  return 1;
}
