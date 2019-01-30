# 1 "thread_start_test.c"
# 1 "/home/shaked/rems/litmus-tests-riscv/elf-tests/basic//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "thread_start_test.c"
# 1 "thread_start_riscv64.h" 1
# 15 "thread_start_riscv64.h"
static inline int thread_start( void (* fp )(int) ) {
  register long int argument __asm__ ("x10") = (long int)fp;
  register long int result __asm__ ("x10");
  __asm__ volatile (
    ".word 0xC0DE000B"
    : "=r" (result)
    : "r" (argument)
  );
  return result;
}
# 2 "thread_start_test.c" 2

int new_tid;

void f(int tid) {
  new_tid = tid;
}

int main() {
  thread_start(f);
  thread_start(f);

  return 1;
}
