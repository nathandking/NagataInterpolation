% plot Nagata curve based on coefficients for parametric representation
function [] = PlotNagataCurve(x0, d, c, M)

dim = size(x0,1);

x = cell(dim, 1);
t = linspace(0,1,M);
for i = 1:dim
    x{i} = x0(i) + (d(i) - c(i)) * t + c(i) * t.^2;
end

if(dim == 2)
    plot(x{1}, x{2}, 'Color', [0.8500, 0.3250, 0.0980], 'LineWidth', 1);
elseif(dim == 3)
    plot3(x{1}, x{2}, x{3}, 'Color', [0.8500, 0.3250, 0.0980], 'LineWidth', 1);
else
    error('unsupported dimension');
end