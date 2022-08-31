function optimal_acceleration = speed_cntr(u_prev,ref_vel,act_vel,Con_acc,Con_jrk)

%% DATA 

Hp = 10;
Ts = 0.1;

% Constraints
u_max = Con_acc.acc_max;
u_min = Con_acc.acc_min;

du_max = Con_jrk.jerk_max;
du_min = Con_jrk.jerk_min;

%% MODEL

% v(t) = 1/(tau*s + 1)*a_des(t)

A = -2;
B = 1;
C = 2;
D = 0;

n = 1;

Ad = expm(A*Ts);
Bd = pinv(A)*(Ad-eye(n))*B;
Cd = C;
Dd = D;

% Augmented system
Aaug = [Ad Bd;zeros(1,1) 1];
Baug = [Bd;1];
Caug = [Cd 0];

naug = n+1;

%% OPTIMIZATION

% Weights
Q_y = eye(Hp);
R = eye(Hp);

% Prediction matrices
% -------- Abar ------------
Aaugbar = zeros(naug*Hp,naug);

for i = naug:naug:naug*Hp
    Aaugbar((i-naug+1):i,1:naug) = Aaug^(i/naug);
end

Aaugbar = [eye(naug);Aaugbar];
% --------------------------

% -------- Bbar ------------
Baugbar = zeros(naug*Hp,Hp);

for i = naug:naug:naug*Hp
    for j = 1:Hp
        if(j<=(i/naug))
            Baugbar(i-naug+1:i,j) = Aaug^(i/naug-j)*Baug;
        else
            Baugbar(i-naug+1:i,j) = zeros(naug,1);
        end
        
    end
end

Baugbar = [zeros(naug,Hp);Baugbar];
% --------------------------

% -------- Cbar ------------
Caugtilde = zeros(Hp,naug*Hp);

for i = naug:naug:naug*Hp
    for j = 1:Hp
        if(j==(i/naug))
            Caugtilde(j,i-naug+1:i) = Caug;
        else
            Caugtilde(j,i-naug+1:i) = zeros(naug,1);
        end
    end
end

Caugtilde = [zeros(Hp,naug),Caugtilde];
% --------------------------

% ------ C_ineq_tilde -------

Caugineq = [0 1; 
            0 -1];
         
nrows = length(Caugineq(:,1));
ncols = length(Caugineq(1,:));
            
Caugineqtilde = zeros(nrows*Hp,ncols*Hp);
k = 0;

for i = 1:ncols:ncols*Hp
    for j = 1:nrows:nrows*Hp
        if((j+k)==i)
            Caugineqtilde(j:(j+nrows-1),i:(i+ncols-1)) = Caugineq;
            k = k+1;
        else
            Caugineqtilde(j:(j+nrows-1),i:(i+ncols-1)) = zeros(nrows,ncols);
        end
    end
end

Caugineqtilde = [zeros(nrows*Hp,naug) Caugineqtilde];

% --------------------------

% -------- f_ineq ----------
f_ineq = [u_max;-u_min];
f_ineqtilde = zeros(nrows*Hp,1);

for i = 1:nrows:nrows*Hp
    f_ineqtilde(i:(i+nrows-1),1) = f_ineq;
end
% --------------------------

% Change of variable
Aaugtilde = Caugtilde*Aaugbar;
Baugtilde = Caugtilde*Baugbar;

% Constraints
G_du = [eye(Hp);-eye(Hp)];
h_du = [du_max*ones(Hp,1);
        -du_min*ones(Hp,1)];
    
G_x = Caugineqtilde*Baugbar;
h_x = f_ineqtilde - Caugineqtilde*Aaugbar*[act_vel;u_prev];

% Matrix H for the opt. problem
H = 2*(Caugtilde*Baugbar)'*Q_y*(Caugtilde*Baugbar) + 2*R;

% Matrix F for the opt. problem
F = 2*(Aaugtilde*[act_vel;u_prev]-ref_vel*ones(Hp,1))'*R*(Baugtilde);

%Options for the solver
OPTIONS = optimoptions('quadprog');
OPTIONS.Algorithm = 'active-set';

% Computation of the optimal sequence
%U = quadprog(H,F,[G_x;G_du],[h_x;h_du],[],[],[],[],zeros(Hp,1),OPTIONS);
U = quadprog(H,F,G_x,h_x,[],[],[],[],zeros(Hp,1),OPTIONS);
% Selection of the first control action
optimal_dacc = U(1);

if(abs(optimal_dacc) <= 1e-3)
    optimal_dacc = 0;
end

optimal_acceleration = u_prev + optimal_dacc;
