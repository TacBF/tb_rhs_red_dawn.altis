#define __SHELLMINE "Sh_82mm_AMOS"
#define _SHELLDIST 20
#define _SHELLHEIGHT 80
#define _SHELLVELOCITY [0,0,-50]
#define _RANDOMKOEF  (floor(random 10))
#define _DIGONE 1 
#define _DIGNEGONE -1
#define _DIGFOR 4
#define _SAFEZONE 25
#define _BOOMTIMER 5
#define __PIC '\A3\ui_f\data\gui\cfg\Hints\death_ca.paa'
#define _DISPLAYPIC 7023
#define _DISPLAYTEXTONE 7025
#define _DISPLAYTEXTTWO 7027

if!(local player) exitWith {};

//==============================================================================================

_func_shelling_zone_boom = {
private ["_man","_ranx","_rany","_shell_posx","_shell_posy","_shell_pos","_expl"];
_man = _this select 0;
_ranx = _RANDOMKOEF;
if(_ranx > _DIGFOR ) then { _ranx = _DIGONE} else { _ranx = _DIGNEGONE};
_rany = _RANDOMKOEF;
if(_rany > _DIGFOR ) then { _rany = _DIGONE} else { _rany = _DIGNEGONE};
_shell_posx = ((floor(random _SHELLDIST)) *_ranx);
_shell_posy = ((floor(random _SHELLDIST)) *_rany);            
_shell_pos = _man modelToWorld [ _shell_posx ,_shell_posy,_SHELLHEIGHT];
_expl = __SHELLMINE createVehicle (_shell_pos);
[ _expl, _shell_pos] remoteExec ["setPos", 0, false];
[ _expl, _SHELLVELOCITY] remoteExec ["setVelocity", 0, false];
};


_func_boom_activate = {
private ["_man","_timer"];
_man = _this select 0;
_timer = _man getvariable ['shelling_zone_timer',0];
_man setvariable ['shelling_zone_timer',(_timer + 1) ,false];
};


//======================================================================================================
waitUntil {!(isNil 'TB_curBaseList')};
waitUntil {!(isNil 'TB_zones_fnc_getZoneOwner')};

private ["_zona","_size_name","_check_zona","_boom_zona","_flag","_zona_pos","_zona_x","_zona_y","_zona_dir","_zone_type","_sides","_pl","_text1","_text2","_text3","_img"];

_zona = _this select 0;
_size_name = (count (toArray _zona));
_flag = _this select 1;
_sides = _this select 2;
_zona_pos = getMarkerPos _zona;
_zona_x = ((getMarkerSize _zona) select 0);
_zona_y = ((getMarkerSize _zona) select 1);
_zona_dir = MarkerDir _zona ;
_zone_type = (MarkerShape _zona == "RECTANGLE");

_chat1 = localize "STR_shelling_zone_out";
_chat2 = localize "STR_shelling_zone_run";
_text1 =  format [ "<t size='0.7' align='center' color='#000000'>%1</t>",_chat1];
_text2 =  format [ "<t size='0.7' align='center' color='#FFFF00'>%1</t>",_chat2];
_img = format [ "%1",__PIC];
_text3 = format [ "<t size='6' shadow='0' shadowColor='#000000' color='#FF0000'><img image= '%1'></t>",_img];

In_Shelling_zone_mess = false;
In_Shelling_zone_boom = false;

_check_zona = createTrigger [ "EmptyDetector",_zona_pos ];
_check_zona setTriggerArea [ _zona_x, _zona_y, _zona_dir, _zone_type ]; 
_check_zona setTriggerActivation [ "ANY" , "PRESENT", true ];
_check_zona setTriggerStatements [ "(local player) and ((vehicle player) in thislist)","In_Shelling_zone_mess = true","In_Shelling_zone_mess = false"];

_zona_x = _zona_x - _SAFEZONE;
_zona_y = _zona_y - _SAFEZONE;

_boom_zona = createTrigger [ "EmptyDetector",_zona_pos ];
_boom_zona setTriggerArea [ _zona_x, _zona_y, _zona_dir, _zone_type ]; 
_boom_zona setTriggerActivation [ "ANY" , "PRESENT", true ];
_boom_zona setTriggerStatements [ "(local player) and ((vehicle player) in thislist)","In_Shelling_zone_boom = true ","In_Shelling_zone_boom = false"];


while { true } do
{	

    if!((player getVariable "ICE_Side") in _sides ) exitWith {};
	if([_flag] call TB_zones_fnc_getZoneOwner == (player getVariable "ICE_Side")) exitWith {};
    if(_flag  in TB_curBaseList) exitWith {};
	
	if!( [ player ] call TB_firstAid_fnc_isDead ) then 
	{	
	    if!( [ player ] call TB_firstAid_fnc_isIncapacitated ) then 
	    {	
            if( In_Shelling_zone_mess ) then 
            {
                [ _text3,0,0,2,0,0,_DISPLAYPIC] spawn bis_fnc_dynamicText;
                [ _text1,0,0.3,2,0,0,_DISPLAYTEXTONE] spawn bis_fnc_dynamicText;

                if( In_Shelling_zone_boom ) then 
                {		            
			        if((vehicle player) isKindOf "Land") then
			        {
                        [ _text2,0,0.01,0.3,0,0,_DISPLAYTEXTTWO] spawn bis_fnc_dynamicText;					
				        if(player getvariable ['shelling_zone_timer',0] >_BOOMTIMER ) then 
                        {
					        [ player ] call _func_shelling_zone_boom;
	                        player setvariable ['shelling_zone_timer',0,false];
                        };
                        [ player ] spawn _func_boom_activate;						
                    };				
		        }
		        else
		        {
		            player setvariable ['shelling_zone_timer',0,false];
		        };
            };
	    };
	};
sleep 1;
};

deleteVehicle _check_zona;
deleteVehicle _boom_zona;

In_Shelling_zone_mess = false;
In_Shelling_zone_boom = false;

{
  private ["_a"];
  _a = toArray _x;  
  _a resize _size_name;  
  if (toString _a == _zona) then { deleteMarkerLocal _x };
} forEach allMapMarkers;

if(true) exitWith {};
