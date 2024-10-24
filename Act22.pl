% ===============================================
% Autor: Diego Samuel Garcia Bagnis  
% Fecha: 22 de octubre de 2024 
% Descripción: Programa en Prolog que crea una lista 
%              con todos los enteros dentro de un rango 
%              dado. 
%              Se incluye una versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para crear una lista con todos los enteros en un rango en C#.
%     static List<int> Range(int start, int end)
%     {
%         List<int> result = new List<int>();
%         for (int i = start; i <= end; i++)
%         {
%             result.Add(i); // Añade cada número al rango.
%         }
%         return result;
%     }
% 
%     static void Main()
%     {
%         int start = 3; // Inicio del rango
%         int end = 7; // Fin del rango
%         List<int> listaRango = Range(start, end);
%         
%         Console.WriteLine("Lista en rango: " + string.Join(", ", listaRango));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado range(Inicio, Fin, Lista) que crea una lista 
% con todos los enteros dentro del rango dado.

% Caso base: cuando el inicio y el final son iguales.
range(I, I, [I]).

% Caso recursivo: agrega el inicio a la lista y continúa con el siguiente número.
range(I, K, [I|R]) :- 
    I < K, 
    I1 is I + 1, 
    range(I1, K, R).

% Ejemplo de uso:
% ?- range(3, 7, Lista).
% Lista = [3, 4, 5, 6, 7].
% ----------------------------------------------
