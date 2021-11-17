function x_phi = Dic_sindy(X,options)
arguments
    X double
    options string
end
t = size(X,1);
switch options
    case {'constant'}
        x_phi = ones(t,1);
    case {'first'}
        x_phi = X;
    case {'second'}
        x_phi = [X.^2,X(:,1).*X(:,2),X(:,1).*X(:,3),X(:,1).*X(:,4),...
            X(:,2).*X(:,3),X(:,2).*X(:,4),...
            X(:,3).*X(:,4)];   
    case {'sin'}
        x_phi = [sin(X),sin(2*X)];
    case {'cos'}
        x_phi = [cos(X),cos(2*X)];
end

