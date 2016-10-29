
%AnalyseVibrations A matlab program to plot the theoretical response of the building in the 1A vibration lab.


% Requires mPrime, kPrime, lambdaPrime,
%          absorberMass, drivingForce
%          equivilentFloorDampingRange, absorberDampingRange           to be defined


absorberStiffness = absorberMass * freqs(mode)^2;
maxAmplitudes = zeros(length(absorberDampingRange), length(equivilentFloorDampingRange));

Ampl = zeros(length(equivilentFloorDampingRange), length(absorberDampingRange), 2);

%hertzRange = logspace(log10(hertz(mode) + 10), log10(hertz(mode) + 10), 200);
hertzRange = logspace(log10(12), log10(15), 400);


for sweepNumber = 1:length(equivilentFloorDampingRange);



    M = [
        mPrime(floor,mode), 0;
        0, absorberMass;
    ];

    K = [
        kPrime(floor,mode) + absorberStiffness, -absorberStiffness;
        -absorberStiffness, absorberStiffness;
    ];


    for i = 1:length(absorberDampingRange)

        absorberDamping = absorberDampingRange(i);

        Lambda = [
                equivilentFloorDampingRange(sweepNumber) + absorberDamping, -absorberDamping;
                -absorberDamping, absorberDamping;
        ];

        for j = 1:length(hertzRange);

                w = hertzRange(j) * 2 * pi;

                X = (-w^2 * M + 1i * w * Lambda + K) \ drivingForce;

                for k = 1:2
                    Ampl(i, j, k) = X(k) * conj(X(k));
            end

        end
        maxAmplitudes(i, sweepNumber) = max(Ampl(i,:,1));
    end
    
    if(printSweep == sweepNumber)
    
        
        figure();
        surf(hertzRange, absorberDampingRange, Ampl(:,:,1));
        
        set(gca, 'XScale', 'log', 'YScale', 'log', 'ZScale', 'log')
        
        title(strcat('building vibration amplitudes, equivlent damping = ', int2str(equivilentFloorDampingRange(sweepNumber))));
        xlabel('frequency (Hz)');
        ylabel('Absorber Stiffnses (Ns/m');
        zlabel('amplitude');
        shading interp;
        
        
    end
end
