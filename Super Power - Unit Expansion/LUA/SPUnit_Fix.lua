-- SaveUtils
WARN_NOT_SHARED = false; include( "SaveUtils" ); MY_MOD_NAME = "SPUE";
-- SPCode
include("UtilityFunctions")
include("FLuaVector.lua")
include("CombatPercent_Misc_SPUE.lua")
include("SPUE_UtilityFunctions.lua")


local KnightID 						= GameInfo.UnitPromotions["PROMOTION_KNIGHT_COMBAT"].ID
local TankID 						= GameInfo.UnitPromotions["PROMOTION_TANK_COMBAT"].ID

local Charge1ID 					= GameInfo.UnitPromotions["PROMOTION_CHARGE_1"].ID
local Charge2ID 					= GameInfo.UnitPromotions["PROMOTION_CHARGE_2"].ID
local Charge3ID 					= GameInfo.UnitPromotions["PROMOTION_CHARGE_3"].ID


-- 王城骑士
local KingsKnightID					= GameInfo.UnitPromotions["PROMOTION_SPUE_KNIGHT_NEW"].ID
local KingsKnightBID				= GameInfo.UnitPromotions["PROMOTION_SPUE_KNIGHT_NEW_B"].ID
local KingsKnightCID				= GameInfo.UnitPromotions["PROMOTION_SPUE_KNIGHT_NEW_C"].ID

-- local KingsKnightPops				= 0
local g_KingsKnightPops 			= {GameInfo.UnitPromotions["PROMOTION_SPUE_KNIGHT_NEW_A000"].ID,
									   GameInfo.UnitPromotions["PROMOTION_SPUE_KNIGHT_NEW_A020"].ID,
									   GameInfo.UnitPromotions["PROMOTION_SPUE_KNIGHT_NEW_A040"].ID,
									   GameInfo.UnitPromotions["PROMOTION_SPUE_KNIGHT_NEW_A060"].ID,
									   GameInfo.UnitPromotions["PROMOTION_SPUE_KNIGHT_NEW_A080"].ID,
									   GameInfo.UnitPromotions["PROMOTION_SPUE_KNIGHT_NEW_A100"].ID}

-- 瓦兰吉	
local VARANGIANID					= GameInfo.UnitPromotions["PROMOTION_SPUE_VARANGIAN"].ID
local VARANGIANBonusID 				= GameInfo.UnitPromotions["PROMOTION_SPUE_VARANGIAN_SEA"].ID
local VARANGIANGuardID 				= GameInfo.UnitPromotions["PROMOTION_SPUE_VARANGIAN_GUARD"].ID
-- 铁人军	
local IronTroopID	 				= GameInfo.UnitPromotions["PROMOTION_SPUE_IRON_TROOP"].ID
-- 十字战车	
local pGreatCrossID 				= GameInfo.UnitPromotions["PROMOTION_SPUE_GREAT_CROSS"].ID
local pGreatCrossEffectID			= GameInfo.UnitPromotions["PROMOTION_SPUE_GREAT_CROSS_EFFECT"].ID
-- 热气球	
local pHotAirBalloonID 				= GameInfo.UnitPromotions["PROMOTION_SPUE_HOT_AIR_BALLOON_NEW"].ID
local pHotAirBalloonEffectID 		= GameInfo.UnitPromotions["PROMOTION_SPUE_HOT_AIR_BALLOON_EFFECT"].ID
local pHotAirBalloonEffectLv1ID 	= GameInfo.UnitPromotions["PROMOTION_SPUE_HOT_AIR_BALLOON_EFFECT_LV1"].ID
local pHotAirBalloonEffectLv2ID 	= GameInfo.UnitPromotions["PROMOTION_SPUE_HOT_AIR_BALLOON_EFFECT_LV2"].ID
-- 三大骑士团	
local TemplarKnightID 				= GameInfo.UnitPromotions["PROMOTION_SPUE_FOOT_KNIGHT_TEMPLAR"].ID
local TeutonicKnightID 				= GameInfo.UnitPromotions["PROMOTION_SPUE_FOOT_KNIGHT_TEUTONIC"].ID
local HospitallerKnightID 			= GameInfo.UnitPromotions["PROMOTION_SPUE_FOOT_KNIGHT_HOSPITALLER"].ID
local HospitallerEffectID 			= GameInfo.UnitPromotions["PROMOTION_SPUE_FOOT_KNIGHT_HOSPITALLER_EFFECT"].ID
-- 涌泉守卫	
local unitPromotionGondorID 		= GameInfo.UnitPromotions["PROMOTION_SPUE_GONDORGUARD"].ID
-- 靖抚甲骑
local unitPromotionBucellariID 		= GameInfo.UnitPromotions["PROMOTION_SPUE_BUCELLARII_GUARD"].ID
local unitPromotionBucellariEliteID = GameInfo.UnitPromotions["PROMOTION_SPUE_BUCELLARII_GUARD_ELITE"].ID
-- 海洋之火
local unitPromotionOceanFireID		= GameInfo.UnitPromotions["PROMOTION_SPUE_OCEAN_FIRE"].ID
local unitPromotionOceanFireE02ID	= GameInfo.UnitPromotions["PROMOTION_SPUE_OCEAN_FIRE_02"].ID
local unitPromotionOceanFireE01ID	= GameInfo.UnitPromotions["PROMOTION_SPUE_OCEAN_FIRE_01"].ID
-- 阿兰骑兵	
-- local unitPromotionAlanID 			= GameInfo.UnitPromotions["PROMOTION_SPUE_VASSAL_ALAN_CAVALRY"].ID

-- 鹰击055	
local unitPromotion055ID 			= GameInfo.UnitPromotions["PROMOTION_SPUE_ORDER_SUPER_055"].ID
local unitPromotion055EffectID 		= GameInfo.UnitPromotions["PROMOTION_SPUE_ORDER_SUPER_055_EFFECT"].ID
-- 鹰击21	
local unitPromotion055MissileID 	= GameInfo.UnitPromotions["PROMOTION_SPUE_ORDER_SUPER_055_MISSILE"].ID

-- 空天母舰
local unitPromotionHeliCarrierID 	= GameInfo.UnitPromotions["PROMOTION_SPUE_FREEDOM_HELICARRIER"].ID
local unitPromotionHeliFighterID 	= GameInfo.UnitPromotions["PROMOTION_SPUE_FREEDOM_HELICARRIER_FIGHTER"].ID

-- 装甲掷弹兵
local unitPromotionPanzerID 		= GameInfo.UnitPromotions["PROMOTION_SPUE_AUTOCRACY_PANZERG"].ID
local unitPromotionPanzerEffectID 	= GameInfo.UnitPromotions["PROMOTION_SPUE_AUTOCRACY_PANZERG_EFFECT"].ID

-- 坦克
local TankID 						= GameInfo.UnitPromotions["PROMOTION_TANK_COMBAT"].ID

-- 超级要塞
local unitPromotionGAIAID 			= GameInfo.UnitPromotions["PROMOTION_SPUE_AUTOCRACY_JUFORTRESS"].ID
local unitPromotionGAIA_ShipID 		= GameInfo.UnitPromotions["PROMOTION_SPUE_AUTOCRACY_JUFORTRESSSHIP"].ID
local unitPromotionGAIA_HeadID 		= GameInfo.UnitPromotions["PROMOTION_SPUE_AUTOCRACY_JUFORTRESSHEAD"].ID

local GAIAShipHasAttackedThisTurn 	= 0
-- 舰载机	
local CarrierFighterID 				= GameInfo.UnitPromotions["PROMOTION_CARRIER_FIGHTER"].ID
-- 战斗机	
local IntercepterAircraftUnitID 	= GameInfo.UnitPromotions["PROMOTION_ANTI_AIR_II"].ID
-- 航母	
local AirCraftCarrierID 			= GameInfo.UnitPromotions["PROMOTION_CARRIER_UNIT"].ID

local AntiDebuffID 					= GameInfo.UnitPromotions["PROMOTION_ANTI_DEBUFF"].ID
--------------------------------------------------------------
-- 单位下海模型强制修正
--------------------------------------------------------------
function EmbarkGraphic(playerID)
	for pPlayer=0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
		local pPlayer = Players[pPlayer]

		if pPlayer:IsEverAlive() then
			local pEraType = pPlayer:GetCurrentEra()
			local activeCivID = pPlayer:GetCivilizationType()
			local activeCiv = GameInfo.Civilizations[activeCivID]
	
			--if (not pPlayer:IsAlive()) then break end
			-- if not pPlayer:IsBarbarian() then break end
	
			local activeCivSuffix = GameInfo.Civilizations[activeCivID].ArtStyleSuffix
			local pEraID = GameInfo.Eras[pEraType].ID;
			-- print("1Suffix="..activeCivSuffix)
			if pEraID >= GameInfo.Eras["ERA_INDUSTRIAL"].ID then
				pPlayer:SetEmbarkedGraphicOverride("ART_DEF_UNIT_TRANSPORT")
			end
			if  pEraID >= GameInfo.Eras["ERA_MEDIEVAL"].ID and pEraID < GameInfo.Eras["ERA_INDUSTRIAL"].ID then
				pPlayer:SetEmbarkedGraphicOverride("ART_DEF_UNIT_GALLEON")
				if activeCivSuffix == '_ASIA' 
				or activeCivSuffix == '_CHINA' 
				then	
					pPlayer:SetEmbarkedGraphicOverride("ART_DEF_UNIT_GALLEON_ASIA")
				end
				if GameInfo.Civilizations[activeCivID].Type  == "CIVILIZATION_INDONESIA" then
					pPlayer:SetEmbarkedGraphicOverride("ART_DEF_UNIT_U_POLYNESIAN_WAR_CANOE")
				end
			end
			if  pEraID <= GameInfo.Eras["ERA_CLASSICAL"].ID  then
				pPlayer:SetEmbarkedGraphicOverride("ART_DEF_UNIT_GALLEY")
				if activeCivSuffix == '_ASIA' 
				or activeCivSuffix == '_CHINA'
				then	
					pPlayer:SetEmbarkedGraphicOverride("ART_DEF_UNIT_GALLEY_ASIA")
				end
				if GameInfo.Civilizations[activeCivID].Type  == "CIVILIZATION_INDONESIA" then
					pPlayer:SetEmbarkedGraphicOverride("ART_DEF_UNIT_U_POLYNESIAN_WAR_CANOE")
				end
			end
		end
	end
end
Events.LoadScreenClose.Add(EmbarkGraphic)
GameEvents.TeamSetEra.Add(EmbarkGraphic)
--------------------------------------------------------------
-- 直射火力无需架设
--------------------------------------------------------------
function NoSetUPforCannons(iPlayerID, iUnitID)
	if  Players[ iPlayerID ] and Players[ iPlayerID ]:IsAlive()
	and Players[ iPlayerID ]:GetUnitByID( iUnitID )
	and not Players[ iPlayerID ]:GetUnitByID( iUnitID ):IsDead()
	and not Players[ iPlayerID ]:GetUnitByID( iUnitID ):IsDelayedDeath()
	and (Players[ iPlayerID ]:GetUnitByID( iUnitID ):GetUnitClassType() == GameInfoTypes.UNITCLASS_CULVERIN 
	or Players[ iPlayerID ]:GetUnitByID( iUnitID ):GetUnitClassType() == GameInfoTypes.UNITCLASS_CANNON 
	or Players[ iPlayerID ]:GetUnitByID( iUnitID ):GetUnitClassType() == GameInfoTypes.UNITCLASS_SPUE_FIELDGUN)
	and Players[ iPlayerID ]:GetUnitByID( iUnitID ):IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_MUST_SET_UP"].ID)
	then
		Players[ iPlayerID ]:GetUnitByID( iUnitID ):SetHasPromotion(GameInfo.UnitPromotions["PROMOTION_MUST_SET_UP"].ID, false);
	end
end
Events.SerialEventUnitCreated.Add( NoSetUPforCannons );
--------------------------------------------------------------
-- 世界强权火药步兵
--------------------------------------------------------------
local isSPEx = false
local isSPExID = "41450919-c52c-406f-8752-5ea34be32b2d"

for _, mod in pairs(Modding.GetActivatedMods()) do
	if (mod.ID == isSPExID) then
		isSPEx = true
		break
	end
end

-- function SPExInfComBat(iPlayerID, iUnitID)
-- 	if  isSPEx 
-- 	and Players[ iPlayerID ] and Players[ iPlayerID ]:IsAlive()
-- 	and Players[iPlayerID ]:GetUnitByID( iUnitID )
-- 	and not Players[ iPlayerID ]:GetUnitByID( iUnitID ):IsDead()
-- 	and not Players[ iPlayerID ]:GetUnitByID( iUnitID ):IsDelayedDeath()
-- 	and Players[ iPlayerID ]:GetUnitByID( iUnitID ):IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_GUNPOWDER_INFANTRY_COMBAT"].ID)
-- 	then
-- 		Players[ iPlayerID ]:GetUnitByID( iUnitID ):SetHasPromotion(GameInfo.UnitPromotions["PROMOTION_GUNPOWDER_INFANTRY_COMBAT_APPEND"].ID, true);
-- 	end
-- end
-- Events.SerialEventUnitCreated.Add( SPExInfComBat );
--------------------------------------------------------------
-- 飞机在境内且不位于城市时可进行升级
--------------------------------------------------------------
--include('UtilityFunctions.lua')
AirPlanesUpgradeNotInCityButton = {
  Name = "AirPlanesUpgradeNotInCity",
  Title = "TXT_KEY_SPUE_PLANEUPGRADE_SHORT", -- or a TXT_KEY
  OrderPriority = 200, -- default is 200
  IconAtlas = "promoVP_atlas_02", -- 45 and 64 variations required
  PortraitIndex = 14,
  ToolTip = "TXT_KEY_SPUE_PLANEUPGRADE", -- or a TXT_KEY_ or a function
  

  
  Condition = function(action, unit)
	local plot = unit:GetPlot()
	local iUnitType = unit:GetUpgradeUnitType();
    local iGoldToUpgrade = unit:UpgradePrice(iUnitType);
	local player = Players[unit:GetOwner()]
	if unit:GetDomainType() == DomainTypes.DOMAIN_AIR and not unit:CanUpgradeRightNow() and unit:CanMove()
	and plot and Players[plot:GetOwner()] == Players[unit:GetOwner()] and not (plot:GetPlotCity())
	and player:GetGold() >= iGoldToUpgrade
	then

		if GameInfo.Units[unit:GetUpgradeUnitType()] and GameInfo.Units[unit:GetUpgradeUnitType()].PrereqTech
		and Teams[player:GetTeam()]:IsHasTech(GameInfoTypes[GameInfo.Units[unit:GetUpgradeUnitType()].PrereqTech]) then
			return true
		end
	end
  end, -- or nil or a boolean, default is true
  
  Disabled = function(action, unit)   
    return false;
  end, -- or nil or a boolean, default is false
  
  Action = function(action, unit, eClick) 
	
	local pPlayer = Players[unit:GetOwner()];
    local unitX = unit:GetX()
	local unitY = unit:GetY()
	local unitType = unit:GetUnitType()
	local unitAIType = unit:GetUnitAIType()
	local iUnitType = unit:GetUpgradeUnitType();
    local iGoldToUpgrade = unit:UpgradePrice(iUnitType);

	--local unitEXP = unit:GetExperience()

	--unit:Kill()

	local unitLevel = unit:GetLevel();
	local unitEXP   = unit:GetExperience();

	local unitPromotions = {};
	for row in GameInfo.UnitPromotions() do
		if unit:IsHasPromotion(row.ID) and not row.LostWithUpgrade then
		   table.insert(unitPromotions, row.ID);
		end
	end

	local unitName = nil;
	if unit:HasName() then
	  unitName = unit:GetNameNoDesc();
	end
		
	unit:Kill();
	local newUnit = nil;
	newUnit = pPlayer:InitUnit(unit:GetUpgradeUnitType(), unitX, unitY, unitAIType)

	newUnit:SetLevel(unitLevel);
	newUnit:SetExperience(unitEXP);
	if #unitPromotions > 0 then
	  for _, unitPromotionID in ipairs(unitPromotions) do
	    newUnit:SetHasPromotion(unitPromotionID, true);
	  end
	end
	if unitName then
	  newUnit:SetName(unitName);
	end

	newUnit:SetDamage(unitDamage)
	newUnit:SetMoves(0)
	player:ChangeGold(-iGoldToUpgrade)
	
    
    print("AirCraft Upgrade Pressed!")

  end
};

LuaEvents.UnitPanelActionAddin(AirPlanesUpgradeNotInCityButton)
--------------------------------------------------------------
-- 文明选取意识形态时赠送标识政策
--------------------------------------------------------------
function SPUE_OnAdoptPolicyBranch( playerID, policyID )
    local player = Players[playerID]
	if player == nil then return end
	if policyID == nil then return end
	local policy = GameInfo.Policies[policyID]

	if policy.PolicyBranchType == GameInfo.PolicyBranchTypes["POLICY_BRANCH_ORDER"].Type 
	and not player:HasPolicy(GameInfo.Policies["POLICY_SPUE_ORDER"].ID)
	then
		
		-- player:SetNumFreePolicies(1)
		-- player:SetNumFreePolicies(0)
		player:SetHasPolicy(GameInfo.Policies["POLICY_SPUE_ORDER"].ID, true, true)	
		return
	elseif policy.PolicyBranchType == GameInfo.PolicyBranchTypes["POLICY_BRANCH_FREEDOM"].Type 
	and not player:HasPolicy(GameInfo.Policies["POLICY_SPUE_FREEDOM"].ID)
	then
		-- player:SetNumFreePolicies(1)
		-- player:SetNumFreePolicies(0)
		player:SetHasPolicy(GameInfo.Policies["POLICY_SPUE_FREEDOM"].ID, true, true)	
		return
	elseif policy.PolicyBranchType == GameInfo.PolicyBranchTypes["POLICY_BRANCH_AUTOCRACY"].Type 
	and not player:HasPolicy(GameInfo.Policies["POLICY_SPUE_AUTOCRACY"].ID)
	then
		-- player:SetNumFreePolicies(1)
		-- player:SetNumFreePolicies(0)
		player:SetHasPolicy(GameInfo.Policies["POLICY_SPUE_AUTOCRACY"].ID, true, true)	
		return
	end

	--Revolution BUG Fix
	if player:HasPolicy(GameInfo.Policies["POLICY_SPUE_ORDER"].ID)
	and not player:HasPolicyBranch(GameInfo.PolicyBranchTypes["POLICY_BRANCH_ORDER"].Type) 
	then
		player:SetHasPolicy(GameInfo.Policies["POLICY_SPUE_ORDER"].ID, false)
	elseif player:HasPolicy(GameInfo.Policies["POLICY_SPUE_FREEDOM"].ID)
	and not player:HasPolicyBranch(GameInfo.PolicyBranchTypes["POLICY_BRANCH_FREEDOM"].Type) 
	then
		player:SetHasPolicy(GameInfo.Policies["POLICY_SPUE_FREEDOM"].ID, false)
	elseif player:HasPolicy(GameInfo.Policies["POLICY_SPUE_AUTOCRACY"].ID)
	and not player:HasPolicyBranch(GameInfo.PolicyBranchTypes["POLICY_BRANCH_AUTOCRACY"].Type) 
	then
		player:SetHasPolicy(GameInfo.Policies["POLICY_SPUE_AUTOCRACY"].ID, false)
	end

end
GameEvents.PlayerAdoptPolicy.Add(SPUE_OnAdoptPolicyBranch)
--------------------------------------------------------------
-- 根据意识形态锁定精英计划&根据政策锁定精英计划
--------------------------------------------------------------
function SPUE_IdeoProjectOnly(playerID, cityID, projectTypeID)
	local player = Players[playerID]	
    if player == nil or player:IsBarbarian() then return end
	--local city = player:GetCityByID(cityID)
	-- 秩序
	if (projectTypeID == GameInfo.Projects["PROJECT_SPUE_ORDER"].ID) then
		return player:HasPolicy(GameInfo.Policies["POLICY_SPUE_ORDER"].ID)
	-- 自由
	elseif (projectTypeID == GameInfo.Projects["PROJECT_SPUE_FREEDOM"].ID) then
		return player:HasPolicy(GameInfo.Policies["POLICY_SPUE_FREEDOM"].ID)
	-- 独裁
	elseif (projectTypeID == GameInfo.Projects["PROJECT_SPUE_AUTOCRACY"].ID) then
		return player:HasPolicy(GameInfo.Policies["POLICY_SPUE_AUTOCRACY"].ID)
	end	
	-- 贝利撒留甲骑兵
	if (projectTypeID == GameInfo.Projects["PROJECT_BUCELLARII_TRAINING"].ID) then
		return player:HasPolicy(GameInfo.Policies["POLICY_SPUE_BASELIUS"].ID)
	end

	return true
end
GameEvents.CityCanCreate.Add(SPUE_IdeoProjectOnly)
---============================================================
-- 政策单位特殊效果
---============================================================
--------------------------------------------------------------
-- 空天航母晋升传递
--------------------------------------------------------------
function CarrierPromotionTransfer(player,unit)

	local plot = unit:GetPlot();
	if plot and unit:IsHasPromotion(AirCraftCarrierID) and unit:HasCargo() then
		print("Found the carrier!")
		local unitCount = plot:GetNumUnits()

		for i = 0, unitCount-1, 1 do
			local pCargoUnit = plot:GetUnit(i);
			if pCargoUnit:IsCargo() and pCargoUnit:GetTransportUnit() == unit then
				print ("Found the aircraft on the carrier!")
				pCargoUnit:SetHasPromotion(unitPromotionHeliFighterID, unit:IsHasPromotion(unitPromotionHeliCarrierID));
			end
		end
	end
end

function NewUnitCreationRules()   ------------------------Human Player's units rule & AI units assistance--
	for playerID,player in pairs(Players) do
		
		if player and player:IsAlive() and not player:IsMinorCiv() and player:GetNumUnits() > 0 then --  and not player:IsBarbarian() then
			for unit in player:Units() do
				if unit:IsHasPromotion(unitPromotionHeliCarrierID) then
					CarrierPromotionTransfer(player,unit)
				end
			end
		end
	end

end------function end
Events.ActivePlayerTurnStart.Add(NewUnitCreationRules)
--------------------------------------------------------------
-- 鹰击21装载
--------------------------------------------------------------
function SPUE_YJ21Setup_UnitPromoted(playerID, unitID)
	-- 单位晋升
	local player = Players[playerID]
	if player == nil then return end

	local unit = player:GetUnitByID(unitID)
	if not unit:IsHasPromotion( unitPromotion055ID  ) then return end

	if unit:IsHasPromotion( unitPromotion055ID  ) and not unit:IsHasPromotion( unitPromotion055MissileID  ) then
		unit:SetHasPromotion(unitPromotion055MissileID, true)
		if player:IsHuman() then
			local text1s = Locale.ConvertTextKey("TXT_KEY_PROMOTION_SPUE_ORDER_SUPER_055_TEXT1S")
			Events.GameplayAlertMessage( text1s );
		end	
	end
end
GameEvents.UnitPromoted.Add(SPUE_YJ21Setup_UnitPromoted)
function SPUE_YJ21Setup_AdoptPolicy(playerID, policyID)
	-- 选取秩序意识形态政策
	local player = Players[playerID]
	if player == nil then return end
	if policyID == nil then return end
	local policy = GameInfo.Policies[policyID]

    if policy.PolicyBranchType == GameInfo.PolicyBranchTypes["POLICY_BRANCH_ORDER"].Type then
        for unit in player:Units() do
			if unit:IsHasPromotion( unitPromotion055ID  ) and not unit:IsHasPromotion( unitPromotion055MissileID  ) then
				unit:SetHasPromotion(unitPromotion055MissileID, true)
				if player:IsHuman() then
					local text1s = Locale.ConvertTextKey("TXT_KEY_PROMOTION_SPUE_ORDER_SUPER_055_TEXT1S")
					Events.GameplayAlertMessage( text1s );
				end	
			end
		end
    end
end
GameEvents.PlayerAdoptPolicy.Add(SPUE_YJ21Setup_AdoptPolicy)
--------------------------------------------------------------
-- 单位过回合效果
--------------------------------------------------------------
function SPUE_OnPlayerDoTurn(playerID)
	local player = Players[playerID]
	local iTeamID = player:GetTeam() 
	local pTeam = Teams[iTeamID]
	
	if player == nil then
		return
	end
	
	-- 超级要塞特殊效果初始化
	GAIAShipHasAttackedThisTurn = 0

	-- 统计秩序政策数
	local OrderPolicyCount = 0
	
	for policy in GameInfo.Policies() do
		if policy.PolicyBranchType == GameInfo.PolicyBranchTypes["POLICY_BRANCH_ORDER"].Type 
		and player:HasPolicy(policy.ID) 
		then
			OrderPolicyCount = OrderPolicyCount + 1
		end
	end

	-- 统计陆海军单位
	local numLandUnits = 0;
	local numSeaUnits = 0;

	for unit in player:Units() do
		if unit:GetDomainType() == DomainTypes.DOMAIN_LAND then
			numLandUnits = numLandUnits + 1;
		elseif unit:GetDomainType() == DomainTypes.DOMAIN_SEA then
			numSeaUnits = numSeaUnits + 1;
		end
	end

	for unit in player:Units() do
		-- 瓦兰吉卫队
		if unit:IsHasPromotion(GameInfoTypes["PROMOTION_SPUE_VARANGIAN_GUARD"]) then
			local iunit = GameInfo.Units[unit:GetUnitType()] 
			local plot = unit:GetPlot()

			local icombat = math.ceil(0.2 * iunit.Combat);
			
			local bonus = 0;

			local unitCount = plot:GetNumUnits();
			local uniqueRange = 4;
			if unitCount >= 1 then
				for i = 0, unitCount-1, 1 do
					local pFoundUnit = plot:GetUnit(i)
					if pFoundUnit ~= nil and pFoundUnit:GetID() ~= unit:GetID() then
						local pPlayer = Players[pFoundUnit:GetOwner()];
						if pPlayer == player and (pFoundUnit:IsHasPromotion(KnightID) or pFoundUnit:IsHasPromotion(TankID)) then
							bonus = bonus + 1
						end
					end
				end
			end
			for dx = -uniqueRange, uniqueRange, 1 do
					for dy = -uniqueRange, uniqueRange, 1 do
					local adjPlot = Map.PlotXYWithRangeCheck(plot:GetX(), plot:GetY(), dx, dy, uniqueRange);
					if (adjPlot ~= nil) then
						local unitCount = adjPlot:GetNumUnits();
						if unitCount >= 1 then
							for i = 0, unitCount-1, 1 do
								local pFoundUnit = adjPlot:GetUnit(i)
								if pFoundUnit ~= nil and pFoundUnit:GetID() ~= unit:GetID() then
									local pPlayer = Players[pFoundUnit:GetOwner()];
									if pPlayer == player and (pFoundUnit:IsHasPromotion(KnightID) or pFoundUnit:IsHasPromotion(TankID)) then
										bonus = bonus + 1
									end
								end
							end
						end
					end
				end
			end
			-- unit:SetBaseCombatStrength(100 * bonus * icombat / iunit.Combat)
			SPUEAddCombatBonus(unit, math.ceil(100 * bonus * icombat / iunit.Combat))
			unit:SetMoves(unit:GetMoves() + 2 * bonus * GameDefines["MOVE_DENOMINATOR"]);

			local hex = ToHexFromGrid(Vector2(plot:GetX(), plot:GetY()));
            Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("+{1_Num}[ICON_MOVES]", bonus * 2));
		end

		-- 宣慰使军
		if unit:IsHasPromotion(GameInfoTypes["PROMOTION_SPUE_SHENJI_MUSKETEER3"]) and unit:IsGarrisoned() then
			unit:ChangeMoves(60);
			local hex = ToHexFromGrid(Vector2(plot:GetX(), plot:GetY()));
            Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("+{1_Num}[ICON_MOVES]", 1));
            Events.GameplayFX(hex.x, hex.y, -1);
		end


		--SU47
		if unit:IsHasPromotion(GameInfoTypes["PROMOTION_SPUE_ORDER_SU47"]) then
			local plot = unit:GetPlot();
			if plot:GetPlotCity() then
				local city = plot:GetPlotCity();
				local specialistScientistID	= GameInfoTypes["SPECIALIST_SCIENTIST"];
				local cityScientistProgress = city:GetSpecialistGreatPersonProgressTimes100();

				local unitLevel = unit:GetLevel();
				local iExpBonus = OrderPolicyCount * 2;

				-- 为城市提供大科点数
				city:ChangeSpecialistGreatPersonProgressTimes100(specialistScientistID, (unitLevel / 100) * cityScientistProgress);

				if player:IsHuman() then
					local plotX = unit:GetX();
					local plotY = unit:GetY();
					Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(plotX, plotY))), Locale.ConvertTextKey("[ICON_GREAT_SCIENTIST][ICON_GREAT_SCIENTIST][ICON_GREAT_SCIENTIST]"), true);
				end
			
				-- 为自身外的空军单位提供经验
				for sunit in player:Units() do
					if not sunit:IsHasPromotion(GameInfoTypes["PROMOTION_SPUE_ORDER_SU47"]) and sunit:IsHasPromotion(IntercepterAircraftUnitID)  then
						sunit:ChangeExperience(iExpBonus)
					end
				end

			end
		end

		-- 贝利撒留甲骑兵：根据两格内敌方单位数量增加移动力
		if unit:IsHasPromotion( unitPromotionBucellariEliteID ) then
			local iunit = GameInfo.Units[unit:GetUnitType()] ;
			local plot = unit:GetPlot();
			local imove_bonus = 0;

			local unitCount = plot:GetNumUnits();
			local uniqueRange = 2
			if unitCount >= 1 then
				for i = 0, unitCount-1, 1 do
					local pFoundUnit = plot:GetUnit(i)
					if pFoundUnit ~= nil and pFoundUnit:GetID() ~= unit:GetID() then
						local pPlayer = Players[pFoundUnit:GetOwner()];
						if PlayersAtWar(player, pPlayer) then
							imove_bonus = imove_bonus + 1;
						end
					end
				end
			end
			for dx = -uniqueRange, uniqueRange, 1 do
				for dy = -uniqueRange, uniqueRange, 1 do
					local adjPlot = Map.PlotXYWithRangeCheck(plot:GetX(), plot:GetY(), dx, dy, uniqueRange);
                    if (adjPlot ~= nil) then
			    	    unitCount = adjPlot:GetNumUnits();
			    	    if unitCount >= 1 then
			    	    	for i = 0, unitCount-1, 1 do
			    	    		local pFoundUnit = adjPlot:GetUnit(i)
			    	    		if pFoundUnit ~= nil and pFoundUnit:GetID() ~= unit:GetID() then
			    	    			local pPlayer = Players[pFoundUnit:GetOwner()];
			    	    			if PlayersAtWar(player, pPlayer) then
                                        imove_bonus = imove_bonus + 1;
			    	    			end
			    	    		end
			    	    	end
			    	    end
                    end
			    end
            end
            unit:SetMoves(unit:GetMoves() + imove_bonus * GameDefines["MOVE_DENOMINATOR"]);

            if player:IsHuman() then
				local hex = ToHexFromGrid(Vector2(plot:GetX(), plot:GetY()));
				Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("+{1_Num}[ICON_MOVES]", imove_bonus));
				Events.GameplayFX(hex.x, hex.y, -1);
			end
		end

		-- 海洋之火效果
		if unit:IsHasPromotion(unitPromotionOceanFireE02ID) then
			unit:SetHasPromotion(unitPromotionOceanFireE02ID, false)
			unit:SetHasPromotion(unitPromotionOceanFireE01ID, true)
		elseif unit:IsHasPromotion(unitPromotionOceanFireE01ID) then
			unit:SetHasPromotion(unitPromotionOceanFireE01ID, false)
		end
	end

	-- AI使用技能系列
	if not player:IsHuman() then
		for unit in player:Units() do
			local plot = unit:GetPlot()
			-- 采邑骑士
			local SPUE_Knight_New_Flag = load( player, "Knight Rally", SPUE_Knight_New_Flag) or 0
			local knightFlag = 0
			-- 福船标识
			local fuchuanFlag = JFD_GetRandom(1, 2)
			local fuchuanInfantryFlag = 0
			local fuchuanCannonFlag = 0
			local fuchuanInfantryCost = -1
			local fuchuanCannonCost = -1
			-- 宝船旗舰标识
			local treasureFleetFlag = JFD_GetRandom(1, 2)
			--*****************************AI召唤采邑骑士*****************************--
			if unit:CanMove() and unit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_SPUE_KNIGHT_NEW"].ID) 
			and SPUE_Knight_New_Flag == 0
			then
				if player:CountNumBuildings(GameInfoTypes["BUILDING_TROOPS"]) == 0 then
					knightFlag = 1
				elseif player:CountNumBuildings(GameInfoTypes["BUILDING_TROOPS"]) > 0 then
					-- 兵力足够时按钮才会显示
					local iTotalTroops = player:CountNumBuildings(GameInfoTypes["BUILDING_TROOPS"]) 
					local iUsedTroops = player:CountNumBuildings(GameInfoTypes["BUILDING_TROOPS_USED"]) 
					if iTotalTroops - iUsedTroops > math.min(20,  player:GetNumCities() - 1) then
						knightFlag = 1
					end
				end
				if knightFlag == 1 then
					local plot = unit:GetPlot()
					local unitX = unit:GetX()
					local unitY = unit:GetY()
					local unitAIType = unit:GetUnitAIType()
					local numKnights = 0
				
					for city in player:Cities() do
						if not city:IsCapital() then
							-- 从非首都城市召唤采邑骑士
							local cityname = city:GetName()
							local NewUnit = player:InitUnit(GameInfoTypes["UNIT_SPUE_KNIGHT_NEW1"], unitX, unitY, unitAIType)
							NewUnit:SetName("[COLOR_CYAN]"..cityname..Locale.ConvertTextKey("TXT_KEY_UNIT_SPUE_KNIGHT_NEW1_NAME").."[ENDCOLOR]") 
							numKnights = numKnights + 1;
							if plot:GetNumUnits() > 2 then
								NewUnit:JumpToNearestValidPlot()
							end
							if numKnights >= math.min(20,  player:GetNumCities() - 1) then
								break;
							end
						end
					end
					unit:SetMoves(0)
					save( player, "Knight Rally", 1)
					SPUE_Knight_New_Flag = 1
				end
			end
			--*****************************AI福船制造单位*****************************--
			if unit:CanMove() and unit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_SPUE_FUCHUAN"].ID) 
			and plot:IsAdjacentToLand() and Players[unit:GetOwner()]:GetCapitalCity() ~= nil
			then
				if fuchuanFlag < 2 then
					-- 重步兵训练
					local sUnitType = GetCivSpecificUnit(player, "UNITCLASS_SWORDSMAN")
					local sUpgradeUnitType = GetUpgradeUnit(player, sUnitType)

					while (sUpgradeUnitType ~= nil) do
					   sUnitType = sUpgradeUnitType
					   sUpgradeUnitType = GetUpgradeUnit(player, sUnitType)
					end
					local iUnit = GameInfoTypes[sUnitType]
				
					if iUnit and iUnit ~= -1 then
						for pCity in player:Cities() do
						if pCity and pCity:IsCanPurchase(false, false, iUnit, -1, -1, YieldTypes.YIELD_GOLD) then
							fuchuanInfantryCost = math.floor(pCity:GetUnitPurchaseCost( iUnit)/2);
							break;
						end
						end
					end
				
					if fuchuanInfantryCost > 0 and player:GetGold() >= fuchuanInfantryCost then
						-- 玩家有足够金钱
						if player:CountNumBuildings(GameInfoTypes["BUILDING_TROOPS"]) == 0 then
							fuchuanInfantryFlag = 1
						elseif player:CountNumBuildings(GameInfoTypes["BUILDING_TROOPS"]) > 0 then
							-- 兵力足够时按钮才会显示
							local iTotalTroops = player:CountNumBuildings(GameInfoTypes["BUILDING_TROOPS"]) 
							local iUsedTroops = player:CountNumBuildings(GameInfoTypes["BUILDING_TROOPS_USED"]) 
							if iTotalTroops - iUsedTroops >  1 then
								fuchuanInfantryFlag = 1
							end
						end
					end

					if fuchuanInfantryFlag == 1 then
						local NewUnit = player:InitUnit(GameInfoTypes[sUnitType], unit:GetX(), unit:GetY(), UNITAI_DEFENSE)
						NewUnit:JumpToNearestValidPlot()
						NewUnit:SetExperience(unit:GetExperience())
						unit:SetMoves(0)
						player:ChangeGold(-fuchuanInfantryCost)
					end
				else
					-- 炮兵训练
					local sUnitType = GetCivSpecificUnit(player, "UNITCLASS_CULVERIN")
					local sUpgradeUnitType = GetUpgradeUnit(player, sUnitType)

					while (sUpgradeUnitType ~= nil) do
					   sUnitType = sUpgradeUnitType
					   sUpgradeUnitType = GetUpgradeUnit(player, sUnitType)
					end
					local iUnit = GameInfoTypes[sUnitType]
				
					if iUnit and iUnit ~= -1 then
						for pCity in player:Cities() do
						if pCity and pCity:IsCanPurchase(false, false, iUnit, -1, -1, YieldTypes.YIELD_GOLD) then
							fuchuanCannonCost = math.floor(pCity:GetUnitPurchaseCost( iUnit)/2);
							break;
						end
						end
					end
				
					if fuchuanCannonCost > 0 and player:GetGold() >= fuchuanCannonCost then
						-- 玩家有足够金钱
						if player:CountNumBuildings(GameInfoTypes["BUILDING_TROOPS"]) == 0 then
							fuchuanCannonFlag = 1
						elseif player:CountNumBuildings(GameInfoTypes["BUILDING_TROOPS"]) > 0 then
							-- 兵力足够时按钮才会显示
							local iTotalTroops = player:CountNumBuildings(GameInfoTypes["BUILDING_TROOPS"]) 
							local iUsedTroops = player:CountNumBuildings(GameInfoTypes["BUILDING_TROOPS_USED"]) 
							if iTotalTroops - iUsedTroops >  1 then
								fuchuanCannonFlag = 1
							end
						end
					end

					if fuchuanCannonFlag == 1 then
						local NewUnit = player:InitUnit(GameInfoTypes[sUnitType], unit:GetX(), unit:GetY(), UNITAI_DEFENSE)
						NewUnit:JumpToNearestValidPlot()
						NewUnit:SetExperience(unit:GetExperience())
						unit:SetMoves(0)
						player:ChangeGold(-fuchuanCannonCost)
					end
				end
			end
			--*****************************AI转化瓦兰吉卫队*****************************--
			if unit:CanMove() and unit:IsHasPromotion(VARANGIANID) 
			and unit:GetUnitType() == GameInfoTypes.UNIT_SPUE_VARANGIAN
			and CountUnitsWithUniquePromotions(unit:GetOwner(), VARANGIANGuardID) == 0
			-- and CountVarangianGuard(unit:GetOwner()) == 0
			and player:GetGold() > 1000 then
				local plot 		= unit:GetPlot();
				local plotX 	= plot:GetX();
				local plotY 	= plot:GetY();
			
				local unitLevel = unit:GetLevel();
				local unitEXP   = unit:GetExperience();
			
				local unitPromotions = {};
				for row in GameInfo.UnitPromotions() do
				  if unit:IsHasPromotion(row.ID) and not row.LostWithUpgrade then
					table.insert(unitPromotions, row.ID);
				  end
				end
			
				local unitName = nil;
				if unit:HasName() then
				  unitName = unit:GetNameNoDesc();
				end

				unit:Kill();
				local newUnit = nil;
				newUnit = player:InitUnit(GameInfoTypes.UNIT_SPUE_VARANGIAN_GUARD, plot:GetX(), plot:GetY());
			
				newUnit:SetLevel(unitLevel);
				newUnit:SetExperience(unitEXP);
				if #unitPromotions > 0 then
				  for _, unitPromotionID in ipairs(unitPromotions) do
					newUnit:SetHasPromotion(unitPromotionID, true);
				  end
				end
				if unitName then
				  newUnit:SetName(unitName);
				end
			
				player:ChangeGold(-1000)
				local hex = ToHexFromGrid(Vector2(plotX, plotY))
				Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("-1000[ICON_GOLD]"))
			end		
			-- if EliteConditionAI(unit, VARANGIANID, "UNIT_SPUE_VARANGIAN", "UNIT_SPUE_VARANGIAN_GUARD",
			-- "UNITCLASS_SPUE_VARANGIAN", "PROJECT_BUCELLARII_TRAINING") 
			-- and not EliteDisable()
			-- then
			-- 	EliteAction()
			-- end
			--*****************************AI转化甲骑兵*****************************--

			if EliteConditionAI(unit, unitPromotionBucellariID, "UNIT_SPUE_BUCELLARII_GUARD", "UNIT_SPUE_BUCELLARII_GUARD_ELITE",
			"UNITCLASS_SPUE_BUCELLARII_GUARD", "PROJECT_BUCELLARII_TRAINING") 
			and not EliteDisable(unit, unitPromotionBucellariEliteID, "UNITCLASS_SPUE_BUCELLARII_GUARD", "PROJECT_BUCELLARII_TRAINING")
			then
				EliteAction(unit, "UNIT_SPUE_BUCELLARII_GUARD_ELITE", "UNITCLASS_SPUE_BUCELLARII_GUARD");
			end
			--*****************************AI宝船旗舰*****************************--
			if Teams[player:GetTeam()]:IsHasTech(GameInfoTypes["TECH_SONAR"])
			and unit:CanMove() and unit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_SPUE_TREASURE_FLEET"].ID) 
			and plot:IsAdjacentToLand() and Players[unit:GetOwner()]:GetCapitalCity() ~= nil
			then
				local numInfantry = player:GetUnitClassCount(GameInfoTypes["UNITCLASS_SPUE_SHENJI_MUSKETEER"]);
				local numCorvette = player:GetUnitClassCount(GameInfoTypes["UNITCLASS_SPUE_CORVETTE"]);
				if numInfantry < GameInfo.UnitClasses["UNITCLASS_SPUE_SHENJI_MUSKETEER"].MaxPlayerInstances
				and treasureFleetFlag < 2
				then
					local flag = 0
					local iCost = 300
					if iCost > 0 and player:GetGold() >= iCost then
						-- 玩家有足够金钱
						if player:CountNumBuildings(GameInfoTypes["BUILDING_TROOPS"]) == 0 then
							flag = 1
						elseif player:CountNumBuildings(GameInfoTypes["BUILDING_TROOPS"]) > 0 then
							-- 兵力足够时按钮才会显示
							local iTotalTroops = player:CountNumBuildings(GameInfoTypes["BUILDING_TROOPS"]) 
							local iUsedTroops = player:CountNumBuildings(GameInfoTypes["BUILDING_TROOPS_USED"]) 
							if iTotalTroops - iUsedTroops >  1 then
								flag = 1
							end
						end
					end
					if flag == 1 then
						local plotX = unit:GetX()
						local plotY = unit:GetY()
						local unitEXP = unit:GetExperience()
					
						local newUnitType = GetCivSpecificUnit(player, "UNITCLASS_SPUE_SHENJI_MUSKETEER");
						local NewUnit = player:InitUnit(GameInfoTypes[newUnitType], plotX, plotY, UNITAI_DEFENSE);
						NewUnit:JumpToNearestValidPlot();
						NewUnit:SetExperience(unitEXP);
						unit:SetMoves(0);
					
						if unit:GetOwner() == unit:GetPlot():GetOwner()
						then
							local Ccity = GetCloseCity ( unit:GetOwner() , unit:GetPlot() );
							if Ccity:IsCapital() or Ccity:IsOriginalMajorCapital() then
								NewUnit:SetHasPromotion(GameInfo.UnitPromotions["PROMOTION_SPUE_SHENJI_MUSKETEER1"].ID, true);
							else
								NewUnit:SetHasPromotion(GameInfo.UnitPromotions["PROMOTION_SPUE_SHENJI_MUSKETEER2"].ID, true);
							end
						else
							NewUnit:SetHasPromotion(GameInfo.UnitPromotions["PROMOTION_SPUE_SHENJI_MUSKETEER3"].ID, true);
						end	
						player:ChangeGold(- iCost);		
					end
				elseif numInfantry < GameInfo.UnitClasses["UNITCLASS_SPUE_CORVETTE"].MaxPlayerInstances
				and treasureFleetFlag > 1
				then	
					local flag = 0
					local iCost = 700
					if iCost > 0 and player:GetGold() >= iCost then
						-- 玩家有足够金钱
						if player:CountNumBuildings(GameInfoTypes["BUILDING_TROOPS"]) == 0 then
							flag = 1
						elseif player:CountNumBuildings(GameInfoTypes["BUILDING_TROOPS"]) > 0 then
							-- 兵力足够时按钮才会显示
							local iTotalTroops = player:CountNumBuildings(GameInfoTypes["BUILDING_TROOPS"]) 
							local iUsedTroops = player:CountNumBuildings(GameInfoTypes["BUILDING_TROOPS_USED"]) 
							if iTotalTroops - iUsedTroops >  1 then
								flag = 1
							end
						end
					end
					if flag == 1 then
						local plot = unit:GetPlot()
						local plotX = unit:GetX()
						local plotY = unit:GetY()
						local unitEXP = unit:GetExperience()
						local newUnitType = GetCivSpecificUnit(player, "UNITCLASS_SPUE_CORVETTE");
						local NewUnit = player:InitUnit(GameInfoTypes[newUnitType], plotX, plotY, UNITAI_DEFENSE)
						if plot:GetNumUnits() > 2 then
							NewUnit:JumpToNearestValidPlot();
						end 
						NewUnit:SetExperience(unitEXP)
						unit:SetMoves(0)
						player:ChangeGold(- iCost)
					end
				
				end
			end
			--*****************************AI超级要塞转化为大头*****************************--
			-- 陆军单位过少时变为大头
			if unit:CanMove() and unit:IsHasPromotion(unitPromotionGAIA_ShipID) 
			and numLandUnits < numSeaUnits * 2
			then
				local plot 		= unit:GetPlot();
				local plotX 	= plot:GetX();
				local plotY 	= plot:GetY();

				local unitLevel = unit:GetLevel();
				local unitEXP   = unit:GetExperience();

				local unitPromotions = {};
				for row in GameInfo.UnitPromotions() do
				  if unit:IsHasPromotion(row.ID) and not row.LostWithUpgrade then
					table.insert(unitPromotions, row.ID);
				  end
				end
			
				local unitName = nil;
				if unit:HasName() then
				  unitName = unit:GetNameNoDesc();
				end
				unit:Kill();
				local newUnit = nil;
				newUnit = player:InitUnit(GameInfoTypes.UNIT_SPUE_AUTOCRACY_JUFORTRESSHEAD, plot:GetX(), plot:GetY());
			
				newUnit:SetMoves(0);
				newUnit:SetLevel(unitLevel);
				newUnit:SetExperience(unitEXP);
				if #unitPromotions > 0 then
				  for _, unitPromotionID in ipairs(unitPromotions) do
					newUnit:SetHasPromotion(unitPromotionID, true);
				  end
				end
				if unitName then
				  newUnit:SetName(unitName);
				end
			
			end
			-- 海军单位过少时变为超级要塞
			if unit:CanMove() and unit:IsHasPromotion(unitPromotionGAIA_HeadID) and not unit:GetPlot():IsWater() 
			and numLandUnits >= numSeaUnits * 2
			then
				local plot 		= unit:GetPlot();
				local plotX 	= plot:GetX();
				local plotY 	= plot:GetY();
			
				local unitLevel = unit:GetLevel();
				local unitEXP   = unit:GetExperience();
			
				local unitPromotions = {};
				for row in GameInfo.UnitPromotions() do
				  if unit:IsHasPromotion(row.ID) and not row.LostWithUpgrade then
					table.insert(unitPromotions, row.ID);
				  end
				end
			
				local unitName = nil;
				if unit:HasName() then
				  unitName = unit:GetNameNoDesc();
				end

				unit:Kill();
				local newUnit = nil;
				newUnit = player:InitUnit(GameInfoTypes.UNIT_SPUE_AUTOCRACY_JUFORTRESSSHIP, plot:GetX(), plot:GetY());
			
				newUnit:SetMoves(0);
				newUnit:SetLevel(unitLevel);
				newUnit:SetExperience(unitEXP);
				if #unitPromotions > 0 then
				  for _, unitPromotionID in ipairs(unitPromotions) do
					newUnit:SetHasPromotion(unitPromotionID, true);
				  end
				end
				if unitName then
				  newUnit:SetName(unitName);
				end
			end
		end
	end
end--function END
GameEvents.PlayerDoTurn.Add(SPUE_OnPlayerDoTurn)

function SPUE_PlayerDoneTurn(playerID)
	local player = Players[playerID];		-----获取player
    if player == nil then return end;
    if (not player:IsAlive()) then return end;
	if player:IsBarbarian() or player:IsMinorCiv() then return end;
	local pEraType = player:GetCurrentEra();
	local pEraID = GameInfo.Eras[pEraType].ID;
	
    for unit in player:Units() do
        -- 医院骑士团：两格内己方单位数量回复20血量
        if unit:IsHasPromotion( HospitallerKnightID ) then
            local iunit = GameInfo.Units[unit:GetUnitType()]; 
			local plot = unit:GetPlot();
            local ihealth_bonus = 0;

            local unitCount = plot:GetNumUnits();
            local uniqueRange = 2;
			if unitCount >= 1 then
				for i = 0, unitCount-1, 1 do
					local pFoundUnit = plot:GetUnit(i)
					if pFoundUnit ~= nil and pFoundUnit:GetID() ~= unit:GetID() then
						local pPlayer = Players[pFoundUnit:GetOwner()];
						if pPlayer == player then
							pFoundUnit:ChangeDamage(-20);
						end
					end
				end
			end
            
			for dx = -uniqueRange, uniqueRange, 1 do
				for dy = -uniqueRange, uniqueRange, 1 do
					local adjPlot = Map.PlotXYWithRangeCheck(plot:GetX(), plot:GetY(), dx, dy, uniqueRange);
                    if (adjPlot ~= nil) then
			    	    unitCount = adjPlot:GetNumUnits();
			    	    if unitCount >= 1 then
			    	    	for i = 0, unitCount-1, 1 do
			    	    		local pFoundUnit = adjPlot:GetUnit(i);
			    	    		if pFoundUnit ~= nil and pFoundUnit:GetID() ~= unit:GetID() then
			    	    			local pPlayer = Players[pFoundUnit:GetOwner()];
			    	    			if pPlayer == player then
                                        pFoundUnit:ChangeDamage(-20);
			    	    			end
			    	    		end
			    	    	end
			    	    end
                    end
			    end
            end

		end

		-- 涌泉守卫：根据两格内敌方单位数量增加战斗力
        if unit:IsHasPromotion( unitPromotionGondorID ) then
            local iunit = GameInfo.Units[unit:GetUnitType()] ;
			local plot = unit:GetPlot();
            local icombat_bonus = 0;

            local unitCount = plot:GetNumUnits();
            local uniqueRange = 2
			if unitCount >= 1 then
				for i = 0, unitCount-1, 1 do
					local pFoundUnit = plot:GetUnit(i)
					if pFoundUnit ~= nil and pFoundUnit:GetID() ~= unit:GetID() then
						local pPlayer = Players[pFoundUnit:GetOwner()];
						if PlayersAtWar(player, pPlayer) then
							icombat_bonus = icombat_bonus + 1;
						end
					end
				end
			end
            
			for dx = -uniqueRange, uniqueRange, 1 do
				for dy = -uniqueRange, uniqueRange, 1 do
					local adjPlot = Map.PlotXYWithRangeCheck(plot:GetX(), plot:GetY(), dx, dy, uniqueRange);
                    if (adjPlot ~= nil) then
			    	    unitCount = adjPlot:GetNumUnits();
			    	    if unitCount >= 1 then
			    	    	for i = 0, unitCount-1, 1 do
			    	    		local pFoundUnit = adjPlot:GetUnit(i)
			    	    		if pFoundUnit ~= nil and pFoundUnit:GetID() ~= unit:GetID() then
			    	    			local pPlayer = Players[pFoundUnit:GetOwner()];
			    	    			if PlayersAtWar(player, pPlayer) then
                                        icombat_bonus = icombat_bonus + 1;
			    	    			end
			    	    		end
			    	    	end
			    	    end
                    end
			    end
            end
            local iunit = GameInfo.Units[unit:GetUnitType()];
			local icombat = math.ceil(0.1 * iunit.Combat);
			-- unit:SetBaseCombatStrength(iunit.Combat + icombat * icombat_bonus);
			SPUEAddCombatBonus(unit, math.ceil(100 * icombat_bonus * icombat / iunit.Combat))
            local hex = ToHexFromGrid(Vector2(plot:GetX(), plot:GetY()));
            Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("+{1_Num}[ICON_STRENGTH]", icombat * icombat_bonus));
            Events.GameplayFX(hex.x, hex.y, -1);

		end

		-- 罗马禁卫军：集权帝国：驻守首都
		if unit:IsHasPromotion(GameInfoTypes["PROMOTION_SPUE_PRAETORIAN"]) then
			local plot = unit:GetPlot();
			if plot:GetPlotCity() and player:GetCityByID( plot:GetPlotCity() ):IsCapital() then
				local city = plot:GetPlotCity();
				local iCapitalBonus = 4 * pEraID;
				-- 首都
				city:SetOverflowProduction(city:GetOverflowProduction() + iCapitalBonus);
				city:ChangeFood(iCapitalBonus);
				player:ChangeJONSCulture(iCapitalBonus);
				unit:ChangeExperience(2);
				
				-- iCapitalBonus = 4 * (1 + pEraID);
				local hex = ToHexFromGrid(Vector2(plot:GetX(), plot:GetY()));
				Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_CITY_BROWN]+{1_Num}[ENDCOLOR][ICON_PRODUCTION][NEWLINE][COLOR_YIELD_FOOD]+{2_Num}[ENDCOLOR][ICON_FOOD][NEWLINE][COLOR_MAGENTA]+{3_Num}[ENDCOLOR][ICON_CULTURE]", iCapitalBonus, iCapitalBonus, iCapitalBonus));
				Events.GameplayFX(hex.x, hex.y, -1);

			end
		end

		-- 海洋之火：希腊火灼烧蔓延
		if (unit:IsHasPromotion(unitPromotionOceanFireID)) then

			local uniqueRange = 1
			for dx = -uniqueRange, uniqueRange, 1 do
			for dy = -uniqueRange, uniqueRange, 1 do
	
				local adjPlot = Map.PlotXYWithRangeCheck(unit:GetX(), unit:GetY(), dx, dy, uniqueRange);
				if (adjPlot ~= nil and not adjPlot:IsCity()) then
					local unitCount = adjPlot:GetNumUnits();
					if unitCount > 0 then
					for i = 0, unitCount-1, 1 do
					local pUnit = adjPlot:GetUnit(i) ------------Find Units affected
					if pUnit 
					and pUnit:GetID() ~= unit:GetID()
					and (pUnit:GetDomainType() == unit:GetDomainType()) 
					and not pUnit:IsHasPromotion(unitPromotionOceanFireE02ID) 
					and not pUnit:IsHasPromotion(unitPromotionOceanFireE01ID)
					and not pUnit:IsHasPromotion(AntiDebuffID)
					then

						local pPlayer = Players[pUnit:GetOwner()]
						
						if pPlayer == player then
							pUnit:SetHasPromotion(unitPromotionOceanFireE01ID);
						end

					end
					end
					end
				end
			end
			end
	
		end

		-- 西班牙大帆船
		if unit:IsHasPromotion(GameInfoTypes["PROMOTION_SPUE_CORVETTE"]) then
			local plot = unit:GetPlot();
			local fromGPT = 0;
			local numPolices = player:GetNumPolicies();
			if plot and plot:GetImprovementType() == GameInfo.Improvements["IMPROVEMENT_FORT"].ID then
				local outgoingRoutes = {};
				local outgoingRoutes = player:GetTradeRoutes();
				for i, route in ipairs(outgoingRoutes) do
					fromGPT = route.FromCity;
				end
				fromGPT = fromGPT / 100
				player:ChangeGold(math.ceil(0.05 * fromGPT * numPolices));
				local hex = ToHexFromGrid(Vector2(plot:GetX(), plot:GetY()));
				Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("+{1_Num}[ICON_GOLD]", math.ceil(0.05 * fromGPT * numPolices)));
				Events.GameplayFX(hex.x, hex.y, -1);
			end
		end

		-- 长滩：回合结束回30血
		if unit:IsHasPromotion( GameInfoTypes["PROMOTION_SPUE_FREEDOM_LONG_BEACH"] ) then
			unit:ChangeDamage(-30);
		end

		-- 超级要塞：回合结束回满血
		if unit:IsHasPromotion( unitPromotionGAIAID ) then
			unit:ChangeDamage(-1060);
		end
		
    end
end
GameEvents.PlayerDoneTurn.Add(SPUE_PlayerDoneTurn);
--------------------------------------------------------------
-- 单位移动效果
--------------------------------------------------------------
function SPUE_UnitSetXY(playerID, unitID)
	local player = Players[playerID]

	if player:GetUnitByID(unitID) == nil then return end

	local unit = player:GetUnitByID(unitID)
	local plot = unit:GetPlot()

	if player == nil then return end
	
	if player:IsBarbarian() or player:IsMinorCiv() then return end

	--if not player:IsHuman() then return end

	local pCapital = player:GetCapitalCity()
	

	local bWeiYang = GameInfoTypes["BUILDING_SPUE_WEIYANG"]

	if plot then

		if unit:IsHasPromotion(GameInfoTypes["PROMOTION_SPUE_PRAETORIAN"]) then
			-- 罗马禁卫军：集权帝国：驻守首都
			player:SetHasPolicy(GameInfo.Policies["POLICY_SPUE_PRAETORIAN"].ID, false)
			if plot:GetPlotCity() and player:GetCityByID( plot:GetPlotCity() ):IsCapital() then
				-- 首都
				-- player:SetNumFreePolicies(1)
				-- player:SetNumFreePolicies(0)
				player:SetHasPolicy(GameInfo.Policies["POLICY_SPUE_PRAETORIAN"].ID, true, true)
			elseif 
			not ( (plot:GetPlotCity()) or ( plot:GetPlotCity() and player:GetCityByID( plot:GetPlotCity() ):IsCapital() ) )
			and player:HasPolicy(GameInfo.Policies["POLICY_SPUE_PRAETORIAN"].ID) 
			then
				-- 其他地块和城市
				player:SetHasPolicy(GameInfo.Policies["POLICY_SPUE_PRAETORIAN"].ID, false)	 
			end
		end

		if unit:IsHasPromotion(GameInfoTypes["PROMOTION_SPUE_WEIYANG"]) then
			-- 未央宫卫士：驻守首都全局不满-10%
			local pCapPlot = pCapital:Plot()
			if plot:GetPlotCity() and player:GetCityByID( plot:GetPlotCity() ):IsCapital() 
			then
				pCapital:SetNumRealBuilding( bWeiYang, pCapital:GetNumBuilding( bWeiYang ) + 1 )
			elseif 
			not ( (plot:GetPlotCity()) or ( plot:GetPlotCity() and player:GetCityByID( plot:GetPlotCity() ):IsCapital() ) )
			then

				local num_wy_units = 0
				for i = 0, pCapPlot:GetNumUnits() - 1, 1 do
					local fUnit = pCapPlot:GetUnit(i)
					if fUnit:IsHasPromotion(GameInfoTypes["PROMOTION_SPUE_WEIYANG"]) then
						num_wy_units = num_wy_units + 1
					end
				end

				pCapital:SetNumRealBuilding( bWeiYang, num_wy_units )
				
			end
		end

		if unit and ( unit:IsHasPromotion(VARANGIANID) ) then
			-- 瓦兰吉佣兵：海岸加成
			unit:SetHasPromotion(VARANGIANBonusID, false)
			if plot:IsCoastalLand() then
				unit:SetHasPromotion(VARANGIANBonusID, true)
			end
		end

	end 
end
GameEvents.UnitSetXY.Add(SPUE_UnitSetXY)
-- Events.SerialEventUnitCreated.Add(SPUE_UnitSetXY)
GameEvents.UnitCreated.Add(SPUE_UnitSetXY)
--==========================================================================================================================
-- CanHavePromotion EVENTS
--==========================================================================================================================
function SPUE_CanHavePromotion(iPlayer, iUnit, iPromotionType)
	local player = Players[iPlayer];		-----获取player
    if player == nil then return end;
    if (not player:IsAlive()) then return end;
	if player:IsBarbarian() or player:IsMinorCiv() then return end;

	local pUnit = Players[iPlayer]:GetUnitByID(iUnit);
	
	-- 王城骑士：王国冠军
	if iPromotionType == GameInfoTypes.PROMOTION_SPUE_KNIGHT_NEW_C then
		if pUnit:GetExperience() < 300 then 
			return false;
	   end
	end

  
	return true;
end
GameEvents.CanHavePromotion.Add(SPUE_CanHavePromotion)
--==========================================================================================================================
-- PROMOTED EVENTS
--==========================================================================================================================
function SPUE_UnitPromoted(playerID, unitID, promotionID)
	local player = Players[playerID];
	local unit = player:GetUnitByID(unitID);
	local capital = player:GetCapitalCity();
	if (not capital) then return end;

	--王城骑士晋升时获得大文学家
	if unit:IsHasPromotion( KingsKnightBID ) then 
		local sUnitType = GetCivSpecificUnit(player, "UNITCLASS_WRITER")   	
		local NewUnit = player:InitUnit(GameInfoTypes[sUnitType], capital:GetX(), capital:GetY(), UNITAI_WRITER)	
	end

end
GameEvents.UnitPromoted.Add(SPUE_UnitPromoted)
--------------------------------------------------------------
-- 单位光环晋升
-- 十字战车：十字架反对弓月&热气球：高级热气球&医院骑士团
-- 鹰击055：北斗摇光
--------------------------------------------------------------
function SPUE_Unit_Effect_UnitSetXY(playerID)
	local pPlayer = Players[playerID]

	local GreatCrossCheck			 	= CheckUniquePromotions(pPlayer, pGreatCrossID);
	local HotAirBalloonCheck 			= CheckUniquePromotions(pPlayer, pHotAirBalloonID);
	local HospitallerKnightCheck 		= CheckUniquePromotions(pPlayer, HospitallerKnightID);
	local S055Check 					= CheckUniquePromotions(pPlayer, unitPromotion055ID);
	local PanzerCheck					= CheckUniquePromotions(pPlayer, unitPromotionPanzerID);

	-- 十字战车：东征十字军
	if GreatCrossCheck == 1 then
		for pUnit in pPlayer:Units() do
			-- local Patronage = 0;
			local pFlag = false;
			if (pUnit:GetDomainType() == DomainTypes.DOMAIN_LAND) 
			and pUnit:IsCombatUnit() and not pUnit:IsEmbarked() 
			and not pUnit:IsHasPromotion(pGreatCrossID) 
			then  
				pFlag = true
			end
			plotDistancePromotion(pPlayer, pUnit, pGreatCrossID, pGreatCrossEffectID, 2, pFlag)
		end
	end

	-- 热气球：气球上的五星期
	if HotAirBalloonCheck == 1 then
		for pUnit in pPlayer:Units() do
			local Patronage = 0;
			local numHotAirBalloon = 0;
			-- print("HotAirBalloonCheck1.1")
			if (pUnit:GetDomainType() == DomainTypes.DOMAIN_LAND or pUnit:GetDomainType() == DomainTypes.DOMAIN_SEA) 
			and pUnit:IsCombatUnit() 
			and not pUnit:IsEmbarked() 
			and not pUnit:IsHasPromotion(pHotAirBalloonID)
			then 
				--print("HotAirBalloonCheck2")
				for sUnit in pPlayer:Units() do
					if sUnit:IsHasPromotion(pHotAirBalloonID) then
						if Map.PlotDistance(pUnit:GetX(), pUnit:GetY(), sUnit:GetX(), sUnit:GetY()) < 2 then -- 人类同格
							--print("HotAirBalloonCheck3")
							numHotAirBalloon = numHotAirBalloon + 1;
							Patronage = 1;
						end
					end
				end			
				if Patronage == 1 then
					pUnit:SetHasPromotion(pHotAirBalloonEffectID, false)
					pUnit:SetHasPromotion(pHotAirBalloonEffectLv1ID, false)
					pUnit:SetHasPromotion(pHotAirBalloonEffectLv2ID, false)

					if numHotAirBalloon <= 1 then
						pUnit:SetHasPromotion(pHotAirBalloonEffectID, true)
					elseif numHotAirBalloon == 2 then
						pUnit:SetHasPromotion(pHotAirBalloonEffectLv1ID, true)
					else
						pUnit:SetHasPromotion(pHotAirBalloonEffectLv2ID, true)
					end

				else
					if (pUnit:IsHasPromotion(pHotAirBalloonEffectID) 
					or pUnit:IsHasPromotion(pHotAirBalloonEffectLv1ID) 
					or pUnit:IsHasPromotion(pHotAirBalloonEffectLv2ID))
					and not pUnit:IsHasPromotion(pHotAirBalloonID) then
						pUnit:SetHasPromotion(pHotAirBalloonEffectID, false)
						pUnit:SetHasPromotion(pHotAirBalloonEffectLv1ID, false)
						pUnit:SetHasPromotion(pHotAirBalloonEffectLv2ID, false)
					end
				end		
			else
				if (pUnit:IsHasPromotion(pHotAirBalloonEffectID) 
				or pUnit:IsHasPromotion(pHotAirBalloonEffectLv1ID) 
				or pUnit:IsHasPromotion(pHotAirBalloonEffectLv2ID))
				and not pUnit:IsHasPromotion(pHotAirBalloonID) then
					pUnit:SetHasPromotion(pHotAirBalloonEffectID, false)
					pUnit:SetHasPromotion(pHotAirBalloonEffectLv1ID, false)
					pUnit:SetHasPromotion(pHotAirBalloonEffectLv2ID, false)
				end
			end
		end
	end

	-- 医院骑士团
	if GreatCrossCheck == 1 then
		for pUnit in pPlayer:Units() do

			local pFlag = false;
			if (pUnit:GetDomainType() == DomainTypes.DOMAIN_SEA) and pUnit:IsCombatUnit() and not pUnit:IsHasPromotion( HospitallerKnightID ) then  
				pFlag = true
			end
			plotDistancePromotion(pPlayer, pUnit, HospitallerKnightID, HospitallerEffectID, 2, pFlag)
		end
	end

	-- 鹰击055：巡天四面阵
	if S055Check == 1 then
		for pUnit in pPlayer:Units() do
			local pFlag = false;
			if (pUnit:IsHasPromotion( CarrierFighterID  ) or pUnit:IsHasPromotion( IntercepterAircraftUnitID  ))
			then 
				pFlag = true
			end
			plotDistancePromotion(pPlayer, pUnit, unitPromotion055ID, unitPromotion055EffectID, 2, pFlag)
		end
	end

	-- 装甲掷弹兵
	if PanzerCheck == 1 then
		for pUnit in pPlayer:Units() do
			local pFlag = false;
			if (pUnit:IsHasPromotion( TankID ))
			then 
				pFlag = true
			end
			plotDistancePromotion(pPlayer, pUnit, unitPromotionPanzerID, unitPromotionPanzerEffectID, 2, pFlag)
		end
	end

end
GameEvents.UnitSetXY.Add(SPUE_Unit_Effect_UnitSetXY) 
-- Events.SerialEventUnitCreated.Add(SPUE_Unit_Effect_UnitSetXY)
GameEvents.UnitCreated.Add(SPUE_Unit_Effect_UnitSetXY)
--------------------------------------------------------------
-- 瓦兰吉佣兵永备化成为瓦兰吉卫队
--------------------------------------------------------------
SPUE_Varangian_Button = {
	Name = "Varangian Guard",
	Title = "TXT_KEY_SPUE_VARANGIAN_GUARD_BUTTON_SHORT", -- or a TXT_KEY
	OrderPriority = 200, -- default is 200
	IconAtlas = "promoVP_atlas_00", -- 45 and 64 variations required
	PortraitIndex = 49,
	ToolTip = "TXT_KEY_SPUE_VARANGIAN_GUARD_BUTTON", -- or a TXT_KEY_ or a function
	
	Condition = function(action, unit)
		return EliteCondition(unit, VARANGIANID, "UNIT_SPUE_VARANGIAN", "UNIT_SPUE_VARANGIAN_GUARD",
		 "UNITCLASS_SPUE_VARANGIAN", "PROJECT_BUCELLARII_TRAINING", SPUE_Varangian_Button);
  
	end, -- or nil or a boolean, default is true
	
	Disabled = function(action, unit)   
		return EliteDisable(unit, VARANGIANGuardID, "UNITCLASS_SPUE_VARANGIAN", nil);
	end, -- or nil or a boolean, default is false
	
	Action = function(action, unit, eClick) 
		EliteAction(unit, "UNIT_SPUE_VARANGIAN_GUARD", "UNITCLASS_SPUE_VARANGIAN")
	end
  };
  
LuaEvents.UnitPanelActionAddin(SPUE_Varangian_Button)
--------------------------------------------------------------
-- 王都骑士团：兵士集结
--------------------------------------------------------------
--include('UtilityFunctions.lua')
SPUE_Knight_New_Button = {
  Name = "Knight Rally",
  Title = "TXT_KEY_PROMOTION_SPUE_KNIGHT_NEW", -- or a TXT_KEY
  OrderPriority = 200, -- default is 200
  IconAtlas = "UNIT_ATLAS_1", -- 45 and 64 variations required
  PortraitIndex = 26,
  ToolTip = "TXT_KEY_PROMOTION_SPUE_KNIGHT_NEW_HELP", -- or a TXT_KEY_ or a function
  

  
  Condition = function(action, unit)
	local player = Players[unit:GetOwner()]
	local SPUE_Knight_New_Flag = load( player, "Knight Rally", SPUE_Knight_New_Flag) or 0
	local flag = 0
	if unit:CanMove() and unit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_SPUE_KNIGHT_NEW"].ID) and SPUE_Knight_New_Flag == 0
	then
		if player:CountNumBuildings(GameInfoTypes["BUILDING_TROOPS"]) == 0 then
			flag = 1
		elseif player:CountNumBuildings(GameInfoTypes["BUILDING_TROOPS"]) > 0 then
			-- 兵力足够时按钮才会显示
			local iTotalTroops = player:CountNumBuildings(GameInfoTypes["BUILDING_TROOPS"]) 
			local iUsedTroops = player:CountNumBuildings(GameInfoTypes["BUILDING_TROOPS_USED"]) 
			if iTotalTroops - iUsedTroops > math.min(20,  player:GetNumCities() - 1) then
				flag = 1
			end
		end
	end

	return flag == 1;
  end, -- or nil or a boolean, default is true
  
  Disabled = function(action, unit)   
    return false;
  end, -- or nil or a boolean, default is false
  
  Action = function(action, unit, eClick) 
	
	local plot = unit:GetPlot()
	local player = Players[unit:GetOwner()];
    local unitX = unit:GetX()
	local unitY = unit:GetY()
	local unitAIType = unit:GetUnitAIType()
	local numKnights = 0;

	for city in player:Cities() do
		if not city:IsCapital() then
			-- 从非首都城市召唤采邑骑士
			local cityname = city:GetName()
			local NewUnit = player:InitUnit(GameInfoTypes["UNIT_SPUE_KNIGHT_NEW1"], unitX, unitY, unitAIType)
			NewUnit:SetName("[COLOR_CYAN]"..cityname..Locale.ConvertTextKey("TXT_KEY_UNIT_SPUE_KNIGHT_NEW1_NAME").."[ENDCOLOR]") 
			numKnights = numKnights + 1;
			if plot:GetNumUnits() > 2 then
				NewUnit:JumpToNearestValidPlot()
			end
			if numKnights >= math.min(20,  player:GetNumCities() - 1) then
				break;
			end
 
		end
	end

	unit:SetMoves(0)

	save( player, "Knight Rally", 1)

  end
};

LuaEvents.UnitPanelActionAddin(SPUE_Knight_New_Button)
--------------------------------------------------------------
-- 羽林禁军：羽林孤儿
--------------------------------------------------------------
function OnSPUESetDamageSP( iPlayerID, iUnitID, iDamage, iPreviousDamage )
	if Players[ iPlayerID ] == nil or not Players[ iPlayerID ]:IsAlive()
	or Players[ iPlayerID ]:GetUnitByID( iUnitID ) == nil
	or Players[ iPlayerID ]:GetUnitByID( iUnitID ):IsDead()
	or Players[ iPlayerID ]:GetUnitByID( iUnitID ):IsDelayedDeath()
	then
		return;
	end
	local pUnit = Players[ iPlayerID ]:GetUnitByID( iUnitID );
	local pPlayer = Players[ iPlayerID ]
	local YuLin_Num = CountUnitsWithUniquePromotions(iPlayerID, GameInfo.UnitPromotions["PROMOTION_SPUE_YULIN_CAVALRY"].ID)

	if YuLin_Num and YuLin_Num > 0 
	and not pUnit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_SPUE_YULIN_CAVALRY"].ID)
	and iDamage - iPreviousDamage > 0 
	then
		for unit in pPlayer:Units() do
			if unit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_SPUE_YULIN_CAVALRY"].ID) then
				unit:ChangeDamage(-(iDamage - iPreviousDamage) / YuLin_Num)
			end
		end
	end
end
Events.SerialEventUnitSetDamage.Add( OnSPUESetDamageSP );
--------------------------------------------------------------
-- 洛汗骠骑：白城烽火
--------------------------------------------------------------
SPUE_Rohan_Cavalry_Button = {
  Name = "Rohant Cavalry",
  Title = "TXT_KEY_SPUE_ROHAN_CAVALRY_BUTTON_SHORT", -- or a TXT_KEY
  OrderPriority = 200, -- default is 200
  IconAtlas = "promoVP_atlas_02", -- 45 and 64 variations required
  PortraitIndex = 22,
  ToolTip = "TXT_KEY_SPUE_ROHAN_CAVALRY_BUTTON", -- or a TXT_KEY_ or a function
  

  
  Condition = function(action, unit)
	local player = Players[unit:GetOwner()]
	local flag = 0

	if unit:CanMove() 
	and CountUnitsWithUniquePromotions(unit:GetOwner(), GameInfo.UnitPromotions["PROMOTION_SPUE_ROHAN_CAVALRY"].ID) > 0
	and unit:GetUnitClassType() == GameInfo.UnitClasses.UNITCLASS_GREAT_GENERAL.ID
	then
		flag = 1
	end

	return flag == 1;
  end, -- or nil or a boolean, default is true
  
  Disabled = function(action, unit)   
    return false;
  end, -- or nil or a boolean, default is false
  
  Action = function(action, unit, eClick) 
	
	local plot = unit:GetPlot()
	local player = Players[unit:GetOwner()];
    local unitX = unit:GetX()
	local unitY = unit:GetY()
	local unitAIType = unit:GetUnitAIType()

	for iunit in player:Units() do
		if iunit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_SPUE_ROHAN_CAVALRY"].ID) then
			iunit:SetXY(unitX,unitY)
			iunit:SetMoves(iunit:MovesLeft()+GameDefines["MOVE_DENOMINATOR"])
			iunit:ChangeDamage(-10)
			if plot:GetNumUnits() > 2 then
				iunit:JumpToNearestValidPlot()
			end 
		end
	end

	unit:SetMoves(0)

  end
};

LuaEvents.UnitPanelActionAddin(SPUE_Rohan_Cavalry_Button)
--------------------------------------------------------------
-- 探险家：临时热气球
--------------------------------------------------------------
--include('UtilityFunctions.lua')
SPUE_HotAirBalloon_Button = {
  Name = "Hot Air Balloon",
  Title = "TXT_KEY_PROMOTION_SPUE_HOT_AIR_BALLOON_BUTTON_SHORT", -- or a TXT_KEY
  OrderPriority = 200, -- default is 200
  IconAtlas = "SPUE_UNITS_ATLAS", -- 45 and 64 variations required
  PortraitIndex = 29,
  ToolTip = "TXT_KEY_PROMOTION_SPUE_HOT_AIR_BALLOON_BUTTON", -- or a TXT_KEY_ or a function
  

  
  Condition = function(action, unit)
	local player = Players[unit:GetOwner()]

	return unit:CanMove() 
	and unit:GetUnitClassType() == GameInfoTypes.UNITCLASS_EXPLORERX
	and player:HasPolicy(GameInfo.Policies["POLICY_RATIONALISM"].ID);

  end, -- or nil or a boolean, default is true
  
  Disabled = function(action, unit)   
    return false;
  end, -- or nil or a boolean, default is false
  
  Action = function(action, unit, eClick) 
	
	local plot = unit:GetPlot()
	local player = Players[unit:GetOwner()];
    local unitX = unit:GetX()
	local unitY = unit:GetY()
	local unitAIType = unit:GetUnitAIType()


	local NewUnit = player:InitUnit(GameInfoTypes["UNIT_SPUE_HOT_AIR_BALLOON"], unitX, unitY)
	NewUnit:SetHasPromotion(GameInfo.UnitPromotions["PROMOTION_NO_CASUALTIES"].ID, true)
	NewUnit:SetHasPromotion(GameInfo.UnitPromotions["PROMOTION_SPUE_HOT_AIR_BALLOON"].ID, true)
	if plot:GetNumUnits() > 2 then
		NewUnit:JumpToNearestValidPlot()
	end 


	unit:SetMoves(0)

  end
};

LuaEvents.UnitPanelActionAddin(SPUE_HotAirBalloon_Button)
--------------------------------------------------------------
-- 临时热气球每回合减少5战斗力，战斗力为0下一回合消失
--------------------------------------------------------------
function TempHotAirBalloon(playerID)
	local player = Players[playerID]

	if player == nil then
		return
	end

	local HotAirBallooCheck = CheckUniquePromotions(player, pHotAirBalloonID);

	if HotAirBallooCheck == 1 then
		for unit in player:Units() do
			if unit:GetUnitType() == GameInfoTypes.UNIT_SPUE_HOT_AIR_BALLOON
			and unit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_SPUE_HOT_AIR_BALLOON"].ID)
			then
				local combat = unit:GetBaseCombatStrength()
				if combat > 0 then
					unit:SetBaseCombatStrength(combat - 5)
				elseif combat == 0 then
					unit:Kill()
				end
			end

		end
	end

end
GameEvents.PlayerDoTurn.Add(TempHotAirBalloon)
--------------------------------------------------------------
-- 福船：军事训练
--------------------------------------------------------------
-- 重步兵训练
SPUE_FuChuan_LandInfantry_Button = {
	Name = "FuChuan Land Infantry",
	Title = "TXT_KEY_SPUE_FUCHUAN_INFANTRY_BUTTON_SHORT", -- or a TXT_KEY
	OrderPriority = 200, -- default is 200
	IconAtlas = "SP_PROMOTION_ATLAS", -- 45 and 64 variations required
	PortraitIndex = 40,
	ToolTip = "TXT_KEY_SPUE_FUCHUAN_INFANTRY_BUTTON", -- or a TXT_KEY_ or a function
	
  
	
	Condition = function(action, unit)

		local plot = unit:GetPlot()
		local player = Players[unit:GetOwner()]
		local unitX = unit:GetX()
		local unitY = unit:GetY()

		if Teams[player:GetTeam()]:IsHasTech(GameInfoTypes["TECH_GUNPOWDER"]) then
			SPUE_FuChuan_LandInfantry_Button.Title = "TXT_KEY_SPUE_FUCHUAN_GUNPOWDER_BUTTON_SHORT";
        	SPUE_FuChuan_LandInfantry_Button.ToolTip = "TXT_KEY_SPUE_FUCHUAN_GUNPOWDER_BUTTON";
			SPUE_FuChuan_LandInfantry_Button.PortraitIndex = 41;
		end

		local flag = 0
		-- local iCost = -1
		if unit:CanMove() and unit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_SPUE_FUCHUAN"].ID) 
		and plot:IsAdjacentToLand() and Players[unit:GetOwner()]:GetCapitalCity() ~= nil
		then
			-- 单位购买价格
			local sUnitType = GetCivSpecificUnit(player, "UNITCLASS_SWORDSMAN")
			local sUpgradeUnitType = GetUpgradeUnit(player, sUnitType)
			
			while (sUpgradeUnitType ~= nil) do
			   sUnitType = sUpgradeUnitType
			   sUpgradeUnitType = GetUpgradeUnit(player, sUnitType)
			end
			local iUnit = GameInfoTypes[sUnitType]
			local iCost = -1;
			local goldCost = SPUE_UnitPurchaseCost(player, iUnit);
			
			if goldCost then iCost = goldCost * 0.33 end;

			if iCost > 0 and player:GetGold() >= iCost then
				-- 玩家有足够金钱
				if player:CountNumBuildings(GameInfoTypes["BUILDING_TROOPS"]) == 0 then
					flag = 1
				elseif player:CountNumBuildings(GameInfoTypes["BUILDING_TROOPS"]) > 0 then
					-- 兵力足够时按钮才会显示
					local iTotalTroops = player:CountNumBuildings(GameInfoTypes["BUILDING_TROOPS"]) 
					local iUsedTroops = player:CountNumBuildings(GameInfoTypes["BUILDING_TROOPS_USED"]) 
					if iTotalTroops - iUsedTroops >  1 then
						flag = 1
					end
				end
			end
		end
  
		return flag == 1;
  
	end, -- or nil or a boolean, default is true
	
	Disabled = function(action, unit)   
		return false;
	end, -- or nil or a boolean, default is false
	
	Action = function(action, unit, eClick) 
	  
		local plotX = unit:GetX()
		local plotY = unit:GetY()
		local player = Players[unit:GetOwner()]
		local unitEXP = unit:GetExperience()

		local sUnitType = GetCivSpecificUnit(player, "UNITCLASS_SWORDSMAN")
    	local sUpgradeUnitType = GetUpgradeUnit(player, sUnitType)
        
    	while (sUpgradeUnitType ~= nil) do
    	   sUnitType = sUpgradeUnitType
    	   sUpgradeUnitType = GetUpgradeUnit(player, sUnitType)
    	end
		
		local NewUnit = player:InitUnit(GameInfoTypes[sUnitType], plotX, plotY, UNITAI_DEFENSE)
		NewUnit:JumpToNearestValidPlot()
		NewUnit:SetExperience(unitEXP)
		unit:SetMoves(0)

		local iUnit = GameInfoTypes[sUnitType]

		local iCost = -1;
		local goldCost = SPUE_UnitPurchaseCost(player, iUnit);
		
		if goldCost then iCost = goldCost * 0.33 end;
		Events.AudioPlay2DSound("AS2D_INTERFACE_BUY_TILE");	

		if iCost and iCost > 0 then
			player:ChangeGold(- iCost)
		end
		
		
  
	end
  };
  
LuaEvents.UnitPanelActionAddin(SPUE_FuChuan_LandInfantry_Button)
-- 炮兵训练
SPUE_FuChuan_Cannon_Button = {
	Name = "FuChuan Cannons",
	Title = "TXT_KEY_SPUE_FUCHUAN_CANNON_BUTTON_SHORT", -- or a TXT_KEY
	OrderPriority = 200, -- default is 200
	IconAtlas = "SP_PROMOTION_ATLAS", -- 45 and 64 variations required
	PortraitIndex = 45,
	ToolTip = "TXT_KEY_SPUE_FUCHUAN_CANNON_BUTTON", -- or a TXT_KEY_ or a function
	
  
	
	Condition = function(action, unit)

		local plot = unit:GetPlot()
		local player = Players[unit:GetOwner()]
		local unitX = unit:GetX()
		local unitY = unit:GetY()

		local flag = 0

		if unit:CanMove() and unit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_SPUE_FUCHUAN"].ID) 
		and plot:IsAdjacentToLand() and Players[unit:GetOwner()]:GetCapitalCity() ~= nil
		then
			-- 单位购买价格
			local sUnitType = GetCivSpecificUnit(player, "UNITCLASS_CULVERIN")
			local sUpgradeUnitType = GetUpgradeUnit(player, sUnitType)
			
			while (sUpgradeUnitType ~= nil) do
			   sUnitType = sUpgradeUnitType
			   sUpgradeUnitType = GetUpgradeUnit(player, sUnitType)
			end
			local iUnit = GameInfoTypes[sUnitType]
		
			local iCost = -1;
			local goldCost = SPUE_UnitPurchaseCost(player, iUnit);
			
			if goldCost then iCost = goldCost * 0.33 end;

			if iCost > 0 and player:GetGold() >= iCost then
			
				if player:CountNumBuildings(GameInfoTypes["BUILDING_TROOPS"]) == 0 then
					flag = 1
				elseif player:CountNumBuildings(GameInfoTypes["BUILDING_TROOPS"]) > 0 then
					-- 兵力足够时按钮才会显示
					local iTotalTroops = player:CountNumBuildings(GameInfoTypes["BUILDING_TROOPS"]) 
					local iUsedTroops = player:CountNumBuildings(GameInfoTypes["BUILDING_TROOPS_USED"]) 
					if iTotalTroops - iUsedTroops >  1 then
						flag = 1
					end
				end
			end
		end

		return flag == 1;
  
	end, -- or nil or a boolean, default is true
	
	Disabled = function(action, unit)   
		return false;
	end, -- or nil or a boolean, default is false
	
	Action = function(action, unit, eClick) 
	  
		local plotX = unit:GetX()
		local plotY = unit:GetY()
		local player = Players[unit:GetOwner()]
		local unitEXP = unit:GetExperience()

		local sUnitType = GetCivSpecificUnit(player, "UNITCLASS_CULVERIN")
    	local sUpgradeUnitType = GetUpgradeUnit(player, sUnitType)
        
    	while (sUpgradeUnitType ~= nil) do
    	   sUnitType = sUpgradeUnitType
    	   sUpgradeUnitType = GetUpgradeUnit(player, sUnitType)
    	end
		
		local NewUnit = player:InitUnit(GameInfoTypes[sUnitType], plotX, plotY, UNITAI_DEFENSE)
		NewUnit:JumpToNearestValidPlot()
		NewUnit:SetExperience(unitEXP)
		
		unit:SetMoves(0)
		local iUnit = GameInfoTypes[sUnitType]

		local iCost = -1;
		local goldCost = SPUE_UnitPurchaseCost(player, iUnit);
		
		if goldCost then iCost = goldCost * 0.33 end;

		Events.AudioPlay2DSound("AS2D_INTERFACE_BUY_TILE");	

		if iCost and iCost > 0 then
			player:ChangeGold(- iCost)
		end

  
	end
  };
  
LuaEvents.UnitPanelActionAddin(SPUE_FuChuan_Cannon_Button)
--------------------------------------------------------------
-- 超级要塞转换
--------------------------------------------------------------
SPUE_GAIA_Ship2Head_Button = {
	Name = "GAIA Ship2Head",
	Title = "TXT_KEY_SPUE_AUTOCRACY_JUFORTRESSSHIP_TEXT_SHORT", -- or a TXT_KEY
	OrderPriority = 200, -- default is 200
	IconAtlas = "SPUE_GAIA_ATLAS", -- 45 and 64 variations required
	PortraitIndex = 0,
	ToolTip = "TXT_KEY_UNIT_SPUE_AUTOCRACY_JUFORTRESSHEAD_HELP", -- or a TXT_KEY_ or a function
	
	Condition = function(action, unit)

		local player = Players[unit:GetOwner()]
		return unit:CanMove() and unit:IsHasPromotion(unitPromotionGAIA_ShipID);
  
	end, -- or nil or a boolean, default is true
	
	Disabled = function(action, unit)   
		return false;
	end, -- or nil or a boolean, default is false
	
	Action = function(action, unit, eClick) 
	  
		local player 	= Players[unit:GetOwner()];

		local plot 		= unit:GetPlot();
	  	local plotX 	= plot:GetX();
	  	local plotY 	= plot:GetY();

		local unitLevel = unit:GetLevel();
		local unitEXP   = unit:GetExperience();

		local unitPromotions = {};
		for row in GameInfo.UnitPromotions() do
		  if unit:IsHasPromotion(row.ID) and not row.LostWithUpgrade then
		    table.insert(unitPromotions, row.ID);
		  end
		end

		local unitName = nil;
		if unit:HasName() then
		  unitName = unit:GetNameNoDesc();
		end
		
		unit:Kill();
		local newUnit = nil;
		newUnit = player:InitUnit(GameInfoTypes.UNIT_SPUE_AUTOCRACY_JUFORTRESSHEAD, plot:GetX(), plot:GetY());

		newUnit:SetMoves(0);
		newUnit:SetLevel(unitLevel);
		newUnit:SetExperience(unitEXP);
		if #unitPromotions > 0 then
		  for _, unitPromotionID in ipairs(unitPromotions) do
		    newUnit:SetHasPromotion(unitPromotionID, true);
		  end
		end
		if unitName then
		  newUnit:SetName(unitName);
		end

	end
  };
  
LuaEvents.UnitPanelActionAddin(SPUE_GAIA_Ship2Head_Button)

SPUE_GAIA_Head2Ship_Button = {
	Name = "GAIA Head2Ship",
	Title = "TXT_KEY_SPUE_AUTOCRACY_JUFORTRESSHEAD_TEXT_SHORT", -- or a TXT_KEY
	OrderPriority = 200, -- default is 200
	IconAtlas = "SPUE_GAIA_ATLAS", -- 45 and 64 variations required
	PortraitIndex = 1,
	ToolTip = "TXT_KEY_UNIT_SPUE_AUTOCRACY_JUFORTRESSSHIP_HELP", -- or a TXT_KEY_ or a function
	
	Condition = function(action, unit)

		local player = Players[unit:GetOwner()]
		return unit:CanMove() and unit:IsHasPromotion(unitPromotionGAIA_HeadID);
  
	end, -- or nil or a boolean, default is true
	
	Disabled = function(action, unit)   
		return not unit:GetPlot():IsWater();
	end, -- or nil or a boolean, default is false
	
	Action = function(action, unit, eClick) 
	  
		local player 	= Players[unit:GetOwner()];

		local plot 		= unit:GetPlot();
	  	local plotX 	= plot:GetX();
	  	local plotY 	= plot:GetY();

		local unitLevel = unit:GetLevel();
		local unitEXP   = unit:GetExperience();

		local unitPromotions = {};
		for row in GameInfo.UnitPromotions() do
		  if unit:IsHasPromotion(row.ID) and not row.LostWithUpgrade then
		    table.insert(unitPromotions, row.ID);
		  end
		end

		local unitName = nil;
		if unit:HasName() then
		  unitName = unit:GetNameNoDesc();
		end
		
		unit:Kill();
		local newUnit = nil;
		newUnit = player:InitUnit(GameInfoTypes.UNIT_SPUE_AUTOCRACY_JUFORTRESSSHIP, plot:GetX(), plot:GetY());

		newUnit:SetMoves(0);
		newUnit:SetLevel(unitLevel);
		newUnit:SetExperience(unitEXP);
		if #unitPromotions > 0 then
		  for _, unitPromotionID in ipairs(unitPromotions) do
		    newUnit:SetHasPromotion(unitPromotionID, true);
		  end
		end
		if unitName then
		  newUnit:SetName(unitName);
		end

	end
  };
  
LuaEvents.UnitPanelActionAddin(SPUE_GAIA_Head2Ship_Button)
--------------------------------------------------------------
-- 战斗效果
--------------------------------------------------------------
local isSPTP = false
local isSPTPID = "4a11d485-6e59-4392-928e-dc0c24efc083" -- 传统修复mod

for _, mod in pairs(Modding.GetActivatedMods()) do
	if (mod.ID == isSPTPID) then
		isSPTP = true
		break
	end
end

--******************************************************************************* Unit Combat Rules *******************************************************************************
local g_DoNewAttackEffect = nil;
function NewAttackEffectStarted(iType, iPlotX, iPlotY)
	if (PreGame.GetGameOption("GAMEOPTION_SP_NEWATTACK_OFF") == 1) then
		print("SP Attack Effect - OFF!");
		return;
	end
	
	if iType == GameInfoTypes["BATTLETYPE_MELEE"]
	or iType == GameInfoTypes["BATTLETYPE_RANGED"]
	or iType == GameInfoTypes["BATTLETYPE_AIR"]
	or iType == GameInfoTypes["BATTLETYPE_SWEEP"]
	then
		g_DoNewAttackEffect = {
			attPlayerID = -1,
			attUnitID   = -1,
			defPlayerID = -1,
			defUnitID   = -1,
			attODamage  = 0,
			defODamage  = 0,
			PlotX = iPlotX,
			PlotY = iPlotY,
			bIsCity = false,
			defCityID = -1,
			battleType = iType,
		};
	end
end
GameEvents.BattleStarted.Add(NewAttackEffectStarted);
tCaptureSPUnits = {};
function NewAttackEffectJoined(iPlayer, iUnitOrCity, iRole, bIsCity)
	if g_DoNewAttackEffect == nil
	or Players[ iPlayer ] == nil or not Players[ iPlayer ]:IsAlive()
	or (not bIsCity and Players[ iPlayer ]:GetUnitByID(iUnitOrCity) == nil)
	or (bIsCity and (Players[ iPlayer ]:GetCityByID(iUnitOrCity) == nil or iRole == GameInfoTypes["BATTLEROLE_ATTACKER"]))
	or iRole == GameInfoTypes["BATTLEROLE_BYSTANDER"]
	then
		return;
	end
	if bIsCity then
		g_DoNewAttackEffect.defPlayerID = iPlayer;
		g_DoNewAttackEffect.defCityID = iUnitOrCity;
		g_DoNewAttackEffect.bIsCity = bIsCity;
	elseif iRole == GameInfoTypes["BATTLEROLE_ATTACKER"] then
		g_DoNewAttackEffect.attPlayerID = iPlayer;
		g_DoNewAttackEffect.attUnitID = iUnitOrCity;
		g_DoNewAttackEffect.attODamage = Players[ iPlayer ]:GetUnitByID(iUnitOrCity):GetDamage();
	elseif iRole == GameInfoTypes["BATTLEROLE_DEFENDER"] or iRole == GameInfoTypes["BATTLEROLE_INTERCEPTOR"] then
		g_DoNewAttackEffect.defPlayerID = iPlayer;
		g_DoNewAttackEffect.defUnitID = iUnitOrCity;
		g_DoNewAttackEffect.defODamage = Players[ iPlayer ]:GetUnitByID(iUnitOrCity):GetDamage();
	end
	
	-- Prepare for Capture Unit!
	if not bIsCity and g_DoNewAttackEffect.battleType == GameInfoTypes["BATTLETYPE_MELEE"]
	and Players[g_DoNewAttackEffect.attPlayerID] ~= nil and Players[g_DoNewAttackEffect.attPlayerID]:GetUnitByID(g_DoNewAttackEffect.attUnitID) ~= nil
	and Players[g_DoNewAttackEffect.defPlayerID] ~= nil and Players[g_DoNewAttackEffect.defPlayerID]:GetUnitByID(g_DoNewAttackEffect.defUnitID) ~= nil
	then
		local attPlayer = Players[g_DoNewAttackEffect.attPlayerID];
		local attUnit   = attPlayer:GetUnitByID(g_DoNewAttackEffect.attUnitID);
		local defPlayer = Players[g_DoNewAttackEffect.defPlayerID];
		local defUnit   = defPlayer:GetUnitByID(g_DoNewAttackEffect.defUnitID);
	
		if attUnit:GetCaptureChance(defUnit) > 0 then
			local unitClassType = defUnit:GetUnitClassType();
			local unitPlot = defUnit:GetPlot();
			local unitOriginalOwner = defUnit:GetOriginalOwner();
		
			local sCaptUnitName = nil;
			if defUnit:HasName() then
				sCaptUnitName = defUnit:GetNameNoDesc();
			end
			
			local unitLevel = defUnit:GetLevel();
			local unitEXP   = attUnit:GetExperience();
			local attMoves = attUnit:GetMoves();
			print("attacking Unit remains moves:"..attMoves);
		
			tCaptureSPUnits = {unitClassType, unitPlot, g_DoNewAttackEffect.attPlayerID, unitOriginalOwner, sCaptUnitName, unitLevel, unitEXP, attMoves};
		end
	end
end
GameEvents.BattleJoined.Add(NewAttackEffectJoined);
function NewAttackEffect()
	--Defines and status checks
   if g_DoNewAttackEffect == nil or Players[ g_DoNewAttackEffect.defPlayerID ] == nil
   or Players[ g_DoNewAttackEffect.attPlayerID ] == nil or not Players[ g_DoNewAttackEffect.attPlayerID ]:IsAlive()
   or Players[ g_DoNewAttackEffect.attPlayerID ]:GetUnitByID(g_DoNewAttackEffect.attUnitID) == nil
   -- or Players[ g_DoNewAttackEffect.attPlayerID ]:GetUnitByID(g_DoNewAttackEffect.attUnitID):IsDead()
   or Map.GetPlot(g_DoNewAttackEffect.PlotX, g_DoNewAttackEffect.PlotY) == nil
   then
	   return;
   end
   
   local attPlayerID = g_DoNewAttackEffect.attPlayerID;
   local attPlayer = Players[ attPlayerID ];
   local defPlayerID = g_DoNewAttackEffect.defPlayerID;
   local defPlayer = Players[ defPlayerID ];
   
   local attUnit = attPlayer:GetUnitByID(g_DoNewAttackEffect.attUnitID);
   local attPlot = attUnit:GetPlot();
   
   local plotX = g_DoNewAttackEffect.PlotX;
   local plotY = g_DoNewAttackEffect.PlotY;
   local batPlot = Map.GetPlot(plotX, plotY);
   local batType = g_DoNewAttackEffect.battleType;
   
   local bIsCity = g_DoNewAttackEffect.bIsCity;
   local defUnit = nil;
   local defPlot = nil;
   local defCity = nil;
   
   local attFinalUnitDamage = attUnit:GetDamage();
   local defFinalUnitDamage = 0;
   local attUnitDamage = attFinalUnitDamage - g_DoNewAttackEffect.attODamage;
   local defUnitDamage = 0;
   
   if not bIsCity and defPlayer:GetUnitByID(g_DoNewAttackEffect.defUnitID) then
	   defUnit = defPlayer:GetUnitByID(g_DoNewAttackEffect.defUnitID);
	   defPlot = defUnit:GetPlot();
	   defFinalUnitDamage = defUnit:GetDamage();
	   defUnitDamage = defFinalUnitDamage - g_DoNewAttackEffect.defODamage;
   elseif bIsCity and defPlayer:GetCityByID(g_DoNewAttackEffect.defCityID) then
	   defCity = defPlayer:GetCityByID(g_DoNewAttackEffect.defCityID);
   end
   
   g_DoNewAttackEffect = nil;
   
   --Complex Effects Only for Human VS AI(reduce time and enhance stability)
   if not attPlayer:IsHuman() and not defPlayer:IsHuman() then
	   --[[
	   --Larger AI's Bonus against Smaller AIs - AI is easier to become a Boss! Player will feel excited fighting Boss!
	   --AI will capture another AI's city by ranged attack
	   -- AI boss's City cann't be Captured by AI Ranged Unit!
	   if not AICanBeBoss(defPlayer) and defCity then
		   print ("AI attacking AI's City!")
		   if defCity:GetDamage() >= defCity:GetMaxHitPoints() - 1 then
			   local cityPop = defCity:GetPopulation()
			   if cityPop < 10 or AICanBeBoss(attPlayer) then
				   -- attPlayer:AcquireCity(defCity)
				   print ("AI Ranged Unit Takes another AI's city!")
			   end
		   end
	   end
	   ]]
	   return;
   end
   -- Not for Barbarins
   if attPlayer:IsBarbarian() then
	   return;
   end

   local KillingEffectsID = GameInfo.UnitPromotions["PROMOTION_GAIN_MOVES_AFFER_KILLING"].ID

   -- 玄甲军杀敌回血
   ----------- PROMOTION_GAIN_MOVES_AFFER_KILLING Effects
   if not isSPTP and defUnit and attUnit:IsHasPromotion(KillingEffectsID) then
	   print ("DefUnit Damage:"..defFinalUnitDamage);
	   -- if defFinalUnitDamage >= 100 then
	   if defUnitDamage >= 40 or defFinalUnitDamage >= defUnit:GetMaxHitPoints() or defUnit:IsDead() then
		   local maxattUnitHP = attUnit:GetMaxHitPoints()
		   attUnit:SetMoves(attUnit:MovesLeft()+GameDefines["MOVE_DENOMINATOR"]);
		   attUnit:SetMadeAttack(false);
		   attUnit:ChangeDamage(0 - 0.25 * maxattUnitHP)
		   local hex = ToHexFromGrid(Vector2(attPlot:GetX(), attPlot:GetY()));
		   Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("TXT_KEY_PROMOTION_GAIN_MOVES_AFFER_KILLING"));	
		   print ("Ah, fresh meat!");
	   end
	end

   ----------- 达芬奇坦克另类AOE
   if (attUnit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_SPUE_DVC_TANK"].ID)) then
   
   for i = 0, 5 do
	   local adjPlot = Map.PlotDirection(attPlot:GetX(), attPlot:GetY(), i)
	   if (adjPlot ~= nil and not adjPlot:IsCity()) then
		   print("Available for AOE Damage!")
		   local unitCount = adjPlot:GetNumUnits();
		   if unitCount > 0 then
		   for i = 0, unitCount-1, 1 do
		   local pUnit = adjPlot:GetUnit(i) ------------Find Units affected
		   if pUnit and (pUnit:GetDomainType() == DomainTypes.DOMAIN_LAND or pUnit:GetDomainType() == DomainTypes.DOMAIN_SEA) then
			   local pCombat = pUnit:GetBaseCombatStrength()
			   local pPlayer = Players[pUnit:GetOwner()]
			   
			   if PlayersAtWar(attPlayer, pPlayer) then
				   -- local SplashDamageOri = defUnitDamage
				   local attUnitStrength = attUnit:GetMaxAttackStrength(attPlot, defPlot, defUnit);
				   local pFoundUnitStrength = pUnit:GetMaxDefenseStrength(batPlot, attUnit);
				   local SplashDamageOri = attUnit:GetCombatDamage(attUnitStrength, pFoundUnitStrength, attFinalUnitDamage, false, false,
				   false);
					   
				   local AOEmod = 1.0   -- the percent of damage reducing to nearby units
					   
				   local text = nil;
				   local attUnitName = attUnit:GetName();
				   local defUnitName = pUnit:GetName();
					   
				   local SplashDamageFinal = math.floor(SplashDamageOri * AOEmod); -- Set the Final Damage
				   if     SplashDamageFinal >= pUnit:GetCurrHitPoints() then
					   SplashDamageFinal = pUnit:GetCurrHitPoints();
					   local eUnitType = pUnit:GetUnitType();
					   UnitDeathCounter(attPlayerID, pUnit:GetOwner(), eUnitType);
						   
					   -- Notification
					   if     defPlayerID == Game.GetActivePlayer() then
						   -- local heading = Locale.ConvertTextKey("TXT_KEY_SP_NOTIFICATION_UNIT_DESTROYED_SHORT")
						   text = Locale.ConvertTextKey("TXT_KEY_SP_NOTIFICATION_SPLASH_DAMAGE_DEATH", attUnitName, defUnitName);
						   -- defPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC , text, heading, plotX, plotY)
					   elseif attPlayerID == Game.GetActivePlayer() then
						   text = Locale.ConvertTextKey("TXT_KEY_SP_NOTIFICATION_SPLASH_DAMAGE_ENEMY_DEATH", attUnitName, defUnitName);
					   end
				   elseif SplashDamageFinal > 0 then
					   -- Notification
					   if     defPlayerID == Game.GetActivePlayer() then
						   text = Locale.ConvertTextKey("TXT_KEY_SP_NOTIFICATION_SPLASH_DAMAGE", attUnitName, defUnitName, SplashDamageFinal);
					   elseif attPlayerID == Game.GetActivePlayer() then
						   text = Locale.ConvertTextKey("TXT_KEY_SP_NOTIFICATION_SPLASH_DAMAGE_ENEMY", attUnitName, defUnitName, SplashDamageFinal);
					   end
				   end
				   if text then
					   Events.GameplayAlertMessage( text );
				   end
				   pUnit:ChangeDamage(SplashDamageFinal, attPlayer)
				   print("Splash Damage="..SplashDamageFinal)
			   end
		   end
		   end
		   end
	   end
   end
   end

   ----- Charge Damage 瑞士佣兵&瓦兰吉卫队冲锋伤害
   if  not attUnit:IsDead() and (attUnit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_SPUE_SWISSGUARD"].ID) or attUnit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_SPUE_VARANGIAN_GUARD"].ID))
   and not defUnit:IsDead() and batPlot ~= defPlot and defUnitDamage > 0 and batType == GameInfoTypes["BATTLETYPE_MELEE"]
   then
   -- print("Available for Charge Damage!");
   local defFinalUnitDamageChange = 0;
   local ChargeMod = 0.3;	-- The percentage of charging damage to the other unit
   if attUnit:IsHasPromotion(Charge1ID) then
	   if attUnit:IsHasPromotion(Charge2ID) then
		   defFinalUnitDamageChange = 10;
		   ChargeMod = 0.8;
	   end
	   if attUnit:IsHasPromotion(Charge3ID) then
		   defFinalUnitDamageChange = 20;
		   ChargeMod = 1.3;
	   end
   end
   
   local unitCount = batPlot:GetNumUnits();
   if unitCount >= 1 and batPlot ~= attPlot then
	   print ("Our damage done="..defUnitDamage);
	   for i = 0, unitCount-1, 1 do
		   local pFoundUnit = batPlot:GetUnit(i)
		   if pFoundUnit ~= nil and pFoundUnit:GetID() ~= defUnit:GetID() then
			   local pPlayer = Players[pFoundUnit:GetOwner()];
			   if PlayersAtWar(attPlayer,pPlayer) then
				   local attUnitStrength = attUnit:GetMaxAttackStrength(attPlot, defPlot, defUnit);
				   print ("attUnitStrength:" .. attUnitStrength);
				   local pFoundUnitStrength = pFoundUnit:GetMaxDefenseStrength(batPlot, attUnit);
				   print ("pFoundUnitStrength:" .. pFoundUnitStrength);
				   local ChargeDamageOri = attUnit:GetCombatDamage(attUnitStrength, pFoundUnitStrength, attFinalUnitDamage, false, false, false);
				   print ("ChargeDamageOri:" .. ChargeDamageOri);--we now consider the buff and debuff when caculating the charge damage.---by WM
				   -- local ChargeDamageOri = attUnit:GetCombatDamage(attUnitStrength, pUnitStrength, attUnit:GetDamage(),false,false, false)
				   
				   local text = nil;
				   local attUnitName = attUnit:GetName();
				   local defUnitName = pFoundUnit:GetName();
				   
				   print ("ChargeMod:"..ChargeMod)
				   local ChargeDamageFinal = math.floor(ChargeDamageOri * ChargeMod);
				   if     ChargeDamageFinal >= pFoundUnit:GetCurrHitPoints() then
					   local eUnitType = pFoundUnit:GetUnitType();
					   UnitDeathCounter(attPlayerID, pFoundUnit:GetOwner(), eUnitType);
					   
					   -- Notification
					   if     defPlayerID == Game.GetActivePlayer() then
						   -- local heading = Locale.ConvertTextKey("TXT_KEY_SP_NOTIFICATION_UNIT_DESTROYED_SHORT")
						   text = Locale.ConvertTextKey("TXT_KEY_SP_NOTIFICATION_CHARGE_DAMAGE_DEATH", attUnitName, defUnitName);
						   -- defPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC , text, heading, plotX, plotY)
					   elseif attPlayerID == Game.GetActivePlayer() then
						   text = Locale.ConvertTextKey("TXT_KEY_SP_NOTIFICATION_CHARGE_DAMAGE_ENEMY_DEATH", attUnitName, defUnitName);
					   end
					   pFoundUnit:Kill();
				   elseif ChargeDamageFinal > 0 then
					   -- Notification
					   if     defPlayerID == Game.GetActivePlayer() then
						   text = Locale.ConvertTextKey("TXT_KEY_SP_NOTIFICATION_CHARGE_DAMAGE", attUnitName, defUnitName, ChargeDamageFinal);
					   elseif attPlayerID == Game.GetActivePlayer() then
						   text = Locale.ConvertTextKey("TXT_KEY_SP_NOTIFICATION_CHARGE_DAMAGE_ENEMY", attUnitName, defUnitName, ChargeDamageFinal);
					   end
					   pFoundUnit:ChangeDamage(ChargeDamageFinal,attPlayer)
					   print("Charge Damage="..ChargeDamageFinal)
				   end
				   if text then
					   Events.GameplayAlertMessage( text );
				   end
			   end
		   end
	   end
   else
	   print ("our unit is in this plot or this plot has no other enemy - don't need to charge!")
   end
   local text = nil;
   local attUnitName = attUnit:GetName();
   local defUnitName = defUnit:GetName();
   
   if     defFinalUnitDamageChange >= defUnit:GetCurrHitPoints() then
	   defFinalUnitDamageChange = defUnit:GetCurrHitPoints();
	   local eUnitType = defUnit:GetUnitType();
	   UnitDeathCounter(attPlayerID, defPlayerID, eUnitType);
	   
	   -- Notification
	   if     defPlayerID == Game.GetActivePlayer() then
		   -- local heading = Locale.ConvertTextKey("TXT_KEY_SP_NOTIFICATION_UNIT_DESTROYED_SHORT")
		   text = Locale.ConvertTextKey("TXT_KEY_SP_NOTIFICATION_CHARGE_DAMAGE_DEATH", attUnitName, defUnitName);
		   -- defPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC , text, heading, defUnit:GetX(), defUnit:GetY())
	   elseif attPlayerID == Game.GetActivePlayer() then
		   text = Locale.ConvertTextKey("TXT_KEY_SP_NOTIFICATION_CHARGE_DAMAGE_ENEMY_DEATH", attUnitName, defUnitName);
	   end
   elseif defFinalUnitDamageChange > 0 then
	   -- Notification
	   if     defPlayerID == Game.GetActivePlayer() then
		   text = Locale.ConvertTextKey("TXT_KEY_SP_NOTIFICATION_CHARGE_DAMAGE", attUnitName, defUnitName, defFinalUnitDamageChange);
	   elseif attPlayerID == Game.GetActivePlayer() then
		   text = Locale.ConvertTextKey("TXT_KEY_SP_NOTIFICATION_CHARGE_DAMAGE_ENEMY", attUnitName, defUnitName, defFinalUnitDamageChange);
	   end
   end
   if text then
	   Events.GameplayAlertMessage( text );
   end
   defFinalUnitDamage = defFinalUnitDamage + defFinalUnitDamageChange;
   defUnit:ChangeDamage(defFinalUnitDamageChange);
   end

   -- 火帆船防御时直接死球
   -- if not attUnit:IsDead() and attUnit:GetUnitType() == GameInfoTypes["UNIT_SPUE_FIRESHIP"]
   -- then
   -- 	attUnit:Kill();
   -- end

   if not bIsCity then
	   if not defUnit:IsDead() and defUnit:GetUnitType() == GameInfoTypes["UNIT_SPUE_FIRESHIP"]
	   then
		   defUnit:Kill();
	   end
   end

   -- 阿兰骑兵近战回血远程回移动力
   -- if attUnit and attUnit:IsHasPromotion(unitPromotionAlanID) then
   -- 	if batType == GameInfoTypes["BATTLETYPE_MELEE"] then
   -- 		attUnit:ChangeDamage(-10)
   -- 	elseif batType == GameInfoTypes["BATTLETYPE_RANGED"] then
   -- 		attUnit:SetMoves(attUnit:MovesLeft() + GameDefines["MOVE_DENOMINATOR"])
   -- 		local hex = ToHexFromGrid(Vector2(attPlot:GetX(), attPlot:GetY()));
   --         Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("+{1_Num}[ICON_MOVES]", 1));
   --         Events.GameplayFX(hex.x, hex.y, -1);
   -- 	end
	-- end

   -- 九边卫士
   if attUnit and attUnit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_SPUE_SHENJI_MUSKETEER2"].ID) 
   and batType == GameInfoTypes["BATTLETYPE_MELEE"]
   then
	   local movesLeft = attUnit:MovesLeft();
	   attUnit:RangeStrike( plotX, plotY );
	   -- attUnit:SetMadeAttack(false);
	   attUnit:SetMoves(movesLeft);
   end

   if not bIsCity then
	   if not defUnit:IsDead() and defUnit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_SPUE_SHENJI_MUSKETEER2"].ID) 
	   and batType == GameInfoTypes["BATTLETYPE_RANGED"]
	   and Map.PlotDistance(defUnit:GetX(), defUnit:GetY(), attUnit:GetX(), attUnit:GetY()) <= 2
	   then
		   local movesLeft = defUnit:MovesLeft();
		   defUnit:RangeStrike(attUnit:GetX(), attUnit:GetY())
		   defUnit:SetMadeAttack (false)
		   defUnit:SetMoves(movesLeft);
		   print ("I see you!")
	   end
   end

   -- 长滩
   
   if attUnit and attUnit:IsHasPromotion(GameInfoTypes["PROMOTION_SPUE_FREEDOM_LONG_BEACH"]) 
   then
	   local movesLeft = attUnit:MovesLeft();
	   local movesAdd = 60 * JFD_GetRandom(1, 5)
	   attUnit:SetMoves(movesLeft + movesAdd);
	   local hex = ToHexFromGrid(Vector2(attPlot:GetX(), attPlot:GetY()));
	   Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("+{1_Num}[ICON_MOVES]", movesAdd / 60));

   end


   ------鹰击21
   if (attUnit:IsHasPromotion(unitPromotion055MissileID)) then

	   -- for i = 0, 5 do
	   -- 	local adjPlot = Map.PlotDirection(plotX, plotY, i)
	   local text3n = nil;
	   local uniqueRange = 3
	   for dx = -uniqueRange, uniqueRange, 1 do
	   for dy = -uniqueRange, uniqueRange, 1 do

		   local adjPlot = Map.PlotXYWithRangeCheck(plotX, plotY, dx, dy, uniqueRange);
		   if (adjPlot ~= nil and not adjPlot:IsCity()) then
			   print("Available for AOE Damage!")
			   local unitCount = adjPlot:GetNumUnits();
			   if unitCount > 0 then
			   for i = 0, unitCount-1, 1 do
			   local pUnit = adjPlot:GetUnit(i) ------------Find Units affected
			   if pUnit and (pUnit:GetDomainType() == DomainTypes.DOMAIN_LAND or pUnit:GetDomainType() == DomainTypes.DOMAIN_SEA) then
				   local pCombat = pUnit:GetBaseCombatStrength()
				   local pPlayer = Players[pUnit:GetOwner()]
				   
				   if PlayersAtWar(attPlayer, pPlayer) then
					   local SplashDamageOri = attUnit:GetRangeCombatDamage(pUnit,nil,false)
						   
					   local AOEmod = attUnit:GetMoves() / attUnit:MaxMoves()   -- the percent of damage reducing to nearby units
						   
					   local text = nil;
					   
					   local attUnitName = attUnit:GetName();
					   local defUnitName = pUnit:GetName();
						   
					   local SplashDamageFinal = math.floor(SplashDamageOri * AOEmod); -- Set the Final Damage
					   if     SplashDamageFinal >= pUnit:GetCurrHitPoints() then
						   SplashDamageFinal = pUnit:GetCurrHitPoints();
						   local eUnitType = pUnit:GetUnitType();
						   UnitDeathCounter(attPlayerID, pUnit:GetOwner(), eUnitType);
							   
						   -- Notification
						   if     defPlayerID == Game.GetActivePlayer() then
							   -- local heading = Locale.ConvertTextKey("TXT_KEY_SP_NOTIFICATION_UNIT_DESTROYED_SHORT")
							   text = Locale.ConvertTextKey("TXT_KEY_SP_NOTIFICATION_SPLASH_DAMAGE_DEATH", attUnitName, defUnitName);
							   -- defPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC , text, heading, plotX, plotY)
						   elseif attPlayerID == Game.GetActivePlayer() then
							   text = Locale.ConvertTextKey("TXT_KEY_SP_NOTIFICATION_SPLASH_DAMAGE_ENEMY_DEATH", attUnitName, defUnitName);
							   if not text3n then
								   text3n = Locale.ConvertTextKey("TXT_KEY_PROMOTION_SPUE_ORDER_SUPER_055_TEXT3N")
							   end
						   end
					   elseif SplashDamageFinal > 0 then
						   -- Notification
						   if     defPlayerID == Game.GetActivePlayer() then
							   text = Locale.ConvertTextKey("TXT_KEY_SP_NOTIFICATION_SPLASH_DAMAGE", attUnitName, defUnitName, SplashDamageFinal);
						   elseif attPlayerID == Game.GetActivePlayer() then
							   text = Locale.ConvertTextKey("TXT_KEY_SP_NOTIFICATION_SPLASH_DAMAGE_ENEMY", attUnitName, defUnitName, SplashDamageFinal);
						   end
					   end
					   if text then
						   Events.GameplayAlertMessage( text );
					   end

					   
					   pUnit:ChangeDamage(SplashDamageFinal, attPlayer)
					   print("Splash Damage="..SplashDamageFinal)
				   end
			   end
			   end
			   end
		   end
	   end
	   end
	   if text3n then
		   Events.GameplayAlertMessage( text3n )
	   end
	   -- 攻击结束后失去晋升
	   attUnit:SetHasPromotion(unitPromotion055MissileID, false)
	   local text1l = Locale.ConvertTextKey("TXT_KEY_PROMOTION_SPUE_ORDER_SUPER_055_TEXT1L")
	   Events.GameplayAlertMessage( text1l );

   end
	   
   -- 超级要塞：浮岛要塞
   if attUnit:IsHasPromotion(unitPromotionGAIA_ShipID) and GAIAShipHasAttackedThisTurn == 0 then
	   local movesLeft = attUnit:MovesLeft();
	   attUnit:RangeStrike( plotX, plotY );
	   attUnit:SetMadeAttack(false);
	   attUnit:SetMoves(movesLeft);
	   GAIAShipHasAttackedThisTurn = 1;
   end

   -- 超级要塞：神之鼻息
   if (attUnit:IsHasPromotion(unitPromotionGAIA_HeadID)) then

	   -- 确定超级要塞与战斗单元的相对方位
	   local iDireciton = nil; -- 战斗单元相对于超级要塞的方向
	   local GAIARange = 10;
	   local oPlotX, oPlotY = plotX, plotY;
	   
	   for i = 0, 5 do
		   local adjPlot = Map.PlotDirection(plotX, plotY, i)
		   if adjPlot:GetX() ==  attPlot:GetX() and adjPlot:GetY() ==  attPlot:GetY() then
			   if i >= 3 then
				   iDireciton = i - 3
			   else
				   iDireciton = i + 3
			   end
		   end
	   end

	   if not iDireciton then
		   return;
	   end

	   while GAIARange > 0 do
	   -- for i = 0, 5 do
		   -- local iPlot = Map.PlotDirection(oPlotX, oPlotY, i)
		   local adjPlot = Map.PlotDirection(oPlotX, oPlotY, iDireciton)
		   if (adjPlot ~= nil and not adjPlot:IsCity() and GAIARange > 0) then
			   print("Available for AOE Damage!")
			   local unitCount = adjPlot:GetNumUnits();
			   if unitCount > 0 then
			   for i = 0, unitCount-1, 1 do
			   local pUnit = adjPlot:GetUnit(i) ------------Find Units affected
			   if pUnit and (pUnit:GetDomainType() == DomainTypes.DOMAIN_LAND or pUnit:GetDomainType() == DomainTypes.DOMAIN_SEA) then
				   local pCombat = pUnit:GetBaseCombatStrength()
				   local pPlayer = Players[pUnit:GetOwner()]
				   
				   if PlayersAtWar(attPlayer, pPlayer) then
					   local SplashDamageOri = attUnit:GetRangeCombatDamage(pUnit,nil,false)
						   
					   local AOEmod = 1.0;   -- the percent of damage reducing to nearby units
						   
					   local text = nil;
					   
					   local attUnitName = attUnit:GetName();
					   local defUnitName = pUnit:GetName();
						   
					   local SplashDamageFinal = math.floor(SplashDamageOri * AOEmod); -- Set the Final Damage
					   if     SplashDamageFinal >= pUnit:GetCurrHitPoints() then
						   SplashDamageFinal = pUnit:GetCurrHitPoints();
						   local eUnitType = pUnit:GetUnitType();
						   UnitDeathCounter(attPlayerID, pUnit:GetOwner(), eUnitType);
							   
						   -- Notification
						   if     defPlayerID == Game.GetActivePlayer() then
							   -- local heading = Locale.ConvertTextKey("TXT_KEY_SP_NOTIFICATION_UNIT_DESTROYED_SHORT")
							   text = Locale.ConvertTextKey("TXT_KEY_SP_NOTIFICATION_SPLASH_DAMAGE_DEATH", attUnitName, defUnitName);
							   -- defPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC , text, heading, plotX, plotY)
						   elseif attPlayerID == Game.GetActivePlayer() then
							   text = Locale.ConvertTextKey("TXT_KEY_SP_NOTIFICATION_SPLASH_DAMAGE_ENEMY_DEATH", attUnitName, defUnitName);
							   if not text3n then
								   text3n = Locale.ConvertTextKey("TXT_KEY_PROMOTION_SPUE_ORDER_SUPER_055_TEXT3N")
							   end
						   end
					   elseif SplashDamageFinal > 0 then
						   -- Notification
						   if     defPlayerID == Game.GetActivePlayer() then
							   text = Locale.ConvertTextKey("TXT_KEY_SP_NOTIFICATION_SPLASH_DAMAGE", attUnitName, defUnitName, SplashDamageFinal);
						   elseif attPlayerID == Game.GetActivePlayer() then
							   text = Locale.ConvertTextKey("TXT_KEY_SP_NOTIFICATION_SPLASH_DAMAGE_ENEMY", attUnitName, defUnitName, SplashDamageFinal);
						   end
					   end
					   if text then
						   Events.GameplayAlertMessage( text );
					   end

					   
					   pUnit:ChangeDamage(SplashDamageFinal, attPlayer)
					   print("Splash Damage="..SplashDamageFinal)
				   end
			   end
			   end
			   end
		   end
		   oPlotX, oPlotY = adjPlot:GetX(), adjPlot:GetY()
		   GAIARange = GAIARange - 1
	   end
   end


   
   if defUnit and attPlayer:GetCapitalCity() then
	   -- 王城骑士杀敌掠获人口，达到一定程度则可以在首都获得移民
	   for i = 1, 5 do
		   if attUnit:IsHasPromotion(g_KingsKnightPops[i]) then
			   local pEraType = attPlayer:GetCurrentEra();
			   local pEraID = GameInfo.Eras[pEraType].ID;	
			   if defUnitDamage >= 40 or defFinalUnitDamage >= defUnit:GetMaxHitPoints() or defUnit:IsDead() then
				   local attCambat = attUnit:GetBaseCombatStrength();
				   local defCombat = defUnit:GetBaseCombatStrength();
				   local KingsKnightPopsDelta = (pEraID + 1) * defCombat / attCambat;
				   local KingsKnightPops = load(attUnit, "KingsKnightPops", KingsKnightPops) or 0;
				   if KingsKnightPops <= (i - 1) * 20 then KingsKnightPops = (i-1)*20 end;
				   KingsKnightPops = KingsKnightPops + KingsKnightPopsDelta;
				   if KingsKnightPops < 100 then
					   local j = math.ceil(KingsKnightPops / 20);
					   -- print("g_KingsKnightPops[j], j="..j)
					   attUnit:SetHasPromotion(g_KingsKnightPops[i], false);
					   attUnit:SetHasPromotion(g_KingsKnightPops[j], true);
					   local hex = ToHexFromGrid(Vector2(attPlot:GetX(), attPlot:GetY()));
					   Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[ICON_FOOD] [COLOR_YIELD_FOOD]{1_Num}[ENDCOLOR] POP", KingsKnightPops));

				   elseif KingsKnightPops >= 100 then
					   attUnit:SetHasPromotion(g_KingsKnightPops[i], false);
					   attUnit:SetHasPromotion(g_KingsKnightPops[1], true);
					   local hex = ToHexFromGrid(Vector2(attPlot:GetX(), attPlot:GetY()));
					   Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[ICON_FOOD] [COLOR_YIELD_FOOD]{1_Num}[ENDCOLOR] POP", KingsKnightPops));
					   KingsKnightPops = KingsKnightPops - 100;
					   local attCapitalCity = attPlayer:GetCapitalCity();
					   local sUnitType = GetCivSpecificUnit(attPlayer, "UNITCLASS_SETTLER")   	
					   local NewUnit = attPlayer:InitUnit(GameInfoTypes[sUnitType], attCapitalCity:GetX(), attCapitalCity:GetY(), UNITAI_SETTLE)	
				   end
				   save(attUnit, "KingsKnightPops", KingsKnightPops);
				   break;
			   end
		   end
	   end 
	   -- 王城骑士杀敌为首都提供伟人点数
	   if attUnit:IsHasPromotion(KingsKnightCID) then
		   if defUnitDamage >= 40 or defFinalUnitDamage >= defUnit:GetMaxHitPoints() or defUnit:IsDead() then
			   local unitLevel = attUnit:GetLevel();
			   local rewardTP = attUnit:GetBaseCombatStrength();
			   local capital = attPlayer:GetCapitalCity();
			   local specialistWriterID	= GameInfoTypes["SPECIALIST_WRITER"];
			   local specialistScientistID	= GameInfoTypes["SPECIALIST_SCIENTIST"];
			   if capital then
				   capital:ChangeSpecialistGreatPersonProgressTimes100(specialistWriterID, rewardTP*100);
				   capital:ChangeSpecialistGreatPersonProgressTimes100(specialistScientistID, rewardTP*100);

				   if attPlayer:IsHuman() then
					   local plotX = capital:GetX();
					   local plotY = capital:GetY();
					   Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(plotX, plotY))), Locale.ConvertTextKey("[COLOR_POSITIVE_TEXT]+{1_Num}[ENDCOLOR] [ICON_GREAT_WRITER][NEWLINE][COLOR_POSITIVE_TEXT]+{1_Num}[ENDCOLOR] [ICON_GREAT_SCIENTIST]", rewardTP, rewardTP), true);
				   end
			   end
		   end
	   end
   end


   -- 贝利撒留甲骑兵
   if defUnit and attUnit:IsHasPromotion(unitPromotionBucellariEliteID) then
	   print ("DefUnit Damage:"..defFinalUnitDamage);
	   -- if defFinalUnitDamage >= 100 then
	   if defUnitDamage >= 40 or defFinalUnitDamage >= defUnit:GetMaxHitPoints() or defUnit:IsDead() then
		   -- 贝利撒留甲骑兵杀敌带来我们1回合爱国王日
		   if attPlayer:GetCapitalCity() then
			   local goldRow = GameInfo.Resources["RESOURCE_GOLD"];
			   for city in attPlayer:Cities() do
				   if city:GetWeLoveTheKingDayCounter() == 0 then
		   
					   attPlayer:AddNotification(
					   NotificationTypes.NOTIFICATION_DISCOVERED_LUXURY_RESOURCE, 
					   Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_CITY_WLTKD", goldRow.Description, city:GetNameKey()),
					   Locale.ConvertTextKey("TXT_KEY_NOTIFICATION_SUMMARY_CITY_WLTKD", city:GetNameKey()), 
					   city:GetX(), city:GetY(), 
					   goldRow.ID);
					   city:SetWeLoveTheKingDayCounter(city:GetWeLoveTheKingDayCounter() + 1);
					   city:SetResourceDemanded(-1);
					   Events.SerialEventCityInfoDirty();
		   
					   local cityID = city:GetID();
					   Events.SpecificCityInfoDirty(attPlayerID, cityID, CityUpdateTypes.CITY_UPDATE_TYPE_BANNER);
					   Events.SpecificCityInfoDirty(attPlayerID, cityID, CityUpdateTypes.CITY_UPDATE_TYPE_PRODUCTION);
					   Events.SerialEventGameDataDirty();
				   elseif city:GetWeLoveTheKingDayCounter() > 0 then
					   city:SetWeLoveTheKingDayCounter(city:GetWeLoveTheKingDayCounter() + 1);
				   end			
			   end
		   end
	   end

	   --每次发动攻击带来战斗力加成
	   local combatBonus = math.min(500, SPUEGetCombatBonus(attUnit) + 20);
	   if SPUEGetCombatBonus(attUnit) < 500 then 
		   SPUEAddCombatBonus(attUnit, combatBonus);
	   end

	end

   -- 贝利撒留甲骑兵受到攻击后效果减半&清零
   if not bIsCity and defUnit then
	   if not defUnit:IsDead() and defUnit:IsHasPromotion(unitPromotionBucellariEliteID)
	   then
		   local combatBonus = math.max(20, math.ceil(SPUEGetCombatBonus(attUnit) / 2));
		   if combatBonus >= 20 then
			   SPUEAddCombatBonus(defUnit, combatBonus);
		   else
			   SPUEAddCombatBonus(defUnit, 0);
		   end
		   
	   end
   end

   -- 海洋之火
   if (attUnit:IsHasPromotion(unitPromotionOceanFireID)) then

	local uniqueRange = 2
	for dx = -uniqueRange, uniqueRange, 1 do
	for dy = -uniqueRange, uniqueRange, 1 do

		local adjPlot = Map.PlotXYWithRangeCheck(plotX, plotY, dx, dy, uniqueRange);
		if (adjPlot ~= nil and not adjPlot:IsCity()) then
			local unitCount = adjPlot:GetNumUnits();
			if unitCount > 0 then
			for i = 0, unitCount-1, 1 do
			local pUnit = adjPlot:GetUnit(i) ------------Find Units affected
			if pUnit 
			and (pUnit:GetDomainType() == DomainTypes.DOMAIN_LAND or pUnit:GetDomainType() == DomainTypes.DOMAIN_SEA) 
			and not pUnit:IsHasPromotion(unitPromotionOceanFireE02ID) 
			and not pUnit:IsHasPromotion(unitPromotionOceanFireE01ID)
			and not pUnit:IsHasPromotion(AntiDebuffID)
			then
				local pCombat = pUnit:GetBaseCombatStrength()
				local pPlayer = Players[pUnit:GetOwner()]	
				if PlayersAtWar(attPlayer, pPlayer) then
					if Map.PlotDistance(pUnit:GetX(), pUnit:GetY(), attUnit:GetX(), attUnit:GetY()) < 2 then -- 人类2格
						pUnit:SetHasPromotion(unitPromotionOceanFireE02ID);
					else
						pUnit:SetHasPromotion(unitPromotionOceanFireE01ID);
					end	
				end
			end
			end
			end
		end
	end
	end
end

end--function END
GameEvents.BattleFinished.Add(NewAttackEffect)
--------------------------------------------------------------
-- 战斗减伤
--------------------------------------------------------------
function SPUEDamageDelta(iBattleUnitType, iBattleType,
	iAttackPlayerID, iAttackUnitOrCityID, bAttackIsCity, iAttackDamage,
	iDefensePlayerID, iDefenseUnitOrCityID, bDefenseIsCity, iDefenseDamage,
	iInterceptorPlayerID, iInterceptorUnitOrCityID, bInterceptorIsCity, iInterceptorDamage)
	
	local reducedDamage = 0;

	local attPlayer = Players[iAttackPlayerID]
	local defPlayer = Players[iDefensePlayerID]
	if attPlayer == nil or defPlayer == nil then
		return 0
	end

	-- 王城骑士进攻，防御方造成伤害减少
	if iBattleUnitType == GameInfoTypes["BATTLEROLE_DEFENDER"] 
	then
		local attUnit = attPlayer:GetUnitByID(iAttackUnitOrCityID);
		local defUnit = defPlayer:GetUnitByID(iDefenseUnitOrCityID);
		if attUnit == nil then return 0 end;

		-- 王城骑士
		if attUnit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_SPUE_KNIGHT_NEW_C"].ID)
		and not (defUnit ~= nil
		and defUnit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_SPUE_KNIGHT_NEW_C"].ID) )
		then 
			if iDefenseDamage <= 15 then
				-- return -iDefenseDamage;
				reducedDamage = iDefenseDamage;
			else
				-- return -15;
				reducedDamage = 15
			end
		end

	-- 王城骑士防守，进攻方造成伤害减少
	elseif iBattleUnitType == GameInfoTypes["BATTLEROLE_ATTACKER"] 
	then

		local attUnit = attPlayer:GetUnitByID(iAttackUnitOrCityID);
		local defUnit = defPlayer:GetUnitByID(iDefenseUnitOrCityID);
		if defUnit == nil then return 0 end;
		local deltaDamage = 0;

		-- 王城骑士
		if defUnit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_SPUE_KNIGHT_NEW_C"].ID)
		and not (attUnit ~= nil 
		and attUnit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_SPUE_KNIGHT_NEW_C"].ID) )
		then 
			
			if iAttackDamage <= 15 then
				reducedDamage = iAttackDamage
				-- deltaDamage = iAttackDamage;
				-- return -deltaDamage;
			else
				-- deltaDamage = 15;
				reducedDamage = 15;
			end


		end

		-- 王城骑士：掠获人口减伤
		if reducedDamage < iAttackDamage then
			-- 优先考虑王国骑士晋升的减伤
			for i = 2, 6 do
				if defUnit:IsHasPromotion(g_KingsKnightPops[i]) then
					local KingsKnightPops = load(defUnit, "KingsKnightPops", KingsKnightPops) or 0;
					if KingsKnightPops <= (i - 1) * 20 then KingsKnightPops = (i-1)*20 end;
					KingsKnightPops = KingsKnightPops - 20;
					local j = math.ceil(KingsKnightPops / 20);
					defUnit:SetHasPromotion(g_KingsKnightPops[i], false);
					defUnit:SetHasPromotion(g_KingsKnightPops[j], true);
					save(defUnit, "KingsKnightPops", KingsKnightPops);

					if iAttackDamage <= deltaDamage + iAttackDamage * 0.8 then
						-- 此时deltaDamage==15，15>iAttackDamage*0.2
						reducedDamage = iAttackDamage;
						-- return -deltaDamage;
					else
						reducedDamage = reducedDamage + iAttackDamage * 0.8;
						-- return -deltaDamage;
					end	
				end
			end
		end
	
		-- return -deltaDamage;

	end

	return -reducedDamage;
end
GameEvents.BattleCustomDamage.Add(SPUEDamageDelta)
--------------------------------------------------------------
-- 南洋海盗船远程劫掠
--------------------------------------------------------------
--print("This is the 'Units - Ranged Pillage' mod script.")

function OnUnitCanRangeAttackAt(iPlayer, iUnit, iX, iY, bNeedWar)
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)
	local pUnitInfo = GameInfo.Units[pUnit:GetUnitType()]	
	
	if (pUnitInfo.RangedPillage > 0) then
		local pPlot = Map.GetPlot(iX, iY)
		local ePlayer = Players[pPlot:GetOwner()]
		local iRangedPillage = pUnitInfo.RangedPillage

    	if (pPlot:GetImprovementType() ~= -1 and PlayersAtWar(ePlayer, pPlayer)) then
      		print(string.format("%s can range pillage the improvement at (%i, %i)", pUnit:GetName(), iX, iY))

      		if (iRangedPillage == 1 or not pPlot:IsImprovementPillaged()) then
        		-- TODO - for an AI player, does this unit want to pillage the tile?  This opens a whole can of worms!
	    		return pPlayer:IsHuman();
	  		end
		elseif (pPlot:IsRoute()) then
      	print(string.format("%s can range pillage the route at (%i, %i)", pUnit:GetName(), iX, iY))

      		if (iRangedPillage == 1 or not pPlot:IsRoutePillaged()) then
        		-- TODO - for an AI player, does this unit want to pillage the tile?  This opens a whole can of worms!
	   	 		return pPlayer:IsHuman();
	  		end
		end
  	end

  return false;
end
GameEvents.UnitCanRangeAttackAt.Add(OnUnitCanRangeAttackAt)

function OnUnitRangeAttackAt(iPlayer, iUnit, iX, iY)
	local pUnit = Players[iPlayer]:GetUnitByID(iUnit)
	local pPlot = Map.GetPlot(iX, iY)
	local pUnitInfo = GameInfo.Units[pUnit:GetUnitType()]
	local iRangedPillage = pUnitInfo.RangedPillage
	

	
	print(string.format("%s is range pillaging the tile at (%i, %i)", pUnit:GetName(), iX, iY))

	-- Doesn't matter how strong the attacking units RangedPillage is, we can always pillage a functioning improvement/route
	-- Four options for the tile - improvement, pillaged improvement, route, pillaged route
	if (pPlot:GetImprovementType() ~= -1 and not pPlot:IsImprovementPillaged()) then
		-- Non-pillaged improvement, at the very least, pillage it
		pPlot:SetImprovementPillaged(true)
		pUnit:ChangeExperience(pUnitInfo.XPValueAttack)
		pUnit:SetDamage(-25)
	elseif (pPlot:IsRoute() and not pPlot:IsRoutePillaged()) then
		-- Non-pillaged route, at the very least, pillage it
		pPlot:SetRoutePillaged(true)
		pUnit:ChangeExperience(pUnitInfo.XPValueAttack)
		pUnit:SetDamage(-25)
	end

	-- Can the attacking unit destroy the improvement/route?

	return 1;
end
GameEvents.UnitRangeAttackAt.Add(OnUnitRangeAttackAt)
--------------------------------------------------------------
-- 铁人军登陆时回复全部移动力
--------------------------------------------------------------
function SPUE_EmbarkUnit(iPlayerID, iUnitID)
	if Players[iPlayerID] == nil or Players[iPlayerID]:GetUnitByID(iUnitID) == nil
	or Players[iPlayerID]:GetUnitByID(iUnitID):IsEmbarked()
	or Players[iPlayerID]:GetUnitByID(iUnitID):IsDead()
	or Players[iPlayerID]:GetUnitByID(iUnitID):IsDelayedDeath()
	then
		return;
	end
	local pUnit = Players[iPlayerID]:GetUnitByID(iUnitID);
	if pUnit:IsHasPromotion(IronTroopID) then
		pUnit:SetMoves(pUnit:MaxMoves());
	end
end
Events.UnitEmbark.Add( SPUE_EmbarkUnit );
--------------------------------------------------------------
-- 圣殿骑士团攻占城市
--------------------------------------------------------------
--g_Religions_Table
local g_Religions_Table = {}
local g_Religions_Count = 1
for row in DB.Query("SELECT ID FROM Religions WHERE Type != 'RELIGION_PANTHEON';") do 	
	g_Religions_Table[g_Religions_Count] = row
	g_Religions_Count = g_Religions_Count + 1
end

function SPUE_Templar_CityCaptureComplete(oldOwnerID, isCapital, plotX, plotY, newOwnerID, numPop, isConquest)
	local player = Players[newOwnerID]
	if oldOwnerID == newOwnerID then return end
	if (not isConquest) then return end
	
	local city = Map.GetPlot(plotX, plotY):GetPlotCity();
	local mainReligionID = player:GetReligionCreatedByPlayer();
	if Player.HasStateReligion then
		mainReligionID = player:GetStateReligion();
	end
	if mainReligionID == -1 then
		mainReligionID = player:GetCapitalCity():GetReligiousMajority();
	end
	if mainReligionID == -1 then return end

	local pEraType = player:GetCurrentEra()
	local pEraID = GameInfo.Eras[pEraType].ID;

	--UNIQUE UNIT
	local unitGarrison = city:GetGarrisonedUnit()
	if (not unitGarrison) then return end
	-- if unitGarrison:GetUnitType() ~= unitKnightsTemplarID then return end
	
	if unitGarrison:IsHasPromotion( TemplarKnightID ) then
		--g_Religions_Table
		local religionsTable = g_Religions_Table
		local numReligions = #religionsTable
		local oldMainReligionFollowers = city:GetNumFollowers(mainReligionID)
		
		for index = 1, numReligions do
			local row = religionsTable[index]
			local religionID = row.ID
			
			city:ConvertPercentFollowers(mainReligionID, religionID, 100) 
		end
		city:ConvertPercentFollowers(mainReligionID, -1, 100)

		local newMainReligionFollowers = city:GetNumFollowers(mainReligionID)

		local religionBonus = (newMainReligionFollowers - oldMainReligionFollowers) * 30 * (pEraID + 1);
		player:ChangeGold(religionBonus);
		player:ChangeFaith(religionBonus);
		player:ChangeJONSCulture(religionBonus);
		player:ChangeOverflowResearch(religionBonus);

		local hex = ToHexFromGrid(Vector2(plotX, plotY));
		Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_YIELD_GOLD]+{1_Num}[ENDCOLOR][ICON_GOLD][NEWLINE]+{2_Num}[ICON_PEACE][NEWLINE][COLOR_MAGENTA]+{3_Num}[ENDCOLOR][ICON_CULTURE][NEWLINE][COLOR_RESEARCH_STORED]+{4_Num}[ENDCOLOR][ICON_RESEARCH]", religionBonus, religionBonus, religionBonus, religionBonus));
		Events.GameplayFX(hex.x, hex.y, -1);

	end
end
GameEvents.CityCaptureComplete.Add(SPUE_Templar_CityCaptureComplete)
--------------------------------------------------------------
-- 赞助单位征集按钮
--------------------------------------------------------------
--------------------------------------------------------------
-- 靖抚甲骑永备化成为贝利撒留甲骑兵
--------------------------------------------------------------
SPUE_BUCELLARII_Button = {
	Name = "BUCELLARII Guard",
	Title = "TXT_KEY_SPUE_VARANGIAN_GUARD_BUTTON_SHORT", -- or a TXT_KEY
	OrderPriority = 200, -- default is 200
	IconAtlas = "promoVP_atlas_00", -- 45 and 64 variations required
	PortraitIndex = 49,
	ToolTip = "TXT_KEY_SPUE_VARANGIAN_GUARD_BUTTON", -- or a TXT_KEY_ or a function
	
	Condition = function(action, unit)
		return EliteCondition(unit, unitPromotionBucellariID, "UNIT_SPUE_BUCELLARII_GUARD", "UNIT_SPUE_BUCELLARII_GUARD_ELITE",
		 "UNITCLASS_SPUE_BUCELLARII_GUARD", "PROJECT_BUCELLARII_TRAINING", SPUE_BUCELLARII_Button);
  
	end, -- or nil or a boolean, default is true
	
	Disabled = function(action, unit)   
		return EliteDisable(unit, unitPromotionBucellariEliteID, "UNITCLASS_SPUE_BUCELLARII_GUARD", "PROJECT_BUCELLARII_TRAINING");
	end, -- or nil or a boolean, default is false
	
	Action = function(action, unit, eClick) 
		EliteAction(unit, "UNIT_SPUE_BUCELLARII_GUARD_ELITE", "UNITCLASS_SPUE_BUCELLARII_GUARD")
	end
  };
  
LuaEvents.UnitPanelActionAddin(SPUE_BUCELLARII_Button)

-- 同盟军团征集
SPUE_Patronage_Hastati_Button = {
	Name = "Patronage Hastati",
	Title = "TXT_KEY_SPUE_PATRONAGE_SOCII_HASTATI_BUTTON_SHORT", -- or a TXT_KEY
	OrderPriority = 200, -- default is 200
	IconAtlas = "SPUE02_UNITS_ATLAS", -- 45 and 64 variations required
	PortraitIndex = 28,
	ToolTip = "TXT_KEY_SPUE_PATRONAGE_SOCII_HASTATI_BUTTON", -- or a TXT_KEY_ or a function
	
	Condition = function(action, unit)

		local plot = unit:GetPlot()
		local player = Players[unit:GetOwner()]
		local unitX = unit:GetX()
		local unitY = unit:GetY()

		if not Teams[player:GetTeam()]:IsHasTech(GameInfoTypes["TECH_IRON_WORKING"]) then
			return;
		end

		local flag = 0
		local csPlotFlag = 0

		if plot and plot:IsOwned() then
			local csPlayer = Players[plot:GetOwner()]
			if csPlayer:IsMinorCiv() then
				if not PlayersAtWar(player, csPlayer) then
					csPlotFlag = 1
				end
			end
		end

		-- local numUnit = player:GetUnitClassCount(GameInfoTypes["UNITCLASS_SPUE_SOCII_HASTATI"]);
		local numUnit = CountUnitsWithUniquePromotions( unit:GetOwner(), GameInfo.UnitPromotions["PROMOTION_SPUE_SOCII_HASTATI"].ID )
		if unit:CanMove() and unit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_SPUE_GENERAL_BODYGUARD"].ID) 
		and csPlotFlag == 1 
		and Players[unit:GetOwner()]:GetCapitalCity() ~= nil
		and numUnit < GameInfo.UnitClasses["UNITCLASS_SPUE_SOCII_HASTATI"].MaxPlayerInstances
		then
			-- 单位购买价格
			local sUnitType = GetCivSpecificUnit(player, "UNITCLASS_SPUE_SOCII_HASTATI");
			local iUnit = GameInfoTypes[sUnitType];

			local iCost = -1;
			local goldCost = SPUE_UnitPurchaseCost(player, iUnit);
			
			if goldCost then iCost = goldCost * 0.5 end;

			if iCost > 0 and player:GetGold() >= iCost then

				SPUE_Patronage_Hastati_Button.ToolTip = Locale.ConvertTextKey("TXT_KEY_SPUE_PATRONAGE_SOCII_HASTATI_BUTTON", iCost)
				
				-- 玩家有足够金钱
				if player:CountNumBuildings(GameInfoTypes["BUILDING_TROOPS"]) == 0 then
					flag = 1
				elseif player:CountNumBuildings(GameInfoTypes["BUILDING_TROOPS"]) > 0 then
					-- 兵力足够时按钮才会显示
					local iTotalTroops = player:CountNumBuildings(GameInfoTypes["BUILDING_TROOPS"]) 
					local iUsedTroops = player:CountNumBuildings(GameInfoTypes["BUILDING_TROOPS_USED"]) 
					if iTotalTroops - iUsedTroops >  1 then
						flag = 1
					end
				end
			end
		end
  
		return flag == 1;
  
	end, -- or nil or a boolean, default is true
	
	Disabled = function(action, unit)   
		return false;
	end, -- or nil or a boolean, default is false
	
	Action = function(action, unit, eClick) 
		
		local plot = unit:GetPlot()
		local plotX = unit:GetX()
		local plotY = unit:GetY()
		local player = Players[unit:GetOwner()]
		local unitEXP = unit:GetExperience()
		-- 单位购买价格
		local sUnitType = GetCivSpecificUnit(player, "UNITCLASS_SPUE_SOCII_HASTATI");
		local iUnit = GameInfoTypes[sUnitType];
	
		local iCost = -1;
		local goldCost = SPUE_UnitPurchaseCost(player, iUnit);
		
		if goldCost then iCost = goldCost * 0.5 end;

		local NewUnit = player:InitUnit(iUnit, plotX, plotY, UNITAI_DEFENSE)
		if plot:GetNumUnits() > 2 then
			NewUnit:JumpToNearestValidPlot();
		end 
		NewUnit:SetExperience(unitEXP);
		NewUnit:SetPromotionReady(true);		
		unit:SetMoves(0)

		Events.AudioPlay2DSound("AS2D_INTERFACE_BUY_TILE");	

		if iCost and iCost > 0 then
			player:ChangeGold(- iCost)
		end
		
	end
}; 
LuaEvents.UnitPanelActionAddin(SPUE_Patronage_Hastati_Button)	

-- 克里特弓箭手征集
SPUE_Patronage_vBowman_Button = {
	Name = "Patronage vBowman",
	Title = "TXT_KEY_SPUE_VASSAL_BOWMAN_BUTTON_SHORT", -- or a TXT_KEY
	OrderPriority = 200, -- default is 200
	IconAtlas = "SPUE_UNITS_ATLAS", -- 45 and 64 variations required
	PortraitIndex = 55,
	ToolTip = "TXT_KEY_SPUE_VASSAL_BOWMAN_BUTTON", -- or a TXT_KEY_ or a function
	
	Condition = function(action, unit)

		local plot = unit:GetPlot()
		local player = Players[unit:GetOwner()]
		local unitX = unit:GetX()
		local unitY = unit:GetY()

		-- if Teams[player:GetTeam()]:IsHasTech(GameInfoTypes["TECH_IRON_WORKING"]) then
		-- 	return false;
		-- end

		local flag = 0
		local csPlotFlag = 0

		if plot and plot:IsOwned() then
			local csPlayer = Players[plot:GetOwner()]
			if csPlayer:IsMinorCiv() then
				if not PlayersAtWar(player, csPlayer) then
					csPlotFlag = 1
				end
			end
		end

		local numUnit = player:GetUnitClassCount(GameInfoTypes["UNITCLASS_SPUE_VASSAL_BOWMAN"]);
		if unit:CanMove() and unit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_SPUE_GENERAL_BODYGUARD"].ID) 
		and csPlotFlag == 1 
		and Players[unit:GetOwner()]:GetCapitalCity() ~= nil
		and numUnit < GameInfo.UnitClasses["UNITCLASS_SPUE_VASSAL_BOWMAN"].MaxPlayerInstances
		then
			-- 单位购买价格
			local sUnitType = GetCivSpecificUnit(player, "UNITCLASS_SPUE_VASSAL_BOWMAN");
			local iUnit = GameInfoTypes[sUnitType];

			local iCost = -1;
			local goldCost = SPUE_UnitPurchaseCost(player, iUnit);
			if goldCost then iCost = goldCost * 0.5 end;

			if iCost > 0 and player:GetGold() >= iCost then
				SPUE_Patronage_vBowman_Button.ToolTip = Locale.ConvertTextKey("TXT_KEY_SPUE_VASSAL_BOWMAN_BUTTON", iCost)
				-- 玩家有足够金钱
				if player:CountNumBuildings(GameInfoTypes["BUILDING_TROOPS"]) == 0 then
					flag = 1
				elseif player:CountNumBuildings(GameInfoTypes["BUILDING_TROOPS"]) > 0 then
					-- 兵力足够时按钮才会显示
					local iTotalTroops = player:CountNumBuildings(GameInfoTypes["BUILDING_TROOPS"]) 
					local iUsedTroops = player:CountNumBuildings(GameInfoTypes["BUILDING_TROOPS_USED"]) 
					if iTotalTroops - iUsedTroops >  1 then
						flag = 1
					end
				end
			end
		end
  
		return flag == 1;
  
	end, -- or nil or a boolean, default is true
	
	Disabled = function(action, unit)   
		return false;
	end, -- or nil or a boolean, default is false
	
	Action = function(action, unit, eClick) 
		
		local plot = unit:GetPlot()
		local plotX = unit:GetX()
		local plotY = unit:GetY()
		local player = Players[unit:GetOwner()]
		local unitEXP = unit:GetExperience()
		-- 单位购买价格
		local sUnitType = GetCivSpecificUnit(player, "UNITCLASS_SPUE_VASSAL_BOWMAN");
		local iUnit = GameInfoTypes[sUnitType];
	
		local iCost = -1;
		local goldCost = SPUE_UnitPurchaseCost(player, iUnit);
		if goldCost then iCost = goldCost * 0.5 end;
	
		-- local newUnitType = GetCivSpecificUnit(player, "UNITCLASS_SPUE_VASSAL_BOWMAN");
		local NewUnit = player:InitUnit(iUnit, plotX, plotY, UNITAI_DEFENSE)
		if plot:GetNumUnits() > 2 then
			NewUnit:JumpToNearestValidPlot();
		end 
		NewUnit:SetExperience(unitEXP)
		NewUnit:SetPromotionReady(true)
		unit:SetMoves(0)
		Events.AudioPlay2DSound("AS2D_INTERFACE_BUY_TILE");	

		if iCost and iCost > 0 then
			player:ChangeGold(- iCost)
		end
		
	end
}; 
LuaEvents.UnitPanelActionAddin(SPUE_Patronage_vBowman_Button)	

-- 拜占庭喷火兵征集
SPUE_Patronage_Serbia_Button = {
	Name = "Patronage Serbia",
	Title = "TXT_KEY_SPUE_FIRE_THROWER_BUTTON_SHORT", -- or a TXT_KEY
	OrderPriority = 200, -- default is 200
	IconAtlas = "SPUE_UNITS_ATLAS", -- 45 and 64 variations required
	PortraitIndex = 62,
	ToolTip = "TXT_KEY_SPUE_FIRE_THROWER_BUTTON", -- or a TXT_KEY_ or a function
	
	Condition = function(action, unit)

		local plot = unit:GetPlot()
		local player = Players[unit:GetOwner()]
		local unitX = unit:GetX()
		local unitY = unit:GetY()

		if not Teams[player:GetTeam()]:IsHasTech(GameInfoTypes["TECH_IRON_WORKING"]) then
			return;
		end

		local flag = 0
		local csPlotFlag = 0

		if plot and plot:IsOwned() then
			local csPlayer = Players[plot:GetOwner()]
			if csPlayer:IsMinorCiv() then
				if not PlayersAtWar(player, csPlayer) then
					csPlotFlag = 1
				end
			end
		end

		local numUnit = player:GetUnitClassCount(GameInfoTypes["UNITCLASS_SPUE_FIRE_THROWER"]);
		if unit:CanMove() and unit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_SPUE_BUCELLARII_GUARD"].ID) 
		and csPlotFlag == 1 
		and Players[unit:GetOwner()]:GetCapitalCity() ~= nil
		and numUnit < GameInfo.UnitClasses["UNITCLASS_SPUE_FIRE_THROWER"].MaxPlayerInstances
		then
			-- 单位购买价格
			local sUnitType = GetCivSpecificUnit(player, "UNITCLASS_SPUE_FIRE_THROWER");
			local iUnit = GameInfoTypes[sUnitType];

			local iCost = -1;
			local goldCost = SPUE_UnitPurchaseCost(player, iUnit);
			if goldCost then iCost = goldCost * 0.5 end;

			if iCost > 0 and player:GetGold() >= iCost then

				SPUE_Patronage_Serbia_Button.ToolTip = Locale.ConvertTextKey("TXT_KEY_SPUE_FIRE_THROWER_BUTTON", iCost)
				
				-- 玩家有足够金钱
				if player:CountNumBuildings(GameInfoTypes["BUILDING_TROOPS"]) == 0 then
					flag = 1
				elseif player:CountNumBuildings(GameInfoTypes["BUILDING_TROOPS"]) > 0 then
					-- 兵力足够时按钮才会显示
					local iTotalTroops = player:CountNumBuildings(GameInfoTypes["BUILDING_TROOPS"]) 
					local iUsedTroops = player:CountNumBuildings(GameInfoTypes["BUILDING_TROOPS_USED"]) 
					if iTotalTroops - iUsedTroops >  1 then
						flag = 1
					end
				end
			end
		end
  
		return flag == 1;
  
	end, -- or nil or a boolean, default is true
	
	Disabled = function(action, unit)   
		return false;
	end, -- or nil or a boolean, default is false
	
	Action = function(action, unit, eClick) 
		
		local plot = unit:GetPlot()
		local plotX = unit:GetX()
		local plotY = unit:GetY()
		local player = Players[unit:GetOwner()]
		local unitEXP = unit:GetExperience()
		
		-- 单位购买价格
		local sUnitType = GetCivSpecificUnit(player, "UNITCLASS_SPUE_FIRE_THROWER");
		local iUnit = GameInfoTypes[sUnitType];
	
		local iCost = -1;
		local goldCost = SPUE_UnitPurchaseCost(player, iUnit);
		if goldCost then iCost = goldCost * 0.5 end;
	
		local NewUnit = player:InitUnit(iUnit, plotX, plotY, UNITAI_DEFENSE)
		if plot:GetNumUnits() > 2 then
			NewUnit:JumpToNearestValidPlot();
		end 
		NewUnit:SetExperience(unitEXP)
		NewUnit:SetPromotionReady(true)
		unit:SetMoves(0)
		Events.AudioPlay2DSound("AS2D_INTERFACE_BUY_TILE");	

		if iCost and iCost > 0 then
			player:ChangeGold(- iCost)
		end
		
	end
}; 
LuaEvents.UnitPanelActionAddin(SPUE_Patronage_Serbia_Button)	

-- 海洋之火征集
SPUE_Patronage_OceanFire_Button = {
	Name = "Patronage Ocean Fire",
	Title = "TXT_KEY_SPUE_OCEAN_FIRE_BUTTON_SHORT", -- or a TXT_KEY
	OrderPriority = 200, -- default is 200
	IconAtlas = "SPUE02_UNITS_ATLAS", -- 45 and 64 variations required
	PortraitIndex = 27,
	ToolTip = "TXT_KEY_SPUE_OCEAN_FIRE_BUTTON", -- or a TXT_KEY_ or a function
	
	Condition = function(action, unit)

		local plot = unit:GetPlot()
		local player = Players[unit:GetOwner()]
		local unitX = unit:GetX()
		local unitY = unit:GetY()

		local flag = 0

		local numUnit = player:GetUnitClassCount(GameInfoTypes["UNITCLASS_SPUE_OCEAN_FIRE"]);
		if unit:CanMove() and unit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_SPUE_BUCELLARII_GUARD"].ID) 
		and plot:IsCoastalLand() 
		and Players[unit:GetOwner()]:GetCapitalCity() ~= nil
		and numUnit < GameInfo.UnitClasses["UNITCLASS_SPUE_OCEAN_FIRE"].MaxPlayerInstances
		then
			-- 单位购买价格
			local sUnitType = GetCivSpecificUnit(player, "UNITCLASS_SPUE_OCEAN_FIRE");
			local iUnit = GameInfoTypes[sUnitType];

			local iCost = -1;
			local goldCost = SPUE_UnitPurchaseCost(player, iUnit);
			if goldCost then iCost = goldCost * 0.5 end;
	

			if iCost > 0 and player:GetGold() >= iCost then

				SPUE_Patronage_OceanFire_Button.ToolTip = Locale.ConvertTextKey("TXT_KEY_SPUE_OCEAN_FIRE_BUTTON", iCost)
				
				-- 玩家有足够金钱
				if player:CountNumBuildings(GameInfoTypes["BUILDING_TROOPS"]) == 0 then
					flag = 1
				elseif player:CountNumBuildings(GameInfoTypes["BUILDING_TROOPS"]) > 0 then
					-- 兵力足够时按钮才会显示
					local iTotalTroops = player:CountNumBuildings(GameInfoTypes["BUILDING_TROOPS"]) 
					local iUsedTroops = player:CountNumBuildings(GameInfoTypes["BUILDING_TROOPS_USED"]) 
					if iTotalTroops - iUsedTroops >  1 then
						flag = 1
					end
				end
			end
		end
  
		return flag == 1;
  
	end, -- or nil or a boolean, default is true
	
	Disabled = function(action, unit)   
		return false;
	end, -- or nil or a boolean, default is false
	
	Action = function(action, unit, eClick) 
		
		local plot = unit:GetPlot()
		local plotX = unit:GetX()
		local plotY = unit:GetY()
		local player = Players[unit:GetOwner()]
		local unitEXP = unit:GetExperience()
		-- 单位购买价格
		local sUnitType = GetCivSpecificUnit(player, "UNITCLASS_SPUE_OCEAN_FIRE");
		local iUnit = GameInfoTypes[sUnitType];
	
		local iCost = -1;
		local goldCost = SPUE_UnitPurchaseCost(player, iUnit);
		if goldCost then iCost = goldCost * 0.5 end;
		
		local NewUnit = player:InitUnit(iUnit, plotX, plotY, UNITAI_DEFENSE)
		NewUnit:JumpToNearestValidPlot();
		NewUnit:SetExperience(unitEXP)
		NewUnit:SetPromotionReady(true)

		unit:SetMoves(0)
		Events.AudioPlay2DSound("AS2D_INTERFACE_BUY_TILE");	

		if iCost and iCost > 0 then
			player:ChangeGold(- iCost)
		end
		
	end
}; 
LuaEvents.UnitPanelActionAddin(SPUE_Patronage_OceanFire_Button)

-- 神机营征集
SPUE_TreasureFleet_LandInfantry_Button = {
	Name = "Patronage Land Infantry",
	Title = "TXT_KEY_SPUE_PATRONAGE_SHENJI_MUSKETEER_BUTTON_SHORT", -- or a TXT_KEY
	OrderPriority = 200, -- default is 200
	IconAtlas = "SPUE_UNITS_ATLAS", -- 45 and 64 variations required
	PortraitIndex = 58,
	ToolTip = "TXT_KEY_SPUE_PATRONAGE_SHENJI_MUSKETEER_BUTTON", -- or a TXT_KEY_ or a function
	
  
	
	Condition = function(action, unit)

		local plot = unit:GetPlot()
		local player = Players[unit:GetOwner()]
		local unitX = unit:GetX()
		local unitY = unit:GetY()
		
		if Teams[player:GetTeam()]:IsHasTech(GameInfoTypes["TECH_SONAR"]) then
			return false;
		end

		local flag = 0
		-- local numUnit = player:GetUnitClassCount(GameInfoTypes["UNITCLASS_SPUE_SHENJI_MUSKETEER"]);
		local numUnit = CountUnitsWithUniquePromotions( unit:GetOwner(), GameInfo.UnitPromotions["PROMOTION_SPUE_SHENJI_MUSKETEER1"].ID )
					  + CountUnitsWithUniquePromotions( unit:GetOwner(), GameInfo.UnitPromotions["PROMOTION_SPUE_SHENJI_MUSKETEER2"].ID )
					  + CountUnitsWithUniquePromotions( unit:GetOwner(), GameInfo.UnitPromotions["PROMOTION_SPUE_SHENJI_MUSKETEER3"].ID )

		if unit:CanMove() and unit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_SPUE_TREASURE_FLEET"].ID) 
		and plot:IsAdjacentToLand() and Players[unit:GetOwner()]:GetCapitalCity() ~= nil
		and numUnit < GameInfo.UnitClasses["UNITCLASS_SPUE_SHENJI_MUSKETEER"].MaxPlayerInstances
		then
			-- 单位购买价格
			local sUnitType = GetCivSpecificUnit(player, "UNITCLASS_SPUE_SHENJI_MUSKETEER");
			local iUnit = GameInfoTypes[sUnitType];

			local iCost = -1;
			local goldCost = SPUE_UnitPurchaseCost(player, iUnit);
			
			if goldCost then iCost = goldCost * 0.5 end;
	
			if iCost > 0 and player:GetGold() >= iCost then
				SPUE_TreasureFleet_LandInfantry_Button.ToolTip = Locale.ConvertTextKey("TXT_KEY_SPUE_PATRONAGE_SHENJI_MUSKETEER_BUTTON", iCost)
				-- 玩家有足够金钱
				if player:CountNumBuildings(GameInfoTypes["BUILDING_TROOPS"]) == 0 then
					flag = 1
				elseif player:CountNumBuildings(GameInfoTypes["BUILDING_TROOPS"]) > 0 then
					-- 兵力足够时按钮才会显示
					local iTotalTroops = player:CountNumBuildings(GameInfoTypes["BUILDING_TROOPS"]) 
					local iUsedTroops = player:CountNumBuildings(GameInfoTypes["BUILDING_TROOPS_USED"]) 
					if iTotalTroops - iUsedTroops >  1 then
						flag = 1
					end
				end
			end
		end
  
		return flag == 1;
  
	end, -- or nil or a boolean, default is true
	
	Disabled = function(action, unit)   
		return false;
	end, -- or nil or a boolean, default is false
	
	Action = function(action, unit, eClick) 
	  
		local plotX = unit:GetX()
		local plotY = unit:GetY()
		local player = Players[unit:GetOwner()]
		local unitEXP = unit:GetExperience()

		-- 单位购买价格
		local sUnitType = GetCivSpecificUnit(player, "UNITCLASS_SPUE_SHENJI_MUSKETEER");
		local iUnit = GameInfoTypes[sUnitType];

		local iCost = -1;
		local goldCost = SPUE_UnitPurchaseCost(player, iUnit);
		
		if goldCost then iCost = goldCost * 0.5 end;
				
		-- local newUnitType = GetCivSpecificUnit(player, "UNITCLASS_SPUE_SHENJI_MUSKETEER");
		local NewUnit = player:InitUnit(iUnit, plotX, plotY, UNITAI_DEFENSE)
		NewUnit:JumpToNearestValidPlot()
		NewUnit:SetExperience(unitEXP);
		NewUnit:SetPromotionReady(true);

		unit:SetMoves(0)

		if unit:GetOwner() == unit:GetPlot():GetOwner()
		then
			local Ccity = GetCloseCity ( unit:GetOwner() , unit:GetPlot() );
			if Ccity:IsCapital() or Ccity:IsOriginalMajorCapital() then
				NewUnit:SetHasPromotion(GameInfo.UnitPromotions["PROMOTION_SPUE_SHENJI_MUSKETEER1"].ID, true);
			else
				NewUnit:SetHasPromotion(GameInfo.UnitPromotions["PROMOTION_SPUE_SHENJI_MUSKETEER2"].ID, true);
			end
		else
			NewUnit:SetHasPromotion(GameInfo.UnitPromotions["PROMOTION_SPUE_SHENJI_MUSKETEER3"].ID, true);
		end

		Events.AudioPlay2DSound("AS2D_INTERFACE_BUY_TILE");	

		if iCost and iCost > 0 then
			player:ChangeGold(- iCost)
		end
		
		
  
	end
  };
  
LuaEvents.UnitPanelActionAddin(SPUE_TreasureFleet_LandInfantry_Button)	

-- 征召护卫舰召集
SPUE_Patronage_Corvette_Button = {
	Name = "Patronage Corvette",
	Title = "TXT_KEY_SPUE_PATRONAGE_CORVETTE_BUTTON_SHORT", -- or a TXT_KEY
	OrderPriority = 200, -- default is 200
	IconAtlas = "SPUE_UNITS_ATLAS", -- 45 and 64 variations required
	PortraitIndex = 34,
	ToolTip = "TXT_KEY_SPUE_PATRONAGE_CORVETTE_BUTTON", -- or a TXT_KEY_ or a function
	
  
	
	Condition = function(action, unit)

		local plot = unit:GetPlot()
		local player = Players[unit:GetOwner()]
		local unitX = unit:GetX()
		local unitY = unit:GetY()

		if Teams[player:GetTeam()]:IsHasTech(GameInfoTypes["TECH_SONAR"]) then
			return false;
		end

		local flag = 0
		local numUnit = CountUnitsWithUniquePromotions( unit:GetOwner(), GameInfo.UnitPromotions["PROMOTION_SPUE_CORVETTE"].ID )
		if unit:CanMove() and unit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_SPUE_TREASURE_FLEET"].ID) 
		and plot:IsAdjacentToLand() and Players[unit:GetOwner()]:GetCapitalCity() ~= nil
		and numUnit < GameInfo.UnitClasses["UNITCLASS_SPUE_CORVETTE"].MaxPlayerInstances
		then
			-- 单位购买价格
			local sUnitType = GetCivSpecificUnit(player, "UNITCLASS_SPUE_CORVETTE");
			local iUnit = GameInfoTypes[sUnitType];

			local iCost = -1;
			local goldCost = SPUE_UnitPurchaseCost(player, iUnit);
			
			print("goldCost="..goldCost)

			if goldCost then iCost = goldCost * 0.5 end;
				
			if iCost > 0 and player:GetGold() >= iCost then
				SPUE_Patronage_Corvette_Button.ToolTip = Locale.ConvertTextKey("TXT_KEY_SPUE_PATRONAGE_CORVETTE_BUTTON", iCost)

				-- 玩家有足够金钱
				if player:CountNumBuildings(GameInfoTypes["BUILDING_TROOPS"]) == 0 then
					flag = 1
				elseif player:CountNumBuildings(GameInfoTypes["BUILDING_TROOPS"]) > 0 then
					-- 兵力足够时按钮才会显示
					local iTotalTroops = player:CountNumBuildings(GameInfoTypes["BUILDING_TROOPS"]) 
					local iUsedTroops = player:CountNumBuildings(GameInfoTypes["BUILDING_TROOPS_USED"]) 
					if iTotalTroops - iUsedTroops >  1 then
						flag = 1
					end
				end
			end
		end
  
		return flag == 1;
  
	end, -- or nil or a boolean, default is true
	
	Disabled = function(action, unit)   
		return false;
	end, -- or nil or a boolean, default is false
	
	Action = function(action, unit, eClick) 
		
		local plot = unit:GetPlot()
		local plotX = unit:GetX()
		local plotY = unit:GetY()
		local player = Players[unit:GetOwner()]
		local unitEXP = unit:GetExperience()
		-- 单位购买价格
		local sUnitType = GetCivSpecificUnit(player, "UNITCLASS_SPUE_CORVETTE");
		local iUnit = GameInfoTypes[sUnitType];
	
		local iCost = -1;
		local goldCost = SPUE_UnitPurchaseCost(player, iUnit);
		
		if goldCost then iCost = goldCost * 0.5 end;
		
		local NewUnit = player:InitUnit(iUnit, plotX, plotY, UNITAI_DEFENSE)
		if plot:GetNumUnits() > 2 then
			NewUnit:JumpToNearestValidPlot();
		end 
		NewUnit:SetExperience(unitEXP);
		NewUnit:SetPromotionReady(true);

		
		unit:SetMoves(0)

		Events.AudioPlay2DSound("AS2D_INTERFACE_BUY_TILE");

		if iCost and iCost > 0 then
			player:ChangeGold(- iCost)
		end
		
		
  
	end
  };
  
LuaEvents.UnitPanelActionAddin(SPUE_Patronage_Corvette_Button)	
--------------------------------------------------------------
-- 人类玩家无法通过城市建造仆从军&未满足城邦人口要求时AI也不可能建造
--------------------------------------------------------------
local g_PatronageVassalUnitClassList = {"UNITCLASS_SPUE_CORVETTE", 
										"UNITCLASS_SPUE_SHENJI_MUSKETEER", 

										"UNITCLASS_SPUE_VASSAL_BOWMAN",				
										"UNITCLASS_SPUE_SOCII_HASTATI", 

										"UNITCLASS_SPUE_FIRE_THROWER", 
										"UNITCLASS_SPUE_OCEAN_FIRE"}
function SPUE_Patronage_PlayerCanTrain(playerID, unitID)

	local player = Players[playerID];
	local playerTeam = Teams[player:GetTeam()];

	if player:IsHuman() then
		-- local unit = player:GetUnitByID(unitID);
		local vassalUnitsTable = g_PatronageVassalUnitClassList;
		local numVassalUnitClass = #vassalUnitsTable;

		for index = 1, numVassalUnitClass do
			local ivUnitType = GetCivSpecificUnit(player, vassalUnitsTable[index]);
			local ivUnit = GameInfo.Units[GameInfoTypes[ivUnitType]];
			if ivUnit.ID == unitID then
				return false;
			end
		end
	end
	--UNIQUE UNIT
	return true;
	
end
GameEvents.PlayerCanTrain.Add(SPUE_Patronage_PlayerCanTrain);
--------------------------------------------------------------
-- 政策代表单位升级后命名
--------------------------------------------------------------
-- MOD by CaptainCWB
function SetPolicyUnitsName( iPlayer, iOldUnit,  iNewUnit)
	if Players[ iPlayer ] == nil or not Players[ iPlayer ]:IsAlive()
	or Players[ iPlayer ]:GetUnitByID( iOldUnit ) == nil
	or Players[ iPlayer ]:GetUnitByID( iOldUnit ):IsDead()
	or Players[ iPlayer ]:GetUnitByID( iOldUnit ):IsDelayedDeath()
	or Players[ iPlayer ]:GetUnitByID( iOldUnit ):HasName() 
	then
		return;
	end
	local pUnit = Players[ iPlayer ]:GetUnitByID( iOldUnit );
	if  pUnit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_SPUE_PRAETORIAN"].ID) then
		pUnit:SetName("TXT_KEY_UNIT_SPUE_PRAETORIAN");	-- 传统：禁卫军
	elseif pUnit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_SPUE_WEIYANG"].ID) then
		pUnit:SetName("TXT_KEY_UNIT_SPUE_WEIYANG");	-- 传统：未央宫卫士

	elseif pUnit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_SPUE_KNIGHT_NEW"].ID) then
		pUnit:SetName("TXT_KEY_UNIT_SPUE_KNIGHT_NEW");	-- 自主：王城骑士
		
	elseif pUnit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_SPUE_YULIN_CAVALRY"].ID) then
		pUnit:SetName("TXT_KEY_UNIT_SPUE_YULIN_CAVALRY");	-- 荣誉：羽林骑军
	elseif pUnit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_SPUE_ROHAN_CAVALRY"].ID) then
		pUnit:SetName("TXT_KEY_UNIT_SPUE_ROHAN_CAVALRY");	-- 荣誉：洛汗骠骑
	elseif pUnit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_SPUE_FOOT_KNIGHT_TEMPLAR"].ID) 
	and pUnit:GetUnitCombatType() == GameInfoTypes.UNITCOMBAT_MELEE
	then
		pUnit:SetName("TXT_KEY_UNIT_SPUE_FOOT_KNIGHT_TEMPLAR");	-- 虔信：步行圣殿骑士
	elseif pUnit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_SPUE_FOOT_KNIGHT_TEMPLAR"].ID) then
		pUnit:SetName("TXT_KEY_UNIT_SPUE_KNIGHT_TEMPLAR");	-- 虔信：圣殿骑士
	elseif pUnit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_SPUE_FOOT_KNIGHT_TEUTONIC"].ID) 
	and pUnit:GetUnitCombatType() == GameInfoTypes.UNITCOMBAT_MELEE
	then
		pUnit:SetName("TXT_KEY_UNIT_SPUE_FOOT_KNIGHT_TEMPLAR");	-- 虔信：步行条顿骑士
	elseif pUnit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_SPUE_FOOT_KNIGHT_TEUTONIC"].ID) then
		pUnit:SetName("TXT_KEY_UNIT_SPUE_KNIGHT_TEMPLAR");	-- 虔信：条顿骑士
	elseif pUnit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_SPUE_FOOT_KNIGHT_HOSPITALLER"].ID) 
	and pUnit:GetUnitCombatType() == GameInfoTypes.UNITCOMBAT_MELEE
	then
		pUnit:SetName("TXT_KEY_UNIT_SPUE_FOOT_KNIGHT_TEMPLAR");	-- 虔信：步行医院骑士
	elseif pUnit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_SPUE_FOOT_KNIGHT_HOSPITALLER"].ID) then
		pUnit:SetName("TXT_KEY_UNIT_SPUE_KNIGHT_TEMPLAR");	-- 虔信：医院骑士

	elseif pUnit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_SPUE_GENERAL_BODYGUARD"].ID) then
		pUnit:SetName("TXT_KEY_UNIT_SPUE_GENERAL_BODYGUARD");	-- 赞助：将领卫队
	elseif pUnit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_SPUE_VASSAL_BOWMAN"].ID) then
		pUnit:SetName("TXT_KEY_UNIT_SPUE_VASSAL_BOWMAN");	-- 赞助：克里特岛弓箭手
	elseif pUnit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_SPUE_SOCII_HASTATI"].ID) then
		pUnit:SetName("TXT_KEY_UNIT_SPUE_SOCII_HASTATI");	-- 赞助：同盟军团

	elseif pUnit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_SPUE_FIRE_THROWER"].ID) then
		pUnit:SetName("TXT_KEY_UNIT_SPUE_FIRE_THROWER");	-- 赞助：亚美尼亚重步兵
	elseif pUnit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_SPUE_BUCELLARII_GUARD"].ID) 
	and not pUnit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_SPUE_BUCELLARII_GUARD_ELITE"].ID)
	then
		pUnit:SetName("TXT_KEY_UNIT_SPUE_BUCELLARII_GUARD");	-- 赞助：靖抚甲骑
	elseif pUnit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_SPUE_BUCELLARII_GUARD_ELITE"].ID) then
		pUnit:SetName("TXT_KEY_UNIT_SPUE_BUCELLARII_GUARD_ELITE");	-- 赞助：执政甲骑
	elseif pUnit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_SPUE_OCEAN_FIRE"].ID) then
		pUnit:SetName("TXT_KEY_UNIT_SPUE_OCEAN_FIRE");	-- 赞助：海洋之火

	elseif pUnit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_SPUE_TREASURE_FLEET"].ID) then
		pUnit:SetName("TXT_KEY_UNIT_SPUE_TREASURE_FLEET");	-- 赞助：宝船
	elseif pUnit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_SPUE_SHENJI_MUSKETEER1"].ID) then
		pUnit:SetName("TXT_KEY_PROMOTION_SPUE_SHENJI_MUSKETEER1");	-- 赞助：神机营1
	elseif pUnit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_SPUE_SHENJI_MUSKETEER2"].ID) then
		pUnit:SetName("TXT_KEY_PROMOTION_SPUE_SHENJI_MUSKETEER2");	-- 赞助：神机营2
	elseif pUnit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_SPUE_SHENJI_MUSKETEER3"].ID) then
		pUnit:SetName("PROMOTION_SPUE_SHENJI_MUSKETEER3");	-- 赞助：神机营3
	elseif pUnit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_SPUE_CORVETTE"].ID) then
		pUnit:SetName("TXT_KEY_UNIT_SPUE_CORVETTE");	-- 赞助：护卫舰

	elseif pUnit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_SPUE_FUCHUAN"].ID) then
		pUnit:SetName("TXT_KEY_UNIT_SPUE_FUCHUAN");	-- 海事：福船

	elseif pUnit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_SPUE_DVC_TANK"].ID) then
		pUnit:SetName("TXT_KEY_UNIT_SPUE_DVC_TANK");	-- 美学：达芬奇坦克

	elseif pUnit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_SPUE_SSPRIVATEER"].ID) then
		pUnit:SetName("TXT_KEY_UNIT_SPUE_SSPRIVATEER");		-- 商业：南洋海盗船
	elseif pUnit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_SPUE_GENOAXBOW"].ID) then
		pUnit:SetName("TXT_KEY_UNIT_SPUE_GENOAXBOW");	-- 商业：热那亚弩手
	elseif pUnit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_SPUE_SWISSGUARD"].ID) then
		pUnit:SetName("TXT_KEY_UNIT_SPUE_SWISSGUARD");	-- 商业：瑞士佣兵
	elseif pUnit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_SPUE_VARANGIAN_GUARD"].ID) then
		pUnit:SetName("TXT_KEY_UNIT_SPUE_VARANGIAN_GUARD");	-- 商业：瓦兰吉卫队
	elseif pUnit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_SPUE_VARANGIAN"].ID) then
		pUnit:SetName("TXT_KEY_UNIT_SPUE_VARANGIAN");	-- 商业：瓦兰吉佣兵
	elseif pUnit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_SPUE_IRON_TROOP"].ID) then
		pUnit:SetName("TXT_KEY_UNIT_SPUE_IRON_TROOP");	-- 商业：铁人军

	elseif pUnit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_SPUE_ORDER_KV2"].ID) then
		pUnit:SetName("TXT_KEY_UNIT_SPUE_ORDER_KV2");	-- 秩序：KV2
	elseif pUnit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_SPUE_FREEDOM_SPITFIRE"].ID) then
		pUnit:SetName("TXT_KEY_UNIT_SPUE_FREEDOM_SPITFIRE");	-- 自由：喷火
	elseif pUnit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_SPUE_AUTOCRACY_PANZERG"].ID) then
		pUnit:SetName("TXT_KEY_UNIT_SPUE_AUTOCRACY_PANZERG");	-- 独裁：装甲掷弹兵
	end

	if pUnit:GetUnitType() == GameInfoTypes.UNIT_SPUE_DVC_FIGHTER then
		pUnit:SetName("TXT_KEY_UNIT_SPUE_DVC_FIGHTER");	-- 美学：达芬奇飞行器
	elseif pUnit:GetUnitType() == GameInfoTypes.UNIT_SPUE_DVC_MACHINEGUN then
		pUnit:SetName("TXT_KEY_UNIT_SPUE_DVC_MACHINEGUN");	-- 美学：达芬奇机关炮
	end
end
GameEvents.UnitUpgraded.Add(SetPolicyUnitsName);