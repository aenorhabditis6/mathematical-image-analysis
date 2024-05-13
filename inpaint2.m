
function image = inpaint2(s,lambda,iter,mask)
    s = double(s(:,:,1));
    u = s;
    d = s - s .* mask;
    bx = zeros(size(s));
    by = zeros(size(s));
    [h,w] = size(s);

    uk = zeros(h,w);
    LamMtx = zeros(h,w);
    LamMtx(mask) = lambda; % crate the lambda matrix LamMtx

    % sx = [-1 0 1; -2 0 2; -1 0 1];
    % sy = [-1 -2 -1; 0 0 0; 1 2 1];

    % grad_x = conv2(u, sx, 'same');
    % grad_y = conv2(u, sy, 'same');
    % gradient_magnitude = sqrt(grad_x.^2 + grad_y.^2);

    D1 = spdiags([-ones(w,1),ones(w,1)], 0:1, w, w);
    D1(w, 1) = 1;
    D2 = spdiags([-ones(h,1),ones(h,1)], 0:1, h, h);
    D2(h, 1) = 1;

    for i = 1:iter
        grad_x = u*D1;                                     
        grad_y = D2*u;

        % d subproblem
        [dx,dy] = shrink(grad_x,grad_y,bx,by,0.1);
    
        % u subproblem -- need to use Gauss-Siedel per Bergman iteration
        Gk = Gau_Sei(dx,dy,bx,by,lambda,0.1,u,uk,h,w);     % find Gk by Gau_Sei solution, coded up from the original paper
        dif = (uk-Gk).^2;
        uk = Gk;
        % div_del_s = conv2(u,[0 1 0; 1 -4 1 ; 0 1 0],'same'); %% not divdels = del2(u);
        % newgrad_x = conv2(u, sx, 'same');
        % newgrad_y = conv2(u, sy, 'same');
        % newgrad_magn = sqrt(newgrad_x.^2 + newgrad_y.^2);
        % d = [newgrad_x,newgrad_y];     % update in every cycle
        % 
        %  step_grad = 2* (u-s) + lambda*div_del_s./ newgrad_magn;
        %  if newgrad_magn <= 10e-4
        %      break
        %  optimal_alpha = f(start,-step_grad);
        %  u(mask) = u(mask) - alpha * step_grad(mask);

        % update b
        bx = bx + grad_x - (grad_x + bx) ./ abs(grad_x + bx);
        by = by + grad_y - (grad_y + by) ./ abs(grad_y + by);

        disp(['Iteration: ', num2str(i)]);
        % disp(['Gradient Magnitude Mean: ', num2str(mean(newgrad_magn(:)))]);
        % disp(['TV Term Mean: ', num2str(mean(d(:)))]);
        % disp([num2str(alpha)])

        subplot(2, 5, i);
        imshow(uint8(u));
        title(['Iteration: ', num2str(i)]);
        drawnow;
    end

    image = uint8(uk);
end

% % Divergence operator
% function div = div2(bx, by)
%     div = -circshift(bx, [0, 0]) + circshift(bx, [0, 1]) ...
%           -circshift(by, [0, 0]) + circshift(by, [1, 0]);
% end

% function alpha = compute_alpha(u, s, mask, lambda, gradient_magnitude,sx,sy)
%     grad_tv_x = conv2(u, sx, 'same');
%     grad_tv_y = conv2(u, sy, 'same');
%     grad_tv_magnitude = sqrt(grad_tv_x.^2 + grad_tv_y.^2);
% 
%     numerator = sum(sum((u(mask) - s(mask)) .* gradient_magnitude(mask)));
%     denominator = sum(sum(gradient_magnitude(mask) .^ 2 + lambda));
% 
%     alpha = numerator / denominator;
% end

% function alpha = f(u,start,-gradient)
%     % find derivative of u every step
%     grad_x = conv2(u,[-1 0 1; -2 0 2; -1 0 1], 'same');
%     grad_y = conv2(u,[-1 -2 -1; 0 0 0; 1 2 1], 'same');
%     gradient_magnitude = sqrt(grad_x.^2 + grad_y.^2);
% 
% 
% 
% end

function Gk = Gau_Sei(dx,dy,bx,by,lambda,gama,u,uk,h,w)

laplacian = [0 1 0; 1 -4 1 ; 0 1 0];
D_prod = lambda .* u;
lamdan4g = lambda + 4*gama;

coefficient1 = D_prod./lamdan4g;
coefficient2 = gama./lamdan4g;

u_sum = conv2(u,laplacian,'same');
% u_sum = sum(u(2:h+1,2:w+1));
db_sum = fwd_diff_row(dx) + fwd_diff_col(dy)-fwd_diff_row(bx)-fwd_diff_col(by);

Gk = coefficient1 + coefficient2.*(u_sum + db_sum);

end
        % u(mask) = u(mask) + (2*s(mask)-u(mask) + lambda*div_del_s(mask)./ newgrad_magn(mask));

function x_diff = fwd_diff_row(x_data)

[row,~] = size(x_data);

x_data_rowless = [x_data(1,:);x_data(1:row-1,:)];
x_diff = x_data_rowless - x_data;

end


function y_diff = fwd_diff_col(y_data)

[~,col] = size(y_data);
y_data_rowless = [y_data(:,1),y_data(:,1:col-1)];

y_diff = y_data_rowless - y_data;
end

function [dx,dy] = shrink(gx,gy,bx,by,constant)

x1 = (gx + bx)./abs(gx + bx);

dx = x1.*max(abs(gx + bx)-1/constant,0);
dx(isnan(dx)) = 0; % set any NaN (Not a Number) values to 0

x2 = (gy + by)./abs(gy + by);

dy = x2.*(max(abs(gy + by)-1/constant,0));
dy(isnan(dy)) = 0;

end

       % Gk = GS(dx,dy,bx,by,lambda,0.1,u,uk,h,w);
        % dif = (uk-Gk).^2;
        % uk = Gk;
      
        %  alpha = compute_alpha(u, s, mask, lambda, newgrad_magn,sx,sy);
        % u(mask) = u(mask) + (2*s(mask)-u(mask) + lambda*div_del_s(mask)./ newgrad_magn(mask)); % Keep original values within the mask
        % u = u + alpha*(2.*s-u + lambda*div_del_s./ gradient_magnitude)