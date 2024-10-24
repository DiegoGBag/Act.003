% ===============================================
% Autor: Diego Samuel Garcia Bagnis  
% Fecha: 22 de octubre de 2024 
% Descripción: Programa en Prolog que extrae un número 
%              dado de elementos aleatorios de una lista. 
%              Utiliza un generador de números aleatorios 
%              y elimina los elementos seleccionados.
%              Se incluye una versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% using System.Linq;
% 
% class Program
% {
%     // Función para seleccionar N elementos aleatorios de una lista en C#.
%     static List<T> RandomSelect<T>(List<T> list, int n)
%     {
%         Random random = new Random();
%         return list.OrderBy(x => random.Next()).Take(n).ToList(); // Selecciona N elementos aleatorios.
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c', 'd', 'e', 'f' };
%         int n = 3; // Número de elementos a seleccionar
%         List<char> elementosAleatorios = RandomSelect(lista, n);
%         
%         Console.WriteLine("Elementos seleccionados: " + string.Join(", ", elementosAleatorios));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado rnd_select(Lista, N, Seleccion) que extrae un número 
% dado de elementos aleatorios de la lista.

% Caso base: si N es 0, la selección es una lista vacía.
rnd_select(_, 0, []).

% Caso recursivo: selecciona un elemento aleatorio de la lista,
% elimina el elemento seleccionado y continúa con la selección.
rnd_select(L, N, [X|R]) :- 
    length(L, Len),               % Calcula la longitud de la lista.
    random(1, Len, I),            % Genera un índice aleatorio entre 1 y Len.
    element_at(X, L, I),          % Obtiene el elemento en la posición I.
    delete(L, X, L1),             % Elimina el elemento seleccionado de la lista.
    N1 is N - 1,                  % Disminuye el contador N.
    rnd_select(L1, N1, R).        % Continúa con la selección.

% Predicado auxiliar para obtener el elemento en la posición I de la lista.
element_at(X, [X|_], 1).                     % Caso base: el primer elemento.
element_at(X, [_|T], I) :- 
    I > 1, 
    I1 is I - 1, 
    element_at(X, T, I1).                    % Llama recursivamente para el resto de la lista.

% Ejemplo de uso:
% ?- rnd_select([a, b, c, d, e, f], 3, Seleccion).
% Seleccion = [c, a, e]. (El resultado será aleatorio)
% ----------------------------------------------
