
% Pass the vehicle
input.init.saved_veh_file='series_small_in';
[error_code,resp]=adv_no_gui('initialize',input);

        % Modify the Vehicle Parameters
        input.modify.param = {'veh_cargo_mass','veh_glider_mass','veh_FA','veh_CD','wh_1st_rrc'};
        input.modify.value = {100,914,1.8,0.22,0.006};
        [error_code,resp] = adv_no_gui('modify',input)

        % Modify the trq and spd of the Engine
        input.modify.param = {'fc_trq_scale','fc_spd_scale'};
        input.modify.value = {0.70533,1};
        [error_code,resp] = adv_no_gui('modify',input)
        
        % Modify the number of Battery Modules
        input.modify.param = {'ess_module_num'};
        input.modify.value = {39.4198};
        [error_code,resp] = adv_no_gui('modify',input)

        % Scale the trq and spd of the Motor
        input.modify.param = {'mc_trq_scale','mc_spd_scale'}
        input.modify.value = {1.6312,1};
        [a,b] = adv_no_gui('modify',input);

        % Scale the trq and spd of the Generator
        input.modify.param = {'gc_trq_scale','gc_spd_scale'}
        input.modify.value = {0.87667,0.857};
        [a,b] = adv_no_gui('modify',input);

        % Modify the Final Drive Ratio
        input.modify.param = {'fd_ratio'};
        input.modify.value = {0.582};
        [error_code,resp] = adv_no_gui('modify',input)
        
        % Modify the Accesory load
        input.modify.param = {'acc_elec_pwr'};
        input.modify.value = {3200};
        [error_code,resp] = adv_no_gui('modify',input)
