function [F] = RK4Step(S, A, H, I)
    T = S(1, I);
    X = S(2 : 5, I);
    V = S(6 : 9, I);
    
    K0 = A(X(1), X(2), X(3), X(4), V(1), V(2), V(3), V(4));
    L1 = V + H / 2 * K0;
    M1 = X + H / 2 * V;

    K1 = A(M1(1), M1(2), M1(3), M1(4), L1(1), L1(2), L1(3), L1(4));
    L2 = V + H / 2 * K1;
    M2 = X + H / 2 * L1;

    K2 = A(M2(1), M2(2), M2(3), M2(4), L2(1), L2(2), L2(3), L2(4));
    L3 = V + H / 2 * K2;
    M3 = X + H / 2 * L2;

    K3 = A(M3(1), M3(2), M3(3), M3(4), L3(1), L3(2), L3(3), L3(4));
    
    F(1) = T + H;
    F(2 : 5) = X + H * (V + H * (K0 + K1 + K2) / 6);
    F(6 : 9) = V + H * (K0 + 2 * K1 + 2 * K2 + K3) / 6;
end