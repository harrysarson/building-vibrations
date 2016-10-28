function FindModeShapes
%FindModeShapes Matlab function that find the undamped natural frequencies of a building and corresponding modeshapes

	global hertz modeshapes mPrime kPrime;


	[V,D] = eig(K,M);
	syms w;

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
	for mode = 1:N
		modeshape = modeshapes(:,mode);
		for floor = 1:N
			mPrime(floor,mode) = m * norm(modeshape)^2/(modeshape(floor)^2);
		end
		kPrime(:,mode) = mPrime(:,mode) * freqs(mode)^2;
	end
	
	
