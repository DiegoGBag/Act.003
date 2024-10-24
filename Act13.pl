% ===============================================
% Autor: Diego Samuel Garcia Bagnis  
% Fecha: 22 de octubre de 2024 
% Descripción: Programa en Prolog que codifica directamente 
%              una lista usando codificación Run-Length.
%              Se incluye una versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para codificar directamente una lista usando Run-Length en C#.
%     static List<Tuple<int, T>> EncodeDirectRunLength<T>(List<T> list)
%     {
%         List<Tuple<int, T>> encodedList = new List<Tuple<int, T>>();
%         
%         int count = 1;
%         for (int i = 1; i <= list.Count; i++)
%         {
%             if (i < list.Count && list[i].Equals(list[i - 1]))
%             {
%                 count++; // Cuenta los elementos consecutivos iguales.
%             }
%             else
%             {
%                 encodedList.Add(new Tuple<int, T>(count, list[i - 1])); // Añade el par (N, X).
%                 count = 1; // Resetea el contador.
%             }
%         }
%         
%         return encodedList;
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'a', 'b', 'c', 'c', 'c', 'a' };
%         List<Tuple<int, char>> listaCodificadaDirectamente = EncodeDirectRunLength(lista);
%         
%         foreach (var item in listaCodificadaDirectamente)
%         {
%             Console.WriteLine($"({item.Item1}, {item.Item2})");
%         }
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado encode_direct(Lista, ListaCodificada) que codifica directamente
% una lista usando codificación Run-Length.

% Caso base: una lista vacía produce una lista vacía codificada.
encode_direct([], []).

% Caso recursivo: cuenta cuántos elementos consecutivos son iguales y continúa codificando.
encode_direct([X|Xs], [[N,X]|R]) :- 
    count(X, [X|Xs], N, Rest),  % Cuenta cuántos elementos consecutivos son iguales.
    encode_direct(Rest, R).     % Continúa codificando el resto de la lista.

% Predicado count/4: cuenta cuántos elementos consecutivos son iguales.

% Caso base: si la lista está vacía, no hay elementos iguales.
count(_, [], 0, []).

% Caso recursivo: si el siguiente elemento es igual, incrementa el contador.
count(X, [X|Xs], N, Rest) :- 
    count(X, Xs, N1, Rest),  % Cuenta recursivamente.
    N is N1 + 1.             % Incrementa el contador.

% Caso recursivo: si el siguiente elemento es diferente, termina la cuenta.
count(X, [Y|Ys], 0, [Y|Ys]) :- 
    X \= Y.                 % Si los elementos son diferentes, la cuenta termina.

% Ejemplo de uso:
% ?- encode_direct([a, a, b, c, c, c, a], ListaCodificada).
% ListaCodificada = [[2, a], [1, b], [3, c], [1, a]].
% ----------------------------------------------
