% ===============================================
% Autor: Diego Samuel Garcia Bagnis  
% Fecha: 22 de octubre de 2024 
% Descripción: Programa en Prolog que encuentra los 
%              factores primos de un número con su multiplicidad.
%              Se incluye una versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% using System.Linq;
% 
% class Program
% {
%     // Función que encuentra los factores primos y sus multiplicidades.
%     static Dictionary<int, int> PrimeFactorsMult(int n)
%     {
%         List<int> factors = new List<int>();
%         int divisor = 2;
%         while (n > 1)
%         {
%             while (n % divisor == 0)
%             {
%                 factors.Add(divisor);
%                 n /= divisor;
%             }
%             divisor = divisor == 2 ? 3 : divisor + 2;  // Pasa al siguiente factor.
%         }
%         
%         // Agrupa los factores y cuenta sus apariciones.
%         return factors.GroupBy(f => f).ToDictionary(g => g.Key, g => g.Count());
%     }
%     
%     static void Main()
%     {
%         int n = 315;
%         var factors = PrimeFactorsMult(n);
%         foreach (var factor in factors)
%         {
%             Console.WriteLine($"Factor: {factor.Key}, Multiplicidad: {factor.Value}");
%         }
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado prime_factors_mult(N, L) que encuentra los factores primos 
% de un número N con su multiplicidad. L es la lista de pares (Factor, Multiplicidad).

prime_factors_mult(N, L) :- 
    prime_factors(N, F),  % Primero, encuentra los factores primos.
    encode(F, L).  % Luego, codifica la lista de factores con sus multiplicidades.

% Ejemplo de uso:
% ?- prime_factors_mult(315, L).
% L = [(3,2), (5,1), (7,1)].

% -------------------------------------------------
% Predicados auxiliares:

% Predicado encode/2: Codifica una lista en pares (Elemento, Frecuencia).
encode([], []).
encode([H|T], [(H, N)|R]) :- 
    count(H, [H|T], N), 
    remove_all(H, T, T1), 
    encode(T1, R).

% Predicado count/3: Cuenta las ocurrencias de un elemento en una lista.
count(_, [], 0).
count(X, [X|T], N) :- 
    count(X, T, N1), 
    N is N1 + 1.
count(X, [_|T], N) :- 
    count(X, T, N).

% Predicado remove_all/3: Elimina todas las ocurrencias de un elemento en una lista.
remove_all(_, [], []).
remove_all(X, [X|T], L) :- 
    remove_all(X, T, L).
remove_all(X, [H|T], [H|R]) :- 
    remove_all(X, T, R).

% Ejemplo de uso:
% ?- prime_factors_mult(315, L).
% L = [(3, 2), (5, 1), (7, 1)].
% ----------------------------------------------
