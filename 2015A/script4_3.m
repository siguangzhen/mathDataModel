clear;
tic;

% 导入数据
points = xlsread('附件1-4.xlsx', 1, 'B2:C22');
l0 = transpose(sqrt(points(:,1).^2+points(:,2).^2));
t0 = [133.5 133.75 134.25 134.75 135 135.5 136 136.25 136.75 137.25 137.75 138 138.5 139 139.25 139.75 140.25 140.5 141 141.5 142]; % 时间角向量，角度制

% 实际问题的参数设置
h = 2; % 假设杆的高度为3米
t0 = [190.25 191 191.75 192.5 193.25 194 194.75 195.5 196.25 197 197.75 198.5 199.25 200 200.75 201.5 202.25 203 203.75 204.5 205.25]; % 时间角向量，角度制
rad_t0 = (t0/360)*(2*pi); % 时间角向量，弧度制

% 设置算法参数
E0 = 0.05; % 允许误差
maxNum = 10000; % 粒子最大迭代次数
narvs = 3; % 目标函数的自变量个数
particleSize = 100; % 粒子群规模
c1 = 2; % 每个粒子的个体学习因子，也称加速常数
c2 = 2; % 每个粒子的社会学习因子，也称加速常数
w = 0.6; % 惯性因子
vMax = 30; % 粒子的最大飞行速度，单位“度/次”

for v0 = 1:90
    % 初始化粒子群状态
    x = zeros(particleSize, narvs);
    x(:,1) = 180*(rand(particleSize,1)-0.5); % 粒子的所在维度，单位“度”
    x(:,2) = 360*(rand(particleSize,1)-0.5); % 粒子的所在经度，单位“度”
    x(:,3) = 365*rand(particleSize,1); % 粒子的所在经度，单位“度”
    v = v0*rand(particleSize,narvs); % 粒子的飞行速度，单位“度/次”

    for m = 1:particleSize
        solar = ((23.5*sin(((2*pi)/365)*x(m,3)))/360)*(2*pi); % 由题目已知计算
        rad_x = (x(m,1)./360).*(2*pi); % 将纬度角度制的x转换为弧度制的rad_x
        t = t0 + (x(m,2)-120); % 计算各个维度所对应的实际的时间角
        rad_t = (t./360).*(2*pi); % 将x的经度对应的时间角转换为弧度制rad_t
        sin_h = sin(rad_x(1)).*sin(solar)+cos(rad_x(1)).*cos(solar).*cos(rad_t);
        cos_h = sqrt(1-sin_h.^2);
        l = h.*(cos_h./sin_h);
        y(m) = sum(abs(l-l0));
    end
    personalBest_x = x;
    personalBest_faval = y;
    [globalBest_faval m] = min(personalBest_faval);
    globalBest_x = personalBest_x(m,:);
    k = 1;
    while k<=maxNum
        for m = 1:particleSize
            solar = ((23.5*sin(((2*pi)/365)*x(m,3)))/360)*(2*pi); % 由题目已知计算
            rad_x = (x(m,1)./360).*(2*pi); % 将纬度角度制的x转换为弧度制的rad_x
            t = t0 + (x(m,2)-120); % 计算各个维度所对应的实际的时间角
            rad_t = (t./360).*(2*pi); % 将x的经度对应的时间角转换为弧度制rad_t
            sin_h = sin(rad_x(1)).*sin(solar)+cos(rad_x(1)).*cos(solar).*cos(rad_t);
            cos_h = sqrt(1-sin_h.^2);
            l = h.*(cos_h./sin_h);
            y(m) = sum(abs(l-l0));
            if y(m)<personalBest_faval % 判断当前位置是否是历史上最佳位置
                personalBest_faval(m) = y(m);
                personalBest_x(m,:) = x(m,:);
            end
        end
        [globalBest_faval m] = min(personalBest_faval);
        globalBest_x = personalBest_x(m,:);
        for m = 1:particleSize % 更新粒子群里每个个体的最新位置
            v(m,:) = w*v(m,:)+c1*rand*(personalBest_x(m,:)-x(m,:))+c2*rand*(globalBest_x-x(m,:));
            for n = 1:narvs % 判断粒子的飞行速度是否超过最大飞行速度
                if v(m,n)>vMax
                    v(m,n) = vMax;
                elseif v(m,n)<-vMax
                    v(m,n) = -vMax;
                end
            end
            x(m,:) = x(m,:)+v(m,:);
        end
        if abs(globalBest_faval)<E0
            break
        end
        k = k+1;
    end
    globalBest_favals(v0) = globalBest_faval;
    globalBest_xs(v0,:) = globalBest_x;
    v0
end
plot(1:v0, globalBest_favals, 'b')
hold on
plot(1:v0, globalBest_xs(:,1), 'm')
plot(1:v0, globalBest_xs(:,2), 'r')
plot(1:v0, globalBest_xs(:,3), 'g')
hold off
toc;
