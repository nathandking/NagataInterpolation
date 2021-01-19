% example of a circle triangulated using parametric representation
function [F, V, N] = TriCircle(nV)

V = zeros(nV+1,2);

% use parametric representation of unit circle
th = (0:(2*pi/nV):(2*pi))';

V(:,1) = cos(th);
V(:,2) = sin(th);
 
% join edges in order of increasing parameter
F = zeros(nV, 2);
F(:,1) = 1:nV;
F(:,2) = 2:nV+1;
F(nV,2) = 1;
 
% compute normals for the circle
N = normalize(V,2,'norm');