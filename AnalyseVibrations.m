
%AnalyseVibrations A matlab program to plot the theoretical response of the building in the 1A vibration lab.


% Requires mPrime, kPrime, lambdaPrime,
%          absorberMass, drivingForce
%          equivilentFloorDampingRange, absorberDampingRange           to be defined


absorberStiffness = absorberMass * freqs(mode)^2;
maxAmplitudes = zeros(length(absorberDampingRange), length(equivilentFloorDampingRange));


hertzRange = logspace(log10(max(0, hertz(mode) - 3)), log10(hertz(mode) + 3), 200);

Ampl = zeros(length(absorberDampingRange), length(hertzRange), 2);

disp(['Sweeping frequencies about the natural frequency of ', num2str(hertz(mode)), 'Hz in range of ',...
    num2str(hertzRange(1)), 'Hz to ',num2str(hertzRange(end)), + 'Hz']);


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
        surf(hertzRange, absorberDampingRange, Ampl(:,:,1), log10(Ampl(:,:,1)));
        
        set(gca, 'YScale', 'log', 'ZScale', 'log')
        
        title(['building vibration amplitudes, equivilent damping = ' ...
            num2str(equivilentFloorDampingRange(sweepNumber)) 'Ns/m']);
        xlabel('frequency (Hz)');
        ylabel('Absorber Stiffnses (Ns/m');
        zlabel('amplitude');
        shading interp;
        
        
    end
end
