% ===============================================
% Autor: Diego Samuel Garcia Bagnis  
% Fecha: 22 de octubre de 2024 
% Descripción: Programa en Prolog que extrae N números 
%              aleatorios de un rango dado. Utiliza la 
%              función range para generar la lista de 
%              números y luego selecciona aleatoriamente.
%              Se incluye una versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% using System.Linq;
% 
% class Program
% {
%     // Función para extraer N números aleatorios de un rango dado en C#.
%     static List<int> Lotto(int n, int m)
%     {
%         Random random = new Random();
%         List<int> numbers = Enumerable.Range(1, m).ToList(); // Crea una lista de 1 a m.
%         return numbers.OrderBy(x => random.Next()).Take(n).ToList(); // Selecciona N números aleatorios.
%     }
% 
%     static void Main()
%     {
%         int n = 6; // Número de elementos a seleccionar
%         int m = 49; // Fin del rango
%         List<int> numerosAleatorios = Lotto(n, m);
%         
%         Console.WriteLine("Números aleatorios: " + string.Join(", ", numerosAleatorios));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado lotto(N, M, L) que extrae N números aleatorios 
% de un rango dado de 1 a M.

% Utiliza la función range para generar la lista de números
% y luego selecciona aleatoriamente.
lotto(N, M, L) :- 
    range(1, M, R),    % Genera una lista de números del 1 al M.
    rnd_select(R, N, L). % Selecciona N números aleatorios de la lista R.

% Predicado range(Inicio, Fin, Lista) que crea una lista 
% con todos los enteros dentro del rango dado.
range(I, I, [I]).
range(I, K, [I|R]) :- 
    I < K, 
    I1 is I + 1, 
    range(I1, K, R).

% Predicado rnd_select(Lista, N, Seleccion) que extrae un número 
% dado de elementos aleatorios de la lista.
rnd_select(_, 0, []).
rnd_select(L, N, [X|R]) :- 
    length(L, Len), 
    random(1, Len, I), 
    element_at(X, L, I), 
    delete(L, X, L1), 
    N1 is N - 1, 
    rnd_select(L1, N1, R).

% Predicado auxiliar para obtener el elemento en la posición I de la lista.
element_at(X, [X|_], 1). 
element_at(X, [_|T], I) :- 
    I > 1, 
    I1 is I - 1, 
    element_at(X, T, I1).

% Ejemplo de uso:
% ?- lotto(6, 49, NombresAleatorios).
% NombresAleatorios = [3, 15, 27, 8, 42, 16]. (El resultado será aleatorio)
% ----------------------------------------------
