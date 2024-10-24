% ===============================================
% Autor: Diego Samuel Garcia Bagnis  
% Fecha: 22 de octubre de 2024 
% Descripción: Programa en Prolog que calcula la función 
%              totiente de Euler, que cuenta cuántos números
%              menores que M son coprimos con M.
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
%     // Función que verifica si dos números son coprimos.
%     static bool AreCoprime(int x, int y)
%     {
%         return Gcd(x, y) == 1;
%     }
%     
%     // Función que calcula la función totiente de Euler.
%     static int Totient(int m)
%     {
%         int count = 0;
%         for (int i = 1; i < m; i++)
%         {
%             if (AreCoprime(m, i))
%                 count++;
%         }
%         return count;
%     }
% 
%     static void Main()
%     {
%         int m = 9;
%         Console.WriteLine($"φ({m}) = {Totient(m)}");
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado totient(M, Phi) que calcula la función 
% totiente de Euler para el número M.

% Caso base: φ(1) = 1.
totient(1, 1).

% Caso general: utiliza un acumulador para contar cuántos números menores que M son coprimos con M.
totient(M, Phi) :- 
    M > 1, 
    totient_acc(M, M, 0, Phi).

% Predicado totient_acc/4 que actúa como acumulador.
% Caso base: cuando se llega a 0, el acumulador tiene el resultado.
totient_acc(_, 0, Acc, Acc).

% Caso recursivo: si K es coprimo con M, incrementa el acumulador.
totient_acc(M, K, Acc, Phi) :- 
    K > 0, 
    coprime(M, K), 
    Acc1 is Acc + 1, 
    K1 is K - 1, 
    totient_acc(M, K1, Acc1, Phi).

% Caso recursivo: si K no es coprimo con M, continúa sin incrementar el acumulador.
totient_acc(M, K, Acc, Phi) :- 
    K > 0, 
    \+ coprime(M, K), 
    K1 is K - 1, 
    totient_acc(M, K1, Acc, Phi).

% Predicado coprime/2 que verifica si dos números son coprimos (ya definido previamente).
coprime(X, Y) :- gcd(X, Y, 1).

% Predicado gcd/3 que calcula el máximo común divisor (MCD) usando el algoritmo de Euclides.
gcd(X, 0, X) :- X > 0.
gcd(X, Y, G) :- Y > 0, R is X mod Y, gcd(Y, R, G).

% Ejemplo de uso:
% ?- totient(9, Phi).
% Phi = 6.
% ----------------------------------------------
