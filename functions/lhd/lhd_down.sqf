if!(isServer) exitWith {};
#define _list ["Land_LHD_1", "Land_LHD_2", "Land_LHD_3", "Land_LHD_4", "Land_LHD_5","Land_LHD_6", "Land_LHD_house_1", "Land_LHD_house_2", "Land_LHD_elev_R"]
#define _DIST 300
#define _OFFSET_LHD_ON [0,0,0 ]
#define _OFFSET_LHD_TW [-0.6,-61,0]
#define _OFFSET_LHD_FR [0.63,-84,0.64]
#define _OFFSET_LHD_FO [-1.44,-129,1.64]
#define _OFFSET_LHD_FI [-1.825,-173.96,0.997]
#define _OFFSET_LHD_SI [-1.44,-215,0.997]
#define _OFFSET_LHD_SE [-2.591,-90.11,17.606]
#define _OFFSET_LHD_AT [-5.8,-130.9,19.70]
#define _OFFSET_LHD_NI [3.1,-200.1,0.89]
#define _OFFSET_SIM [0,84,-10]

#define _DIGONE 0.0001
#define _DIGTWO 0.0005
#define _SLEEP 0.01
#define _SLEEPWAIT 0.01
#define _TIMERONE 5
#define _TIMERTWO 15

private ["_ship","_sim","_pos","_objects"];
_ship = _this select 0;
_sim = _this select 1;
_pos = getposasl _ship;
_objects = nearestObjects [_pos ,_list,_DIST];
waitUntil {LHD_DOWN};
sleep 5;
{
    private ["_offset"];
  	_offset = switch(typeOf _x)do
	{
	case "Land_LHD_1": {_OFFSET_LHD_ON};
	case "Land_LHD_2": {_OFFSET_LHD_TW};
	case "Land_LHD_3": {_OFFSET_LHD_FR};
	case "Land_LHD_4": {_OFFSET_LHD_FO};
	case "Land_LHD_5": {_OFFSET_LHD_FI};
	case "Land_LHD_6": {_OFFSET_LHD_SI};
	case "Land_LHD_house_1": {_OFFSET_LHD_SE};
	case "Land_LHD_house_2": {_OFFSET_LHD_AT};
	case "Land_LHD_elev_R": {_OFFSET_LHD_NI};
	default {_OFFSET_LHD_ON};
	};
	_x attachto [ _ship,_offset];
} foreach _objects;

detach _sim;
_ship attachto [ _sim,_OFFSET_SIM];

[_sim] call 
{
private ["_ship","_time","_waitUntil"];
   _ship = _this select 0;
   _time = 0;
   _waitUntil = 0;  
   _ship hideObjectGlobal false;
   _ship enablesimulationGlobal true;
   _ship setDammage 1;
   _ship setVectorUp [ 0,0,1];
   sleep 0.1;
   while { _time < _TIMERONE } do 
   {
       _ship setVectorDirAndUp [ vectorDir _ship,[((vectorUp _ship) select 0) - _DIGONE ,((vectorUp _ship) select 1) - _DIGONE,(vectorUp _ship) select 2]];
       _time = _time + _SLEEP;
	   //hint str _time;
       sleep _SLEEP;
    };
   while { _time < _TIMERTWO } do 
   {
       _ship setVectorDirAndUp [ vectorDir _ship,[((vectorUp _ship) select 0) - _DIGTWO ,((vectorUp _ship) select 1) - _DIGTWO,(vectorUp _ship) select 2]];
       _time = _time + _SLEEP;
	   //hint str _time;
       _waitUntil = time + _SLEEPWAIT;
       waitUntil { (time > _waitUntil)};
       sleep _SLEEP;
    };
};

if(true) exitWith {};



