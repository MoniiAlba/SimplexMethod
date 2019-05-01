%Andrés Cruz y Vera  155899
%Luis Felipe Landa Lizarralde 158228
%Mónica Elizabeth Alba González 160502
function [status, obasis , obfs, oval] = bothPhases(A, b, c)
%BOTH PHASES 
% Complete Simplex method implementation. Receives A mxn matrix with m<=n
%  and a rank of m, b column vector with m rows, c column vector with n
%  rows. Output: status = -1 if the problem is infeasible, = 0 if the
%  problem is unbouded, = 1 if the problem is bounded. obasis is a vector 
%  of size m of indices of an optimal feasible basis for the problem 
%  if the feasible set is non-empty and the problem is bounded. obfs is a n
%  vector which is the optimal basic feasible solution corresponding to
%  this optimal basis. oval is the objective value of this optimal basic 
%  feasible solution

%We initialize variables
oval = 0;
obfs = [];
obasis = [];

%Start with suposition that problem is infeasible
status = -1;

%PHASE ONE
[nvac, sbasis, sbfs] = phaseOne(A, b, c);
if nvac == 1
    %Feasible set non empty
    %Start phase two
    [bound, obasis, obfs, oval] = phaseTwo(A, b, c, sbasis, sbfs);
    if bound == 0
        %Problem is unbounded
        status = 0;
    else
        %Problem is bounded
        status = 1;
    end


end

