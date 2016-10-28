


close all
clear ~ll

figure();
surf(equivilentFloorDampingRange, log10(absorberDampingRange), log10(maxAmplitudes));
title('Max amplitudes of floor');
xlabel('floor lambda');
ylabel('log10(absorber lambda)');
zlabel('log10(amplitude)');
shading interp;


optimalAbsorberDamping = zeros(length(equivilentFloorDampingRange),1);
minAmplitude = zeros(length(equivilentFloorDampingRange),1);
maxAmplitude = zeros(length(equivilentFloorDampingRange),1);
ratio = zeros(length(equivilentFloorDampingRange),1);
for i = 1:length(equivilentFloorDampingRange)

    minAmplitude(i) = min(maxAmplitudes(:,i));
    maxAmplitude(i) = max(maxAmplitudes(:,i));
    ratio(i) = minAmplitude(i)/maxAmplitude(i);
    optimalAbsorberDamping(i) = absorberDampingRange( find(maxAmplitudes(:,i) == minAmplitude(i), 1) );

end

if (1)
    figure();
    plot(equivilentFloorDampingRange, minAmplitude);
    title('min floor amplitude for different floor lambdas');
    xlabel('floor lambda');
    ylabel('floor amplitude');
end

if (1)
    figure();
    plot(equivilentFloorDampingRange, ratio);
    title('max absorber efficiency for given floor damping');
    xlabel('floor lambda');
    ylabel('min amplitude / max amplitude');
end

if (1)
    figure();
    plot(equivilentFloorDampingRange, optimalAbsorberDamping);
    title('optimal absorber for different floor lambdas');
    xlabel('floor lambda');
    ylabel('optimal absorber damping');
end
