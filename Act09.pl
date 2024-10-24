% ===============================================
% Autor: Diego Samuel Garcia Bagnis  
% Fecha: 22 de octubre de 2024 
% Descripción: Programa en Prolog que agrupa duplicados 
%              consecutivos de una lista en sublistas.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% using System.Linq;
% 
% class Program
% {
%     // Función para agrupar duplicados consecutivos en C#.
%     static List<List<T>> Pack<T>(List<T> list)
%     {
%         if (list == null || list.Count == 0)
%             return new List<List<T>>();
% 
%         List<List<T>> packedList = new List<List<T>>();
%         List<T> currentSublist = new List<T> { list[0] };
%         
%         for (int i = 1; i < list.Count; i++)
%         {
%             if (list[i].Equals(list[i - 1]))
%             {
%                 currentSublist.Add(list[i]); // Agrega el elemento si es igual al anterior.
%             }
%             else
%             {
%                 packedList.Add(currentSublist); // Agrega la sublista actual.
%                 currentSublist = new List<T> { list[i] }; // Inicia una nueva sublista.
%             }
%         }
%         packedList.Add(currentSublist); // Agrega la última sublista.
%         
%         return packedList;
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'a', 'b', 'c', 'c', 'c', 'a' };
%         List<List<char>> listaAgrupada = Pack(lista);
%         
%         foreach (var sublist in listaAgrupada)
%         {
%             Console.WriteLine("Sublista: " + string.Join(", ", sublist));
%         }
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado pack(Lista, ListaAgrupada) que agrupa duplicados 
% consecutivos de una lista en sublistas.

% Caso base: una lista vacía se agrupa como una lista vacía.
pack([], []).

% Caso recursivo: transfiere todos los elementos consecutivos iguales a una sublista.
pack([X|Xs], [[X|Ys]|Zs]) :- 
    transfer(X, Xs, Ys, Rest), % Transfiere elementos consecutivos iguales.
    pack(Rest, Zs).            % Agrupa el resto de la lista.

% Predicado transfer/4: transfiere los elementos duplicados consecutivos a una sublista.

% Caso base: si no quedan más elementos, se termina la transferencia.
transfer(X, [], [], []).

% Si el siguiente elemento es diferente, termina la transferencia.
transfer(X, [Y|Ys], [], [Y|Ys]) :- 
    X \= Y.

% Si el siguiente elemento es igual, agrégalo a la sublista.
transfer(X, [X|Xs], [X|Ys], Rest) :- 
    transfer(X, Xs, Ys, Rest).

% Ejemplo de uso:
% ?- pack([a, a, b, c, c, c, a], ListaAgrupada).
% ListaAgrupada = [[a, a], [b], [c, c, c], [a]].
% ----------------------------------------------
