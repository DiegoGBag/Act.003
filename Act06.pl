% ===============================================
% Autor: Diego Samuel Garcia Bagnis 20211778 
% Fecha: 22 de Octubre de 2024 
% Descripción: Programa en Prolog que verifica si una lista es un palíndromo.
%
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para verificar si una lista es un palíndromo en C#.
%     static bool IsPalindrome<T>(List<T> list)
%     {
%         if (list == null)
%             throw new ArgumentException("La lista no puede ser null.");
%         
%         List<T> reversedList = new List<T>(list);
%         reversedList.Reverse(); // Invertir la lista.
%         
%         return list.SequenceEqual(reversedList); // Verificar si es igual a su inversa.
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'b', 'a' };
%         bool esPalindromo = IsPalindrome(lista);
% 
%         Console.WriteLine("La lista es un palíndromo: " + esPalindromo);
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado palindrome(List) que verifica si la lista List
% es un palíndromo (es igual a su inversa).

palindrome(L) :- reverse_list(L, L).

% Ejemplo de uso:
% ?- palindrome([a, b, b, a]).
% true.

% ?- palindrome([a, b, c, d]).
% false.
% ----------------------------------------------
