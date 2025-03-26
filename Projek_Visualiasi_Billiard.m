%Project Kelompok 
%Kelas : PSM 22 C
%Nama  : Rido Evendi Tarigan                 NIM : (4223230016)
%Nama  : Michel Angelina Simanjuntak         NIM : (4223530003)

clc
close all
clear all

width = 10;          
height = 5;          
ball_radius = 0.1;   

figure;
axis([0 width 0 height]);
hold on;
rectangle('Position', [0, 0, width, height], 'EdgeColor', 'k', 'LineWidth', 2);
title('Klik untuk menentukan posisi bola pertama, kedua, dan ketiga');

ball1_pos = ginput(1); 
ball1 = rectangle('Position', [ball1_pos(1)-ball_radius, ball1_pos(2)-ball_radius, 2*ball_radius, 2*ball_radius], ...
                 'Curvature', [1, 1], 'FaceColor', 'r');

ball2_pos = ginput(1); 
ball2 = rectangle('Position', [ball2_pos(1)-ball_radius, ball2_pos(2)-ball_radius, 2*ball_radius, 2*ball_radius], ...
                 'Curvature', [1, 1], 'FaceColor', 'b');

ball3_pos = ginput(1); 
ball3 = rectangle('Position', [ball3_pos(1)-ball_radius, ball3_pos(2)-ball_radius, 2*ball_radius, 2*ball_radius], ...
                 'Curvature', [1, 1], 'FaceColor', 'g');

ball4_pos = ginput(1); 
ball4 = rectangle('Position', [ball4_pos(1)-ball_radius, ball4_pos(2)-ball_radius, 2*ball_radius, 2*ball_radius], ...
                 'Curvature', [1, 1], 'FaceColor', 'm');


title('Visualisasi Billiard');

vel_target1 = ginput(1); 
ball1_vel = (vel_target1 - ball1_pos) / norm(vel_target1 - ball1_pos); 

vel_target2 = ginput(1); 
ball2_vel = (vel_target2 - ball2_pos) / norm(vel_target2 - ball2_pos); 

vel_target3 = ginput(1); 
ball3_vel = (vel_target3 - ball3_pos) / norm(vel_target3 - ball3_pos); 

vel_target4 = ginput(1); 
ball4_vel = (vel_target4 - ball4_pos) / norm(vel_target4 - ball4_pos); 

dt = 0.05;         

fs = 44100;          
t = 0:1/fs:0.1;      

left_note = sin(2*pi*440*t);   
right_note = sin(2*pi*523.25*t); 
top_note = sin(2*pi*659.25*t);  
bottom_note = sin(2*pi*392*t);  

left_color = [1, 0, 0];   
right_color = [0, 0, 1];   
top_color = [0, 1, 0];     
bottom_color = [1, 1, 0];  

left_wall = rectangle('Position', [0, 0, 0.2, height], 'FaceColor', left_color, 'EdgeColor', 'none');
right_wall = rectangle('Position', [width-0.2, 0, 0.2, height], 'FaceColor', right_color, 'EdgeColor', 'none');
top_wall = rectangle('Position', [0, height-0.2, width, 0.2], 'FaceColor', top_color, 'EdgeColor', 'none');
bottom_wall = rectangle('Position', [0, 0, width, 0.2], 'FaceColor', bottom_color, 'EdgeColor', 'none');

while true

    ball1_pos = ball1_pos + ball1_vel * dt;
    ball2_pos = ball2_pos + ball2_vel * dt;
    ball3_pos = ball3_pos + ball3_vel * dt;
    ball4_pos = ball4_pos + ball4_vel * dt;

    if ball1_pos(1) - ball_radius < 0 || ball1_pos(1) + ball_radius > width
        ball1_vel(1) = -ball1_vel(1);
        if ball1_pos(1) - ball_radius < 0
            sound(left_note, fs); 
            set(left_wall, 'FaceColor', rand(1, 3));
        else
            sound(right_note, fs); 
            set(right_wall, 'FaceColor', rand(1, 3)); 
        end
    end
    if ball1_pos(2) - ball_radius < 0 || ball1_pos(2) + ball_radius > height
        ball1_vel(2) = -ball1_vel(2);
        if ball1_pos(2) - ball_radius < 0
            sound(bottom_note, fs); 
            set(bottom_wall, 'FaceColor', rand(1, 3)); 
        else
            sound(top_note, fs);
            set(top_wall, 'FaceColor', rand(1, 3));
        end
    end

    if ball2_pos(1) - ball_radius < 0 || ball2_pos(1) + ball_radius > width
        ball2_vel(1) = -ball2_vel(1);
        if ball2_pos(1) - ball_radius < 0
            sound(left_note, fs); 
            set(left_wall, 'FaceColor', rand(1, 3));
        else
            sound(right_note, fs); 
            set(right_wall, 'FaceColor', rand(1, 3)); 
        end
    end
    if ball2_pos(2) - ball_radius < 0 || ball2_pos(2) + ball_radius > height
        ball2_vel(2) = -ball2_vel(2);
        if ball2_pos(2) - ball_radius < 0
            sound(bottom_note, fs); 
            set(bottom_wall, 'FaceColor', rand(1, 3)); 
        else
            sound(top_note, fs);
            set(top_wall, 'FaceColor', rand(1, 3));
        end
    end

    if ball3_pos(1) - ball_radius < 0 || ball3_pos(1) + ball_radius > width
        ball3_vel(1) = -ball3_vel(1);
        if ball3_pos(1) - ball_radius < 0
            sound(left_note, fs); 
            set(left_wall, 'FaceColor', rand(1, 3));
        else
            sound(right_note, fs); 
            set(right_wall, 'FaceColor', rand(1, 3)); 
        end
    end
    if ball3_pos(2) - ball_radius < 0 || ball3_pos(2) + ball_radius > height
        ball3_vel(2) = -ball3_vel(2);
        if ball3_pos(2) - ball_radius < 0
            sound(bottom_note, fs); 
            set(bottom_wall, 'FaceColor', rand(1, 3)); 
        else
            sound(top_note, fs);
            set(top_wall, 'FaceColor', rand(1, 3));
        end
    end

     if ball4_pos(1) - ball_radius < 0 || ball4_pos(1) + ball_radius > width
        ball4_vel(1) = -ball4_vel(1);
        if ball4_pos(1) - ball_radius < 0
            sound(left_note, fs); 
            set(left_wall, 'FaceColor', rand(1, 3));
        else
            sound(right_note, fs); 
            set(right_wall, 'FaceColor', rand(1, 3)); 
        end
     end

    if ball4_pos(2) - ball_radius < 0 || ball4_pos(2) + ball_radius > height
        ball4_vel(2) = -ball4_vel(2);
        if ball4_pos(2) - ball_radius < 0
            sound(bottom_note, fs); 
            set(bottom_wall, 'FaceColor', rand(1, 3)); 
        else
            sound(top_note, fs);
            set(top_wall, 'FaceColor', rand(1, 3));
        end
    end

    distance12 = norm(ball1_pos - ball2_pos);
    distance13 = norm(ball1_pos - ball3_pos);
    distance14 = norm(ball1_pos - ball4_pos);
    distance23 = norm(ball2_pos - ball3_pos);
    distance24 = norm(ball2_pos - ball4_pos);

    if distance12 < 2 * ball_radius
        normal = (ball2_pos - ball1_pos) / distance12;
        tangent = [-normal(2), normal(1)];
        
        v1n = dot(ball1_vel, normal);
        v1t = dot(ball1_vel, tangent);
        v2n = dot(ball2_vel, normal);
        v2t = dot(ball2_vel, tangent);
        
        v1n_new = v2n;
        v2n_new = v1n;
        
        ball1_vel = v1n_new * normal + v1t * tangent;
        ball2_vel = v2n_new * normal + v2t * tangent;
    end

    if distance13 < 2 * ball_radius
        normal = (ball3_pos - ball1_pos) / distance13;
        tangent = [-normal(2), normal(1)];
        
        v1n = dot(ball1_vel, normal);
        v1t = dot(ball1_vel, tangent);
        v3n = dot(ball3_vel, normal);
        v3t = dot(ball3_vel, tangent);
        
        v1n_new = v3n;
        v3n_new = v1n;
        
        ball1_vel = v1n_new * normal + v1t * tangent;
        ball3_vel = v3n_new * normal + v3t * tangent;
    end

    if distance14 < 2 * ball_radius
        normal = (ball4_pos - ball1_pos) / distance14;
        tangent = [-normal(2), normal(1)];
        
        v1n = dot(ball1_vel, normal);
        v1t = dot(ball1_vel, tangent);
        v4n = dot(ball4_vel, normal);
        v4t = dot(ball4_vel, tangent);
        
        v1n_new = v4n;
        v4n_new = v1n;
        
        ball1_vel = v1n_new * normal + v1t * tangent;
        ball4_vel = v4n_new * normal + v4t * tangent;
    end

    if distance23 < 2 * ball_radius
        normal = (ball3_pos - ball2_pos) / distance23;
        tangent = [-normal(2), normal(1)];
        
        v2n = dot(ball2_vel, normal);
        v2t = dot(ball2_vel, tangent);
        v3n = dot(ball3_vel, normal);
        v3t = dot(ball3_vel, tangent);
        
        v2n_new = v3n;
        v3n_new = v2n;
        
        ball2_vel = v2n_new * normal + v2t * tangent;
        ball3_vel = v3n_new * normal + v3t * tangent;
    end

    if distance24 < 2 * ball_radius
        normal = (ball4_pos - ball2_pos) / distance24;
        tangent = [-normal(2), normal(1)];
        
        v2n = dot(ball2_vel, normal);
        v2t = dot(ball2_vel, tangent);
        v4n = dot(ball4_vel, normal);
        v4t = dot(ball4_vel, tangent);
        
        v2n_new = v4n;
        v4n_new = v2n;
        
        ball2_vel = v2n_new * normal + v2t * tangent;
        ball4_vel = v4n_new * normal + v4t * tangent;
    end

    set(ball1, 'Position', [ball1_pos(1)-ball_radius, ball1_pos(2)-ball_radius, 2*ball_radius, 2*ball_radius]);
    set(ball2, 'Position', [ball2_pos(1)-ball_radius, ball2_pos(2)-ball_radius, 2*ball_radius, 2*ball_radius]);
    set(ball3, 'Position', [ball3_pos(1)-ball_radius, ball3_pos(2)-ball_radius, 2*ball_radius, 2*ball_radius]);
    set(ball4, 'Position', [ball4_pos(1)-ball_radius, ball4_pos(2)-ball_radius, 2*ball_radius, 2*ball_radius]);

    pause(0.01);
end
hold off;