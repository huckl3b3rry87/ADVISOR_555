function [con, con_e]=con_STEP(x,varargin)

% update parameter settings
input.modify.param={'mc_trq_scale','mc_spd_scale','ess_module_num','fd_ratio'}; % parameter names are stored in the first optional argument
input.modify.value=num2cell(x); % assign corresponding values
[error,~]=adv_no_gui('modify',input);

con=evalin('base','con');

offset=length(con);

% run acceleration test
input.accel.param={'spds','disable_systems','disp_results'};
input.accel.value={[0 60],0,1};
[error, resp]=adv_no_gui('accel_test',input);

if ~error&~isempty(resp.accel.times)
    con(3,1)=resp.accel.times(1);
else
   con(3,1)=100;
end

% run grade test
input.grade.param={'duration','speed','grade','disable_systems','ess_init_soc','ess_min_soc'};
input.grade.value={100,55,5,0,1,0.3};
[error, resp]=adv_no_gui('grade_test',input);
if ~error&~isempty(resp.grade.grade)
    con(4,1)=resp.grade.grade;
else
    con(4,1)=0;
end

% matlab only
if length(varargin)>3
    for i=1:length(con)
        if varargin{4}(i)>-1e29
            con(i)=varargin{4}(i)-con(i);
        elseif varargin{5}(i)<1e29
            con(i)=con(i)-varargin{5}(i);
        end
    end
end
con_e=0;
% ****
con

return
