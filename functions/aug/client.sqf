#include "config.sqh"
if!(local player ) exitWith {};

Func_attach_weapon = compile preprocessfile "functions\aug\fn_attach_weapon.sqf";
Func_detach_weapon = compile preprocessfile "functions\aug\fn_detach_weapon.sqf";
Func_aug_action = compile preprocessfile "functions\aug\fn_aug_action.sqf";
Func_aug_objects = compile preprocessfile "functions\aug\fn_aug_objects.sqf";
Func_get_out = compile preprocessfile "functions\aug\fn_get_out.sqf";
Func_go_gunner = compile preprocessfile "functions\aug\fn_go_gunner.sqf";
Func_go_driver = compile preprocessfile "functions\aug\fn_go_driver.sqf";
Func_text_aug_action = compile preprocessfile "functions\aug\fn_text_aug_action.sqf";

sleep 20;

[] spawn 
{ 
    {
	    if((typeOf _x) in __ALLCAR) then
		{
	        [_x] execVM "functions\aug\initVehicleAUG.sqf";
		};
    } forEach vehicles;
};