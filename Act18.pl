% ===============================================
% Autor: Diego Samuel Garcia Bagnis  
% Fecha: 22 de octubre de 2024 
% Descripción: Programa en Prolog que extrae una porción de 
%              una lista, dado un rango de índices.
%              Los índices I y K deben ser mayores que 0.
%              Se incluye una versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para extraer una porción de una lista en C#.
%     static List<T> Slice<T>(List<T> list, int start, int length)
%     {
%         List<T> result = new List<T>();
%         for (int i = start - 1; i < start - 1 + length && i < list.Count; i++)
%         {
%             result.Add(list[i]); // Añade los elementos en el rango especificado.
%         }
%         return result;
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c', 'd', 'e', 'f' };
%         int start = 2; // Índice de inicio
%         int length = 3; // Longitud de la porción
%         List<char> porcion = Slice(lista, start, length);
%         
%         Console.WriteLine("Porción extraída: " + string.Join(", ", porcion));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado slice(ListaOriginal, I, K, Porcion) que 
% extrae una porción de la lista dada desde el índice I con longitud K.

% Caso base: si el índice es 1 y K es 1, se extrae el primer elemento.
slice([H|_], 1, 1, [H]).

% Caso recursivo: si el índice es 1 y K es mayor que 1, se añade el primer elemento 
% y se continúa con el resto.
slice([H|T], 1, K, [H|R]) :- 
    K > 1, 
    K1 is K - 1, 
    slice(T, 1, K1, R).

% Si el índice I es mayor que 1, se ignora el primer elemento y se decrementa I y K.
slice([_|T], I, K, R) :- 
    I > 1, 
    I1 is I - 1, 
    K1 is K - 1, 
    slice(T, I1, K1, R).

% Ejemplo de uso:
% ?- slice([a, b, c, d, e, f], 2, 3, Porcion).
% Porcion = [b, c, d].
% ----------------------------------------------
