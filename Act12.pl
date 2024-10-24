% ===============================================
% Autor: Diego Samuel Garcia Bagnis  
% Fecha: 22 de octubre de 2024 
% Descripción: Programa en Prolog que decodifica una lista 
%              codificada mediante Run-Length.
%              Se incluye una versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para decodificar una lista codificada mediante Run-Length en C#.
%     static List<T> DecodeRunLength<T>(List<Tuple<int, T>> encodedList)
%     {
%         List<T> decodedList = new List<T>();
%         
%         foreach (var item in encodedList)
%         {
%             for (int i = 0; i < item.Item1; i++)
%             {
%                 decodedList.Add(item.Item2); // Expande el par (N, X) en N elementos X.
%             }
%         }
%         
%         return decodedList;
%     }
% 
%     static void Main()
%     {
%         List<Tuple<int, char>> listaCodificada = new List<Tuple<int, char>>
%         {
%             new Tuple<int, char>(2, 'a'),
%             new Tuple<int, char>(1, 'b'),
%             new Tuple<int, char>(3, 'c'),
%             new Tuple<int, char>(1, 'a')
%         };
%         
%         List<char> listaDecodificada = DecodeRunLength(listaCodificada);
%         
%         Console.WriteLine("Lista decodificada: " + string.Join(", ", listaDecodificada));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado decode(ListaCodificada, ListaDecodificada) que 
% decodifica una lista codificada mediante Run-Length.

% Caso base: una lista vacía decodificada es una lista vacía.
decode([], []).

% Caso recursivo: expande cada par (N, X) en una lista con N elementos X.
decode([[N,X]|T], R) :- 
    decode(T, R1),          % Decodifica el resto de la lista.
    expand(X, N, E),        % Expande el elemento X en N elementos.
    append(E, R1, R).       % Anexa la expansión al resultado decodificado.

% Predicado expand/3: expande un elemento X en una lista de longitud N.

% Caso base: si N es 0, la lista resultante es vacía.
expand(_, 0, []).

% Caso recursivo: expande X y reduce N en cada paso.
expand(X, N, [X|T]) :- 
    N > 0,                 % Asegura que N sea positivo.
    N1 is N - 1,           % Resta 1 a N.
    expand(X, N1, T).      % Continúa expandiendo X.

% Ejemplo de uso:
% ?- decode([[2, a], [1, b], [3, c], [1, a]], ListaDecodificada).
% ListaDecodificada = [a, a, b, c, c, c, a].
% ----------------------------------------------
