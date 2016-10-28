
%FindModeShapes Matlab function that find the undamped natural frequencies of a building and corresponding modeshapes

N = 3;


[V,D] = eig(K,M);
syms w;

freqs = zeros(3,1);

for imode=1:N
    freqs(imode) = sqrt(D(imode,imode));
end

% save hertz and modeshapes as global variables
hertz = freqs/(2*pi);
modeshapes = V;

% save mPrime and kPrime as global variables
% these are the equivilent masses and stiffnesses of each floor around
% each natural frequency
mPrime = zeros(N,N);
    kPrime = zeros(N,N);
for imode = 1:N
    modeshape = modeshapes(:,imode);
    for ifloor = 1:N
        mPrime(ifloor,imode) = m * norm(modeshape)^2/(modeshape(ifloor)^2);
    end
    kPrime(:,imode) = mPrime(:,imode) * freqs(imode)^2;
end


