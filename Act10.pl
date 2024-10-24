% ===============================================
% Autor: Diego Samuel Garcia Bagnis  
% Fecha: 22 de octubre de 2024 
% Descripción: Programa en Prolog que codifica una lista
%              usando codificación Run-Length.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para codificar una lista usando Run-Length en C#.
%     static List<Tuple<int, T>> EncodeRunLength<T>(List<T> list)
%     {
%         List<List<T>> packedList = Pack(list); // Primero agrupa los duplicados.
%         List<Tuple<int, T>> encodedList = new List<Tuple<int, T>>();
%         
%         foreach (var sublist in packedList)
%         {
%             encodedList.Add(new Tuple<int, T>(sublist.Count, sublist[0])); // Transforma las sublistas en (N, X).
%         }
%         
%         return encodedList;
%     }
%     
%     // Función auxiliar que agrupa duplicados consecutivos (Pack).
%     static List<List<T>> Pack<T>(List<T> list)
%     {
%         List<List<T>> packedList = new List<List<T>>();
%         List<T> currentSublist = new List<T> { list[0] };
%         
%         for (int i = 1; i < list.Count; i++)
%         {
%             if (list[i].Equals(list[i - 1]))
%             {
%                 currentSublist.Add(list[i]);
%             }
%             else
%             {
%                 packedList.Add(currentSublist);
%                 currentSublist = new List<T> { list[i] };
%             }
%         }
%         packedList.Add(currentSublist);
%         
%         return packedList;
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'a', 'b', 'c', 'c', 'c', 'a' };
%         List<Tuple<int, char>> listaCodificada = EncodeRunLength(lista);
%         
%         foreach (var item in listaCodificada)
%         {
%             Console.WriteLine($"({item.Item1}, {item.Item2})");
%         }
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado encode(Lista, ListaCodificada) que codifica 
% una lista usando codificación Run-Length.

% Primero agrupa los duplicados y luego transforma las sublistas en parejas (N, X).
encode(L, R) :- 
    pack(L, P),         % Agrupa duplicados consecutivos.
    transform(P, R).    % Transforma las sublistas en (N, X).

% Predicado transform/2: transforma sublistas en parejas (N, X), 
% donde N es la cantidad de elementos y X es el elemento repetido.

% Caso base: si no hay sublistas, la transformación termina.
transform([], []).

% Caso recursivo: para cada sublista, cuenta el número de elementos y lo transforma en (N, X).
transform([[X|Xs]|Ys], [[N,X]|Zs]) :- 
    length([X|Xs], N),    % Cuenta el número de elementos en la sublista.
    transform(Ys, Zs).    % Continúa transformando el resto de sublistas.

% Ejemplo de uso:
% ?- encode([a, a, b, c, c, c, a], ListaCodificada).
% ListaCodificada = [[2, a], [1, b], [3, c], [1, a]].
% ----------------------------------------------
