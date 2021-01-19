% test Nagata triangular patch interpolation in 3D
addpath(genpath('../'));

%% create triangulation
% TriFunc = @TriSphere;
TriFunc = @TriEllipsoid;
[F, V, N] = TriFunc(4);

%% Plot the input triangulation (green edges and blue faces)
figure;
hold on
patch('Faces', F, 'Vertices', V, 'EdgeColor', [0.4660, 0.6740, 0.1880], 'FaceColor', [0, 0.4470, 0.7410]);
% quiver3(V(:,1), V(:,2), V(:,3), N(:,1), N(:,2), N(:,3), 0.25,'k')
camlight
material dull
axis equal
axis off
view(150,25)

%% Plot Nagata curves (orange), Nagata patches (blue), and normals (black)
figure;
hold on
ConstructNagataPatches(F, V, N);
ConstructNagataCurves(F, V, N);
% quiver3(V(:,1), V(:,2), V(:,3), N(:,1), N(:,2), N(:,3), 0.25, 'k')
camlight
material dull
axis equal
axis off
view(150,25)

%% To see "actual" surface, use fine triangulation
% [F, V, ~] = TriFunc(80);
% figure;
% patch('Faces', F, 'Vertices', V,'EdgeColor','none','FaceColor',[0 0.4470 0.7410])
% camlight
% material dull
% axis equal
% axis off
% view(150,25)