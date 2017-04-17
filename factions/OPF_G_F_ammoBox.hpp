
class TB_A3RESBasicAmmunitionBox
{
	transportClear = 1;
	proxyObject = "TB_A3RESBasicAmmunitionBox";
	class transportCargo
	{
		transportMagazines[] = {
			{"rhs_30Rnd_762x39mm", 12},
			{"rhs_100Rnd_762x54mmR_green", 5},
			{"rhs_10Rnd_762x54mmR_7N1", 5},
			{"SmokeShell", 10},
			{"rhs_mag_rgd5", 6},
			{"rhs_VOG25", 6},
			{"rhs_rpg7_PG7VL_mag", 2},
			{"CUP_RPG18_M", 2},
			{"CUP_Strela_2_M", 1},
            {"Chemlight_green", 10},
            {"Chemlight_yellow", 10},
			{"DemoCharge_Remote_Mag", 4}	
		};
		transportWeapons[] = {{"CUP_launch_RPG18",1},{"rhs_weap_rsp30_red", 10}};
		//transportBackpacks[] = {};
		//transportItems[] = {};
	};
};
class TB_Box_East_Mines_F
{
	transportClear = 1;
	proxyObject = "TB_Box_East_Mines_F";
	class transportCargo
	{
		transportMagazines[] = {
			{"rhs_mine_tm62m_mag", 5},
			{"SLAMDirectionalMine_Wire_Mag", 5},
			{"rhs_mine_pmn2_mag", 6},
			{"APERSBoundingMine_Range_Mag", 5},
			{"APERSTripMine_Wire_Mag", 5},
			{"ClaymoreDirectionalMine_Remote_Mag", 5}
		};
		//transportWeapons[] = {};
		transportBackpacks[] = {{"B_Carryall_cbr", 1}};
		//transportItems[] = {{"MineDetector", 1}};
	};
};