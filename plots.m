


close all
clear ~ll

figure();
% for color parameter logged values of amplitude are used so that color
% changes throughout range of z-values.
surf(equivilentFloorDampingRange, absorberDampingRange, maxAmplitudes, log10(maxAmplitudes));
set(gca, 'YScale', 'log', 'ZScale', 'log')

title('Max amplitudes of building vibrations');
xlabel('equivilent stiffness of building (Ns/m)');
ylabel('stiffness of absorber (Ns/m)');
zlabel('normalised amplitude');
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

if (0)
    figure();
    plot(equivilentFloorDampingRange, minAmplitude);
    title('min floor amplitude for different floor lambdas');
    xlabel('floor lambda');
    ylabel('floor amplitude');
end

if (0)
    figure();
    plot(equivilentFloorDampingRange, 1-ratio);
    title('max absorber efficiency for given floor damping');
    xlabel('floor lambda');
    ylabel('min amplitude / max amplitude');
end

if (0)
    figure();
    plot(equivilentFloorDampingRange, optimalAbsorberDamping);
    title('optimal absorber for different floor lambdas');
    xlabel('floor lambda');
    ylabel('optimal absorber damping');
end
