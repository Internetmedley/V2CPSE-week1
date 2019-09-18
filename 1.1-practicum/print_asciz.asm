.text
.global print_asciz
.global uart_put_char


print_asciz:
    PUSH {R5, LR}       //zet R5 en LR op stack
    MOV R5, R0          //pointer(R0) naar R5
    
loop:
    LDRB R0, [R5]       //inhoud van adres op R5 naar R0 als byte
    ADD R0, R0, #0      //losse functie voor BEQ
    BEQ done            //als inhoud van R0 gelijk is aan 0, branch dan naar done
    BL uart_put_char    //als niet gelijk aan 0, branch dan naar uart_put_char en return
    ADD R5, R5, #1      //verhoog geheugenadres met 1
    B loop              //ga terug naar loop
    
done:
    POP {R5, PC}        //haal 2 dingen uit stack en zet op R5 en PC
    