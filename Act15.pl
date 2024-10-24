% ===============================================
% Autor: Diego Samuel Garcia Bagnis  
% Fecha: 22 de octubre de 2024 
% Descripción: Programa en Prolog que duplica los elementos
%              de una lista un número dado de veces.
%              Se incluye una versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para duplicar los elementos de una lista N veces en C#.
%     static List<T> Dupli<T>(List<T> list, int n)
%     {
%         List<T> duplicatedList = new List<T>();
%         
%         foreach (var item in list)
%         {
%             for (int i = 0; i < n; i++)
%             {
%                 duplicatedList.Add(item);  // Añade el elemento N veces.
%             }
%         }
%         
%         return duplicatedList;
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c' };
%         int n = 2; // Número de repeticiones
%         List<char> listaDuplicada = Dupli(lista, n);
%         
%         Console.WriteLine("Lista duplicada: " + string.Join(", ", listaDuplicada));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado dupli(ListaOriginal, N, ListaDuplicada) que 
% duplica los elementos de una lista un número dado de veces.

% Caso base: la lista vacía se mantiene vacía.
dupli([], _, []).

% Caso recursivo: duplica el primer elemento N veces y continúa con el resto.
dupli([H|T], N, R) :- 
    duplicate(H, N, D),  % Duplicar H N veces.
    dupli(T, N, R1),     % Procesar el resto de la lista.
    append(D, R1, R).    % Unir la lista duplicada con el resto.

% Crea una lista con N repeticiones del elemento X.
duplicate(_, 0, []).  % Si N es 0, la lista es vacía.
duplicate(X, N, [X|R]) :- 
    N > 0, 
    N1 is N - 1,        % Disminuir N en 1.
    duplicate(X, N1, R). % Repetir la operación con N-1.

% Ejemplo de uso:
% ?- dupli([a, b, c], 2, ListaDuplicada).
% ListaDuplicada = [a, a, b, b, c, c].
% ----------------------------------------------
