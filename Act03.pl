% ===============================================
% Autor: Diego Samuel Garcia Bagnis 20211778 
% Fecha: 22 de Octubre de 2024 
% Descripción: Programa en Prolog que encuentra el k-ésimo elemento de una lista.
%
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para encontrar el k-ésimo elemento de una lista en C#.
%     static T ElementAt<T>(List<T> list, int k)
%     {
%         if (list == null || list.Count < k || k < 1)
%             throw new ArgumentException("Índice fuera de rango o lista vacía.");
%         
%         return list[k - 1]; // Devuelve el k-ésimo elemento (k empieza en 1).
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c', 'd' };
%         char elemento = ElementAt(lista, 3); // Encuentra el tercer elemento.
% 
%         Console.WriteLine("El tercer elemento es: " + elemento);
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado element_at(X, List, K) que determina el K-ésimo
% elemento X de la lista List.

% El índice K debe ser mayor que 0.
element_at(X, [X|_], 1).

element_at(X, [_|T], K) :- 
    K > 1, 
    K1 is K - 1, 
    element_at(X, T, K1).

% Ejemplo de uso:
% ?- element_at(X, [a, b, c, d], 3).
% X = c.
% ----------------------------------------------
