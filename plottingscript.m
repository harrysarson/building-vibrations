

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
    text(absorberDampingRange(i)*0.8, maxAmplitudes(i, line)*(1.7 - line/4), ...
    [num2str(equivilentFloorDampingRange(line)) 'Nm/s'], 'BackgroundColor', 'w', 'rotation', a);
end

title('Amplitude of vibrations at resonance');
xlabel('Absorber damping (Ns/m)');
ylabel('Normalised amplitude');