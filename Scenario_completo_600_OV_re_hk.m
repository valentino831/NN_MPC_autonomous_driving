function [scenario, egoVehicle] = Scenario_completo_600_OV_re_hk()
% createDrivingScenario Returns the drivingScenario defined in the Designer

% Generated by MATLAB(R) 9.9 (R2020b) and Automated Driving Toolbox 3.2 (R2020b).
% Generated on: 28-Mar-2022 13:20:08

% Construct a drivingScenario object.
scenario = drivingScenario;

% Add all road segments
roadCenters = [496.0478 1736.105 0;
    520.7389 1627.772 0;
    545.4299 1519.439 0;
    570.121 1411.106 0;
    594.812 1302.773 0;
    619.5031 1194.44 0;
    644.1941 1086.107 0;
    668.8852 977.7742 0;
    693.5762 869.4413 0;
    733.3333 604.9991 0;
    723.8095 498.5195 0;
    714.2856 455.0178 0;
    704.7618 422.0524 0;
    695.238 394.6109 0;
    685.7141 370.744 0;
    676.1903 349.4481 0;
    666.6664 330.125 0;
    657.1426 312.3836 0;
    647.6187 295.9514 0;
    638.0949 280.6293 0;
    628.5711 266.2668 0;
    619.0472 252.7463 0;
    609.5234 239.9744 0;
    599.9995 227.8749 0;
    590.4757 216.3851 0;
    580.9518 205.4523 0;
    571.428 195.032 0;
    561.9042 185.086 0;
    552.3803 175.5814 0;
    542.8565 166.4894 0;
    533.3326 157.7849 0;
    523.8088 149.4457 0;
    514.2849 141.4521 0;
    504.7611 133.7864 0;
    495.2372 126.433 0;
    485.7134 119.3776 0;
    476.1896 112.6074 0;
    466.6657 106.1109 0;
    457.1419 99.87734 0;
    447.618 93.89726 0;
    438.0942 88.16181 0;
    428.5703 82.66293 0;
    419.0465 77.39324 0;
    409.5227 72.34591 0;
    399.9988 67.5147 0;
    390.475 62.89382 0;
    380.9511 58.47793 0;
    371.4273 54.26211 0;
    361.9034 50.2418 0;
    352.3796 46.41276 0;
    342.8557 42.77111 0;
    333.3319 39.31321 0;
    323.8081 36.03571 0;
    314.2842 32.93552 0;
    304.7604 30.00977 0;
    295.2365 27.25581 0;
    285.7127 24.67119 0;
    276.1888 22.25365 0;
    266.665 20.00113 0;
    0 0 0;
    -111.1111 0 0;
    -222.2222 0 0;
    -333.3333 0 0;
    -444.4444 0 0;
    -555.5556 0 0;
    -666.6667 0 0;
    -777.7778 0 0;
    -888.8889 0 0;
    -1000 0 0;
    -1000 0 0;
    -1111.111 0 0;
    -1222.222 0 0;
    -1333.333 0 0;
    -1444.444 0 0;
    -1555.556 0 0;
    -1666.667 0 0;
    -1777.778 0 0;
    -1888.889 0 0;
    -2000 0 0;
    -2266.665 -20.00113 0;
    -2276.189 -22.25365 0;
    -2285.713 -24.67119 0;
    -2295.237 -27.25581 0;
    -2304.76 -30.00977 0;
    -2314.284 -32.93552 0;
    -2323.808 -36.03571 0;
    -2333.332 -39.31321 0;
    -2342.856 -42.77111 0;
    -2352.38 -46.41276 0;
    -2361.903 -50.2418 0;
    -2371.427 -54.26211 0;
    -2380.951 -58.47793 0;
    -2390.475 -62.89382 0;
    -2399.999 -67.5147 0;
    -2409.523 -72.34591 0;
    -2419.046 -77.39324 0;
    -2428.57 -82.66293 0;
    -2438.094 -88.16181 0;
    -2447.618 -93.89726 0;
    -2457.142 -99.87734 0;
    -2466.666 -106.1109 0;
    -2476.19 -112.6074 0;
    -2485.713 -119.3776 0;
    -2495.237 -126.433 0;
    -2504.761 -133.7864 0;
    -2514.285 -141.4521 0;
    -2523.809 -149.4457 0;
    -2533.333 -157.7849 0;
    -2542.856 -166.4894 0;
    -2552.38 -175.5814 0;
    -2561.904 -185.086 0;
    -2571.428 -195.032 0;
    -2580.952 -205.4523 0;
    -2590.476 -216.3851 0;
    -2600 -227.8749 0;
    -2609.523 -239.9744 0;
    -2619.047 -252.7463 0;
    -2628.571 -266.2668 0;
    -2638.095 -280.6293 0;
    -2647.619 -295.9514 0;
    -2657.143 -312.3836 0;
    -2666.666 -330.125 0;
    -2676.19 -349.4481 0;
    -2685.714 -370.744 0;
    -2695.238 -394.6109 0;
    -2704.762 -422.0524 0;
    -2714.286 -455.0178 0;
    -2723.809 -498.5195 0;
    -2733.333 -604.9991 0;
    -2693.576 -869.4413 0;
    -2668.885 -977.7742 0;
    -2644.194 -1086.107 0;
    -2619.503 -1194.44 0;
    -2594.812 -1302.773 0;
    -2570.121 -1411.106 0;
    -2545.43 -1519.439 0;
    -2520.739 -1627.772 0;
    -2496.048 -1736.105 0];
laneSpecification = lanespec(3, 'Width', 3.5);
road(scenario, roadCenters, 'Lanes', laneSpecification, 'Name', 'Road');

% Add the ego vehicle
egoVehicle = vehicle(scenario, ...
    'ClassID', 1, ...
    'Position', [-2670.87 -952.98 0], ...
    'Yaw', 103, ...
    'Mesh', driving.scenario.carMesh, ...
    'Name', 'Car');

% Add the non-ego actors
car1 = vehicle(scenario, ...
    'ClassID', 1, ...
    'Position', [-2693.21473491651 -854.082793538209 0], ...
    'Mesh', driving.scenario.carMesh, ...
    'PlotColor', [0.929 0.694 0.125], ...
    'Name', 'Car1');
waypoints = [-2693.21473491651 -854.082793538209 0;
    -2709.9 -778.2 0;
    -2719 -727.5 0;
    -2727.2 -667.9 0;
    -2726.4 -546.6 0;
    -2654.6 -315 0;
    -2405 -74.4 0;
    -2249.9 -19.5 0;
    -2111.1 -4.2 0];
speed = [23;20;20;18;18;18;17;17;17];
waittime = [0;0;0;0;0;0;0;0;0];
trajectory(car1, waypoints, speed, waittime);

car2 = vehicle(scenario, ...
    'ClassID', 1, ...
    'Position', [-2691.4 -876 0], ...
    'Mesh', driving.scenario.carMesh, ...
    'PlotColor', [255 105 41] / 255, ...
    'Name', 'Car2');
waypoints = [-2691.4 -876 0;
    -2710.1 -796.1 0;
    -2722.6 -727.5 0;
    -2730 -670 0;
    -2718.2 -472 0;
    -2632.1 -271.7 0;
    -2435.7 -87.1 0;
    -2325.9 -37.5 0;
    -2240.5 -14.9 0];
speed = [23;20;20;25;33;33;33;33;33];
waittime = [0;0;0;0;0;0;0;0;0];
trajectory(car2, waypoints, speed, waittime);
