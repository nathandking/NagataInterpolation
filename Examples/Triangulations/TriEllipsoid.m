% construct triangulation of ellipsoid
function [F, V, N] = TriEllipsoid(nV)

xr = 2; yr = 1; zr = 1; % axis lengths of ellipsoid
[x,y,z] = ellipsoid(0, 0, 0, xr, yr, zr, nV);
fvc = surf2patch(x, y, z, 'triangles');

F = fvc.faces;
V = fvc.vertices;
 
% compute normals for the ellipsoid
N = zeros(size(V));
N(:,1) = 2 * V(:,1) / xr^2;
N(:,2) = 2 * V(:,2) / yr^2;
N(:,3) = 2 * V(:,3) / zr^2;

N = normalize(N,2,'norm');