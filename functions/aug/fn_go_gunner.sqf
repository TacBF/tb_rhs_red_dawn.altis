private ["_veh","_gunner","_gun"];

_veh = _this select 0;
_veh setVariable ["TB_parkingBrake", true,true];
_gunner = _this select 1;
_gun = _veh getVariable "Aug_attached";
if!(isNil '_gun') then 
{
  
  if(isNull (gunner _gun)) then
  { 
    if(vehicle _gunner != _gunner) then
	{    
	    100025 cutText [ "", "BLACK FADED", 0];
	    _gunner allowdammage false;
        _gunner action ["eject",(vehicle _gunner)];
        waitUntil { vehicle _gunner == _gunner};
	    _gunner moveinTurret [_gun, [0]];
		waitUntil { _gunner in crew _gun};
        _gunner allowdammage true;
		[] spawn {sleep 1; 100025 cutText [ "", "BLACK IN", 1]};		
	}
	else
	{
	    100025 cutText [ "", "BLACK FADED", 0];
	    _gunner moveinCargo [_veh, (count (crew _veh))];
        _gunner action ["eject",(vehicle _gunner)];
        waitUntil { vehicle _gunner == _gunner};
	    _gunner moveinTurret [_gun, [0]];
		[] spawn {sleep 1; 100025 cutText [ "", "BLACK IN", 1]};
		
	};
  };
};
