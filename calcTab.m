%Andrés Cruz y Vera  155899
%Luis Felipe Landa Lizarralde 158228
%Mónica Elizabeth Alba González 160502
function [Q, P, r, nbasis, cb, invAb] = calcTab(A, b, c, sbasis)
%CALCTAB
%  This function gets the simplex tableau. Input: A mxn matrix, b column
%  vector, c column vector, sbasis row vector.

%First, we get the set of all the indices of the A column.
colSet = linspace(1,size(A,2),size(A,2));
%Calculate the indices of the columns of A that aren't part of the basis,
%then get the indices of c that are basic and the ones that are non-basic.
nbasis = setdiff(colSet,sbasis);
cb = c(sbasis,:);
cn = c(nbasis,:);

%Get the inverse of the submatrix of A with the columns that are basic. 
% Then, the submatrix of A with the columns that are non-basic.
invAb = inv(A(:,sbasis));
An = A(:,nbasis);

%Calculate Q,P and r with the formulas we saw in class.
Q = -invAb*An;

P = invAb*b;

r = cn - (cb'*invAb*An)';


end

