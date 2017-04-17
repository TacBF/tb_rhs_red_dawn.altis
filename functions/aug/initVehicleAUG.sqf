if!(local player) exitWith {};
waitUntil { player == player};
waitUntil { alive player};
waitUntil { local player};
waitUntil {!(isNil 'Func_text_aug_action')};

private ["_veh","_add1","_add2","_condition1","_condition2"];

_veh = (_this select 0);
if(_veh getvariable ["Aug_actions",false]) exitWith {};
_veh setVariable ["Aug_actions", true, false ];

_condition1 = "((speed _target <= 1) AND (speed _target >= -1)) and (alive _target) and (_this distance _target < 6) and (vehicle _this == _this)";
_add1 = _veh addAction [ "",{_this call Func_aug_action},0,1.5,false,false,"",_condition1];

_condition2 = "(_this distance _target < 6) and (_target getVariable ['move_gunner',false])";
_add2 = _veh addAction [ "",{_this call Func_go_gunner},0,10,false,false,"",_condition2];



while { alive _veh } do 
{
    private ["_text_arr"]; 
    _text_arr = [ _veh ] call Func_text_aug_action;
    _veh setUserActionText [ _add1,(_text_arr select 0)];
	_veh setUserActionText [ _add2,(_text_arr select 1)];
	
sleep 1;	
};
if(true) exitWith {};










