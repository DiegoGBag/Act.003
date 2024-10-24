% ===============================================
% Autor: Diego Samuel Garcia Bagnis  
% Fecha: 22 de octubre de 2024 
% Descripción: Programa en Prolog que duplica los elementos
%              de una lista.
%              Se incluye una versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para duplicar los elementos de una lista en C#.
%     static List<T> Dupli<T>(List<T> list)
%     {
%         List<T> duplicatedList = new List<T>();
%         
%         foreach (var item in list)
%         {
%             duplicatedList.Add(item);  // Añade el elemento original.
%             duplicatedList.Add(item);  // Añade el elemento duplicado.
%         }
%         
%         return duplicatedList;
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c' };
%         List<char> listaDuplicada = Dupli(lista);
%         
%         Console.WriteLine("Lista duplicada: " + string.Join(", ", listaDuplicada));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado dupli(ListaOriginal, ListaDuplicada) que 
% duplica los elementos de una lista.

% Caso base: una lista vacía se mantiene vacía.
dupli([], []).

% Caso recursivo: duplica el primer elemento y continúa con el resto.
dupli([H|T], [H,H|R]) :- 
    dupli(T, R).  % Duplica el resto de la lista.

% Ejemplo de uso:
% ?- dupli([a, b, c], ListaDuplicada).
% ListaDuplicada = [a, a, b, b, c, c].
% ----------------------------------------------
