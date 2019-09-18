//Remy de Bruijn 18/09/2019
//Deze functie neemt een char als parameter en verwisselt kleine letters naar 
//hoofdletters en vice versa.


.text
    .global toggle_case

toggle_case:
    PUSH {LR}           //om zometeen terug te gaan
    CMP R0, #'A'        //vergelijk char R0 met 'A'
    BGE greater_than_A  //als ascii waarde van R0 groter is dan 'A'
    B done              //done als ascii waarde kleiner is dan 'A' (zowieso geen letter)
    
greater_than_A:         
    CMP R0, #'Z'        //kijk of ascii waarde kleiner is dan 'Z'
    BLS to_lowercase    //zet om naar kleine letter als char R0 tussen 'A' en 'Z' ligt
                        //branch niet en ga verder als het geen hoofdletter is
    CMP R0, #'a'        //vergelijk char R0 met 'A'
    BGE greater_than_a  //als ascii waarde R0 groter is dan letter 'A'
    B done              //done als waarde geen letter is
    
greater_than_a:         
    CMP R0, #'z'        //vergelijk char R0 met letter 'z'
    BLS to_uppercase    //zet char R0 om naar hoofdletter
    B done              //done als R0 geen hoofdletter of geen kleine letter is
    
to_uppercase:  
    SUB R0, #32         //haal 32 van char R0 af om het in ascii lowercase te maken
    B done              

to_lowercase:
    ADD R0, #32         //tel 32 op bij char R0 om het in ascii uppercase te maken
    B done
    
done:
    POP {PC}
    