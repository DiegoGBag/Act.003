% ===============================================
% Autor: Diego Samuel Garcia Bagnis  
% Fecha: 22 de octubre de 2024 
% Descripción: Programa en Prolog que calcula el máximo 
%              común divisor (MCD) usando el algoritmo de Euclides.
%              Se incluye una versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% 
% class Program
% {
%     // Función para calcular el MCD usando el algoritmo de Euclides en C#.
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
%     static void Main()
%     {
%         int x = 56;
%         int y = 98;
%         int resultado = Gcd(x, y);
%         Console.WriteLine($"El MCD de {x} y {y} es: {resultado}");
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado gcd(X, Y, G) que calcula el máximo común divisor de X e Y.

% Caso base: cuando el segundo número es 0, el MCD es el primero.
gcd(X, 0, X) :- X > 0.

% Caso recursivo: aplica el algoritmo de Euclides.
gcd(X, Y, G) :- Y > 0, R is X mod Y, gcd(Y, R, G).

% Ejemplo de uso:
% ?- gcd(56, 98, G).
% G = 14.
% ----------------------------------------------
