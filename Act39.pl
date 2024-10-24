% ===============================================
% Autor: Diego Samuel Garcia Bagnis  
% Fecha: 22 de octubre de 2024 
% Descripción: Programa en Prolog que encuentra dos números 
%              primos que sumen un número par dado, según la 
%              conjetura de Goldbach.
% ===============================================

% -------- Código en Prolog --------------------
% Predicado goldbach/2 que encuentra dos números primos cuya
% suma es un número par dado N.

goldbach(N, [P1, P2]) :- 
    N > 2,              % N debe ser mayor que 2.
    N mod 2 =:= 0,      % N debe ser un número par.
    prime_list(2, N, Primes),  % Genera una lista de primos entre 2 y N.
    member(P1, Primes),        % Selecciona un primo P1 de la lista.
    P2 is N - P1,              % Calcula el segundo primo P2.
    is_prime(P2).              % Verifica que P2 sea primo.

% Ejemplo de uso:
% ?- goldbach(28, Primes).
% Primes = [5, 23].

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
% Predicado para generar una lista de números primos en un rango dado.
prime_list(Low, High, Primes) :- 
    findall(P, (between(Low, High, P), is_prime(P)), Primes).

% -------------------------------------------------
