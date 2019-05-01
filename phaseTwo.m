%Andrés Cruz y Vera  155899
%Luis Felipe Landa Lizarralde 158228
%Mónica Elizabeth Alba González 160502
function [bound, obasis, obfs, oval] = phaseTwo(A, b, c, sbasis, sbfs)
%PHASETWO
%   This function implements the simplex method starting with a basic 
%   feasible solution. Gets A mxn matrix with m<=n and a rank of m, b 
%   column vector with m rows, c column vector with n rows, sbasis the
%   feasible basis we obtained in the phaseOne. Output: bound = 0 if the
%   problem isn't bounded, 1 if it is bounded; obasis is a m vector of
%   indices that gives an optimal feasible basis; obfs is a n vector which 
%   is the optimal basic feasible solution corresponding to this optimal 
%   basis; oval is the objective value of this optimal basic feasible 
%   solution

%First we obtain the starting tableau of the problem
[Q, P, r, nbasis,cb, invAb] = calcTab(A, b , c, sbasis);

%we calculate the index of the variable that enters to the basis
enterVarIndex = minPositiveIndex(r);
bound = 1;
while enterVarIndex > 0 && bound == 1
    %we calculate the index of the variable that exits the basis
    exitVarIndex = getLeavingVar(P,Q,enterVarIndex);
    if exitVarIndex > 0
        %the problem is bounded, so we change the indices of the basis and
        %we calculate the next tableau
        enterValue = nbasis(enterVarIndex);
        sbasis(exitVarIndex) = enterValue;
        [Q, P, r, nbasis,cb, invAb] = calcTab(A, b, c, sbasis);
        enterVarIndex = minPositiveIndex(r);
    else
        %the problem is unbounded
        bound = 0;
    end

end
%we get the value of the objective function and the basis and the basic
%feasible solution. These values are only valid if the problem is bounded.
z0 = cb'*invAb*b;
obasis = sort(sbasis);
obfs = bfs(P,sbasis,size(A,2));
oval = z0;
end

