% ===============================================
% Autor: Diego Samuel Garcia Bagnis  
% Fecha: 22 de octubre de 2024 
% Descripción: Programa en Prolog que encuentra el 
%              último elemento de una lista.
%              Se incluye una versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para encontrar el último elemento de una lista en C#.
%     static T LastElement<T>(List<T> list)
%     {
%         if (list.Count == 0)
%             throw new InvalidOperationException("La lista no puede estar vacía.");
%         return list[list.Count - 1]; // Retorna el último elemento.
%     }
% 
%     static void Main()
%     {
%         var lista = new List<char> { 'a', 'b', 'c', 'd' };
%         char ultimo = LastElement(lista);
%         Console.WriteLine($"Último elemento: {ultimo}");
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado my_last(X, Lista) que encuentra el último 
% elemento X de una lista.

% Caso base: si la lista tiene un solo elemento, ese es el último.
my_last(X, [X]). 

% Caso recursivo: ignora el primer elemento y busca el último en el resto de la lista.
my_last(X, [_|T]) :- my_last(X, T). 

% Ejemplo de uso:
% ?- my_last(X, [a, b, c, d]).
% X = d.
% ----------------------------------------------
