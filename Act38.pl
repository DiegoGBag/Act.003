% ===============================================
% Autor: Diego Samuel Garcia Bagnis  
% Fecha: 22 de octubre de 2024 
% Descripción: Programa en Prolog que genera una lista
%              de números primos en un rango dado [Low, High].
% ===============================================

% -------- Código en Prolog --------------------
% Predicado prime_list/3 que genera una lista de números primos
% entre Low y High.

prime_list(Low, High, Primes) :- 
    findall(P, (between(Low, High, P), is_prime(P)), Primes).

% Ejemplo de uso:
% ?- prime_list(10, 30, Primes).
% Primes = [11, 13, 17, 19, 23, 29].

% -------------------------------------------------
% Predicado auxiliar para verificar si un número es primo.

is_prime(2).
is_prime(3).
is_prime(P) :- 
    P > 3, 
    P mod 2 =\= 0,  % El número no es divisible por 2.
    \+ has_factor(P, 3).  % Verifica si el número tiene factores.

% Predicado que verifica si un número tiene factores.
has_factor(N, L) :- 
    N mod L =:= 0.  % Si es divisible por L, tiene un factor.
has_factor(N, L) :- 
    L * L < N,  % Si el cuadrado de L es menor que N, sigue buscando factores.
    L2 is L + 2,  % Prueba con el siguiente número impar.
    has_factor(N, L2).

% -------------------------------------------------
