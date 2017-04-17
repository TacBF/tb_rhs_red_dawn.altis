#define _WEAPON_TURRET_ONE   ["RHS_weap_M242BC"]
#define _MAGAZINE_TURRET_ONE ["rhs_mag_70Rnd_25mm_M242_APFSDS","rhs_mag_70Rnd_25mm_M242_APFSDS","rhs_mag_70Rnd_25mm_M242_APFSDS","rhs_mag_70Rnd_25mm_M242_APFSDS","rhs_mag_70Rnd_25mm_M242_APFSDS","rhs_mag_70Rnd_25mm_M242_APFSDS","rhs_mag_70Rnd_25mm_M242_APFSDS"]
#define _WEAPON_TURRET_TWO   ["LMG_Minigun"]
#define _MAGAZINE_TURRET_TWO ["2000Rnd_65x39_Belt_Tracer_Red"]
#define _TURRET_ONE [0]
#define _TURRET_TWO [1]

_fnc_change = {
private [ "_veh","_turret","_weapons","_mags"];
_veh = _this select 0;
_turret = _this select 1;
_weapons = _this select 2;
_mags = _this select 3;
{ _veh removeMagazineTurret [ _x,_turret]} foreach (_veh magazinesTurret _turret);
{ _veh removeWeaponTurret [ _x,_turret]} foreach (_veh weaponsTurret _turret);
{ _veh addMagazineTurret [ _x,_turret]} foreach  _mags ;	   
{ _veh addWeaponTurret [ _x,_turret];if (_x != (currentWeapon _veh)) then { _veh selectWeapon _x } } foreach  _weapons;
};
private [ "_boat"];
_boat = _this select 0;
if(local _boat) then 
{  
	[ _boat,_TURRET_ONE,_WEAPON_TURRET_ONE,_MAGAZINE_TURRET_ONE ] call _fnc_change;//1- turret       
    [ _boat,_TURRET_TWO,_WEAPON_TURRET_TWO,_MAGAZINE_TURRET_TWO ] call _fnc_change;//2- turret
};
if(true) exitWith {};