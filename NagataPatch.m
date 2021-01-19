% compute coefficients of the Nagata patch in 3D
function [x00, x10, x11, c1, c2, c3] = NagataPatch(x00, x10, x11, n00, n10, n11)

c1 = ComputeCurvature(x10 - x00, n00, n10);
c2 = ComputeCurvature(x11 - x10, n10, n11);
c3 = ComputeCurvature(x11 - x00, n00, n11);



