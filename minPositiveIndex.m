%Andrés Cruz y Vera  155899
%Luis Felipe Landa Lizarralde 158228
%Mónica Elizabeth Alba González 160502
function [i] = minPositiveIndex(r)
%MINPOSITIVEINDEX
%   Here we calculate the index that corresponds to the first
%   positive element of r.
i = 1;

while (i <= size(r,1)) && (r(i) <= 0)
    i = i +1;
end
if i > size(r,1)
    i = -1;
end
end

