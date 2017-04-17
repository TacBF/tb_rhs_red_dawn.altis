class TB_BLUBasicAmmunitionBox
{
	transportClear = 1;
	proxyObject = "TB_BLUBasicAmmunitionBox";
	class transportCargo
	{
		transportMagazines[] = {
			{"rhs_mag_30Rnd_556x45_M855A1_Stanag", 20},
			{"rhsusf_100Rnd_556x45_soft_pouch", 3},
			{"rhsusf_100Rnd_762x51", 3},
			{"rhsusf_20Rnd_762x51_m118_special_Mag", 5},
			{"SmokeShell", 8},
			{"rhs_mag_m67", 6},
			{"1Rnd_HE_Grenade_shell", 6},
			{"rhsusf_mag_6Rnd_M441_HE", 1},
			{"rhsusf_mag_6Rnd_M714_white", 1},
			{"1Rnd_Smoke_Grenade_shell", 6},
			{"rhsusf_5Rnd_300winmag_xm2010", 5},
			{"CUP_M136_M", 2},
			{"CUP_SMAW_HEAA_M", 2},
			{"DemoCharge_Remote_Mag", 3},	
            {"Chemlight_green", 10},
            {"Chemlight_yellow", 10},			
			{"LaserBatteries", 2}
		};
		transportWeapons[] = {{"rhs_weap_rsp30_white", 10}};
		//transportBackpacks[] = {};
		//transportItems[] = {};
	};
};
class TB_Box_West_Mines_F
{
	transportClear = 1;
	proxyObject = "TB_Box_West_Mines_F";
	class transportCargo
	{
		transportMagazines[] = {
			{"rhs_mine_M19_mag", 3},
			{"SLAMDirectionalMine_Wire_Mag", 3},
			{"APERSMine_Range_Mag", 6},
			{"APERSBoundingMine_Range_Mag", 3},
			{"APERSTripMine_Wire_Mag", 3},
			{"ClaymoreDirectionalMine_Remote_Mag", 3}
		};
		//transportWeapons[] = {};
		transportBackpacks[] = {{"rhsusf_assault_eagleaiii_ocp", 1}};
		//transportItems[] = {{"MineDetector", 1}};
	};
};