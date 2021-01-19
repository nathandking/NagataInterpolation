% construct triangulation of ellipsoid
function [F, V, N] = TriSphere(nV)

[x,y,z] = sphere(nV);
fvc = surf2patch(x,y,z,'triangles');
 
F = fvc.faces;
V = fvc.vertices;
 
% compute normals for the sphere
N = normalize(V,2,'norm');