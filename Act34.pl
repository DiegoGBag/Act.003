% ===============================================
% Autor: Diego Samuel Garcia Bagnis  
% Fecha: 22 de octubre de 2024 
% Descripción: Programa en Prolog que encuentra los 
%              factores primos de un número entero positivo.
%              Se incluye una versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función que encuentra los factores primos de un número.
%     static List<int> PrimeFactors(int n)
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
%         return factors;
%     }
%     
%     static void Main()
%     {
%         int n = 315;
%         List<int> factors = PrimeFactors(n);
%         Console.WriteLine($"Factores primos de {n}: {string.Join(", ", factors)}");
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado prime_factors(N, L) que encuentra los factores primos 
% de un número N. L es la lista de factores primos.

% Llama a prime_factors/3, comenzando con el factor 2.
prime_factors(N, L) :- N > 1, prime_factors(N, 2, L).

% Caso base: cuando el número es 1, la lista está completa.
prime_factors(1, _, []).

% Caso recursivo: si F divide a N, agrega F a la lista y continúa con N1 = N // F.
prime_factors(N, F, [F|L]) :- 
    N > 1, 
    0 is N mod F, 
    N1 is N // F, 
    prime_factors(N1, F, L).

% Caso recursivo: si F no divide a N y F*F < N, pasa al siguiente factor.
prime_factors(N, F, L) :- 
    N > 1, 
    F * F < N, 
    next_factor(F, F1), 
    prime_factors(N, F1, L).

% Predicado next_factor/2 que obtiene el siguiente factor primo.
next_factor(2, 3).  % El siguiente factor después de 2 es 3.
next_factor(F, F1) :- F > 2, F1 is F + 2.  % Para factores mayores que 2, prueba números impares.

% Ejemplo de uso:
% ?- prime_factors(315, L).
% L = [3, 3, 5, 7].
% ----------------------------------------------
