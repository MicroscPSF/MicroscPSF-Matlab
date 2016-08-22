function J = aux_Bessel(order, x)
%AUX_BESSEL An polynominal approximation of Bessel function of first kind
%   AUX_BESSEL(order, x) compute the bessel value of x according to order (0 or 1)
%
%   The principle is based on (Milton Abramowitz, I.A.S., 1964. Handbook
%   of Mathematical Functions with Formulas, Graphs, and Mathematical Tables,
%   p. 369-370)
%
%   (1)$$-3 \leq x \leq 3$$
%      $$J_0(x) = 1-2.249997(x/3)^2 + 1.2656208(x/3)^4 - 0.3163866(x/3)^6 +
%      0.0444479(x/3)^8 - 0.0039444(x/3)^{10} + 0.0002100(x/3)^{12} +
%      \epsilon, |\epsilon|<5\times 10^{-8}$$
%      $$x^{-1}J_1(x) = 0.5 - 0.56249985(x/3)^2 + 0.21093573(x/3)^4 -
%      0.03954289(x/3)^6 + 0.00443319(x/3)^8 - 0.00031761(x/3)^{10} +
%      0.00001109(x/3)^{12} + \epsilon, |\epsilon| < 1.3\times 10^{-8}$$
%   (2)$$3 \leq x < \infinity$$
%       $$J_0(x) = x^{-1/2}f_0\cos \theta_0$$
%       $$ f_0 = 0.79788456 - 0.00000077(3/x) - 0.00552740(3/x)^2 -
%       0.00009512(3/x)^3 + 0.00137237(3/x)^4 - 0.00072805(3/x)^5 +
%       0.00014476(3/x)^6 + \epsilon, |\epsilon| < 1.6\times 10^{-8}$$
%       $$ \theta_0 = x - 0.78539816 - 0.04166397(3/x) - 0.00003954(3/x)^2
%       + 0.00262573(3/x)^3 - 0.00054125(3/x)^4 - 0.00029333(3/x)^5 +
%       0.00013559(3/x)^6 + \epsilon, |\epsilon|<7\times 10^{-8}$$
%       $$ J_1(x) = x^{-1/2} f_1 \cos \theta_1$$
%       $$ f_1 = 0.79788456 + 0.00000156(3/x) + 0.01659667(3/x)^2 +
%       0.00017105 (3/x)^3 - 0.00249511(3/x)^4 + 0.00113653(3/x)^5 -
%       0.00020033(3/x)^6 + \epsilon, |\epsilon|<4\times 10^{-8}$$
%       $$ \theta_1 = x-2.35619449 + 0.12499612(3/x) + 0.00005650(3/x)^2 -
%       0.00637879(3/x)^3 + 0.00074348(3/x)^4 + 0.00079824(3/x)^5 -
%       0.00029166(3/x)^6 + \epsilon, |\epsilon|< 9\times 10^{-8}$$
%
%   Example:
%       x = 2; J = aux_Bessel(0, x); Jb = besselj(0, x);
%
%   See also besselj

%   Copyright © Jizhou Li, 2016, The Chinese University of Hong Kong
%   Update date: 22 Aug, 2016

j0c = [1, -2.2499997, 1.2656208, -0.3163866, 0.0444479, -0.0039444, 0.0002100];
t0c = [-.78539816, -.04166397, -.00003954, 0.00262573, -.00054125, -.00029333, .00013558];
f0c = [.79788456, -0.00000077, -.00552740, -.00009512, 0.00137237, -0.00072805, 0.00014476];
j1c = [0.5, -0.56249985, 0.21093573, -0.03954289, 0.00443319, -0.00031761, 0.00001109];
f1c = [0.79788456, 0.00000156, 0.01659667, 0.00017105, -0.00249511, 0.00113653, -0.00020033];
t1c = [-2.35619449, 0.12499612, 0.00005650, -0.00637897, 0.00074348, 0.00079824, -0.00029166];

if order == 0
    isZero = 1;
    sign = 1;
else
    isZero = 0;
    sign = -1;
end

Index1 = find(x<3);
if numel(Index1)>0
    x1 = x(Index1);
    y = x1.*x1./9.0;
    if isZero
        r1 = j0c(1) + y.*(j0c(2) + y.*(j0c(3) + y.*(j0c(4) + y.*(j0c(5) + y.*(j0c(6) + y.*j0c(7))))));
    else
        r1 = j1c(1) + y.*(j1c(2) + y.*(j1c(3) + y.*(j1c(4) + y.*(j1c(5) + y.*(j1c(6) + y.*j1c(7))))));
        r1 = x1.*r1;
    end
    J(Index1) = r1*sign;
end

Index2 = find(x>=3);
if numel(Index2)>0
    x2 = x(Index2);
    y = 3.0./x2;
    if isZero
        theta0 = x2 + t0c(1) + y.*(t0c(2) + y.*(t0c(3) + y.*(t0c(4) + y.*(t0c(5) + y.*(t0c(6) + y.*t0c(7))))));
        f0 = f0c(1) + y.*(f0c(2) + y.*(f0c(3) + y.*(f0c(4) + y.*(f0c(5) + y.*(f0c(6) + y.*f0c(7))))));
        r2 = sqrt(1.0./x2).*f0.*cos(theta0);
    else
        theta1 = x2 + t1c(1) + y.*(t1c(2) + y.*(t1c(3) + y.*(t1c(4) + y.*(t1c(5) + y.*(t1c(6) + y.*t1c(7))))));
        f1 = f1c(1) + y.*(f1c(2) + y.*(f1c(3) + y.*(f1c(4) + y.*(f1c(5) + y.*(f1c(6) + y.*f1c(7))))));
        r2 = sqrt(1.0./x2).*f1.*cos(theta1);
    end
    J(Index2) = r2*sign;
end



end