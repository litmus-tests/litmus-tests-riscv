#include <stdatomic.h>
#include __THREAD_START_H

int          x = 0;
_Atomic(int) y = 0;

int ry, rx; 


void thread0(int tid) {
  x=1;
  atomic_store_explicit(&y, 1, memory_order_release);
}

void thread1(int tid) {
  ry = atomic_load_explicit(&y, memory_order_acquire);
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
