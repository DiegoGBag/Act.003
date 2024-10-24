% ===============================================
% Autor: Diego Samuel Garcia Bagnis  
% Fecha: 22 de octubre de 2024 
% Descripción: Programa en Prolog que verifica si un 
%              número entero dado es primo.
%              Se incluye una versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% 
% class Program
% {
%     // Función para verificar si un número es primo en C#.
%     static bool IsPrime(int number)
%     {
%         if (number <= 1) return false; // Números menores o iguales a 1 no son primos.
%         if (number == 2 || number == 3) return true; // 2 y 3 son primos.
%         if (number % 2 == 0) return false; // Números pares mayores que 2 no son primos.
%         
%         for (int i = 3; i * i <= number; i += 2)
%         {
%             if (number % i == 0) return false; // Si hay un divisor, no es primo.
%         }
%         return true; // Si no se encontró ningún divisor, es primo.
%     }
% 
%     static void Main()
%     {
%         int num = 29;
%         Console.WriteLine($"{num} es primo: {IsPrime(num)}");
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado is_prime(N) que verifica si N es un número primo.

is_prime(2).                         % 2 es primo.
is_prime(3).                         % 3 es primo.
is_prime(P) :- P > 3, P mod 2 =\= 0, \\+ has_factor(P, 3).

% Predicado has_factor(N, L) que verifica si N tiene un factor L.
has_factor(N, L) :- N mod L =:= 0.       % Si N es divisible por L, tiene un factor.
has_factor(N, L) :- L * L < N, L2 is L + 2, has_factor(N, L2). % Verifica factores impares.

% Ejemplo de uso:
% ?- is_prime(29).
% true.
% ?- is_prime(10).
% false.
% ----------------------------------------------
