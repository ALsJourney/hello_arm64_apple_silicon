//
// Hello Arm64
//

.global _start
// Align changes, so it works with apple silicon
.align 2

//main
// First 7 registers X0-X7 are used for parameters
_start:
    b _printf
    b _reboot

_printf:
    mov X0, #1 // stdout
    adr X1, helloworld // Address of hello world string
    mov X2, #12 // Length of hello world string
    mov X16, #4 // write to stdout
    svc 0 // syscall

_reboot:
    mov X0, #1 // Instant reboot
    mov X16, #55 // Reboot
    svc 0 // syscall

_terminate:
    // Setting up a function call
    // Moving value 0 to register/parameter X0
    mov X0, #0 // return 0
    // I am getting ready to call myself a supervisor call
    // Termination is #1
    mov X16, #1 // terminate
    // Supervisor call, calls to OS
    svc 0 // syscall

// Hello World String
helloworld:
    .ascii "Hello Arm 64\n"