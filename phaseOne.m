%Andrés Cruz y Vera  155899
%Luis Felipe Landa Lizarralde 158228
%Mónica Elizabeth Alba González 160502
function [nvac, basis, bfs] = phaseOne(A, b, c)
%PHASEONE
%  First phase of simplex method, we find a basic feasible solution, if 
%  it exists. Here we receive A mxn matrix with m<=n
%  and a rank of m, b column vector with m rows, c column vector with n
%  rows.
%  Output: nvac = 0 if the feasible set is empty; nvac = 1 if the feasible 
%  set is non-empty; basis = a m vector of indices of column vectors
%  for a feasible basis for the problem if the feasible set is
%  non-empty; bfs = a n vector of the basic feasible solution corresponding
%  to this basis.

%We start by asuming non feasibility
nvac = 0;
basis = [];
bfs = [];

%We first convert the problem so that b>=0
for i = 1:size(b,1)
    if b(i) < 0 
        A(i,:) = A(i,:)*(-1);
        b(i) = b(i)*(-1);
    end
end

 %Formulate the auxiliary Linear Program
 Aprime = [A eye(size(A,1))];
 cPrime = [ zeros(size(A,2),1) ; ones(size(A,1),1)]*(-1);
 sbasisAux = linspace(size(A,2)+1, size(A,2)+size(A,1), size(A,1));
 sbfs = [];
 %Run Simplex method for aux program
 [bound, obasis, obfs, oval] = phaseTwo(Aprime,b,cPrime,sbasisAux,sbfs);

 %If auxiliary objetive function reaches 0 then it's feasible set is non empty
 %and we obtain a feasible basis by removing auxiliary variables
 if oval == 0
     nvac = 1;
     bfs = obfs(1:size(A,2));
     %if the basis does not include correction variables, the first phase
     %is finished
     if max(obasis)<= size(A,2)
        basis = obasis;
     else
         %if the basis includes correction variables, we must fix the
         %basis.
         colSet = linspace(1,size(A,2),size(A,2));
         nbasis = setdiff(colSet,obasis);
         count = 1;
         tempbasis = [];
         %while there are correction variables in the basis, we replace
         %them with variables from the non-basis whose columns mantain 
         %linear independence.
         while max(obasis) > size(A,2) && count <= size(nbasis,2)
            out = max(obasis);
            tempbasis = [setdiff(obasis,out),nbasis(count)];
            if rank(A(:,tempbasis)) == size(A,1)
                ind1 = find(obasis == out); %index of maximum value
                obasis(ind1) = nbasis(count);
                nbasis(count) = out;
            end
            count = count +1;
         end
         basis = obasis;
     end
 end
end