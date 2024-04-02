
.global _start
.align 2

_start:
    b _printf       //! branch print 'Hello World!'
    b _terminate    //! branch

_printf:                    //? Hello World Print.
    mov x0, #1              //! stdout (0 -> stdin ,1 -> stdout,2 -> stderr)
    adr x1, helloworld      //! address of hello world string
    mov x2, 12              //! length of hello world string
    mov x16, #4             //! write --> 4 ALL	{ user_ssize_t write(int fd, user_addr_t cbuf, user_size_t nbyte); }
    svc 0                   //! syscall

_reboot:            //? 관리자 권한이 아니면 실행되지 않음 --> $ sudo ./viv
    mov x0, #1      //! instance reboot
    mov x16, #55    //! reboot --> 55	AUE_REBOOT	ALL	{ int reboot(int opt, char *command); }
    svc 0           //! syscall

_terminate:         //? 종료
    mov x0, #1      //! return 0
    mov x16, #1     //! terminate --> 1	AUE_EXIT	ALL	{ void exit(int rval); }
    svc 0           //! syscall

helloworld: .ascii "hello world\n"

/*
? SVC (Supervisor Call)
-->Supervisor call to allow application code to call the OS

 */
// -> Compile and Link
//! as viv.s -o viv.o
//! ld viv.o -o viv -l System -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64
//--> $ ./viv

//(run script alias -> vasm) $ as viv.s -o viv.o && ld viv.o -o viv -l System -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64 && ./viv
