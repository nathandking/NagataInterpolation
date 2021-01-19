% test boundary curve code in 2D
addpath(genpath('../'));

%% create triangulation (in 2D, just line segments)
% TriFunc = @TriCircle;
TriFunc = @TriCosSinCurve;
[F, V, N] = TriFunc(15);

%% plot of Nagata curves (orange), input normals (black), and input triangulation (green)
figure;
hold on
ConstructNagataCurves(F, V, N);
quiver(V(:,1), V(:,2), N(:,1), N(:,2), 0.125,'k')
plot(V(:,1), V(:,2),'Color',[0.4660, 0.6740, 0.1880])
axis equal
axis off

%% To see "actual" surface, use fine triangulation
% [F, V, ~] = TriFunc(120);
% figure;
% plot(V(:,1), V(:,2),'Color',[0.4660, 0.6740, 0.1880])
% axis equal
% axis off