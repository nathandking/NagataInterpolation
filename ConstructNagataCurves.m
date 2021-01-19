% Construct all the Nagata curves for a given triangulation
% In 2D, we have just a single curve per line segment
% In 3D, we have 3 boundary curves for each triangle
% F: nF x dim (faces)
% V: nV x dim (vertices)
% N: nV x dim (normals, per vertex)
function [] = ConstructNagataCurves(F, V, N)

dim = size(V,2);
M = 16; % number of points to use when plotting curves

if(dim == 2)
    for f = 1:size(F,1)
        i0 = F(f,1);
        i1 = F(f,2);
        [x0, d, c] = NagataCurve(V(i0,:)', V(i1,:)', N(i0,:)', N(i1,:)'); 
        PlotNagataCurve(x0, d, c, M);
    end
elseif(dim == 3)
    for f = 1:size(F,1)
        % do the three vertex combinations for each triangle
        i0 = F(f,1);
        i1 = F(f,2);
        [x0, d, c] = NagataCurve(V(i0,:)', V(i1,:)', N(i0,:)', N(i1,:)');  
        PlotNagataCurve(x0, d, c, M);

        i0 = F(f,1);
        i1 = F(f,3);
        [x0, d, c] = NagataCurve(V(i0,:)', V(i1,:)', N(i0,:)', N(i1,:)'); 
        PlotNagataCurve(x0, d, c, M);

        i0 = F(f,3);
        i1 = F(f,2);
        [x0, d, c] = NagataCurve(V(i0,:)', V(i1,:)', N(i0,:)', N(i1,:)');
        PlotNagataCurve(x0, d, c, M);
    end
else
    error('unsupported dimension')
end
