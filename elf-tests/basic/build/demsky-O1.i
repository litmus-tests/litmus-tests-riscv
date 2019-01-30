# 1 "demsky.c"
# 1 "/home/shaked/rems/litmus-tests-riscv/elf-tests/basic//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "demsky.c"
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
# 2 "demsky.c" 2
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
# 3 "demsky.c" 2

int x[2] = { 0, 0 };
int y[2] = { 1, 1 };

int r1, r2, r3, r4;

void thread1(int tid) {
  r1=
# 10 "demsky.c" 3 4
    __extension__ ({ __auto_type __atomic_load_ptr = (
# 10 "demsky.c"
    &x[1]
# 10 "demsky.c" 3 4
    ); __typeof__ (*__atomic_load_ptr) __atomic_load_tmp; __atomic_load (__atomic_load_ptr, &__atomic_load_tmp, (
# 10 "demsky.c"
    memory_order_relaxed
# 10 "demsky.c" 3 4
    )); __atomic_load_tmp; })
# 10 "demsky.c"
                                                     ;
  
# 11 "demsky.c" 3 4
 __extension__ ({ __auto_type __atomic_store_ptr = (
# 11 "demsky.c"
 &y[r1]
# 11 "demsky.c" 3 4
 ); __typeof__ (*__atomic_store_ptr) __atomic_store_tmp = (
# 11 "demsky.c"
 r1
# 11 "demsky.c" 3 4
 ); __atomic_store (__atomic_store_ptr, &__atomic_store_tmp, (
# 11 "demsky.c"
 memory_order_relaxed
# 11 "demsky.c" 3 4
 )); })
# 11 "demsky.c"
                                                        ;

  r2=
# 13 "demsky.c" 3 4
    __extension__ ({ __auto_type __atomic_load_ptr = (
# 13 "demsky.c"
    &y[0]
# 13 "demsky.c" 3 4
    ); __typeof__ (*__atomic_load_ptr) __atomic_load_tmp; __atomic_load (__atomic_load_ptr, &__atomic_load_tmp, (
# 13 "demsky.c"
    memory_order_relaxed
# 13 "demsky.c" 3 4
    )); __atomic_load_tmp; })
# 13 "demsky.c"
                                                     ;
  
# 14 "demsky.c" 3 4
 __extension__ ({ __auto_type __atomic_store_ptr = (
# 14 "demsky.c"
 &y[1]
# 14 "demsky.c" 3 4
 ); __typeof__ (*__atomic_store_ptr) __atomic_store_tmp = (
# 14 "demsky.c"
 r2
# 14 "demsky.c" 3 4
 ); __atomic_store (__atomic_store_ptr, &__atomic_store_tmp, (
# 14 "demsky.c"
 memory_order_relaxed
# 14 "demsky.c" 3 4
 )); })
# 14 "demsky.c"
                                                       ;
}

void thread2(int tid) {
  r3=
# 18 "demsky.c" 3 4
    __extension__ ({ __auto_type __atomic_load_ptr = (
# 18 "demsky.c"
    &y[1]
# 18 "demsky.c" 3 4
    ); __typeof__ (*__atomic_load_ptr) __atomic_load_tmp; __atomic_load (__atomic_load_ptr, &__atomic_load_tmp, (
# 18 "demsky.c"
    memory_order_relaxed
# 18 "demsky.c" 3 4
    )); __atomic_load_tmp; })
# 18 "demsky.c"
                                                     ;
  
# 19 "demsky.c" 3 4
 __extension__ ({ __auto_type __atomic_store_ptr = (
# 19 "demsky.c"
 &x[r3]
# 19 "demsky.c" 3 4
 ); __typeof__ (*__atomic_store_ptr) __atomic_store_tmp = (
# 19 "demsky.c"
 r3
# 19 "demsky.c" 3 4
 ); __atomic_store (__atomic_store_ptr, &__atomic_store_tmp, (
# 19 "demsky.c"
 memory_order_relaxed
# 19 "demsky.c" 3 4
 )); })
# 19 "demsky.c"
                                                        ;

  r4=
# 21 "demsky.c" 3 4
    __extension__ ({ __auto_type __atomic_load_ptr = (
# 21 "demsky.c"
    &x[0]
# 21 "demsky.c" 3 4
    ); __typeof__ (*__atomic_load_ptr) __atomic_load_tmp; __atomic_load (__atomic_load_ptr, &__atomic_load_tmp, (
# 21 "demsky.c"
    memory_order_relaxed
# 21 "demsky.c" 3 4
    )); __atomic_load_tmp; })
# 21 "demsky.c"
                                                     ;
  
# 22 "demsky.c" 3 4
 __extension__ ({ __auto_type __atomic_store_ptr = (
# 22 "demsky.c"
 &x[1]
# 22 "demsky.c" 3 4
 ); __typeof__ (*__atomic_store_ptr) __atomic_store_tmp = (
# 22 "demsky.c"
 r4
# 22 "demsky.c" 3 4
 ); __atomic_store (__atomic_store_ptr, &__atomic_store_tmp, (
# 22 "demsky.c"
 memory_order_relaxed
# 22 "demsky.c" 3 4
 )); })
# 22 "demsky.c"
                                                       ;
}

int main() {
  int tid1, tid2;
  tid1 = thread_start(thread1);
  tid2 = thread_start(thread2);
  return 1;
}
