
# Proyecto final: Karate Framework API Testing

Este proyecto implementa pruebas automatizadas para la API RestfulBooker utilizando  Karate, Maven e IntelliJ IDEA.



## Escenarios de Prueba

El proyecto incluye pruebas para:

- **GET Booking:** obtener reservas por ID o todas.
- **POST Booking:** crear nuevas reservas.
- **PUT Booking:** actualizar reservas existentes.
- **DELETE Booking:** eliminar reservas por ID.


## Ejecución

Para ejecutar todas las pruebas desde la línea de comandos:

```bash
  mvn clean test
```
Para ejecutar pruebas específicas ejemplo:

```bash
  mvn clean test -Dtest=DeleteBookingRunner
```


## Notas Adicionales 

Autenticación con token mediante

`authentication/createToken.feature`


## API

[Base URL](https://restful-booker.herokuapp.com/apidoc/index.html)








