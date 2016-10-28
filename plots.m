function plots


	close all
	clear ~ll

	figure();
	surf(lambdaFloor, log10(lambdaRange), log10(maxAmplitudes));
	title('Max amplitudes of floor');
	xlabel('floor lambda');
	ylabel('log10(absorber lambda)');
	zlabel('log10(amplitude)');
	shading interp;


	optimalAbsorber = zeros(floorLambdaLength,1);
	minAmplitude = zeros(floorLambdaLength,1);
	index = zeros(floorLambdaLength,1);
	for absorberLambda = 1:floorLambdaLength
	    minAmplitude(absorberLambda) = min(maxAmplitudes(:,absorberLambda));
	    index(absorberLambda) = find(maxAmplitudes(:,absorberLambda)==minAmplitude(absorberLambda),1);
	    optimalAbsorber(absorberLambda) = lambdaRange(index(absorberLambda));
	end

	if (1)
	    figure();
	    plot(lambdaFloor, log10(minAmplitude));
	    title('min floor amplitude for different floor lambdas');
	    xlabel('floor lambda');
	    ylabel('floor amplitude');
	end


	if(1)
	    figure();
	    plot(lambdaFloor, index);
	    title('optimal absorber sample position for different floor lambdas');
	    xlabel('floor lambda');
	    ylabel('optimal absorber damping index');
	end

	if (1)
	    figure();
	    plot(lambdaFloor, optimalAbsorber);
	    title('optimal absorber for different floor lambdas');
	    xlabel('floor lambda');
	    ylabel('optimal absorber damping');
	end
