% ===============================================
% Autor: Diego Samuel Garcia Bagnis  
% Fecha: 22 de octubre de 2024 
% Descripción: Programa en Prolog que modifica la 
%              codificación Run-Length de una lista.
%              Si un elemento no tiene duplicados, se mantiene sin empaquetar.
%              Se incluye una versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para modificar la codificación Run-Length en C#.
%     static List<object> EncodeModified<T>(List<T> list)
%     {
%         List<Tuple<int, T>> encodedList = EncodeRunLength(list); // Codifica la lista.
%         List<object> modifiedList = new List<object>();
%         
%         foreach (var item in encodedList)
%         {
%             if (item.Item1 == 1)
%             {
%                 modifiedList.Add(item.Item2); // Si no hay duplicados, agrega el elemento directamente.
%             }
%             else
%             {
%                 modifiedList.Add(item); // Si hay duplicados, mantiene el formato (N, X).
%             }
%         }
%         
%         return modifiedList;
%     }
%     
%     // Función auxiliar para codificar usando Run-Length (igual que antes).
%     static List<Tuple<int, T>> EncodeRunLength<T>(List<T> list)
%     {
%         List<List<T>> packedList = Pack(list);
%         List<Tuple<int, T>> encodedList = new List<Tuple<int, T>>();
%         
%         foreach (var sublist in packedList)
%         {
%             encodedList.Add(new Tuple<int, T>(sublist.Count, sublist[0]));
%         }
%         
%         return encodedList;
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'a', 'b', 'c', 'c', 'c', 'a' };
%         List<object> listaModificada = EncodeModified(lista);
%         
%         foreach (var item in listaModificada)
%         {
%             Console.WriteLine(item is Tuple<int, char> ? $"({((Tuple<int, char>)item).Item1}, {((Tuple<int, char>)item).Item2})" : item.ToString());
%         }
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado encode_modified(Lista, ListaModificada) que 
% modifica la codificación Run-Length de una lista.

% Primero realiza la codificación Run-Length y luego modifica el resultado.
encode_modified(L, R) :- 
    encode(L, Enc),      % Codifica la lista.
    modify(Enc, R).      % Modifica la codificación.

% Predicado modify/2: modifica la lista codificada.

% Caso base: si la lista codificada está vacía, no hay nada que modificar.
modify([], []).

% Caso recursivo: si un elemento no tiene duplicados, lo agrega directamente.
modify([[1,X]|T], [X|R]) :- 
    modify(T, R).

% Caso recursivo: si un elemento tiene duplicados, lo mantiene en el formato (N, X).
modify([[N,X]|T], [[N,X]|R]) :- 
    N > 1, 
    modify(T, R).

% Ejemplo de uso:
% ?- encode_modified([a, a, b, c, c, c, a], ListaModificada).
% ListaModificada = [[2, a], b, [3, c], a].
% ----------------------------------------------
