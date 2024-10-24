% ===============================================
% Autor: Diego Samuel Garcia Bagnis  
% Fecha: 22 de octubre de 2024 
% Descripción: Programa en Prolog que ordena una lista 
%              de listas de acuerdo con la frecuencia 
%              de la longitud de las sublistas.
%              Se incluye una versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% using System.Linq;
% 
% class Program
% {
%     // Función para contar la frecuencia de las longitudes de las sublistas en C#.
%     static List<(int Length, int Frequency)> LengthFrequency(List<List<T>> lists)
%     {
%         return lists.GroupBy(list => list.Count)
%                     .Select(group => (Length: group.Key, Frequency: group.Count()))
%                     .OrderBy(pair => pair.Length)
%                     .ToList();
%     }
% 
%     static void Main()
%     {
%         var listas = new List<List<char>>
%         {
%             new List<char> { 'a', 'b' },
%             new List<char> { 'c' },
%             new List<char> { 'd', 'e', 'f' },
%             new List<char> { 'g', 'h' },
%             new List<char> { 'i' }
%         };
%         
%         var frecuencias = LengthFrequency(listas);
%         
%         foreach (var (Length, Frequency) in frecuencias)
%         {
%             Console.WriteLine($"Longitud: {Length}, Frecuencia: {Frequency}");
%         }
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado length_frequency(Lista, Frecuencia) que ordena una lista 
% de listas de acuerdo con la frecuencia de la longitud de las sublistas.

% Calcula la frecuencia de las longitudes de las sublistas.
length_frequency(L, F) :- 
    map_list_to_pairs(length, L, P),  % Crea pares de longitud y sublistas.
    msort(P, SP),                     % Ordena los pares por longitud.
    encode(SP, F).                    % Codifica la frecuencia de las longitudes.

% Predicado encode(Lista, Frecuencia) que cuenta la frecuencia de 
% elementos en una lista de pares (Longitud, Sublista).
encode([], []).
encode([H|T], [H1|F]) :- 
    count(H, T, H1, Rest),            % Cuenta la frecuencia de H.
    encode(Rest, F).                  % Codifica el resto de la lista.

% Predicado count(E, Lista, (Longitud, Frecuencia), Resto) que cuenta 
% cuántas veces aparece un elemento en una lista.
count(E, [], (L, 1), []) :- E = (L, _).
count(E, [E|T], (L, N), T) :- E = (L, _), !, N is 1.
count(E, [H|T], F, [H|R]) :- count(E, T, F, R).

% Ejemplo de uso:
% ?- length_frequency([[a, b], [c], [d, e, f], [g, h], [i]], F).
% F = [(1, 2), (2, 2), (3, 1)].
% ----------------------------------------------
