%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%                        Pitch Decay
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Simulation Data
simu=simulationClass();
simu.simMechanicsFile = 'FOSWEC_Pitch.slx';
simu.rampT = 0;
simu.endTime = 100;
simu.dt = 0.05;
simu.mode = 'normal';
simu.explorer = 'on';
simu.domainSize = 2;
simu.CITime = 10;
simu.mcrCaseFile = 'pitchDecayCase.mat';

%% Wave Information
waves = waveClass('noWaveCIC');

%% Body Data
%% Body 1: Platform
body(1) = bodyClass('../../hydroData/Analysis.h5',1);                     
body(1).geometryFile = '../../geometry/platform.stl';
body(1).mass = 79.437181353569;    
body(1).momOfInertia = [57.0431 47.211 66.2529];
body(1).viz.color = [1 1 1];
body(1).viz.opacity = 0.25;

% %pitch decay
% cg1 = [0,0,-0.1560];
% relCoord = cg1 - ic;
% rotatedRelCoord = body(1).rotateXYZ(relCoord,[0 1 0],phi);
% newCoord = rotatedRelCoord + ic;
% linDisp = newCoord-cg1;
% body(1).initDisp.initLinDisp= linDisp; 
% body(1).initDisp.initAngularDispAxis = [0 1 0];
% body(1).initDisp.initAngularDispAngle = phi;

% phi = 25 * pi/180;
% ic = [0,0,-0.366];
% body(1).setInitDisp(ic,[0 1 0],phi,[0,0,0])
% % body(1).initDisp.initLinDisp

%% Body 2: Front Flap
body(2) = bodyClass('../../hydroData/Analysis.h5',2);                     
body(2).geometryFile = '../../geometry/flap.stl';
body(2).mass = 13.5204596444964;     
body(2).momOfInertia = [2.3664 1.0264 1.3736];

% %pitch decay
% % ic = [0,0,-0.366];
% cg2 = [-0.6500, 0, -0.3380];
% relCoord = cg2 - ic;
% rotatedRelCoord = body(2).rotateXYZ(relCoord,[0 1 0],phi);
% newCoord = rotatedRelCoord + ic;
% linDisp = newCoord-cg2;
% body(2).initDisp.initLinDisp= linDisp; 
% body(2).initDisp.initAngularDispAxis = [0 1 0];
% body(2).initDisp.initAngularDispAngle = phi;

% phi = 20 * pi/180;
% ic = [0,0,-0.366];
% body(2).setInitDisp(ic,[0 1 0],phi,[0,0,0])
% % body(2).initDisp.initLinDisp

%% Body 3: Back Flap
body(3) = bodyClass('../../hydroData/Analysis.h5',3);                     
body(3).geometryFile = '../../geometry/flap.stl';
body(3).mass = 13.5204596444964;     
body(3).momOfInertia = [2.3664 1.0264 1.3736];

% %pitch decay
% % ic = [0,0,-0.366];
% cg3 = [0.6500, 0, -0.3380];
% relCoord = cg3 - ic;
% rotatedRelCoord = body(3).rotateXYZ(relCoord,[0 1 0],phi);
% newCoord = rotatedRelCoord + ic;
% linDisp = newCoord-cg3;
% body(3).initDisp.initLinDisp= linDisp; body(3).initDisp.initAngularDispAxis = [0 1 0];
% body(3).initDisp.initAngularDispAngle = phi;

% phi = 20 * pi/180;
% ic = [0,0,-0.366];
% body(3).setInitDisp(ic,[0 1 0],phi,[0,0,0])
% % body(3).initDisp.initLinDisp

%% Arm Mass Properties (UPDATED)
%% Cyl Fixed - mounted to seafloor
cylFixed.mass = 1;
cylFixed.momOfInertia = [1 1 1];
cylFixed.cg = [0 0 -1.1];
cylFixed.dispVol = 1/1000;
cylFixed.initDisp.initLinDisp = [0 0 0];
cylFixed.initDisp.initAngularDispAxis = [0 1 0];
cylFixed.initDisp.initAngularDispAngle = 0;
cylFixed.geometryFile = 'empty.stl';
cylFixed.viz.color = [0 0 1];
cylFixed.viz.opacity = 0.25;

%% Cyl Heaving - attached to FOSWEC in heave
cyl.mass = 27.348; %[kg] %%13.52;
cyl.momOfInertia = [2.19 2.15 0.28]; %[kg-m^2] %%[1 1 1];
cyl.cg = [0 0 -1.082+0.3]; %[m] %%[0 0 -0.75];
cyl.dispVol = 0.009782; %[m^3]
cyl.initDisp.initLinDisp = [0 0 0];
cyl.initDisp.initAngularDispAxis = [0 1 0];
cyl.initDisp.initAngularDispAngle = 0;
cyl.geometryFile = 'empty.stl';
cyl.viz.color = [0 0 1];
cyl.viz.opacity = 1;

%% Squares Pitching - attached to FOSWEC in pitch
squares.mass = 4.47;  %[kg] %%13.52;
squares.momOfInertia = [0.29, 0.02, 0.30];  %[kg-m^2] %%[1 1 1];
squares.cg = [0 0 -0.866+0.5]; %[m]  %%[0 0 -0.5];
squares.dispVol = 0;
squares.initDisp.initLinDisp = [0 0 0];
squares.geometryFile = 'empty.stl';
squares.viz.color = [0 1 0];
squares.viz.opacity = 1;

%pitch decay
squares.initDisp.initAngularDispAxis = [0 1 0];
squares.initDisp.initAngularDispAngle = phi;

%% Rectangle (Frame) - attached to FOSWEC in all DOF
rectangleFrame.mass = 23.66; %[kg] %%79.4;
rectangleFrame.momOfInertia = [1.44 2.21 3.57]; %[kg-m^2] 
rectangleFrame.cg = [0 0 -0.366]; %[m] 
rectangleFrame.dispVol = 0;
rectangleFrame.initDisp.initLinDisp = [0 0 0];
rectangleFrame.geometryFile = 'empty.stl';
rectangleFrame.viz.color = [1 0 0];
rectangleFrame.viz.opacity = 1;

%pitch decay
% ic = [0,0,-0.366];
rectangleFrame.initDisp.initAngularDispAxis = [0 1 0];
rectangleFrame.initDisp.initAngularDispAngle = phi;

%% PTO and Constraint Parameters
%% Constraint 1
constraint(1)= constraintClass('rectangle_fixed');
constraint(1).loc = [0 0 -0.5];

%% Constraint 2
constraint(2)= constraintClass('arm_surge');
constraint(2).loc = [0 0 -0.5];

%% Constraint 3
constraint(3)= constraintClass('arm_pitch');
constraint(3).loc = [0 0 -0.3660];  % ic(3)

%% Constraint 4
constraint(4)= constraintClass('arm_heave');
constraint(4).loc = [0 0 -0.75];

%% Constraint 5
constraint(5)= constraintClass('arm_floor');
constraint(5).loc = [0 0 -1];

%% PTO 1
constraint(6)= constraintClass('PTO_flap1');
constraint(6).loc = [-0.65 0 -0.5];

%% PTO 2
constraint(7)= constraintClass('PTO_flap2');
constraint(7).loc = [ 0.65 0 -0.5];

