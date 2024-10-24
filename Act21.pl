% ===============================================
% Autor: Diego Samuel Garcia Bagnis  
% Fecha: 22 de octubre de 2024 
% Descripción: Programa en Prolog que inserta un elemento 
%              en una lista en la posición dada. El índice 
%              K debe ser mayor que 0.
%              Se incluye una versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para insertar un elemento en una lista en la posición dada en C#.
%     static List<T> InsertAt<T>(List<T> list, T element, int k)
%     {
%         List<T> result = new List<T>(list);
%         result.Insert(k - 1, element); // Inserta el elemento en la posición k-1.
%         return result;
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c', 'd', 'e', 'f' };
%         char elemento = 'x'; // Elemento a insertar
%         int k = 3; // Índice de la posición donde se va a insertar
%         List<char> listaModificada = InsertAt(lista, elemento, k);
%         
%         Console.WriteLine("Lista modificada: " + string.Join(", ", listaModificada));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado insert_at(Elemento, ListaOriginal, K, ListaResultante) que 
% inserta un elemento en la lista en la posición K.

% Caso base: si K es 1, se inserta el elemento al principio de la lista.
insert_at(X, L, 1, [X|L]).

% Caso recursivo: si K es mayor que 1, se conserva el primer elemento 
% y se continúa buscando la posición en el resto de la lista.
insert_at(X, [H|T], K, [H|R]) :- 
    K > 1, 
    K1 is K - 1, 
    insert_at(X, T, K1, R).

% Ejemplo de uso:
% ?- insert_at(x, [a, b, c, d, e, f], 3, ListaResultante).
% ListaResultante = [a, b, x, c, d, e, f].
% ----------------------------------------------
