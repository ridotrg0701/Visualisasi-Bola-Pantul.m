function placeParticles()
    fig = figure;
    fig.NumberTitle = 'off';
    fig.Name = 'Nama : Rido Evendi Tarigan - NIM : 4223230016';
    axis([0 10 0 10]);
    axis square;
    hold on;

    numParticles = 10;
    radius = 0.3;
    timeStep = 0.05;

    positions = zeros(numParticles, 2);
    velocities = 2 * rand(numParticles, 2) - 1;

    colors = rand(numParticles, 3);

    particles = gobjects(numParticles, 1);
    for i = 1:numParticles
        title(sprintf('Klik untuk menempatkan partikel %d', i)); 
        [x, y] = ginput(1);
        positions(i,:) = [x, y];

        particles(i) = rectangle('Position', [positions(i,:)-radius, 2*radius, 2*radius],...
            'Curvature', [1 1],...
            'FaceColor', colors(i,:),...
            'EdgeColor', 'none');
    end

    title('Simulasi Tumbukkan Partikel'); 

    while ishandle(fig)
        positions = positions + velocities * timeStep;

        for i = 1:numParticles
            if positions(i,1) < radius
                positions(i,1) = radius;
                velocities(i,1) = -velocities(i,1);
            elseif positions(i,1) > 10 - radius
                positions(i,1) = 10 - radius;
                velocities(i,1) = -velocities(i,1);
            end

            if positions(i,2) < radius
                positions(i,2) = radius;
                velocities(i,2) = -velocities(i,2);
            elseif positions(i,2) > 10 - radius
                positions(i,2) = 10 - radius;
                velocities(i,2) = -velocities(i,2);
            end
        end

        for i = 1:numParticles
            for j = i+1:numParticles
                deltaPos = positions(i,:) - positions(j,:);
                distance = norm(deltaPos);

                if distance < 2 * radius
                    normal = deltaPos / distance;

                    overlap = 2 * radius - distance;
                    positions(i,:) = positions(i,:) + 0.5 * overlap * normal;
                    positions(j,:) = positions(j,:) - 0.5 * overlap * normal;

                    temp = velocities(i,:);
                    velocities(i,:) = velocities(j,:);
                    velocities(j,:) = temp;
                end
            end
        end

        for i = 1:numParticles
            set(particles(i), 'Position', [positions(i,:)-radius, 2*radius, 2*radius]);
        end

        drawnow;
    end
end