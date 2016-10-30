
masses = [0.05, 0.1, 0.2, 0.4];

for i = 1:4 
    figure();

    surf(hertzRange, absorberDampingRange, plotAmpls(:,:,i), log10(plotAmpls(:,:,i)));

    set(gca, 'YScale', 'log', 'ZScale', 'log')

    axis([-inf inf -inf inf 1e-12 1e-3]);
    caxis([-12 -3]);

    title(['Effect of damping with an absorber mass of ' num2str(masses(i)) 'kg']);
    xlabel('frequency (Hz)');
    ylabel('Absorber Damping (Ns/m');
    zlabel('Normalised Vibration Aplitude');
    shading interp;

end