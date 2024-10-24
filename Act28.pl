% ===============================================
% Autor: Diego Samuel Garcia Bagnis  
% Fecha: 22 de octubre de 2024 
% Descripción: Programa en Prolog que ordena una lista 
%              de listas de acuerdo con la longitud de 
%              las sublistas.
%              Se incluye una versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% using System.Linq;
% 
% class Program
% {
%     // Función para ordenar una lista de listas según la longitud de las sublistas en C#.
%     static List<List<T>> SortByLength<T>(List<List<T>> lists)
%     {
%         return lists.OrderBy(list => list.Count).ToList(); // Ordena por longitud de las sublistas.
%     }
% 
%     static void Main()
%     {
%         var listas = new List<List<char>>
%         {
%             new List<char> { 'a', 'b' },
%             new List<char> { 'c' },
%             new List<char> { 'd', 'e', 'f' },
%             new List<char> { 'g', 'h' }
%         };
%         
%         var listasOrdenadas = SortByLength(listas);
%         
%         foreach (var lista in listasOrdenadas)
%         {
%             Console.WriteLine("Sublista: " + string.Join(", ", lista));
%         }
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado lsort(Lista, ListaOrdenada) que ordena una lista 
% de listas de acuerdo con la longitud de las sublistas.

% Ordena la lista de listas según la longitud de cada sublista.
lsort(L, S) :- 
    map_list_to_pairs(length, L, P),  % Crea pares de longitud y sublistas.
    keysort(P, SP),                   % Ordena los pares por longitud.
    pairs_values(SP, S).              % Extrae las sublistas ordenadas.

% Ejemplo de uso:
% ?- lsort([[a, b], [c], [d, e, f], [g, h]], S).
% S = [[c], [a, b], [g, h], [d, e, f]].
% ----------------------------------------------
