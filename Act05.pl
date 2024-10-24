% ===============================================
% Autor: Diego Samuel Garcia Bagnis 20211778 
% Fecha: 22 de Octubre de 2024 
% Descripción: Programa en Prolog que invierte una lista utilizando un acumulador.
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
%     // Función para invertir una lista en C#.
%     static List<T> ReverseList<T>(List<T> list)
%     {
%         if (list == null)
%             throw new ArgumentException("La lista no puede ser null.");
%         
%         list.Reverse(); // Invierte la lista.
%         return list;
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c', 'd' };
%         List<char> listaInvertida = ReverseList(lista);
% 
%         Console.WriteLine("La lista invertida es: " + string.Join(", ", listaInvertida));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado reverse_list(List, R) que invierte la lista List 
% y guarda el resultado en R.

% Utiliza un acumulador para ir construyendo la lista invertida.
reverse_list(L, R) :- reverse_list(L, [], R).

% Caso base: cuando la lista original está vacía, el acumulador contiene la lista invertida.
reverse_list([], Acc, Acc).

% Caso recursivo: mueve el elemento de la cabeza al acumulador.
reverse_list([H|T], Acc, R) :- 
    reverse_list(T, [H|Acc], R).

% Ejemplo de uso:
% ?- reverse_list([a, b, c, d], R).
% R = [d, c, b, a].
% ----------------------------------------------
