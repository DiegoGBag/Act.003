% ===============================================
% Autor: Diego Samuel Garcia Bagnis  
% Fecha: 22 de octubre de 2024 
% Descripción: Programa en Prolog que genera todas las 
%              combinaciones de K elementos seleccionados 
%              de una lista dada.
%              Se incluye una versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% using System.Linq;
% 
% class Program
% {
%     // Función para generar combinaciones de K elementos de una lista en C#.
%     static List<List<T>> Combinations<T>(List<T> list, int k)
%     {
%         if (k == 0) return new List<List<T>> { new List<T>() }; // Caso base
%         if (list.Count == 0) return new List<List<T>>(); // Si la lista está vacía, no hay combinaciones.
%         
%         var result = new List<List<T>>();
%         var head = list[0];
%         var tail = list.Skip(1).ToList();
%         
%         // Combinaciones que incluyen el primer elemento
%         foreach (var combination in Combinations(tail, k - 1))
%         {
%             combination.Insert(0, head);
%             result.Add(combination);
%         }
%         
%         // Combinaciones que no incluyen el primer elemento
%         result.AddRange(Combinations(tail, k));
%         
%         return result;
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c', 'd' };
%         int k = 2; // Número de elementos en la combinación
%         var combinaciones = Combinations(lista, k);
%         
%         foreach (var combo in combinaciones)
%         {
%             Console.WriteLine("Combinación: " + string.Join(", ", combo));
%         }
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado combination(K, Lista, Comb) que genera todas las 
% combinaciones de K elementos seleccionados de la lista dada.

% Caso base: cuando K es 0, la combinación es una lista vacía.
combination(0, _, []).

% Caso recursivo: incluye el primer elemento y continúa con el resto.
combination(K, [H|T], [H|Comb]) :- 
    K > 0, 
    K1 is K - 1, 
    combination(K1, T, Comb).

% Caso recursivo: no incluye el primer elemento y continúa con el resto.
combination(K, [_|T], Comb) :- 
    K > 0, 
    combination(K, T, Comb).

% Ejemplo de uso:
% ?- combination(2, [a, b, c, d], Comb).
% Comb = [a, b] ;
% Comb = [a, c] ;
% Comb = [a, d] ;
% Comb = [b, c] ;
% Comb = [b, d] ;
% Comb = [c, d]. 
% ----------------------------------------------
