% ===============================================
% Autor: Diego Samuel Garcia Bagnis  
% Fecha: 22 de octubre de 2024 
% Descripción: Programa en Prolog que elimina el k-ésimo 
%              elemento de una lista. El índice K debe ser 
%              mayor que 0.
%              Se incluye una versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para eliminar el k-ésimo elemento de una lista en C#.
%     static (T removedElement, List<T> result) RemoveAt<T>(List<T> list, int k)
%     {
%         T removedElement = list[k - 1]; // Guarda el elemento a eliminar.
%         List<T> result = new List<T>(list);
%         result.RemoveAt(k - 1); // Elimina el k-ésimo elemento.
%         return (removedElement, result);
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c', 'd', 'e', 'f' };
%         int k = 3; // Índice del elemento a eliminar
%         var (removedElement, result) = RemoveAt(lista, k);
%         
%         Console.WriteLine("Elemento eliminado: " + removedElement);
%         Console.WriteLine("Lista resultante: " + string.Join(", ", result));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado remove_at(ElementoEliminado, ListaOriginal, K, ListaResultante) que 
% elimina el k-ésimo elemento de la lista.

% Caso base: si K es 1, elimina el primer elemento y devuelve el resto.
remove_at(X, [X|T], 1, T).

% Caso recursivo: si K es mayor que 1, conserva el primer elemento 
% y continúa buscando en el resto de la lista.
remove_at(X, [H|T], K, [H|R]) :- 
    K > 1, 
    K1 is K - 1, 
    remove_at(X, T, K1, R).

% Ejemplo de uso:
% ?- remove_at(ElementoEliminado, [a, b, c, d, e, f], 3, ListaResultante).
% ElementoEliminado = c,
% ListaResultante = [a, b, d, e, f].
% ----------------------------------------------
