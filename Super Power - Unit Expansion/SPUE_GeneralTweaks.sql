--==========================================================================================================================
-- USER SETTINGS
--==========================================================================================================================
-- RER_GlobalUserSettings
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
SPUE_GlobalUserSettings (
	Type 											text 										default null,
	Value 											integer 									default 1);
--==========================================================================================================================	
-- USER SETTINGS
--==========================================================================================================================	
-- Modular Features that can be toggled on and off and then back on.
--------------------------------------------------------------------------
/*
	1 = Enabled (Default)
	0 = Disabled
*/
--------------------------------------------------------------------------
INSERT INTO SPUE_GlobalUserSettings
		(Type,														Value)
VALUES	('SPUE_CITY_WITH_BUILDINGS',									0); -- 殖民地模板等，默认关闭
--==========================================================================================================================	
-- USER SETTINGS - VMC
--==========================================================================================================================	
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_UNIT_UPGRADES';				-- 开启单位升级事件
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_UNIT_RANGEATTACK';			-- 开启单位远程攻击事件
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_UNIT_CREATED';				-- 开启单位产生事件
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_BATTLES_CUSTOM_DAMAGE';		-- 开启单位减伤事件

-- UPDATE CustomModOptions SET Value = 1 WHERE Name = 'GLOBAL_BREAK_CIVILIAN_1UPT';			-- No More Civilian Traffic Jams
-- UPDATE CustomModOptions SET Value = 1 WHERE Name = 'GLOBAL_BREAK_CIVILIAN_RESTRICTIONS';	-- No More Civilian Traffic Jams
--==========================================================================================================================	
-- 远程攻击劫掠 - VMC
--==========================================================================================================================	
ALTER TABLE Units ADD RangedPillage INTEGER DEFAULT 0;
-- 南洋海盗船
UPDATE Units SET RangedPillage = 1 WHERE Class IN ('UNITCLASS_SPUE_SSPRIVATEER');
--==========================================================================================================================	
-- 7.0兼容
--==========================================================================================================================	
CREATE TABLE IF NOT EXISTS 
UnitPromotions_PromotionModifiers (
		`PromotionType` text not null,
		`OtherPromotionType` text not null,
		`Modifier` integer default 0 not null,
		`Attack` integer default 0 not null,
		`Defense` integer default 0 not null
);
