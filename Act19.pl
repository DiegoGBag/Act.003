% ===============================================
% Autor: Diego Samuel Garcia Bagnis  
% Fecha: 22 de octubre de 2024 
% Descripción: Programa en Prolog que rota una lista N 
%              lugares a la izquierda. Utiliza la longitud 
%              de la lista para manejar rotaciones mayores 
%              que la longitud.
%              Se incluye una versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para rotar una lista N lugares a la izquierda en C#.
%     static List<T> Rotate<T>(List<T> list, int n)
%     {
%         int len = list.Count;
%         n = n % len; // Maneja rotaciones mayores que la longitud
%         List<T> result = new List<T>(list.GetRange(n, len - n));
%         result.AddRange(list.GetRange(0, n)); // Añade la parte inicial al final.
%         return result;
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c', 'd', 'e', 'f' };
%         int n = 2; // Número de posiciones a rotar
%         List<char> listaRotada = Rotate(lista, n);
%         
%         Console.WriteLine("Lista rotada: " + string.Join(", ", listaRotada));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado rotate(ListaOriginal, N, ListaRotada) que 
% rota una lista N lugares a la izquierda.

rotate(L, N, R) :- 
    length(L, Len),          % Calcula la longitud de la lista.
    N1 is N mod Len,         % Maneja rotaciones mayores que la longitud.
    split(L, N1, L1, L2),    % Divide la lista en dos partes.
    append(L2, L1, R).       % Une las partes para obtener la lista rotada.

% Ejemplo de uso:
% ?- rotate([a, b, c, d, e, f], 2, ListaRotada).
% ListaRotada = [c, d, e, f, a, b].
% ----------------------------------------------
