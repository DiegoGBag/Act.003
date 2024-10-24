% ===============================================
% Autor: Diego Samuel Garcia Bagnis  
% Fecha: 22 de octubre de 2024 
% Descripción: Programa en Prolog que verifica si dos 
%              números son coprimos utilizando el MCD.
%              Se incluye una versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% 
% class Program
% {
%     // Función que calcula el MCD usando el algoritmo de Euclides.
%     static int Gcd(int x, int y)
%     {
%         while (y != 0)
%         {
%             int r = x % y;
%             x = y;
%             y = r;
%         }
%         return x;
%     }
%     
%     // Función para verificar si dos números son coprimos.
%     static bool AreCoprime(int x, int y)
%     {
%         return Gcd(x, y) == 1;  // Si el MCD es 1, los números son coprimos.
%     }
% 
%     static void Main()
%     {
%         int x = 35;
%         int y = 64;
%         Console.WriteLine($"{x} y {y} son coprimos: {AreCoprime(x, y)}");
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado coprime(X, Y) que verifica si dos números son coprimos.
% Dos números son coprimos si su MCD es 1.

% Llama al predicado gcd/3 para verificar si el MCD de X e Y es 1.
coprime(X, Y) :- gcd(X, Y, 1).

% Predicado gcd/3 que calcula el máximo común divisor (MCD).
gcd(X, 0, X) :- X > 0.
gcd(X, Y, G) :- Y > 0, R is X mod Y, gcd(Y, R, G).

% Ejemplo de uso:
% ?- coprime(35, 64).
% true.
% ?- coprime(12, 18).
% false.
% ----------------------------------------------
