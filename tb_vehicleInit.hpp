class TB_vehicleInit 
{
    class InitVehicleAUG 
   {
    code = "[_this] execVM 'functions\aug\initVehicleAUG.sqf'";
   };
    class ScriptRemoveWeaponsAHZ 
   {
    code = "[_this] execVM 'functions\weapons\RemoveWeaponsAHZ.sqf'";
   };
    class ScriptRemoveWeaponsAHSIX 
   {
    code = "[_this] execVM 'functions\weapons\RemoveWeaponsAHSIX.sqf'";
   };
    class SetSideWest 
   {
    code = "_this setVariable ['ICE_side', west];[_this] execVM 'functions\vehicles\CaptureVehicle.sqf'";
   };
    class ChangeWeaponBoatEast
   {
    code = "[_this] execVM 'functions\weapons\ChangeWeaponBoatEast.sqf'";
   };
    class ChangeWeaponBoatWest
   {
    code = "[_this] execVM 'functions\weapons\ChangeWeaponBoatWest.sqf'";
   };
    class ScriptCaptureVehicle 
   {
    code = "[_this] execVM 'functions\vehicles\CaptureVehicle.sqf'";
   };
};