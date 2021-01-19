% plot Nagata patch based on coefficients for parametric representation
function [] = PlotNagataPatch(x00, x10, x11, c1, c2, c3, M)

% note that replacing c1, c2, c3 with zero vectors gives linear interpolation
x = @(u,v) x00(1) * (1-u) + x10(1) * (u-v) + x11(1) * v - c1(1) * (1-u) .* (u-v) - c2(1) * (u-v) .* v - c3(1) * (1-u) .* v;
y = @(u,v) x00(2) * (1-u) + x10(2) * (u-v) + x11(2) * v - c1(2) * (1-u) .* (u-v) - c2(2) * (u-v) .* v - c3(2) * (1-u) .* v;
z = @(u,v) x00(3) * (1-u) + x10(3) * (u-v) + x11(3) * v - c1(3) * (1-u) .* (u-v) - c2(3) * (u-v) .* v - c3(3) * (1-u) .* v;

u = linspace(0,1,M); 
v = linspace(0,1,M); 
[U, V] = ndgrid(u,v);

uu = tril(U); % only want the lower triangle of the parameters
vv = tril(V);

X = x(uu,vv);
Y = y(uu,vv);
Z = z(uu,vv);

fvc = surf2patch(X,Y,Z,'triangles');

patch('Faces', fvc.faces, 'Vertices', fvc.vertices,'EdgeColor','none','FaceColor',[0 0.4470 0.7410])