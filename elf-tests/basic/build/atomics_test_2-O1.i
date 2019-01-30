# 1 "atomics_test_2.c"
# 1 "/home/shaked/rems/litmus-tests-riscv/elf-tests/basic//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "atomics_test_2.c"
# 1 "/usr/lib/gcc-cross/riscv64-linux-gnu/8/include/stdatomic.h" 1 3 4
# 29 "/usr/lib/gcc-cross/riscv64-linux-gnu/8/include/stdatomic.h" 3 4

# 29 "/usr/lib/gcc-cross/riscv64-linux-gnu/8/include/stdatomic.h" 3 4
typedef enum
  {
    memory_order_relaxed = 0,
    memory_order_consume = 1,
    memory_order_acquire = 2,
    memory_order_release = 3,
    memory_order_acq_rel = 4,
    memory_order_seq_cst = 5
  } memory_order;


typedef _Atomic _Bool atomic_bool;
typedef _Atomic char atomic_char;
typedef _Atomic signed char atomic_schar;
typedef _Atomic unsigned char atomic_uchar;
typedef _Atomic short atomic_short;
typedef _Atomic unsigned short atomic_ushort;
typedef _Atomic int atomic_int;
typedef _Atomic unsigned int atomic_uint;
typedef _Atomic long atomic_long;
typedef _Atomic unsigned long atomic_ulong;
typedef _Atomic long long atomic_llong;
typedef _Atomic unsigned long long atomic_ullong;
typedef _Atomic short unsigned int atomic_char16_t;
typedef _Atomic unsigned int atomic_char32_t;
typedef _Atomic int atomic_wchar_t;
typedef _Atomic signed char atomic_int_least8_t;
typedef _Atomic unsigned char atomic_uint_least8_t;
typedef _Atomic short int atomic_int_least16_t;
typedef _Atomic short unsigned int atomic_uint_least16_t;
typedef _Atomic int atomic_int_least32_t;
typedef _Atomic unsigned int atomic_uint_least32_t;
typedef _Atomic long int atomic_int_least64_t;
typedef _Atomic long unsigned int atomic_uint_least64_t;
typedef _Atomic signed char atomic_int_fast8_t;
typedef _Atomic unsigned char atomic_uint_fast8_t;
typedef _Atomic long int atomic_int_fast16_t;
typedef _Atomic long unsigned int atomic_uint_fast16_t;
typedef _Atomic long int atomic_int_fast32_t;
typedef _Atomic long unsigned int atomic_uint_fast32_t;
typedef _Atomic long int atomic_int_fast64_t;
typedef _Atomic long unsigned int atomic_uint_fast64_t;
typedef _Atomic long int atomic_intptr_t;
typedef _Atomic long unsigned int atomic_uintptr_t;
typedef _Atomic long unsigned int atomic_size_t;
typedef _Atomic long int atomic_ptrdiff_t;
typedef _Atomic long int atomic_intmax_t;
typedef _Atomic long unsigned int atomic_uintmax_t;
# 92 "/usr/lib/gcc-cross/riscv64-linux-gnu/8/include/stdatomic.h" 3 4
extern void atomic_thread_fence (memory_order);

extern void atomic_signal_fence (memory_order);
# 218 "/usr/lib/gcc-cross/riscv64-linux-gnu/8/include/stdatomic.h" 3 4
typedef _Atomic struct
{

  _Bool __val;



} atomic_flag;




extern _Bool atomic_flag_test_and_set (volatile atomic_flag *);


extern _Bool atomic_flag_test_and_set_explicit (volatile atomic_flag *,
      memory_order);



extern void atomic_flag_clear (volatile atomic_flag *);

extern void atomic_flag_clear_explicit (volatile atomic_flag *, memory_order);
# 2 "atomics_test_2.c" 2
# 1 "thread_start_riscv64.h" 1
# 15 "thread_start_riscv64.h"

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
# 3 "atomics_test_2.c" 2

int x = 0;
_Atomic(int) y = 0;

int ry, rx;


void thread0(int tid) {
  x=1;
  
# 12 "atomics_test_2.c" 3 4
 __extension__ ({ __auto_type __atomic_store_ptr = (
# 12 "atomics_test_2.c"
 &y
# 12 "atomics_test_2.c" 3 4
 ); __typeof__ (*__atomic_store_ptr) __atomic_store_tmp = (
# 12 "atomics_test_2.c"
 1
# 12 "atomics_test_2.c" 3 4
 ); __atomic_store (__atomic_store_ptr, &__atomic_store_tmp, (
# 12 "atomics_test_2.c"
 memory_order_release
# 12 "atomics_test_2.c" 3 4
 )); })
# 12 "atomics_test_2.c"
                                                   ;
}

void thread1(int tid) {
  ry = 
# 16 "atomics_test_2.c" 3 4
      __extension__ ({ __auto_type __atomic_load_ptr = (
# 16 "atomics_test_2.c"
      &y
# 16 "atomics_test_2.c" 3 4
      ); __typeof__ (*__atomic_load_ptr) __atomic_load_tmp; __atomic_load (__atomic_load_ptr, &__atomic_load_tmp, (
# 16 "atomics_test_2.c"
      memory_order_acquire
# 16 "atomics_test_2.c" 3 4
      )); __atomic_load_tmp; })
# 16 "atomics_test_2.c"
                                                    ;
  if (ry == 1)
    rx = x;
  else
    {}
}

int main() {
  int tid1, tid2;
  tid1 = thread_start(thread0);
  tid2 = thread_start(thread1);
  return 1;
}
