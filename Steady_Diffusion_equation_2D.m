clc
clear all
close all

%%Defining the mesh
n_points = 51;          %Number of points in space
dom_size = 1;           %Domain Size in space
h = dom_size/(n_points-1);      %Grid Spacing in x and y axis

%%Initialising the problem
y(n_points,n_points) = 0;           %y is nothing but a Temperature 
y(:,1)=1;                           %Temperature value at first Column

%%Boundary Conditions
y_new(n_points,n_points) = 0;
y_new(:,n_points)=10;

error_mag =1;
error_req =1e-6;
iterations =0;
tic
%%Calculations for problems
while error_mag > error_req
    for i= 2:(n_points-1)
        for j= 2:(n_points-1)
            y_new(i,j)=0.25.*(y_new(i-1,j)+y(i+1,j)+y_new(i,j-1)+y(i,j+1));
        end
    end
       iterations=iterations+1;
    %Calculations of error magnitude
    error_mag=0;
    for i= 2:(n_points-1)
        for j= 2:(n_points-1)
             error_mag = error_mag + abs(y(i,j) - y_new(i,j));
        end
    end
     % Assigning new to the grid
     y = y_new;
end
toc

%%Plotting
x_dom = ((1:n_points)-1).*h
y_dom = 1-((1:n_points)-1).*h
[X,Y]= meshgrid(x_dom,y_dom)
contour(X,Y,y,12)
colorbar


    
            




