# R-Studio

For the R code to function properly, two components are essential:
 

1. The optimization function 
2. The Genetic algorithm

## Functions to optimize

### Thrust current function

This function adjusts the PWM signal to optimize the ratio between thrust and current.

[Thrust current Code](./code/funcion_peso_corriente.R)


### Maximum Thrust function

This function adjusts the PWM signal and aims to identify the peak thrust.

[Thrust current Code](./code//funcion_peso_maximo.R)

### Minimum Thrust function

This function adjusts the PWM signal to ascertain the least thrust value greater than zero.

[Thrust current Code](./code/funcion_peso_minimo.R)

## The genetic algorithmn

To execute the genetic algorithm effectively, a suite of functions is required. These functions cater to various stages such as initialization, data transformation, communication, and storage.

### Genetic algorithmn code

[Algorithmn for R, Initializer](code/funcion_inicializado.R)

[Algorithmn for R, Data transformation ](code/funcion_matris_informacion_summary_ga.R)

[Algorithmn for R, connection and Genetic Algorithm ](code/Comunicacion_R_Arduino_motor.Rmd)

### Storage

[Storage ](code/funcion_inicializado.R)

