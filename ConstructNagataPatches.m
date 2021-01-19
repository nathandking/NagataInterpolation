% construct all the Nagata patches for a given triangulation
% F: nF x 3 (faces)
% V: nV x 3 (vertices)
% N: nV x 3 (normals, per vertex)
function [] = ConstructNagataPatches(F, V, N)

M = 20; % number of points to use when plotting parametric surface with surf

for f = 1:size(F,1)
    i00 = F(f,1);
    i10 = F(f,2);
    i11 = F(f,3);
    
    [x00, x10, x11, c1, c2, c3] = NagataPatch(V(i00,:)', V(i10,:)', V(i11,:)', N(i00,:)', N(i10,:)', N(i11,:)');  
    PlotNagataPatch(x00, x10, x11, c1, c2, c3, M);
end
