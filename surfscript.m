

for i = 1:length(equivilentFloorDampingRange)
    figure();

    surf(hertzRange, absorberDampingRange, plotAmpls(:,:,i), log10(plotAmpls(:,:,i)));

    set(gca, 'YScale', 'log', 'ZScale', 'log')

    axis([-inf inf -inf inf 1e-9 1e-3]);
    caxis([-9 -3]);

    title(['Frequency Responce for building with damping of ' num2str(equivilentFloorDampingRange(i)) 'Ns/m']);
    xlabel('frequency (Hz)');
    ylabel('Absorber Damping (Ns/m');
    zlabel('Normalised Vibration Aplitude');
    shading interp;
    
    saveas(gcf,['floor choice graphs/amplitudes for eqdamping 2, floor ' i ', mode 1, ma = 0.1.fig']);
    saveas(gcf,['floor choice graphs/amplitudes for eqdamping 2, floor ' i ', mode 1, ma = 0.1.png']);

end