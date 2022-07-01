#Ejercicios Modulo 1 

# Integrantes 

## Jorge Higuera 
## Andres Rodriguez

# Punto 1. Vectores y listas 

## Literal a.

### La diferencia principal es que los vectores que creamos 
### en la funcion c() solo se nos permite incluir elementos que 
### poseen un solo estilo de formato, al aplicar la otra funcion de codigo
### podemos crear varios elementos ya que con list() 
### podemos incluir elementos como son las fechas, caracteres... 

## Literal b. 

### Cuando ejecutamos mi_lista[0] nos va a mostrar un elemento
### donde señala la posicion en la que se encuentra ese elemento
### cuando utilizamos mi_lista[[0]] a diferencia de la otra funcion
### lo que hace es mostrarnos el elemento deseado y extraerlo de esa
### lista, para poder separarlo.

# Punto 2. Extracción de elementos

matriz <- matrix(rep(1:7,4), ncol = 4, nrow = 7, byrow = TRUE)

## Literal a. 

matriz[1:7,2, drop = FALSE] 

## Literal b.

matriz[3,1:4, drop = FALSE]

## Literal c.

matriz[3:7,1:4]

## Literal d. 

matriz[1:2,2:4]


# Punto 3. If 

numero <- 98 

if (numero%%2==0){
  print("numero par")
} else if (numero%%2>0) {
  print("numero impar")
}

# Punto 4. For 

nombres <- c("Andrea", "Carlos", "Juan", "Carolina", "Fernando", "Laura")

for (nombre in nombres) {
  print(paste("Bienvenido", nombre))
}

# Punto 5. Funciones

mi_funcion <- function(a,b=1) {
  return(a^b)
}

respuesta <- mi_funcion(2,3)

respuesta






