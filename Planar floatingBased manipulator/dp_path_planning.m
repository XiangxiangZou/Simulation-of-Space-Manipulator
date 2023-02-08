% Define the dynamic programming function
function [X,U,J] = dp_path_planning(f, cost, params)
    N = params.N;
    dt = params.dt;
    x0 = params.x0;
    xf = params.xf;
    
    X = zeros(2,N+1);
    U = zeros(1,N);
    J = zeros(N+1,1);
    
    X(:,N+1) = xf;
    J(N+1) = 0;
    
    for i = N:-1:1
        minJ = inf;
        minU = 0;
        for u = -5:0.1:5
            x = f(X(:,i+1),u);
            J_ = cost(x,u) + J(i+1);
            if J_ < minJ
                minJ = J_;
                minU = u;
                X(:,i) = x;
            end
        end
        U(i) = minU;
        J(i) = minJ;
    end
    
    X = [x0, X];
end