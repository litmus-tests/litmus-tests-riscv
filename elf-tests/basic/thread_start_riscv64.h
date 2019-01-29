// thread start

// __inline__ int thread_start( void (* fp )(int) );

/*
If successful, this will start a new thread running the function 
pointed to by fp, and it will return the new thread id.  The 
argument fp should be a pointer to a void function that takes an int
argument, which will also be set to the thread id of the new thread 
(in which it is running).

If unsuccessful, i.e. if there are no unused threads, thread_start will return -1.
*/

static inline int thread_start( void (* fp )(int) ) {
  register long int argument       __asm__ ("x10") = (long int)fp;
  register long int result __asm__ ("x10"); // return new tid or -1
  __asm__ volatile (
    ".word 0xC0DE000B" // THREAD_START
    : "=r" (result)
    : "r" (argument)
  );
  return result;
}
