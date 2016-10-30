
massArray = [0.05, 0.1, 0.2, 0.4]

figure();
hold on;

for line = 1:4 

    for i = 1:length(absorberDampingRange)

        maxAmplitudes(i, line) = max(plotAmpls(i,:,line));

    end

    plot(absorberDampingRange, maxAmplitudes(:, line));
    set(gca, 'XScale', 'log', 'YScale', 'log')

    % Define position to display the text
    i = round(numel(absorberDampingRange) * ( 1/2 + line / 20 ));

    a = 0;

    % Display the text
    text(absorberDampingRange(i)*0.8, maxAmplitudes(i, line), [num2str(massArray(line)) 'kg'], 'BackgroundColor', 'w', 'rotation', a);
end

title('Amplitude of vibrations at resonance');
xlabel('Absorber damping (Ns/m)');
ylabel('Normalised amplitude');