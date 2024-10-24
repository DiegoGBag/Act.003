% ===============================================
% Autor: Diego Samuel Garcia Bagnis  
% Fecha: 22 de octubre de 2024 
% Descripción: Programa en Prolog que calcula la función
%              totiente de Euler usando los factores primos 
%              con multiplicidad para mejorar la eficiencia.
%              Se incluye una versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% using System.Linq;
% 
% class Program
% {
%     // Función que calcula la función totiente de Euler mejorada.
%     static int TotientImproved(int n)
%     {
%         var factors = PrimeFactorsMult(n);  // Obtenemos los factores primos con multiplicidad.
%         int phi = 1;
%         foreach (var factor in factors)
%         {
%             int p = factor.Key;  // El factor primo.
%             int m = factor.Value;  // Su multiplicidad.
%             phi *= (p - 1) * (int)Math.Pow(p, m - 1);  // Fórmula del totiente mejorada.
%         }
%         return phi;
%     }

%     static void Main()
%     {
%         int n = 315;
%         int phi = TotientImproved(n);
%         Console.WriteLine($"Totient de {n} es: {phi}");
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado totient_improved/2 que calcula la función totiente de un número
% usando los factores primos con su multiplicidad para mejorar la eficiencia.

totient_improved(N, Phi) :- 
    prime_factors_mult(N, F),  % Primero, encontramos los factores primos con multiplicidad.
    totient_phi(F, Phi).  % Calculamos el totiente usando la lista de factores.

% Ejemplo de uso:
% ?- totient_improved(315, Phi).
% Phi = 144.

% -------------------------------------------------
% Predicado auxiliar:

% Calcula el producto (P - 1) * P ** (M - 1) para cada factor primo P con su multiplicidad M.
totient_phi([], 1).  % Caso base: el producto de una lista vacía es 1.
totient_phi([[P, M]|T], Phi) :- 
    totient_phi(T, Phi1),  % Calculamos el totiente de los factores restantes.
    Phi is Phi1 * (P - 1) * P ** (M - 1).  % Fórmula para el totiente usando P y M.

% Ejemplo de uso:
% ?- totient_improved(315, Phi).
% Phi = 144.
% -------------------------------------------------
