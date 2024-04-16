.global _start
.p2align 3

_start:
    b _printf
    b _terminate

_printf:
    mov X0, #1              // stdout
    adr X1, helloworld      // address of 'Hello, World' string
    mov X2, #13             // length of 'Hello, World' string (13)
    mov X16, #4             // write to stdout
    svc 0                   // syscall

_reboot:
    mov X0, #1      // instant reboot
    mov X16, #55    // reboot
    svc 0           // syscall

_terminate:
    mov X0, #0      // return 0
    mov X16, #1     // terminate
    svc 0           // syscall

// hello world string
helloworld: .ascii "Hello, World\n"     // 13 char


// Commands (in terminal)
// -> $ as hello.s -o hello.o
// -> $ ld hello.o -o hello -l System -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _main -arch arm64
// -> $ ld hello.o -o hello -l System -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64

//    SVC
//    Supervisor Call
// -> Supervisor call to allow application code to call the OS

// 0	AUE_NULL	ALL	{ int nosys(void); }   { indirect syscall }
// 1	AUE_EXIT	ALL	{ void exit(int rval); }
// 2	AUE_FORK	ALL	{ int fork(void); }
// 3	AUE_NULL	ALL	{ user_ssize_t read(int fd, user_addr_t cbuf, user_size_t nbyte); }
// 4	AUE_NULL	ALL	{ user_ssize_t write(int fd, user_addr_t cbuf, user_size_t nbyte); }

// lldb hello
// disassemble --name start
// (lldb) precess launch -- <args>
// (lldb) run
// (lldb) r
// memory read -fx -c4 -s4 $address
// >- -f : display format
// >- -s : size of the data
// >- -c : count

// make : 일련의 쉘 명령어들을 Makefile 의 조건에 맞게 실행하는 프로그램.

// Makefile 구성
// >- Target (대상)
// >- Recipes (실행할 명령어들)
// >- PreRequisites (Dependency, 사전에 필요한 것들)

// x/16xw
