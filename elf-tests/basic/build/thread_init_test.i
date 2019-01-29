# 1 "thread_init_test.c"
# 1 "/home/shaked/rems/litmus-tests-riscv/elf-tests/basic//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "thread_init_test.c"
int t;



int main() {
  int x;




  const static void * thread_init_1 = &&t1;
# 21 "thread_init_test.c"
  t=0;
  x=0;
  return 1;


 t1:
  t=1;
  x=1;
  return 1;


 t2:
  t=2;
  x=2;
  return 1;
}
