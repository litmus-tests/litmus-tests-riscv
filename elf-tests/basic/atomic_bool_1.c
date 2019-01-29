#include <stdatomic.h>
#include <stdbool.h>

/*
static _Atomic(_Bool) locked;

void f() {
  _Bool oldval=false;
  atomic_compare_exchange_strong(&locked, &oldval, true);
}
*/

struct __attribute__((__packed__)) s {
  _Atomic(_Bool) s_locked;
  char c;
};

void g(struct s *a) {
  _Bool oldval=false;
  a->c = 7;
  atomic_compare_exchange_strong(&a->s_locked, &oldval, true);
}

struct s a;
int main() {
  g(&a);
  return 1;  
}
