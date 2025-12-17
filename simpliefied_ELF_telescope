clear; clf; figure(1);

% Free [Q=Q_(dim x q)] and fixed [P=P_(dim x p)] node locations
Q(:,1)=[1; 0; -1];
Q(:,2)=[0.309; 0.951; -1];
Q(:,3)=[-0.809; 0.588; -1]; 
Q(:,4)=[-0.809; -0.588; -1];
Q(:,5)=[0.309; -0.951; -1]; 
Q(:,6)=[0.809; 0.588; 1]; 
Q(:,7)=[-0.309; 0.951; 1];
Q(:,8)=[-1.000; 0.000; 1];
Q(:,9)=[-0.309; -0.951; 1];
Q(:,10)=[0.809; -0.588; 1];
r=0.2;
P(:,1)=[r*Q(1,1); r*Q(2,1); -1]; %  fixed nodes
P(:,2)=[r*Q(1,2); r*Q(2,2); -1];
P(:,3)=[r*Q(1,3); r*Q(2,3); -1];
P(:,4)=[r*Q(1,4); r*Q(2,4); -1];
P(:,5)=[r*Q(1,5); r*Q(2,5); -1];
P(:,6)=[r*Q(1,1); r*Q(2,1); -0.2];
P(:,7)=[r*Q(1,2); r*Q(2,2); -0.2];
P(:,8)=[r*Q(1,3); r*Q(2,3); -0.2];
P(:,9)=[r*Q(1,4); r*Q(2,4); -0.2];
P(:,10)=[r*Q(1,5); r*Q(2,5); -0.2];
[dim,q]=size(Q); % got dim = and q =
p=size(P,2); % p's column
n=q+p; 

% Defining connectivity matrix
C(1,1)=1; C(1,2)=-1; % bars 1 = start point; -1 = end point
C(2,2)=1; C(2,3)=-1; % e.g. C(sequence of column, from which point); C(sequence of column, to which point);
C(3,3)=1; C(3,4)=-1; 
C(4,4)=1; C(4,5)=-1;
C(5,5)=1; C(5,1)=-1;
C(6,6)=1; C(6,7)=-1;
C(7,7)=1; C(7,8)=-1;
C(8,8)=1; C(8,9)=-1;
C(9,9)=1; C(9,10)=-1;
C(10,10)=1; C(10,6)=-1;
C(11,1)=1; C(11,6)=-1;
C(12,2)=1; C(12,7)=-1;
C(13,3)=1; C(13,8)=-1;
C(14,4)=1; C(14,9)=-1;
C(15,5)=1; C(15,10)=-1;
b=15;  
C(b+1,1)=1; C(b+1,11)=-1; % strings 
C(b+2,2)=1; C(b+2,12)=-1;    
C(b+3,3)=1; C(b+3,13)=-1;    
C(b+4,4)=1; C(b+4,14)=-1;    
C(b+5,5)=1; C(b+5,15)=-1;    
C(b+6,1)=1; C(b+6,16)=-1;    
C(b+7,2)=1; C(b+7,17)=-1;    
C(b+8,3)=1; C(b+8,18)=-1;    
C(b+9,4)=1; C(b+9,19)=-1;
C(b+10,5)=1; C(b+10,20)=-1;
C(b+11,1)=1; C(b+11,7)=-1;
C(b+12,2)=1; C(b+12,8)=-1;
C(b+13,3)=1; C(b+13,9)=-1;
C(b+14,4)=1; C(b+14,10)=-1;
C(b+15,5)=1; C(b+15,6)=-1;
s=15;
m=b+s; % the number of members

% Applied external force U=U_(dim x q)
U = zeros(dim, q);
U(3,2) = -1; % needed change

% Solve for the forces at equilibrium, 
[c_bars,t_strings,V]=tensegrity_statics(b,s,q,p,dim,Q,P,C,U);

% Setting parameters of cylinder
R_outer = 0.2;         % Outer radius
t       = 0.05;        % Thickness
R_inner = R_outer - t; % Inner radius
H       = 3;           % Height
N       = 100;         % The number of segment of round

% Outer face generation
[Xi, Yi, Zi] = cylinder(R_inner, N); Zi = Zi * H - 1.5;
[Xo, Yo, Zo] = cylinder(R_outer, N); Zo = Zo * H - 1.5;

figure; hold on
% Outer face
surf(Xo, Yo, Zo, 'FaceColor', 'c', 'FaceAlpha', 0.5, 'EdgeColor', 'none');
% Inner face
surf(Xi, Yi, Zi, 'FaceColor', 'w', 'FaceAlpha', 1, 'EdgeColor', 'none');

% Top face
fill3([Xo(1,:) fliplr(Xi(1,:))], ...
      [Yo(1,:) fliplr(Yi(1,:))], ...
      [Zo(1,:) fliplr(Zi(1,:))], ...
      'c','FaceAlpha',0.5,'EdgeColor','none');
% Lower face
fill3([Xo(2,:) fliplr(Xi(2,:))], ...
      [Yo(2,:) fliplr(Yi(2,:))], ...
      [Zo(2,:) fliplr(Zi(2,:))], ...
      'c','FaceAlpha',0.5,'EdgeColor','none');

tensegrity_plot(Q,P,C,b,s,U,V,true,1,0.08); grid on;

% end
