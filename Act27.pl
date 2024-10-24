% ===============================================
% Autor: Diego Samuel Garcia Bagnis  
% Fecha: 22 de octubre de 2024 
% Descripción: Programa en Prolog que agrupa los elementos 
%              de un conjunto en subconjuntos disjuntos dados 
%              los tamaños de los subgrupos.
%              Se incluye una versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% using System.Linq;
% 
% class Program
% {
%     // Función para agrupar elementos en subconjuntos disjuntos.
%     static List<List<T>> Group<T>(List<T> elements, List<int> sizes)
%     {
%         if (!sizes.Any()) return new List<List<T>>(); // Si no hay tamaños, no hay grupos.
%         
%         var result = new List<List<T>>();
%         foreach (var size in sizes)
%         {
%             var group = elements.Take(size).ToList(); // Toma los primeros 'size' elementos.
%             result.Add(group);
%             elements = elements.Skip(size).ToList(); // Elimina los elementos ya agrupados.
%         }
%         return result;
%     }
% 
%     static void Main()
%     {
%         var lista = new List<char> { 'a', 'b', 'c', 'd', 'e', 'f' };
%         var tamaños = new List<int> { 2, 2, 2 }; // Tamaños de los subgrupos
%         var grupos = Group(lista, tamaños);
%         
%         foreach (var grupo in grupos)
%         {
%             Console.WriteLine("Grupo: " + string.Join(", ", grupo));
%         }
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado group(Lista, Tamaños, Grupos) que agrupa los 
% elementos de un conjunto en subconjuntos disjuntos dados 
% los tamaños de los subgrupos.

% Caso base: si la lista está vacía, los grupos también lo están.
group([], [], []).

% Caso recursivo: toma una combinación de tamaño N y agrupa.
group([N|Ns], Es, [G|Gs]) :- 
    combination(N, Es, G),           % Selecciona una combinación de tamaño N.
    subtract(Es, G, Rest),           % Elimina los elementos seleccionados del conjunto original.
    group(Ns, Rest, Gs).             % Continúa con el resto de los tamaños y elementos.

% Predicado combination(K, Lista, Comb) que genera todas las 
% combinaciones de K elementos seleccionados de la lista dada.
combination(0, _, []).
combination(K, [H|T], [H|Comb]) :- 
    K > 0, 
    K1 is K - 1, 
    combination(K1, T, Comb).
combination(K, [_|T], Comb) :- 
    K > 0, 
    combination(K, T, Comb).

% Ejemplo de uso:
% ?- group([a, b, c, d, e, f], [2, 2, 2], Grupos).
% Grupos = [[a, b], [c, d], [e, f]] ;  (El resultado puede variar)
% ----------------------------------------------
