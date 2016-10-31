

figure();
hold on;

for line = 1:length(equivilentFloorDampingRange)

    for i = 1:length(absorberDampingRange)

        maxAmplitudes(i, line) = max(plotAmpls(i,:,line));

    end

    plot(absorberDampingRange, maxAmplitudes(:, line));
    set(gca, 'XScale', 'log', 'YScale', 'log')

    % Define position to display the text
    i = round(numel(absorberDampingRange) * ( 3/4 + line / 40 ));

    a = 0;

    % Display the text
<<<<<<< HEAD
    text(absorberDampingRange(i)*0.8, maxAmplitudes(i, line)*(1.7 - line/4), ...
    [num2str(equivilentFloorDampingRange(line)) 'Nm/s'], 'BackgroundColor', 'w', 'rotation', a);
end
=======
    text(absorberDampingRange(i), maxAmplitudes(i, line), ...
    [ordinals(line, :) ' floor'], 'BackgroundColor', 'w', 'rotation', a);


    end
>>>>>>> cc53386... floor graphs now good, watch out for all graphs that are wrong but still around

title('Amplitude of vibrations at resonance');
xlabel('Absorber damping (Ns/m)');
ylabel('Normalised amplitude');




saveas(gcf,'floor choice graphs/asborber damping vs amplitude at resonance for different floors, eqdamping 2, mode 1.fig');
saveas(gcf,'floor choice graphs/asborber damping vs amplitude at resonance for different floors, eqdamping 2, mode 1.png');








