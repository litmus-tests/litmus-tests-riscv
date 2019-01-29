#include <stdatomic.h>
#include __THREAD_START_H

int x[2] = { 0, 0 };
int y[2] = { 1, 1 };

int r1, r2, r3, r4;

void thread1(int tid) {
  r1=atomic_load_explicit(&x[1], memory_order_relaxed);
  atomic_store_explicit(&y[r1], r1, memory_order_relaxed);

  r2=atomic_load_explicit(&y[0], memory_order_relaxed);
  atomic_store_explicit(&y[1], r2, memory_order_relaxed);
}

void thread2(int tid) {
  r3=atomic_load_explicit(&y[1], memory_order_relaxed);
  atomic_store_explicit(&x[r3], r3, memory_order_relaxed);

  r4=atomic_load_explicit(&x[0], memory_order_relaxed);
  atomic_store_explicit(&x[1], r4, memory_order_relaxed);
}

int main() {
  int tid1, tid2;
  tid1 = thread_start(thread1);
  tid2 = thread_start(thread2);
  return 1;
}


// x[1]=y[1]=0 initially
// x[0]=y[0]=1 initially
//
// T1:
// r1=x[1];
// y[r1]=r1;
//
// r2=y[0];
// y[1]=r2;
//
// T2:
// r3=y[1];
// x[r3]=r3;
//
// r4=x[0];
// x[1]=r4;
//
// Can r1=r2=r3=r4=1?
