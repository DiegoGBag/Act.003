% ===============================================
% Autor: Diego Samuel Garcia Bagnis  
% Fecha: 22 de octubre de 2024 
% Descripción: Programa en Prolog que divide una lista en 
%              dos partes. La longitud de la primera parte 
%              está dada por el segundo argumento.
%              Se incluye una versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para dividir una lista en dos partes en C#.
%     static (List<T> firstPart, List<T> secondPart) Split<T>(List<T> list, int n)
%     {
%         List<T> firstPart = new List<T>();
%         List<T> secondPart = new List<T>();
%         
%         for (int i = 0; i < list.Count; i++)
%         {
%             if (i < n)
%             {
%                 firstPart.Add(list[i]); // Añade a la primera parte.
%             }
%             else
%             {
%                 secondPart.Add(list[i]); // Añade a la segunda parte.
%             }
%         }
%         return (firstPart, secondPart);
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c', 'd', 'e', 'f' };
%         int n = 3; // Longitud de la primera parte
%         var (firstPart, secondPart) = Split(lista, n);
%         
%         Console.WriteLine("Primera parte: " + string.Join(", ", firstPart));
%         Console.WriteLine("Segunda parte: " + string.Join(", ", secondPart));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado split(ListaOriginal, N, PrimeraParte, SegundaParte) que 
% divide una lista en dos partes.

% Caso base: si la longitud de la primera parte es 0, la primera parte es vacía y 
% la segunda parte es la lista original.
split(L, 0, [], L).

% Caso recursivo: añade el primer elemento a la primera parte y continúa con el resto.
split([H|T], N, [H|L1], L2) :- 
    N > 0, 
    N1 is N - 1, 
    split(T, N1, L1, L2).

% Ejemplo de uso:
% ?- split([a, b, c, d, e, f], 3, PrimeraParte, SegundaParte).
% PrimeraParte = [a, b, c],
% SegundaParte = [d, e, f].
% ----------------------------------------------
