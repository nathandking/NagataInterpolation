% compute coefficents for Nagata curves in 2D/3D
function [x0, d, c] = NagataCurve(x0, x1, n0, n1)

d = x1-x0;
c = ComputeCurvature(d, n0, n1);