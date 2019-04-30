% %Bounded:
% A=[-1 1 1 0 0;1 0 0 1 0;0 1 0 0 1];
% b=[1;3;2];
% c=[1 1 0 0 0]';
% sbasis=[3 4 5];
% sbfs=[1 3 2];
% [bound, obasis, obfs, oval] = phaseTwo(A,b,c,sbasis,sbfs)
% 
% %Unbounded
% A=[1 -1 1 0;-1 1 0 1];
% b=[1 2]';
% c=[1 0 0 0]';
% sbasis=[3 4];
% sbfs=[1 2];
% [bound, obasis, obfs, oval] = phaseTwo(A,b,c,sbasis,sbfs)
% 
% %Auxiliary problem example
% A = [1 3 1; 0 2 1];
% b = [4 2]';
% c = [1 2 0]';
% [nvac, basis, bfs] = phaseOne(A, b, c)
% 
% %Degeneracy
% A = [-1 1 1 0; 1 0 0 1];
% b = [0 2]';
% c = [0 1 0 0]';
% [status, obasis , obfs, oval] = bothPhases(A, b, c)
% 
% %Infeasibility
% A = [1 3 1 1 0; 0 2 1 0 1];
% b = [4 2]';
% c = [1 2 0 0 0]';
% [status, obasis , obfs, oval] = bothPhases(A, b, c)

%Infeasibility 2
A = [-1 -1];
b = [0];
c = [1 0]';
[nvac, basis, bfs] = phaseOne(A, b, c)

% %Pruebas de Andy
% A = [2 1 0 1 0 0;1 2 -2 0 1 0;0 1 2 0 0 1];
% b = [10 20 5]';
% c = [2 -1 2 0 0 0]';
% [status, obasis , obfs, oval] = bothPhases(A, b, c)
% 
% A = [1 1 3 1 0;-2 0 2 0 1];
% b = [5 -1]';
% c = [1 1 0 0 0]';
% [status, obasis , obfs, oval] = bothPhases(A, b, c)
% 
% A = [4 1 1 0 0;2 3 1 1 0;1 2 3 0 1];
% b = [30 60 40]';
% c = [3 2 1 0 0]';
% [status, obasis , obfs, oval] = bothPhases(A, b, c)
% 
% A = [4 0 0 1 0 0;6 1 0 0 1 0;18 6 1 0 0 1];
% b = [1 9 81]';
% c = [9 3 1 0 0 0]';
% [status, obasis , obfs, oval] = bothPhases(A, b, c)
% 
% A = [1 2 3/2 1 0 0;2/3 2/3 1 0 1 0;1/2 1/3 1/2 0 0 1];
% b = [12000 4600 2400]';
% c = [11 16 15 0 0 0]';
% [status, obasis , obfs, oval] = bothPhases(A, b, c)