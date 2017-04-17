if!(local player) exitWith {};

private ["_lhdpos","_ranx","_rany"];
player allowdammage false;
100025 cutText [ "", "BLACK FADED", 0];

_lhdpos = _this select 0;
_ranx = (floor(random 6));
_rany = (floor(random 12));

player attachTo [ _lhdpos,[ _ranx,_rany,1]];

detach player;
//[ player, (getPosASL player)] remoteExec ["setposASL", 0, false];

[] spawn {sleep 2; 100025 cutText [ "", "BLACK IN", 2];player setPosASL (getPosASL player) ;player allowdammage true};

if(true) exitWith {};