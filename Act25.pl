% ===============================================
% Autor: Diego Samuel Garcia Bagnis  
% Fecha: 22 de octubre de 2024 
% Descripción: Programa en Prolog que genera una 
%              permutación aleatoria de los elementos 
%              de una lista. Utiliza la selección aleatoria 
%              para construir la permutación.
%              Se incluye una versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% using System.Linq;
% 
% class Program
% {
%     // Función para generar una permutación aleatoria de una lista en C#.
%     static List<T> RandomPermute<T>(List<T> list)
%     {
%         Random random = new Random();
%         return list.OrderBy(x => random.Next()).ToList(); // Ordena aleatoriamente la lista.
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c', 'd', 'e' };
%         List<char> permutacionAleatoria = RandomPermute(lista);
%         
%         Console.WriteLine("Permutación aleatoria: " + string.Join(", ", permutacionAleatoria));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado rnd_permu(Lista, Permutacion) que genera una 
% permutación aleatoria de los elementos de la lista.

% Utiliza la selección aleatoria para construir la permutación.
rnd_permu(L, P) :- 
    length(L, Len),     % Calcula la longitud de la lista.
    rnd_select(L, Len, P). % Selecciona todos los elementos de la lista aleatoriamente.

% Predicado rnd_select(Lista, N, Seleccion) que extrae un número 
% dado de elementos aleatorios de la lista.
rnd_select(_, 0, []). % Caso base: si N es 0, la selección es una lista vacía.
rnd_select(L, N, [X|R]) :- 
    length(L, Len), 
    random(1, Len, I), 
    element_at(X, L, I), 
    delete(L, X, L1), 
    N1 is N - 1, 
    rnd_select(L1, N1, R). % Continúa la selección recursiva.

% Predicado auxiliar para obtener el elemento en la posición I de la lista.
element_at(X, [X|_], 1). 
element_at(X, [_|T], I) :- 
    I > 1, 
    I1 is I - 1, 
    element_at(X, T, I1).

% Ejemplo de uso:
% ?- rnd_permu([a, b, c, d, e], Permutacion).
% Permutacion = [c, a, e, b, d]. (El resultado será aleatorio)
% ----------------------------------------------
