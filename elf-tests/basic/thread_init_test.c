int t;

// label t1 can't be referred to outside main()

int main() {
  int x;

  // label t1 can be referred to inside main(), 
  // using the GCC "labels as values" && extension:

  const static void * thread_init_1 = &&t1;

  // At -O0 this appears in the objdump as
  //  12: 00000000100100f8     8 OBJECT  LOCAL  DEFAULT    2 thread_init_1.1733
  // but at -O2 it does not

  // presumably all these thread start addresses will have to be inside main(),
  // otherwise the got/toc setup will be wrong   

  // thread 0
  t=0;
  x=0;
  return 1;

  // thread 1
 t1:
  t=1;
  x=1;
  return 1;

  // thread 2
 t2:
  t=2;
  x=2;
  return 1;
}

