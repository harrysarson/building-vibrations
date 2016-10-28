

% InitVibrations Set up some global variables
	
	global M;
	global K absorberMass absorberStiffness;
	global hertzRange equivilentFloorDampingRange absorberDampingRange;
	global drivingForce;

	m = 1.83; % mass of one floor
	L = 0.2; % length
	N = 3; % number of degrees of freedom
	b = 0.08; % width
	E = 210E9; % Young's Modulus
	d = 0.001; % thickness
	I = b*d*d*d/12; % second moment of area
	kc = (24*E*I)/(L*L*L); % static stiffness for each floor

        absorberMass = 0.1;

        hertzRange  = logspace(3,  8,  100);
	equivilentFloorDampingRange = linspace(0.01, 400, 60);
	absorberDampingRange = logspace(0.08, 1, 100);

	drivingForce = [
		1;
		0;
	];

	%% create the mass matrix
	M = m*eye(N); 


	%% Create the stiffness matrix

	k = zeros(N,1);
	k = 1 + k; % set all spring constants to 1 (kc)

	K = zeros(N);
	for i=1:N   
		for j=1:N
		    if i==j
			if i < N
			    K(i,j) = k(i) + k(i+1);
			else
			    K(i,j) = k(i);
			end
		    end
		    if i-j == 1
			K(i,j) = -k(j);
		    end
		    if j-i == 1
			K(i,j) = -k(i);
		    end
		end
	end