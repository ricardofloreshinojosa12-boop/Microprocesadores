;Autor: Flores Hinojosa Ricardo

;Inicio del codigo
    .org 0000h

inicio:
    ld sp,0ffffh
    ;-----------
    ld hl,msg_pet        
    call print_str
    
    ld hl,buffer
    ld b,0

leer_loop:
    call read_char
    
    cp 0dh                  ;evaluar tecla enter
    jp z,fin_lectura
    
    cp 20h                  ;evaluar tecla espacio
    jp z,guardar_letra
    
    cp 'A'
    jp c,error_letra
    cp 'z'+1
    jp nc,error_letra
    cp 'Z'+1
    jp c,es_letra
    cp 'a'
    jp c,error_letra

es_letra:
    inc b                   ;incrementar contador de letras

guardar_letra:
    ld (hl),a
    inc hl
    call print_char
    jp leer_loop

error_letra:
    ld hl,msg_error
    call print_str
    jp leer_loop

fin_lectura:
    ld (hl),'$'
    
    ld hl,msg_nombre
    call print_str
    
    ld hl,buffer
    call print_str
    
    ld hl,msg_total
    call print_str
    
    ld a,b
    call print_num

bloqueo:
    halt
    jp bloqueo


    .org 0c000h             ;inicio de sram

msg_pet: .db "Ingrese su nombre y apellidos: $"
msg_error:  .db 0ah,0dh,"Error: Caracter invalido. Ingrese solo letras.",0ah,0dh,"$"
msg_nombre: .db 0ah,0dh,"Nombre ingresado: $"
msg_total:  .db 0ah,0dh,"Cantidad de letras: $"

buffer:     .db 0           ;espacio reservado para almacenar el nombre


;constantes
print_str:  .equ 0100h
read_char:  .equ 0103h
print_char: .equ 0106h
print_num:  .equ 0109h


;fin programa
    .end