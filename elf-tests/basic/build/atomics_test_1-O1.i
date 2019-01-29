# 1 "atomics_test_1.c"
# 1 "/home/shaked/rems/litmus-tests-riscv/elf-tests/basic//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "atomics_test_1.c"
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
# 2 "atomics_test_1.c" 2


# 3 "atomics_test_1.c"
_Atomic(int) x = 1;

int y_relaxed, y_acquire, y_sc;

int n = 0;

int main() {
  n=11;
  y_relaxed = 
# 11 "atomics_test_1.c" 3 4
             __extension__ ({ __auto_type __atomic_load_ptr = (
# 11 "atomics_test_1.c"
             &x
# 11 "atomics_test_1.c" 3 4
             ); __typeof__ (*__atomic_load_ptr) __atomic_load_tmp; __atomic_load (__atomic_load_ptr, &__atomic_load_tmp, (
# 11 "atomics_test_1.c"
             memory_order_relaxed
# 11 "atomics_test_1.c" 3 4
             )); __atomic_load_tmp; })
# 11 "atomics_test_1.c"
                                                           ;
  n=12;
  y_acquire = 
# 13 "atomics_test_1.c" 3 4
             __extension__ ({ __auto_type __atomic_load_ptr = (
# 13 "atomics_test_1.c"
             &x
# 13 "atomics_test_1.c" 3 4
             ); __typeof__ (*__atomic_load_ptr) __atomic_load_tmp; __atomic_load (__atomic_load_ptr, &__atomic_load_tmp, (
# 13 "atomics_test_1.c"
             memory_order_acquire
# 13 "atomics_test_1.c" 3 4
             )); __atomic_load_tmp; })
# 13 "atomics_test_1.c"
                                                           ;
  n=13;
  y_sc = 
# 15 "atomics_test_1.c" 3 4
        __extension__ ({ __auto_type __atomic_load_ptr = (
# 15 "atomics_test_1.c"
        &x
# 15 "atomics_test_1.c" 3 4
        ); __typeof__ (*__atomic_load_ptr) __atomic_load_tmp; __atomic_load (__atomic_load_ptr, &__atomic_load_tmp, (
# 15 "atomics_test_1.c"
        memory_order_seq_cst
# 15 "atomics_test_1.c" 3 4
        )); __atomic_load_tmp; })
# 15 "atomics_test_1.c"
                                                      ;

  n=21;
  
# 18 "atomics_test_1.c" 3 4
 __extension__ ({ __auto_type __atomic_store_ptr = (
# 18 "atomics_test_1.c"
 &x
# 18 "atomics_test_1.c" 3 4
 ); __typeof__ (*__atomic_store_ptr) __atomic_store_tmp = (
# 18 "atomics_test_1.c"
 2
# 18 "atomics_test_1.c" 3 4
 ); __atomic_store (__atomic_store_ptr, &__atomic_store_tmp, (
# 18 "atomics_test_1.c"
 memory_order_relaxed
# 18 "atomics_test_1.c" 3 4
 )); })
# 18 "atomics_test_1.c"
                                                   ;
  n=22;
  
# 20 "atomics_test_1.c" 3 4
 __extension__ ({ __auto_type __atomic_store_ptr = (
# 20 "atomics_test_1.c"
 &x
# 20 "atomics_test_1.c" 3 4
 ); __typeof__ (*__atomic_store_ptr) __atomic_store_tmp = (
# 20 "atomics_test_1.c"
 3
# 20 "atomics_test_1.c" 3 4
 ); __atomic_store (__atomic_store_ptr, &__atomic_store_tmp, (
# 20 "atomics_test_1.c"
 memory_order_release
# 20 "atomics_test_1.c" 3 4
 )); })
# 20 "atomics_test_1.c"
                                                   ;
  n=23;
  
# 22 "atomics_test_1.c" 3 4
 __extension__ ({ __auto_type __atomic_store_ptr = (
# 22 "atomics_test_1.c"
 &x
# 22 "atomics_test_1.c" 3 4
 ); __typeof__ (*__atomic_store_ptr) __atomic_store_tmp = (
# 22 "atomics_test_1.c"
 3
# 22 "atomics_test_1.c" 3 4
 ); __atomic_store (__atomic_store_ptr, &__atomic_store_tmp, (
# 22 "atomics_test_1.c"
 memory_order_seq_cst
# 22 "atomics_test_1.c" 3 4
 )); })
# 22 "atomics_test_1.c"
                                                   ;

  n=31;
  
# 25 "atomics_test_1.c" 3 4
 __atomic_thread_fence (
# 25 "atomics_test_1.c"
 memory_order_relaxed
# 25 "atomics_test_1.c" 3 4
 )
# 25 "atomics_test_1.c"
                                          ;

  n=99;

  return 1;
}
