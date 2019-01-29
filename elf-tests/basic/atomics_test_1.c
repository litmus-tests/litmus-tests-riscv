#include <stdatomic.h>

_Atomic(int) x = 1;

int y_relaxed, y_acquire, y_sc;

int n = 0;

int main() {
  n=11;
  y_relaxed = atomic_load_explicit(&x, memory_order_relaxed); 
  n=12;
  y_acquire = atomic_load_explicit(&x, memory_order_acquire); 
  n=13;
  y_sc = atomic_load_explicit(&x, memory_order_seq_cst); 

  n=21;
  atomic_store_explicit(&x, 2, memory_order_relaxed);
  n=22;
  atomic_store_explicit(&x, 3, memory_order_release);
  n=23;
  atomic_store_explicit(&x, 3, memory_order_seq_cst);

  n=31;
  atomic_thread_fence(memory_order_relaxed);

  n=99;

  return 1;
}
