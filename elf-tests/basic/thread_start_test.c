#include __THREAD_START_H

int new_tid;

void f(int tid) {
  new_tid = tid;
}

int main() {
  thread_start(f);
  thread_start(f);
  //  thread_start(f);
  return 1;
}
