-- SPUE_UtilityFunctions
-- Author: dzs2311
-- DateCreated: 2023/3/15 8:58:34
--------------------------------------------------------------
include("UtilityFunctions");
--=======================================================================================================================
-- USER SETTING FUNCTIONS
--=======================================================================================================================
-- MOD CHECKS
--------------------------------------------------------------------------------------------------------------------------
-- SPUE_IsUsingCPDLL
function SPUE_IsUsingCPDLL()
	local cPDLLModID = "d1b6328c-ff44-4b0d-aad7-c657f83610cd"
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if (mod.ID == cPDLLModID) then
			return true
		end
	end
end
local isUsingCPDLL = SPUE_IsUsingCPDLL()
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- GENERAL
--------------------------------------------------------------------------------------------------------------------------
-- SPUE_GetRandom
function SPUE_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end

-- SPUE_GetUniqueUnit
function SPUE_GetUniqueUnit(player, unitClass)
	-- if isUsingCPDLL then
	-- 	return player:GetSpecificUnitType(unitClass)
	-- end
	local unitType = nil
	local civType = GameInfo.Civilizations[player:GetCivilizationType()].Type
	for uniqueUnit in GameInfo.Civilization_UnitClassOverrides{CivilizationType = civType, UnitClassType = unitClass} do
		unitType = uniqueUnit.UnitType
		break
	end
	if (unitType == nil) then
		unitType = GameInfo.UnitClasses[unitClass].DefaultUnit
	end
	return unitType
end

-- SPUE_SendNotification
function SPUE_SendNotification(playerID, notificationType, description, descriptionShort, global, data1, data2, unitID, data3, metOnly, includesSerialMessage)
	local player = Players[playerID]
	local data1 = data1 or -1
	local data2 = data2 or -1
	local unitID = unitID or -1
	local data3 = data3 or -1
	local sendNotification = false
	local sendSerialMessage = false
	if global then
		if metOnly then
			if Teams[Game.GetActiveTeam()]:IsHasMet(player:GetTeam()) then
				sendNotification = true
			end
		else
			sendNotification = true
		end
	else
		if player:IsHuman() then
			if metOnly then
				if Teams[Game.GetActiveTeam()]:IsHasMet(player:GetTeam()) then
					sendNotification = true
				end
			else
				sendNotification = true
			end
		end
	end
	if sendNotification then
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes[notificationType], description, descriptionShort, data1, data2, unitID, data3)
		if includesSerialMessage then
			Events.GameplayAlertMessage(description)
		end
	end
end   

--SPUE_IsInCityStateBorders
function SPUE_IsInCityStateBorders(unit)
	local plot = unit:GetPlot();
	if plot:GetOwner() > -1 then
		return Players[plot:GetOwner()]:IsMinorCiv();
	end
	return false;
end

----Get Closed City
function GetCloseCity ( iPlayer, plot )      
	local pPlayer = Players[iPlayer];
	local distance = 1000;
	local closeCity = nil;
	if pPlayer == nil then
		-- print ("nil")
		return nil
	end

	if pPlayer:GetNumCities() <= 0 then 
		-- print ("No Cities!")
		return;
	end

	for pCity in pPlayer:Cities() do
		local distanceToCity = Map.PlotDistance(pCity:GetX(), pCity:GetY(), plot:GetX(), plot:GetY());
		if ( distanceToCity < distance) then
			distance = distanceToCity;
			closeCity = pCity;
			--print("pCity:GetName()"..pCity:GetName())
		end
	end
	return closeCity;
end
--------------------------------------------------------------
-- Map functions 地图相关的函数
--------------------------------------------------------------
--	here (x,y) = (0,0) is bottom left of map in Worldbuilder.
function GetPlot (x,y)                          ------从XY获取地块
	local plot = Map:GetPlotXY(y,x)
	return plot
end

function GetPlotKey ( plot )                   ------获取地块的KEY
	-- set the key string used in cultureMap
	-- structure : g_CultureMap[plotKey] = { { ID = CIV_CULTURAL_ID, Value = cultureForThisCiv }, }
	local x = plot:GetX()
	local y = plot:GetY()
	local plotKey = x..","..y
	return plotKey
end

-- return the plot refered by the key string
function GetPlotFromKey ( plotKey )            -----从KEY获取地块
	local pos = string.find(plotKey, ",")
	local x = string.sub(plotKey, 1 , pos -1)
	local y = string.sub(plotKey, pos +1)
	local plot = Map:GetPlotXY(y,x)
	return plot
end

function GetPlotXYFromKey ( plotKey )     -------获取key对应XY
	local pos = string.find(plotKey, ",")
	local x = string.sub(plotKey, 1 , pos -1)
	local y = string.sub(plotKey, pos +1)
	return x, y
end

function isInArray(t, val)
	for _, v in pairs(t) do
		if v == val then
			return true
		end
	end
	return false
end
--------------------------------------------------------------
-- SP精英单位判断
--------------------------------------------------------------
function IsNotEliteUnit(pUnit)
	local unitName = Locale.ConvertTextKey(pUnit:GetNameNoDesc())

	-- 单位不可购买或单位名称中含有字符串"[COLOR_YIELD_GOLD]"
    if  (GameInfo.Units[pUnit:GetUnitType()].HurryCostModifier == -1 
	and GameInfo.Units[pUnit:GetUnitType()].ProjectPrereq ~= nil) 
	or (GameInfo.Units[pUnit:GetUnitType()].HurryCostModifier ~= -1 
	and string.match(unitName, "[COLOR_YIELD_GOLD]") ~= nil)
	then
        return false
    else
        return true
    end
end
--------------------------------------------------------------
-- 军团：玩家有足够兵力
-- 当未启用军团模式或兵力剩余足够(大于numTroopsLeft)时返回1
-------------------------------------------------------------
function TroopsLeftFlag(player, numTroopsLeft)
	--[[
	local flag = 0;
	if player:CountNumBuildings(GameInfoTypes["BUILDING_TROOPS"]) == 0 or GameInfoTypes["BUILDING_TROOPS"] == nil then
		flag = 1;
	elseif player:CountNumBuildings(GameInfoTypes["BUILDING_TROOPS"]) > 0 then
		-- 兵力足够时按钮才会显示
		local iTotalTroops = player:CountNumBuildings(GameInfoTypes["BUILDING_TROOPS"]) 
		local iUsedTroops = player:CountNumBuildings(GameInfoTypes["BUILDING_TROOPS_USED"]) 
		if iTotalTroops - iUsedTroops > numTroopsLeft then
			flag = 1;
		end
	end
	return flag;
	]]
	--军团内置兼容  --by 清音
	local flag = 0;
	if PreGame.GetGameOption("GAMEOPTION_SP_CORPS_MODE_DISABLE") == 1 then
		flag = 1;
	elseif player:GetDomainTroopsActive() > numTroopsLeft then
		flag = 1;
	end
	return flag;
end
------------------------------------------------------
-- 拥有特殊晋升单位数量
--------------------------------------------------------------
function CountUnitsWithUniquePromotions( iPlayerID, unitPromotionID )
	
	if  Players[ iPlayerID ] and Players[ iPlayerID ]:IsAlive() then
		local pPlayer = Players[ iPlayerID ]
		local num = 0

		if (not pPlayer:IsAlive()) then return end
		if pPlayer:IsBarbarian() then return end
		
		for unit in pPlayer:Units() do
			if unit:IsHasPromotion(unitPromotionID) then
				num = num + 1
			end
		end

		return num

	end
end
--------------------------------------------------------------
-- 检查所有单位拥有某特殊晋升
--------------------------------------------------------------
function CheckUniquePromotions(pPlayer, unitPromotionID)
	local GreatCrossCheck = 0;
	local numUnit = pPlayer:GetUnitCountFromHasPromotion(unitPromotionID);
	if numUnit > 0 then GreatCrossCheck = 1 end;
	return GreatCrossCheck;
end
--------------------------------------------------------------
-- 遍历某单位(pUnit)附近单位，判断其是否拥有晋升A，若有则给与当前单位晋升B，没有则去掉当前单位晋升B
--------------------------------------------------------------
function plotDistancePromotion(pPlayer, pUnit, unitPromotionAID, unitPromotionBID, radius, pFlag)
	local Patronage = 0;
	if pFlag then 
		for sUnit in pPlayer:Units() do
			if sUnit:IsHasPromotion(unitPromotionAID) then
				if Map.PlotDistance(pUnit:GetX(), pUnit:GetY(), sUnit:GetX(), sUnit:GetY()) < radius + 1 then -- 人类2格
					Patronage = 1;
					break;
				end
			end
		end			
		if Patronage == 1 then
			if not pUnit:IsHasPromotion(unitPromotionBID) then
				pUnit:SetHasPromotion(unitPromotionBID, true)
			end
		else
			if pUnit:IsHasPromotion(unitPromotionBID) and not pUnit:IsHasPromotion(unitPromotionAID) then
				pUnit:SetHasPromotion(unitPromotionBID, false)
			end
		end		
	else
		if pUnit:IsHasPromotion(unitPromotionBID) and not pUnit:IsHasPromotion(unitPromotionAID) then
			pUnit:SetHasPromotion(unitPromotionBID, false)
		end
	end

end
--------------------------------------------------------------
-- 统计文明的城邦盟友及各城邦盟友的人口数量还有关系
--------------------------------------------------------------
function SPUE_MajorFavorite_MinorCivsAndCityPops(playerID)
	local g_MinorCivsAndPopWithMajor = {};

	local player = Players[playerID];

	if (not player:IsAlive()) then return end;
	if player:IsMinorCiv() or player:GetMinorAllyCount() < 1 then return false end
	local index = 1;
	if not (player:IsMinorCiv() or player:IsBarbarian()) then
		for iCS = GameDefines.MAX_MAJOR_CIVS, GameDefines.MAX_PLAYERS-2, 1 do
			if  Players[iCS]:IsAlive() and Players[iCS]:IsMinorCiv()
			and Players[iCS]:GetAlly() ~= -1 and Players[Players[iCS]:GetAlly()]:IsAlive()
			and Players[iCS]:GetAlly() == playerID
			then
				local CityPop = Players[iCS]:GetTotalPopulation();
				local iFriendShip = Players[iCS]:GetMinorCivFriendshipWithMajor(playerID);
				g_MinorCivsAndPopWithMajor[index] = {iCS, CityPop, iFriendShip};
				index = index + 1;
			end
		end
		if index == 1 then
			return false;
		end
	end

	return g_MinorCivsAndPopWithMajor;
end
--------------------------------------------------------------
-- 单位购买价钱
--------------------------------------------------------------
function SPUE_UnitPurchaseCost(player, iUnit)
	local goldCost
	if iUnit and iUnit ~= -1 then
		local punit = GameInfo.Units[ iUnit ]
		local productionCost = punit.Cost
		productionCost = player:GetUnitProductionNeeded( iUnit )
		for pCity in player:Cities() do
			if pCity then
				goldCost = pCity:GetUnitPurchaseCost( iUnit )	
			elseif (punit.HurryCostModifier or 0) > 0 then
				goldCost = (productionCost * GameDefines.GOLD_PURCHASE_GOLD_PER_PRODUCTION ) ^ GameDefines.HURRY_GOLD_PRODUCTION_EXPONENT
				goldCost = (punit.HurryCostModifier + 100) * goldCost / 100
				goldCost = goldCost - ( goldCost % GameDefines.GOLD_PURCHASE_VISIBLE_DIVISOR )
			end
		end
	end

	return goldCost;
end
--------------------------------------------------------------
-- 单位精英化按钮：显示函数
--------------------------------------------------------------
function EliteCondition(unit, unitPromotionID, ounitType, nunitType, unitClassType, projectType, Button)
	local player = Players[unit:GetOwner()]

	-- 单位购买价格
	local sUnitType = GetCivSpecificUnit(player, unitClassType)
	local iUnit = GameInfoTypes[sUnitType];
	local iCost = 1000;
	local goldCost = SPUE_UnitPurchaseCost(player, iUnit);
	local dboUnit = GameInfo.Units[ounitType];
	local dbnUnit = GameInfo.Units[nunitType];
	local projectFlag = false;

	local dbProject = GameInfo.Projects[projectType];
	-- if dbProject == nil then 
	-- 	return false 
	-- end;
	
	if goldCost then iCost = goldCost * 2 end;
	if ounitType == 'UNIT_SPUE_TABOR' then iCost = iCost * 0.2 end;

	if dbProject == nil then
		Button.ToolTip = Locale.ConvertTextKey("TXT_KEY_SPUE_VARANGIAN_GUARD_BUTTON_NONE", 
						 iCost, dboUnit.Description, dbnUnit.Description, dboUnit.Description);
	else
		Button.ToolTip = Locale.ConvertTextKey("TXT_KEY_SPUE_VARANGIAN_GUARD_BUTTON", 
						 iCost, dboUnit.Description, dbnUnit.Description, dboUnit.Description, dbProject.Description);
	end

		
	return unit:CanMove() and unit:IsHasPromotion(unitPromotionID) 
	and unit:GetUnitType() == GameInfoTypes[ounitType];
end

function EliteConditionAI(unit, unitPromotionID, ounitType, nunitType, unitClassType, projectType)
	local player = Players[unit:GetOwner()]

	-- 单位购买价格
	local sUnitType = GetCivSpecificUnit(player, unitClassType)
	local iUnit = GameInfoTypes[sUnitType];
	local iCost = 1000;
	local goldCost = SPUE_UnitPurchaseCost(player, iUnit);
	local dboUnit = GameInfo.Units[ounitType];
	local dbnUnit = GameInfo.Units[nunitType];
	local projectFlag = false;

	local dbProject = GameInfo.Projects[projectType];
	
	if goldCost then iCost = goldCost * 2 end;
	if ounitType == 'UNIT_SPUE_TABOR' then iCost = iCost * 0.2 end;
		
	return unit:CanMove() and unit:IsHasPromotion(unitPromotionID) 
	and unit:GetUnitType() == GameInfoTypes[ounitType];
end
--------------------------------------------------------------
-- 单位精英化按钮：条件函数
--------------------------------------------------------------
function EliteDisable(unit, unitPromotion2ID, unitClassType, projectType)
	local player = Players[unit:GetOwner()]

	local sUnitType = GetCivSpecificUnit(player, unitClassType)
	local iUnit = GameInfoTypes[sUnitType];
	local iCost = 1000;
	local goldCost = SPUE_UnitPurchaseCost(player, iUnit);
	 
	local projectFlag = false;
	if projectType == nil then projectFlag = true else projectFlag = player:HasProject(GameInfo.Projects[projectType].ID) end;
	-- local dbProject = GameInfo.Projects[projectType];
	local corpsFlag = TroopsLeftFlag(player, 1);

	if goldCost then iCost = goldCost * 2 end;
	-- 胡斯车垒转换价格便宜
	if ounitType == 'UNIT_SPUE_TABOR' then iCost = iCost * 0.2 end;
	-- return CountUnitsWithUniquePromotions(unit:GetOwner(), unitPromotion2ID) > 0 
	return player:GetUnitCountFromHasPromotion(unitPromotion2ID) > 0
	or player:GetGold() < iCost 
	or not projectFlag
	or corpsFlag == 0;

end
--------------------------------------------------------------
-- 单位精英化按钮：动作函数
-------------------------------------------------------------
function EliteAction(unit, nunitType, unitClassType)
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

	unit:Kill(true);
	local newUnit = nil;
	newUnit = player:InitUnit(GameInfoTypes[nunitType], plot:GetX(), plot:GetY());

	newUnit:SetLevel(unitLevel);
	newUnit:SetExperience(unitEXP);
	newUnit:SetPromotionReady(true);
	if #unitPromotions > 0 then
	  for _, unitPromotionID in ipairs(unitPromotions) do
		newUnit:SetHasPromotion(unitPromotionID, true);
	  end
	end
	if unitName then
	  newUnit:SetName(unitName);
	end

	-- 单位购买价格
	local sUnitType = GetCivSpecificUnit(player, unitClassType);
	local iUnit = GameInfoTypes[sUnitType];
	local goldCost = SPUE_UnitPurchaseCost(player, iUnit);
	local iCost = 1000;

	if goldCost then iCost = goldCost * 2 end;
	-- 胡斯车垒转换价格便宜
	if nunitType == 'UNIT_SPUE_TABOR_ELITE' then iCost = iCost * 0.2 end;


	Events.AudioPlay2DSound("AS2D_INTERFACE_BUY_TILE");	

	player:ChangeGold(-iCost)
	local hex = ToHexFromGrid(Vector2(plotX, plotY))
	Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("-{1_Num}[ICON_GOLD]", iCost))
	Events.GameplayFX(hex.x, hex.y, -1)

end
--------------------------------------------------------------
-- AI进行单位精英化
-------------------------------------------------------------
function EliteUnitTransferAI(unit, unitPromotionID, ounitType, nunitType, unitClassType, projectType, unitPromotion2ID)
	if EliteConditionAI(unit, unitPromotionID, ounitType, nunitType, unitClassType, projectType) 
	and not EliteDisable(unit, unitPromotion2ID, unitClassType, projectType)
	then
		EliteAction(unit, nunitType, unitClassType);
	end
end
--------------------------------------------------------------
-- 为陆军单位寻找合适的海岸生成地块
-------------------------------------------------------------
function FindCoastalPlotForLandUnits(unit) 
	local player = Players[unit:GetOwner()];
	local pPlot = nil;
	local plotFlag = false;
	for i = 0, 5 do
		local adjPlot = Map.PlotDirection(unit:GetX(), unit:GetY(), i)
		if (adjPlot ~= nil) and adjPlot:IsCoastalLand() then
			local unitCount = adjPlot:GetNumUnits();
			if unitCount == 0 then
				pPlot = adjPlot;
				break;
			else
				local pFoundUnit = adjPlot:GetUnit(0);
				if pFoundUnit ~= nil then
					local pFlayer = Players[pFoundUnit:GetOwner()];
					if player == pFlayer then
						if unitCount < 2 then
							pPlot = adjPlot;
							break;
						end
					end
				end
			end
			plotFlag = true;
		end
		
	end  		
	return plotFlag, pPlot;
end
--------------------------------------------------------------
-- 为海军单位寻找合适的临近陆地的海洋生成地块
-------------------------------------------------------------
function FindOceanPlotForSeaUnits(unit) 
	local player = Players[unit:GetOwner()];
	local pPlot = nil;
	local plotFlag = false;
	for i = 0, 5 do
		local adjPlot = Map.PlotDirection(unit:GetX(), unit:GetY(), i)
		if (adjPlot ~= nil) and adjPlot:IsWater() and not adjPlot:IsLake()then
			local unitCount = adjPlot:GetNumUnits();
			if unitCount == 0 then
				pPlot = adjPlot;
				break;
			else
				local pFoundUnit = adjPlot:GetUnit(0);
				if pFoundUnit ~= nil then
					local pFlayer = Players[pFoundUnit:GetOwner()];
					if player == pFlayer then
						if unitCount < 2 then
							pPlot = adjPlot;
							break;
						end
					end
				end
			end
			plotFlag = true;
		end
	end  		
	return plotFlag, pPlot;
end
--------------------------------------------------------------
-- 遍历周围拥有某晋升的单位的最大加成战斗力
--------------------------------------------------------------
function plotDistanceGetMaxCombatStrength(unit, unitPromotionID, radius)
	local attMaxCombatStrength = 0;
	local defMaxCombatStrength = 0;
	local plot = unit:GetPlot();

	if plot ~= nil then
		local uniqueRange = radius;
		local unitCount = 0;
		
		unitCount = plot:GetNumUnits();
		if unitCount > 0 then
			for i = 0, unitCount-1, 1 do
				local pFoundUnit = plot:GetUnit(i);
				if pFoundUnit ~= nil 
				and pFoundUnit:GetID() ~= unit:GetID() 
				and pFoundUnit:IsHasPromotion(unitPromotionID)
				and pFoundUnit:GetBaseCombatStrength() > 0 then
					-- 对本单位发起进攻时的最大战力
					attMaxCombatStrength = math.max(attMaxCombatStrength, pFoundUnit:GetMaxAttackStrength(plot, plot, unit) / 100);
					-- 对本单位发起防御时的最大战力
					defMaxCombatStrength = math.max(defMaxCombatStrength, pFoundUnit:GetMaxDefenseStrength(plot, unit) / 100);
				end
			end
			unitCount = 0;
		end

		for dx = -uniqueRange, uniqueRange, 1 do
			for dy = -uniqueRange, uniqueRange, 1 do
				local adjPlot = Map.PlotXYWithRangeCheck(plot:GetX(), plot:GetY(), dx, dy, uniqueRange);
				if (adjPlot ~= nil) and adjPlot ~= plot then
					unitCount = adjPlot:GetNumUnits();
					if unitCount > 0 then
						for i = 0, unitCount-1, 1 do
							local pFoundUnit = adjPlot:GetUnit(i);
							if pFoundUnit ~= nil 
							and pFoundUnit:GetID() ~= unit:GetID() 
							and pFoundUnit:IsHasPromotion(unitPromotionID)
							and pFoundUnit:GetBaseCombatStrength() > 0 then
								-- 对本单位发起进攻时的最大战力
								attMaxCombatStrength = math.max(attMaxCombatStrength, pFoundUnit:GetMaxAttackStrength(adjPlot, plot, unit) / 100);
								-- 对本单位发起防御时的最大战力
								defMaxCombatStrength = math.max(defMaxCombatStrength, pFoundUnit:GetMaxDefenseStrength(plot, unit) / 100);			
							end
						end
					end
				end
			end
		end
	
	end
	return math.max(attMaxCombatStrength, defMaxCombatStrength);

end