# Consultas XPath - Tienda de Alcohol



| Tipo | Expresión XPath | Qué selecciona | Resultado esperado |
| :--- | :--- | :--- | :--- |
| **Ruta Absoluta** | `/tienda_alcohol/alcoholes/alcohol_premium` | El nodo completo de la sección premium. | Nodo `<alcohol_premium>` |
| **Ruta Relativa** | `//Whiskey/*` | Todos los elementos que son hijos de cualquier nodo Whiskey. | Lista de todos los whiskeys (Red Label, Blue Label, etc.) |
| **Predicado** | `//*[@disponible='FALSE']` | Todos los elementos del catálogo que no tienen stock. | Nodos como `Old_harper`, `Hendriks`, `Bulldog`. |
| **Predicado** | `//rones/*[starts-with(name(), 'Barcelo')]` | Elementos de ron cuyo nombre de etiqueta empieza por "Barcelo". | `Barcelo` y `Barcelo_Imperial`. |
| **Función** | `count(//alcohol_no_premium//*)` | Cuenta el número total de productos en la sección no premium. | Un número entero (ej. 18). |
| **Función** | `sum(//Licores_Gallegos/*/translate(@precio, '€', ''))` | Suma los precios de los licores gallegos eliminando el símbolo €. | El valor total numérico de la sección. |
| **Función** | `//node()[contains(., 'escocés')]` | Cualquier producto que mencione la palabra "escocés" en su descripción. | `Green_Label`, `Blue_Label`, `Cardu`. |
| **Eje (Sibling)** | `//Cazique_500/following-sibling::*` | Selecciona los productos que están al mismo nivel después de Cazique 500. | `Bumbu_Dark`, `Havana_Club`, etc. |
| **Compleja** | `//alcohol_premium//*[translate(@precio, '€', '') > 50]` | Productos premium con un precio superior a 50€. | `Green_Label` y `Blue_Label`. |
| **Compleja** | `//rones/*[@disponible='TRUE' and contains(., 'añejo')]` | Rones disponibles que tengan la palabra "añejo" en su texto. | `Barcelo_Imperial`, `Santa_Teresa_1976`. |