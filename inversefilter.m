load ISM_RIRs.mat
g1 = cell2mat(RIR_cell(1,:));
g2 = cell2mat(RIR_cell(2,:));

% this is the [g1 g2] array
% we now have
% d[k] = conv(g[k], h[k]);
% D = [G1 G2][H1 H2]
% [H1 H2] = inverse( [G1 G2] )*D
% H1, H2 the z transform of h1, h2, the inverse filters
% G1, G2 are z transform of g1, g2, the room response for mic1, mic2
% D(z) = 1 = G1(z)H1(z) + G2(z)H2(z)
% [H1 H2] = [G1 G2]^-1 * D
% where G1 and G2 are matrices and D is a L+1 length vector with a single
% non-zero entry
% length(g1)=6915, length(g2)=6927
% define L, M, I here
% I is the order of the filter, chosen such that the resulting matrix is
% square
%M = min( length(g1), length(g2) );
M = length(g1);
N = length(g2);
I = N-1;
J = M-1;
L = max( M+I, N+J );
G1G2 = zeros(L+1, I+J+2);


for i=1:I+1
    for k=1:M
        G1G2(i,i+k)=g1(k);
    end
   
end

for i=I+2:I+J+2
    for k=1:N
        G1G2(i,i+k)=g2(k);
    end
end
