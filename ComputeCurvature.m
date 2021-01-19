% Compute the curvature coefficent c in Nagata 2005
function [cvec] = ComputeCurvature(d, n0, n1)

dim = size(d,1);
angleTol = cos(0.1*pi/180); % tolerance to consider normals parallel, corresponding to a straight line, i.e., c = 0.

if(dim == 2)
    A = [n0'; n1'];
    rhs = [n0' * d; -n1' * d];
    
    c = n0' * n1;
    if(abs(c) <= angleTol)
        cvec = A\rhs;
    else
        cvec = zeros(size(d));
    end
    
elseif(dim == 3)
    v = 0.5 * (n0 + n1);
    Deltav = 0.5 * (n0 - n1);

    dv = d'*v;
    dDeltav = d' * Deltav;

    Deltac = n0' * Deltav;
    c = 1 - 2 * Deltac;

    if(abs(c) <= angleTol)
        cvec = (dDeltav / (1 - Deltac)) * v + (dv / Deltac) * Deltav;
    else
        cvec = zeros(size(d));
    end
    
else
    error('unsupported dimension')
end