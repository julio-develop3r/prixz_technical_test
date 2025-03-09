# prixz_technical_test

## Descripcion
Este proyecto es una prueba técnica realizada para la empresa Prixz.  
Fue desarrollada por Julio César Márquez García.

## Funcionalidades Implementadas

1. Debe conectarse a la api https://openlibrary.org/developers/api. 
2. Cree una pantalla que me permita buscar libros por nombre del libro o por autor del 
libro, esta pantalla debe tener un campo de texto donde el usuario escriba el valor 
buscado, e inmediatamente debe arrojar una lista de libros que coincida con el valor 
buscado, (sea creativo para esta lista, puede usar diseños de internet). 
3. Cuando me muestre la lista de libros me debe dar la opción de ver el detalle del libro 
ya sea con un botón o un link. 
4. En la vista de detalle del libro me tiene que dejar volver a la búsqueda de libros. 
5. Cree otra página o pantalla, esta debe tener un formulario con los siguientes 
campos. 
6. Nombres (Solo debe permitir letras), apellidos (Solo debe permitir letras), teléfono 
(máx. 10 números), email (debe validar el email), fecha de nacimiento, edad (esta 
debe ser calculada al momento de escoger la fecha de nacimiento), género 
(masculino, femenino u otro), y un botón guardar. 
7. Al accionar el botón guardar debe validar todos los campos, si alguno está mal debe 
mostrarme cual, si todo está bien debe guardar los datos en las preferencias de 
usuario y llevarme a otra página donde los pueda visualizar. 
8. Busque la manera en la que el usuario navegue entre estas pantallas intuitivamente. 

Ademas se agrego
* Navegacion en la app con GoRouter
* Test de books_bloc