## ### Proyecto final: Karate Framework API Testing

Este proyecto implementa pruebas automatizadas para la API RestfulBooker utilizando  Karate, Maven e IntelliJ IDEA.

 :fa-search: Escenarios de Prueba
### :fa-search: Escenarios de Prueba
<p>
El proyecto incluye pruebas para:
</p>
- **GET Booking:** obtener reservas por ID o todas.
- **POST Booking:** crear nuevas reservas.
- **PUT Booking:** actualizar reservas existentes.
- **DELETE Booking:** eliminar reservas por ID.

### :fa-wrench: Ejecución
<p>
Para ejecutar todas las pruebas desde la línea de comandos:
</p>
```
mvn clean test
```
Para ejecutar pruebas específicas ejemplo:
```
mvn clean test -Dtest=DeleteBookingRunner
```


####:fa-pencil: Notas Adicionales 

Autenticación con token mediante

`authentication/createToken.feature`






