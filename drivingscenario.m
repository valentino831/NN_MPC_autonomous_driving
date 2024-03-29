function [scenario, egoVehicle] = drivingscenario()
% createDrivingScenario Returns the drivingScenario defined in the Designer

% Generated by MATLAB(R) 9.7 (R2019b) and Automated Driving Toolbox 3.0 (R2019b).
% Generated on: 03-Mar-2021 16:10:17

% Construct a drivingScenario object.
scenario = drivingScenario('StopTime', 138, ...
    'SampleTime', 0.2);

% Add all road segments
roadCenters = [-352.4 310.3 0;
    -145 226 0;
    31 66 0;
    157.2 -101.8 0;
    504.2 -506.8 0;
    592.7 -593.5 0;
    693.4 -693.5 0;
    2462 -2376 0];
roadCenters= roadCenters;
marking = [laneMarking('Solid', 'Color', [0.98 0.86 0.36])
    laneMarking('Dashed')
    laneMarking('Dashed')
    laneMarking('Dashed')];
laneSpecification = lanespec(3, 'Marking', marking);
road(scenario, roadCenters, 'Lanes', laneSpecification);

% Add the ego vehicle
egoVehicle = vehicle(scenario, ...
    'ClassID', 1, ...
    'Length', 4.5, ...
    'Position', [-351.54 306.34 0], ...
    'Yaw', -18.9943583956975, ...
    'FrontOverhang', 0.9);

% Add the non-ego actors
car1 = vehicle(scenario, ...
    'ClassID', 1, ...
    'Position', [-266.7 277.3 0], ...
    'FrontOverhang', 0.9);
waypoints = [-266.7 277.3 0;
    -182.6 243 0;
    -138.8 218.2 0;
    -83.2 178.2 0;
    -42.3 141.3 0;
    10.1 85.5 0;
    52 34.5 0;
    153.8 -102.9 0;
    169.3 -123.5 0;
    216.5 -186.3 0;
    272.58 -255.9 0.01;
    320 -312.7 0;
    359.5 -358.5 0;
    421.3 -426.4 0;
    480.3 -488.7 0;
    515.4 -522.8 0;
    592.8 -599.1 0;
    708 -713.4 0];

speed = [20;20;20;20;20;20;20;19;19;20;20;20;20;20;20;20;20;20];
trajectory(car1, waypoints, speed);

car2 = vehicle(scenario, ...
    'ClassID', 1, ...
    'Position', [-324.8 300.7 0], ...
    'FrontOverhang', 0.9);
waypoints = [-324.8 300.7 0;
    -231.8 268.2 0;
    -169.7 240.4 0;
    -123.9 213.2 0;
    -84.9 183.9 0;
    -45.6 148.8 0;
    -9 112.1 0;
    25.8 72.1 0;
    64.3 24.1 0;
    127.9 -61.8 0;
    181.3 -133.7 0;
    222.7 -188.6 0;
    271.8 -249.4 0;
    321.3 -309.3 0;
    389.9 -387.4 0;
    453.2 -454.9 0;
    496.1 -498.9 0;
    540.1 -542.1 0;
    605.3 -606.2 0;
    700.8 -701.1 0;
    737.3 -737 0;
    793.3 -792.8 0;
    903.1 -900.9 0;
    1079.5 -1073.1 0;
    1181.2 -1170.5 0;
    1278.8 -1264 0;
    1426.3 -1404.2 0;
    1525 -1497.7 0;
    1677.2 -1641.5 0;
    1760.7 -1720.1 0;
    2006.4 -1950.9 0;
    2458.6 -2372.4 0];
speed = [21;21;22;22;22;21;21;21;21;21;22;22;22;22;22;22;22;22;22;22;22;22;22;22;22;22;22;22;22;22;22;22];
trajectory(car2, waypoints, speed);

car3 = vehicle(scenario, ...
    'ClassID', 1, ...
    'Position', [-316.1 302.5 0], ...
    'FrontOverhang', 0.9);
waypoints = [-316.1 302.5 0;
    -240.2 275.7 0;
    -187.7 253.2 0;
    -142.4 229.3 0;
    -103.7 202.4 0;
    -50 158.3 0;
    0.3 107.4 0;
    41.1 59.1 0;
    90.7 -4.7 0;
    117.3 -41.1 0;
    147.9 -83.1 0;
    206.2 -160.6 0;
    243.3 -209.4 0;
    288 -263.3 0;
    326.6 -309.8 0;
    369.4 -358.9 0;
    414.7 -408.8 0;
    464.2 -461.2 0;
    490.7 -487.9 0;
    513.9 -512.1 0;
    555.3 -551.8 0;
    604.6 -600.3 0;
    685.1 -680.5 0;
    767.4 -762.6 0;
    783.7 -781 0;
    797.1 -796.3 0;
    820.7 -819.7 0;
    856.2 -854.5 0;
    910.1 -907.2 0;
    954.5 -950.3 0;
    1028.3 -1023.1 0;
    1106.1 -1097.4 0;
    1220.7 -1208.2 0;
    1302.3 -1286.1 0;
    1368.1 -1349 0;
    1443.3 -1420.5 0;
    1506.7 -1480.1 0;
    1576.6 -1546.2 0;
    1654.8 -1619.7 0;
    1828.8 -1783.9 0;
    1905.2 -1855.3 0;
    2090.7 -2029.4 0;
    2147.2 -2082 0;
    2457.7 -2371.2 0];

speed = [22;22;22;22;22;22;22;22;22;22;23;23;23;23;23;24;25;25;25;25;25;25;25;25;25;25;25;25;25;25;30;30;30;30;30;30;30;30;30;30;30;30;30;30];
trajectory(car3, waypoints, speed);

truck = vehicle(scenario, ...
    'ClassID', 2, ...
    'Length', 8.2, ...
    'Width', 2.5, ...
    'Height', 3.5, ...
    'Position', [430.7 -436.7 0]);
waypoints = [430.7 -436.7 0;
    525.3 -532.9 0;
    570.9 -577.1 0;
    638.6 -644.6 0;
    731.4 -736.8 0;
    822.4 -826.6 0;
    896.6 -899.4 0;
    1012.5 -1012.3 0;
    1150.8 -1146.4 0;
    1216.3 -1209.1 0;
    1349.7 -1336.8 0;
    1416.5 -1400.5 0;
    1620.3 -1593.2 0;
    1860.5 -1818.8 0;
    1963.3 -1915.3 0];
speed = [10;10;10;10;10;15;23;23;23;23;23;23;23;18;0];
trajectory(truck, waypoints, speed);

