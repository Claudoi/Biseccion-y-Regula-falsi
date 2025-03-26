# 🧮 Métodos de Búsqueda de Raíces en MATLAB

Este repositorio contiene la implementación en MATLAB de dos métodos clásicos para encontrar raíces de funciones no lineales:

- 🔹 **Método de Bisección**
- 🔹 **Método de Regula-Falsi** (también conocido como falsa posición)

Ambos métodos se aplican a funciones continuas en un intervalo cerrado [a, b] que cumplen con el **Teorema de Bolzano**, garantizando la existencia de al menos una raíz en dicho intervalo.

---

## 📂 Contenido

- `biseccion.m`: Implementación del método de bisección.
- `regulaFalsi.m`: Implementación del método de regula-falsi.
- `main.m`: Script principal donde se define la función, se configuran los parámetros y se comparan los resultados de ambos métodos.

---

## 🧪 Función de Prueba

La función utilizada para la comparación de ambos métodos es:

```matlab
f(x) = exp(0.75 * x) - 3 * sin(1.25 * x)
