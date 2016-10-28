function AnalyseVibrations(floor, mode)
	%AnalyseVibrations A matlab program to plot the theoretical response of the building in the 1A vibration lab.


	% Requires mPrime, kPrime, lambdaPrime,
	%          absorberMass, drivingForce
	%          hertzRange, equivilentFloorDampingRange, absorberDampingRange           to be defined
	

	global maxAmplitudes;
	
        absorberStiffness = absorberMass * freqs(mode)^2;
	maxAmplitudes = zeros(lambdaLength, floorLambdaLength);

	for sweepNumber = 1:floorLambdaLength
	    	lambdaPrime = lambdaFloor(sweepNumber) + zeros(N,N);



		M = [
	  		mPrime(floor,mode), 0;
	  		0, absorberMass;
		];

		K = [
	  		kPrime(floor,mode) + absorberStiffness, -absorberStiffness;
	  		-absorberStiffness, absorberStiffness;
		];


	  	for i = 1:lambdaLength

	  		absorberDamping = absorberDampingRange(i);

	  	Lambda = [
	    		lambdaPrime(floor, mode) + absorberDamping, -absorberDamping;
	    		-absorberDamping, absorberDamping;
	  	];

	  	for j = 1:omegaLength

	    		w = omegaRange(j);

	    		X = inv(-w^2 * M + 1i * w * Lambda + K) * drivingForce;

	    		for k = 1:2
	        		Ampl(i, j, k) = X(k) * conj(X(k));
	   		end

	  	end
  		maxAmplitudes(i, sweepNumber) = max(Ampl(i,:,1));
    	end
end

