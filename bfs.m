%Andrés Cruz y Vera  155899
%Luis Felipe Landa Lizarralde 158228
%Mónica Elizabeth Alba González 160502
function [obasis] = bfs(P, sbasis,n)
%BFS
%   This function returns the basis that gives us the basic feasbile
%   solution. Input: P is a m column vector, sbasis is the basis vector, n
%   is the n corresponding to the number of columns of A.
obasis = zeros(1,n);
for i=1:size(sbasis,2)
    obasis(sbasis(i)) = P(i);
end
end

