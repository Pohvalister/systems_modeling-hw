% Решение ОДУ

syms u(t) v(t) t;
Du = diff(u, 1);
D2u = diff(u, 2);
Dv = diff(v, 1);
D2v = diff(v, 2);

eqn1 = D2u==(v-5*u);
eqn2 = D2v==(2*v+u+t);
cond = [u(0)==1.5,Du(0)==1,v(0)==3,Dv(0)==1];

%eqns = 'D2u(t)=v-5*u,D2v(t)=2*v+u+t';
%conds = 'u(0)=1.5,Du(t)=1,v(0)=3,Dv(t)=1';
[uSol(t), vSol(t)] = dsolve(eqn1, eqn2, cond)
pretty(uSol)