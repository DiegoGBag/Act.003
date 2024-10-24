% ===============================================
% Autor: Diego Samuel Garcia Bagnis  
% Fecha: 22 de octubre de 2024 
% Descripción: Programa en Prolog que aplana 
%              una lista anidada en una lista simple.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para aplanar una lista anidada en C#.
%     static List<T> MyFlatten<T>(List<object> list)
%     {
%         List<T> flatList = new List<T>();
%         
%         foreach (var element in list)
%         {
%             if (element is List<object>)
%             {
%                 flatList.AddRange(MyFlatten<T>((List<object>)element)); // Aplana recursivamente.
%             }
%             else
%             {
%                 flatList.Add((T)element); // Agrega el elemento si no es lista.
%             }
%         }
%         
%         return flatList;
%     }
% 
%     static void Main()
%     {
%         List<object> listaAnidada = new List<object> 
%         { 
%             'a', new List<object> { 'b', 'c' }, 'd' 
%         };
%         
%         List<char> listaAplanada = MyFlatten<char>(listaAnidada);
%         
%         Console.WriteLine("Lista aplanada: " + string.Join(", ", listaAplanada));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado my_flatten(Lista, ListaAplanada) que aplana 
% una lista anidada en una lista simple.

% Caso base: la lista vacía se aplana a una lista vacía.
my_flatten([], []).

% Caso recursivo: si la cabeza es una lista, aplana la cabeza y la cola recursivamente.
my_flatten([H|T], Flat) :- 
    my_flatten(H, FH),    % Aplana la cabeza.
    my_flatten(T, FT),    % Aplana la cola.
    append(FH, FT, Flat). % Combina los resultados.

% Si la cabeza no es una lista, simplemente agrégala al resultado.
my_flatten(X, [X]) :- 
    X \= [],              % Verifica que no sea una lista vacía.
    \+ is_list(X).        % Verifica que no sea una lista.

% Ejemplo de uso:
% ?- my_flatten([a, [b, c], d], ListaAplanada).
% ListaAplanada = [a, b, c, d].
% ----------------------------------------------
