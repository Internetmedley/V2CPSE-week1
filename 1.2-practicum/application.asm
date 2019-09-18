//Remy de Bruijn 13/09/2019
//Deze functie laadt een char pointer(string) naar R0 en roept dan de print_asciz subroutine aan.

.data
    message: 
        .asciz "Hello world\n"

.text
    .global print_asciz
    .global application


application:
    MOV LR, PC
    PUSH {LR}               
    LDR R0, =message        //zet string in R0
    BL print_asciz          //doe print_asciz en ga dan verder
    POP {PC}
    