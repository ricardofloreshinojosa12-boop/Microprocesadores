#include "stm32f10x.h"
#include "gpios.h"

int main(void) {
    // Inicializar los puertos configurados
    GPIO_Config();

    while(1) {
        // Invertir el estado del LED en el pin PC13 
        GPIOC->ODR ^= (1 << 13);

        // Aplicar el retardo exacto de 100 milisegundos
        delay_ms(100);
    }
}