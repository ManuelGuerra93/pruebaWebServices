@Todo
Feature: Agregar, obtener y modificar mascotas

  @Registrar
  Scenario Outline: Agregar Mascota
    Given url 'https://petstore.swagger.io/v2/pet'
    And request {"id": <id>, "category": { "id": <id>, "name": <nombre> }, "name": <nombre>, "photoUrls": [ "string" ], "tags": [ { "id": 0, "name": "string" }  ], "status": "available" }
    When method post
    Then status 200
    * match response == {"id": <id>, "category": { "id": <id>, "name": <nombre> }, "name": <nombre>, "photoUrls": [ "string" ], "tags": [ { "id": 0, "name": "string" }  ], "status": "available" }

    Examples:
      | id | nombre  |
      | 5  | Prueba5 |

  @Buscar
  Scenario Outline: Buscar Mascota
    Given url 'https://petstore.swagger.io/v2/pet/<id>'
    When method get
    Then status 200
    #And print response
    * match response == { "id": <id>, "category": { "id": <id>, "name": <nombre> }, "name": <nombre>, "photoUrls": [ "string" ], "tags": [ { "id": 0, "name": "string" } ], "status": "available" }

    Examples:
      | id | nombre  |
      | 5  | Prueba5 |

  @Modificar
  Scenario Outline: Modificar Mascota
    Given url 'https://petstore.swagger.io/v2/pet'
    And request { "id": <id>, "category": { "id": <id>, "name": <nombre> }, "name": "doggie", "photoUrls": [ "string" ], "tags": [ { "id": 0, "name": "string" } ], "status": "available" }
    When method put
    Then status 200
    * match response == { "id": <id>, "category": { "id": <id>, "name": <nombre> }, "name": "doggie", "photoUrls": [ "string" ], "tags": [ { "id": 0, "name": "string" } ], "status": "available" }

    Examples:
      | id | nombre           |
      | 5  | PruebaModificar2 |