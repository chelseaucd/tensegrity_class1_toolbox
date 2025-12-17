clear; clf; figure(1);

% Free [Q=Q_(dim x q)] and fixed [P=P_(dim x p)] node locations
Q(:,1)=[0.2588; 0.9659; 0.5];
Q(:,2)=[-0.9659; -0.2588; 0.5];
Q(:,3)=[0.7071; -0.7071; 0.5]; 
Q(:,4)=[0.2588; -0.9659; -0.5];
Q(:,5)=[0.7071; 0.7071; -0.5]; 
Q(:,6)=[-0.9659; 0.2588; -0.5]; 
P=[]; % no fixed nodes
[dim,q]=size(Q); % got dim = and q =
p=size(P,1); % p's column
n=q+p; 

% Defining connectivity matrix
C(1,1)=1; C(1,4)=-1; % bars 1 = start point; -1 = end point
C(2,2)=1; C(2,5)=-1; % e.g. C(sequence of column, from which point); C(sequence of column, to which point);
C(3,3)=1; C(3,6)=-1; b=3;  
C(b+1,1)=1; C(b+1,2)=-1; % strings 
C(b+2,1)=1; C(b+2,3)=-1;    
C(b+3,1)=1; C(b+3,5)=-1;    
C(b+4,2)=1; C(b+4,3)=-1;    
C(b+5,2)=1; C(b+5,6)=-1;    
C(b+6,3)=1; C(b+6,4)=-1;    
C(b+7,4)=1; C(b+7,5)=-1;    
C(b+8,4)=1; C(b+8,6)=-1;    
C(b+9,5)=1; C(b+9,6)=-1; s=9;
m=b+s; % the number of members

% Applied external force U=U_(dim x q)
U(1:dim,1:6)=0;

% Solve for the forces at equilibrium, 
[c_bars,t_strings,V]=tensegrity_statics(b,s,q,p,dim,Q,P,C,U);
tensegrity_plot(Q,P,C,b,s,U,V,true,1,0.08); grid on;

% end
