

% Requires mPrime, kPrime, lambdaPrime,
%          absorberMass, absorberStiffness
%          lambdaRange, omegaRange           to be defined

M = [
  mPrime, 0;
  0, absorberMass;
];

K = [
  kPrime + absorberStiffness, -absorberStiffness;
  -absorberStiffness, absorberStiffness;
];

maxAmpl = [
  0, NaN, NaN;
  0, NaN, NaN;
];

Ampl = zeros(size(lambdaRange), size(omegaRange), 2);

for i = size(lambdaRange) do

  absorberDamping = lambdaRange(i);

  Lambda = [ 
    lambdaPrime + absorberDamping, -absorberDamping;
    -absorberDamping, absorberDamping;
  ];

  for j =  size(omegaRange) do
   
    w = omegaRange(i);

    X = inv(-w^2 * M + 1i * w * Lambda + K) * F;
    
    for k = 1:2 do

      Ampl(i, j, k) = X(k);

      if X(k) > maxAmpl(1,k)
        maxAmpl(:, k) = [X(k), absorberDamping, w];
      
    end

  end
end


surf(lambdaRange, omegaRange, Ampl(:,:,1));
title('floor');
figure;
surf(lambdaRange, omegaRange, Ampl(:,:,2));
title('absorber');

maxAmpl
