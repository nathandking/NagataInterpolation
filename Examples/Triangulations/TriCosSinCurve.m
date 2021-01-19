% example of a star triangulated using parametric representation
function [F, V, N] = TriCosSinCurve(nV)

V = zeros(nV+1,2);

% parameterised curve:
xt = @(t) 0.02 * sqrt(5) + (0.5 + 0.2 * sin(5 * t)) .* cos(t);
yt = @(t) 0.02 * sqrt(5) + (0.5 + 0.2 * sin(5 * t)) .* sin(t);

th = linspace(0, 2 * pi, nV+1)';

V(:,1) = xt(th);
V(:,2) = yt(th);

% join edges in order of increasing parameter
F = zeros(nV, 2);
F(:,1) = 1:nV;
F(:,2) = 2:nV+1;
F(nV,2) = 1;
 
% compute normals for the CosSinCurve
% derivative of parametrisation, gives tangent:
dx = @(t) -sin(t) .* (0.2 * sin(5 * t) + 0.5) + cos(t) .* cos(5 * t);
dy = @(t) cos(t) .* (0.2 * sin(5 * t) + 0.5) + sin(t) .* cos(5 * t);

% negate one and swap x and y to get normal vector
N = zeros(size(V));
N(:,1) = dy(th);
N(:,2) = -dx(th);
N = normalize(N,2,'norm');