%Andrés Cruz y Vera  155899
%Luis Felipe Landa Lizarralde 158228
%Mónica Elizabeth Alba González 160502
function [index] = getLeavingVar(P, Q, enterVarIndex)
%GETLEAVINGVAR
%   We calculate the variable of the basis that most leave in the next step
%   of the Simplex Method. Receives P, Q and the index of the variable
%   that enters the basis regarding the non-basic vector. We return  the 
%   index of the variable that will exit the basis regarding the basic
%   vector.

%We initialize the variables. We first asume that there will be no such
%element.
min = inf;
index = -1; 
%if the index remains -1, then the problem is unbounded
for i = 1:size(P,1)
    if Q(i,enterVarIndex) < 0
        constraint = -P(i,1)/Q(i,enterVarIndex);
        if min > constraint
            min = constraint;
            index = i;
        end
    end
end
end

