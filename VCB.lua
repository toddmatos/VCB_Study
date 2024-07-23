-- Title: Vanilla Consolidate Buffs (VCB)
-- Author: Shino <Synced> - Kronos

-- Global variables
VCB_NAME = "Vanilla Consolidate Buffs"
VCB_VERSION = "4.0"
VCB_IS_LOADED = false
VCB_BF_DUMMY_MODE = false
VCB_FONT_ARRAY = {}
VCB_FONT_ARRAY[1] = "Fonts\\FRIZQT__.ttf"
VCB_FONT_ARRAY[2] = "Fonts\\ARIALN.ttf"
VCB_FONT_ARRAY[3] = "Fonts\\skurri.ttf"
VCB_FONT_ARRAY[4] = "Fonts\\MORPHEUS.ttf"
VCB_FONT_ARRAY[5] = "Interface\\AddOns\\VCB\\Fonts\\DUF_Font1.ttf"
VCB_FONT_ARRAY[6] = "Interface\\AddOns\\VCB\\Fonts\\DUF_Font2.ttf"
VCB_FONT_ARRAY[7] = "Interface\\AddOns\\VCB\\Fonts\\DUF_Font3.ttf"
VCB_FONT_ARRAY[8] = "Interface\\AddOns\\VCB\\Fonts\\DUF_Font4.ttf"
VCB_FONT_ARRAY[9] = "Interface\\AddOns\\VCB\\Fonts\\DUF_Font5.ttf"
VCB_FONT_ARRAY[10] = "Interface\\AddOns\\VCB\\Fonts\\FUTURABC.TTF"
VCB_FONT_ARRAY[11] = "Interface\\AddOns\\VCB\\Fonts\\FUTUXKCI.TTF"
VCB_FONT_ARRAY[12] = "Interface\\AddOns\\VCB\\Fonts\\IX_Font_Bold.ttf"
VCB_FONT_ARRAY[13] = "Interface\\AddOns\\VCB\\Fonts\\IX_Font_Bold_Italic.ttf"
VCB_FONT_ARRAY[14] = "Interface\\AddOns\\VCB\\Fonts\\Montreal_Bold.ttf"
VCB_FONT_ARRAY[15] = "Interface\\AddOns\\VCB\\Fonts\\Montreal_Heavy_Bold.ttf"
VCB_ANCHOR_ARRAY = {}
VCB_ANCHOR_ARRAY[1] = "Bottom"
VCB_ANCHOR_ARRAY[2] = "Right"
VCB_ANCHOR_ARRAY[3] = "Top"
VCB_ANCHOR_ARRAY[4] = "Left"
VCB_BF_COLOR_OBJ = nil
VCB_BF_COLOR_VAR = nil
VCB_BF_COLOR_TAR = nil
VCB_BF_COLOR_TYPE = nil
VCB_ICON_ARRAY = {}
VCB_ICON_ARRAY[1] = "icon"
VCB_BORDER_ARRAY = {}
VCB_BORDER_ARRAY[1] = "Interface\\Tooltips\\UI-Tooltip-Border.tga"
VCB_BORDER_ARRAY[2] = "Interface\\DialogFrame\\UI-DialogBox-Border.tga"
VCB_AURABORDER_ARRAY = {}
VCB_AURABORDER_ARRAY[1] = "Interface\\Buttons\\UI-Debuff-Overlays.tga"
VCB_WEAPONBORDER_ARRAY = {}
VCB_WEAPONBORDER_ARRAY[1] = "Interface\\Buttons\\UI-TempEnchant-Border.tga"
VCB_BACKGROUND_ARRAY = {}
VCB_BACKGROUND_ARRAY[1] = "Interface\\Tooltips\\UI-Tooltip-Background.tga"
VCB_BACKGROUND_ARRAY[2] = "Interface\\DialogFrame\\UI-DialogBox-Background.tga"
VCB_BACKGROUND_ARRAY[3] = "Interface\\CHARACTERFRAME\\UI-Party-Background.tga"

function VCB_OnLoad()
	this:RegisterEvent("VARIABLES_LOADED")
	this:RegisterEvent("PARTY_MEMBERS_CHANGED")
	this:RegisterEvent("RAID_ROSTER_UPDATE")
	this:RegisterEvent("PLAYER_ENTERING_WORLD")

	SLASH_VCB1 = "/VanillaConsolidateBuffs"
	SLASH_VCB2 = "/vanillaconsolidatebuffs"
	SLASH_VCB3 = "/VCB"
	SLASH_VCB4 = "/vcb"
	SlashCmdList["VCB"] = function(msg)
		VCB_SlashCommandHandler(msg)
	end
end

function VCB_OnEvent(event)
  local unitClass = UnitClass("player")
	if event == "VARIABLES_LOADED" and VCB_IS_LOADED == false then
		if VCB_SAVE == nil then
			VCB_SAVE = {}
			VCB_SAVE = {
				Timer_yoffset = 0,
				Timer_disableUnit = false,
				Timer_hours = false,
				Timer_hours_convert = false,
				Timer_minutes = true,
				Timer_minutes_convert = false,
				Timer_tenth = false,
				Timer_round = false,
				Timer_font = "Fonts\\FRIZQT__.ttf",
				Timer_flash = false,
				Timer_below_60 = false,
				Timer_below_60_color_g = 0.82,
				Timer_below_60_color_b = 0,
				Timer_usecfont = false,
				Timer_customfont = "",
				CF_icon_color_r = 1,
				CF_icon_color_g = 1,
				CF_icon_color_b = 1,
				CF_icon_fontsize = 13,
				CF_icon_font = "Fonts\\FRIZQT__.ttf",
				CF_icon_opacity = 1,
				CF_icon_fontopacity = 1,
				CF_icon_texture = "icon",
				CF_icon_border = true,
				CF_icon_possiblebuffs = false,
				CF_icon_showpbgrayedout = false,
				CF_icon_attach = false,
				CF_icon_usecfont = false,
				CF_icon_customfont = "",
				CF_BF_anchor = 1,
				CF_BF_scale = 1,
				CF_BF_invert = false,
				CF_BF_numperrow = 5,
				CF_BF_bgopacity = 1,
				CF_BF_bgcolor_r = 0,
				CF_BF_bgcolor_g = 0,
				CF_BF_bgcolor_b = 0,
				CF_BF_borderopacity = 1,
				CF_BF_bordercolor_r = 1,
				CF_BF_bordercolor_g = 1,
				CF_BF_bordercolor_b = 1,
				CF_BF_border = 1,
				CF_BF_customborder = false,
				CF_BF_customborderpath = "",
				CF_BF_background = 1,
				CF_BF_custombackground = false,
				CF_BF_custombackgroundpath = "",
				CF_BF_invertorientation = false,
				CF_AURA_bgopacity = 1,
				CF_AURA_enableborder = false,
				CF_AURA_borderopacity = 1,
				CF_AURA_bordercolor_r = 1,
				CF_AURA_bordercolor_g = 1,
				CF_AURA_bordercolor_b = 1,
				CF_AURA_padding_h = 2,
				CF_AURA_padding_v = 2,
				CF_AURA_border = 1,
				CF_AURA_customborder = false,
				CF_AURA_customborderpath = "",
				CF_AURA_bgcolor_r = 1,
				CF_AURA_bgcolor_g = 1,
				CF_AURA_bgcolor_b = 1,
				CF_AURA_enablebgcolor = false,
				CF_AURA_enablefontborder = true,
				CF_AURA_fontcolor_r = 1,
				CF_AURA_fontcolor_g = 1,
				CF_AURA_fontcolor_b = 1,
				CF_AURA_font = "Fonts\\FRIZQT__.ttf",
				CF_AURA_fontopacity = 1,
				CF_AURA_fontsize = 13,
				CF_AURA_fontoffset_x = -5,
				CF_AURA_fontoffset_y = 5,
				CF_TIMER_border = true,
				CF_TIMER_fontcolor_r = 1,
				CF_TIMER_fontcolor_g = 0.82,
				CF_TIMER_fontcolor_b = 0,
				CF_TIMER_fontsize = 10,
				CF_TIMER_fontopacity = 1,
				BF_GENERAL_verticalmode = false,
				BF_GENERAL_numperrow = 5,
				BF_GENERAL_padding_h = 2,
				BF_GENERAL_padding_v = 2,
				BF_GENERAL_scale = 0.8,
				BF_GENERAL_bgopacity = 1,
				BF_GENERAL_enablebgcolor = false,
				BF_GENERAL_bgcolor_r = 1,
				BF_GENERAL_bgcolor_g = 1,
				BF_GENERAL_bgcolor_b = 1,
				BF_GENERAL_enableborder = true,
				BF_GENERAL_fontcolor_r = 1,
				BF_GENERAL_fontcolor_g = 1,
				BF_GENERAL_fontcolor_b = 1,
				BF_GENERAL_font = "Fonts\\FRIZQT__.ttf",
				BF_GENERAL_fontopacity = 1,
				BF_GENERAL_fontsize = 12,
				BF_GENERAL_fontoffset_x = -5,
				BF_GENERAL_fontoffset_y = 5,
				BF_GENERAL_invert = false,
				BF_GENERAL_invertorientation = false,
				BF_GENERAL_usecfont = false,
				BF_GENERAL_customfont = "",
				BF_BORDER_enableborder = false,
				BF_BORDER_bordercolor_r = 1,
				BF_BORDER_bordercolor_g = 1,
				BF_BORDER_bordercolor_b = 1,
				BF_BORDER_borderopacity = 1,
				BF_BORDER_border = 1,
				BF_BORDER_usecustomborder = false,
				BF_BORDER_customborderpath = "",
				BF_TIMER_border = false,
				BF_TIMER_fontcolor_r = 1,
				BF_TIMER_fontcolor_g = 0.82,
				BF_TIMER_fontcolor_b = 0,
				BF_TIMER_fontopacity = 1,
				BF_TIMER_fontsize = 10,
				DBF_GENERAL_verticalmode = false,
				DBF_GENERAL_numperrow = 8,
				DBF_GENERAL_padding_h = 2,
				DBF_GENERAL_padding_v = 2,
				DBF_GENERAL_bgopacity = 1,
				DBF_GENERAL_scale = 0.8,
				DBF_GENERAL_enablebgcolor = false,
				DBF_GENERAL_bgcolor_r = 1,
				DBF_GENERAL_bgcolor_g = 1,
				DBF_GENERAL_bgcolor_b = 1,
				DBF_GENERAL_enableborder = true,
				DBF_GENERAL_fontcolor_r = 1,
				DBF_GENERAL_fontcolor_g = 1,
				DBF_GENERAL_fontcolor_b = 1,
				DBF_GENERAL_font = "Fonts\\FRIZQT__.ttf",
				DBF_GENERAL_fontopacity = 1,
				DBF_GENERAL_fontsize = 12,
				DBF_GENERAL_fontoffset_x = -5,
				DBF_GENERAL_fontoffset_y = 5,
				DBF_GENERAL_invert = true,
				DBF_GENERAL_invertorientation = false,
				DBF_GENERAL_usecfont = false,
				DBF_GENERAL_customfont = "",
				DBF_BORDER_enableborder = false,
				DBF_BORDER_usecustomborder = false,
				DBF_BORDER_customborderpath = "",
				DBF_BORDER_border = 1,
				DBF_BORDER_borderopacity = 1,
				DBF_BORDER_nonecolor_r = 0.8,
				DBF_BORDER_nonecolor_g = 0,
				DBF_BORDER_nonecolor_b = 0,
				DBF_BORDER_poisoncolor_r = 0,
				DBF_BORDER_poisoncolor_g = 0.6,
				DBF_BORDER_poisoncolor_b = 0,
				DBF_BORDER_magiccolor_r = 0.2,
				DBF_BORDER_magiccolor_g = 0.6,
				DBF_BORDER_magiccolor_b = 1,
				DBF_BORDER_cursecolor_r = 0.6,
				DBF_BORDER_cursecolor_g = 0,
				DBF_BORDER_cursecolor_b = 1,
				DBF_BORDER_diseasecolor_r = 0.6,
				DBF_BORDER_diseasecolor_g = 0.4,
				DBF_BORDER_diseasecolor_b = 0,
				DBF_TIMER_enableborder = true,
				DBF_TIMER_fontcolor_r = 1,
				DBF_TIMER_fontcolor_g = 0.82,
				DBF_TIMER_fontcolor_b = 0,
				DBF_TIMER_fontsize = 10,
				DBF_TIMER_fontopacity = 1,
				WP_GENERAL_invert = false,
				WP_GENERAL_verticalmode = false,
				WP_GENERAL_enablebgcolor = false,
				WP_GENERAL_enableborder = true,
				WP_GENERAL_bgcolor_r = 1,
				WP_GENERAL_bgcolor_g = 1,
				WP_GENERAL_bgcolor_b = 1,
				WP_GENERAL_attach = false,
				WP_GENERAL_padding_h = 2,
				WP_GENERAL_padding_v = 2,
				WP_GENERAL_fontsize = 13,
				WP_GENERAL_fontopacity = 1,
				WP_GENERAL_fontcolor_r = 1,
				WP_GENERAL_fontcolor_g = 1,
				WP_GENERAL_fontcolor_b = 1,
				WP_GENERAL_bgopacity = 1,
				WP_GENERAL_scale = 1,
				WP_GENERAL_font = "Fonts\\FRIZQT__.ttf",
				WP_GENERAL_offset_x = -2,
				WP_GENERAL_offset_y = 2,
				WP_GENERAL_usecfont = false,
				WP_GENERAL_customfont = "",
				WP_BORDER_enableborder = true,
				WP_BORDER_usecustomborder = false,
				WP_BORDER_bordercolor_r = 0.2,
				WP_BORDER_bordercolor_g = 0.2,
				WP_BORDER_bordercolor_b = 0.8,
				WP_BORDER_borderopacity = 1,
				WP_BORDER_border = 1,
				WP_BORDER_customborderpath = "",
				WP_TIMER_enableborder = true,
				WP_TIMER_fontcolor_r = 1,
				WP_TIMER_fontcolor_g = 0.82,
				WP_TIMER_fontcolor_b = 0,
				WP_TIMER_fontopacity = 1,
				WP_TIMER_fontsize = 10,
				MISC_disable_CF = true,
				MISC_disable_BB = true,
				BF_POS = {
					--[1] = "CENTER",
          [1] = "TOPRIGHT",
					[2] = -5,
					[3] = 0,
          [4] = "BOTTOMRIGHT",
          [5] = -10,
				},
				DBF_POS = {
					--[1] = "CENTER",
          [1] = "BOTTOMRIGHT",
					[2] = -5,
					[3] = 60,
          [4] = "TOPRIGHT",
				},
			}
		end

		if VCB_BF_LOCKED == nil then
			VCB_BF_LOCKED = false
		end

    if Consolidated_Buffs == nil then 
      Consolidated_Buffs = {} 
    end


		if Banned_Buffs == nil then
			Banned_Buffs = {}
		end

		if VCB_Profile == nil then
			VCB_Profile = {}
		end

		if VCB_Profile_Name == nil then
			VCB_Profile_Name = {}
		end

		if VCB_CUR_PROFILE == nil then
			VCB_CUR_PROFILE = VCB_CUR_PROFILE_TEXT
		end

		if VCB_WP_POSX == nil then
			VCB_WP_POSX = 0
		end

		if VCB_WP_POSY == nil then
			VCB_WP_POSY = 0
		end

		if VCB_WP_POINT == nil then
			VCB_WP_POINT = "CENTER"
		end

		if VCB_ICON_POSX == nil then
			VCB_ICON_POSX = 0
		end

		if VCB_ICON_POSY == nil then
			VCB_ICON_POSY = 0
		end

		if VCB_ICON_POINT == nil then
			VCB_ICON_POINT = "CENTER"
		end

		if not VCB_SAVE["Timer_yoffset"] then
			VCB_SAVE["Timer_yoffset"] = 0
		end
		
		-- To catch a crash due to the font update
		if strsub(VCB_SAVE["Timer_font"], 1, 5) ~= "Fonts" then
			VCB_SAVE["Timer_font"] = "Fonts\\FRIZQT__.ttf"
			VCB_SAVE["CF_icon_font"] = "Fonts\\FRIZQT__.ttf"
			VCB_SAVE["CF_AURA_font"] = "Fonts\\FRIZQT__.ttf"
			VCB_SAVE["BF_GENERAL_font"] = "Fonts\\FRIZQT__.ttf"
			VCB_SAVE["DBF_GENERAL_font"] = "Fonts\\FRIZQT__.ttf"
			VCB_SAVE["WP_GENERAL_font"] = "Fonts\\FRIZQT__.ttf"
		end
		
		VCB_INITIALIZE()
		VCB_BF_Lock(VCB_BF_LOCKED)
		
		VCB_BF_WEAPON_BUTTON_OnEvent(false)

		if (VCB_SAVE["BF_POS"] and VCB_SAVE["BF_POS"][1]) then
			VCB_BF_BUFF_FRAME:ClearAllPoints()
      VCB_BF_BUFF_FRAME:SetPoint(VCB_SAVE["BF_POS"][1], PlayerFrame, VCB_SAVE["BF_POS"][4], VCB_SAVE["BF_POS"][2], VCB_SAVE["BF_POS"][3])
		end

		if (VCB_SAVE["DBF_POS"] and VCB_SAVE["DBF_POS"][1]) then
			VCB_BF_DEBUFF_FRAME:ClearAllPoints()
			--VCB_BF_DEBUFF_FRAME:SetPoint(VCB_SAVE["DBF_POS"][1], UIParent, VCB_SAVE["DBF_POS"][1], VCB_SAVE["DBF_POS"][2], VCB_SAVE["DBF_POS"][3])
      VCB_BF_DEBUFF_FRAME:SetPoint(VCB_SAVE["DBF_POS"][1], PlayerFrame, VCB_SAVE["DBF_POS"][4], VCB_SAVE["DBF_POS"][2], VCB_SAVE["DBF_POS"][3])
		end
		VCB_IS_LOADED = true
	elseif (event == "PARTY_MEMBERS_CHANGED" or event == "RAID_ROSTER_UPDATE") then
		if VCB_SAVE["CF_icon_possiblebuffs"] then
			VCB_BF_RepositioningAndResizing()
		end
	elseif (event == "PLAYER_ENTERING_WORLD") and VCB_IS_LOADED then
		VCB_BF_WEAPON_BUTTON_OnEvent(false)
		if (VCB_SAVE["BF_POS"] and VCB_SAVE["BF_POS"][1]) then
			VCB_BF_BUFF_FRAME:ClearAllPoints()
      VCB_BF_BUFF_FRAME:SetPoint(VCB_SAVE["BF_POS"][1], PlayerFrame, VCB_SAVE["BF_POS"][4], VCB_SAVE["BF_POS"][2], VCB_SAVE["BF_POS"][3])
		end
		if (VCB_SAVE["DBF_POS"] and VCB_SAVE["DBF_POS"][1]) then
			VCB_BF_DEBUFF_FRAME:ClearAllPoints()
			--VCB_BF_DEBUFF_FRAME:SetPoint(VCB_SAVE["DBF_POS"][1], UIParent, VCB_SAVE["DBF_POS"][1], VCB_SAVE["DBF_POS"][2], VCB_SAVE["DBF_POS"][3])
      VCB_BF_DEBUFF_FRAME:SetPoint(VCB_SAVE["DBF_POS"][1], PlayerFrame, VCB_SAVE["DBF_POS"][4], VCB_SAVE["DBF_POS"][2], VCB_SAVE["DBF_POS"][3])
		end
	end	
end

function VCB_SAVEFRAMEPOS()
	local point, _, relativePoint, xOfs, yOfs = VCB_BF_BUFF_FRAME:GetPoint()
	VCB_SAVE["BF_POS"] = {}
	VCB_SAVE["BF_POS"][1] = point;
	VCB_SAVE["BF_POS"][2] = xOfs;
	VCB_SAVE["BF_POS"][3] = yOfs;
  VCB_SAVE["BF_POS"][4] = relativePoint;
	point, _, relativePoint, xOfs, yOfs = VCB_BF_DEBUFF_FRAME:GetPoint()

	VCB_SAVE["DBF_POS"] = {}
	VCB_SAVE["DBF_POS"][1] = point;
	VCB_SAVE["DBF_POS"][2] = xOfs;
	VCB_SAVE["DBF_POS"][3] = yOfs;
  VCB_SAVE["DBF_POS"][4] = relativePoint;

  --[[240630 quoted]]--

	if not VCB_SAVE["WP_GENERAL_attach"] then
		point, _, relativePoint, xOfs, yOfs = VCB_BF_WEAPON_FRAME:GetPoint()
		VCB_WP_POINT = point
		VCB_WP_POSX = xOfs
		VCB_WP_POSY = yOfs
	end
end

function VCB_INITIALIZE()
  for i=0,15 do
		getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Duration"):ClearAllPoints()
		getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Duration"):SetPoint("TOPLEFT", getglobal("VCB_BF_DEBUFF_BUTTON"..i), "BOTTOMLEFT", -20, VCB_SAVE["Timer_yoffset"])
		getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Duration"):SetPoint("TOPRIGHT", getglobal("VCB_BF_DEBUFF_BUTTON"..i), "BOTTOMRIGHT", 20, VCB_SAVE["Timer_yoffset"])
	
		if VCB_SAVE["DBF_GENERAL_invertorientation"] then
			if VCB_SAVE["DBF_GENERAL_invert"] then
				local j = 15-i
				getglobal("VCB_BF_DEBUFF_BUTTON"..j):ClearAllPoints()
				if VCB_SAVE["DBF_GENERAL_verticalmode"] then
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):SetPoint("TOPLEFT", (32+VCB_SAVE["DBF_GENERAL_padding_h"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(44+VCB_SAVE["DBF_GENERAL_padding_v"]))
				else
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):SetPoint("TOPLEFT", (32+VCB_SAVE["DBF_GENERAL_padding_h"])*i - floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(32+VCB_SAVE["DBF_GENERAL_padding_h"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]))
				end
			else
				getglobal("VCB_BF_DEBUFF_BUTTON"..i):ClearAllPoints()
				if VCB_SAVE["DBF_GENERAL_verticalmode"] then
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):SetPoint("TOPLEFT", (32+VCB_SAVE["DBF_GENERAL_padding_h"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(44+VCB_SAVE["DBF_GENERAL_padding_v"]))
				else
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):SetPoint("TOPLEFT", (32+VCB_SAVE["DBF_GENERAL_padding_h"])*i - floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(32+VCB_SAVE["DBF_GENERAL_padding_h"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]))
				end
			end
		else
			if VCB_SAVE["DBF_GENERAL_invert"] then
				local j = 15-i
				getglobal("VCB_BF_DEBUFF_BUTTON"..j):ClearAllPoints()
				if VCB_SAVE["DBF_GENERAL_verticalmode"] then
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):SetPoint("TOPRIGHT", -(32+VCB_SAVE["DBF_GENERAL_padding_h"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(44+VCB_SAVE["DBF_GENERAL_padding_v"]))
				else
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):SetPoint("TOPRIGHT", -(32+VCB_SAVE["DBF_GENERAL_padding_h"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(32+VCB_SAVE["DBF_GENERAL_padding_h"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]))
				end
			else
				getglobal("VCB_BF_DEBUFF_BUTTON"..i):ClearAllPoints()
				if VCB_SAVE["DBF_GENERAL_verticalmode"] then
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):SetPoint("TOPRIGHT", -(32+VCB_SAVE["DBF_GENERAL_padding_h"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(44+VCB_SAVE["DBF_GENERAL_padding_v"]))
				else
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):SetPoint("TOPRIGHT", -(32+VCB_SAVE["DBF_GENERAL_padding_h"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(32+VCB_SAVE["DBF_GENERAL_padding_h"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]))
				end
			end
		end

		if VCB_SAVE["DBF_GENERAL_enablebgcolor"] then
			getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Icon"):SetVertexColor(VCB_SAVE["DBF_GENERAL_bgcolor_r"],VCB_SAVE["DBF_GENERAL_bgcolor_g"],VCB_SAVE["DBF_GENERAL_bgcolor_b"],VCB_SAVE["DBF_GENERAL_bgopacity"])
		else
			getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Icon"):SetVertexColor(1,1,1,VCB_SAVE["DBF_GENERAL_bgopacity"])
		end

		getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Border"):SetTexture(nil)
		if VCB_SAVE["DBF_BORDER_enableborder"] then
			if VCB_SAVE["DBF_BORDER_usecustomborder"] then
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Border"):SetTexture(VCB_SAVE["DBF_BORDER_customborderpath"])
			else
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Border"):SetTexture(VCB_AURABORDER_ARRAY[VCB_SAVE["DBF_BORDER_border"]])
			end
		end

		getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Border"):SetAlpha(VCB_SAVE["DBF_BORDER_borderopacity"]) -- Need colors
    --[[240708 quoted out and update
    ]]--
    getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Duration"):SetFont(VCB_SAVE["Timer_font"], VCB_SAVE["DBF_TIMER_fontsize"])

    --[[240708 quoted out and update
    ]]--
    getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["DBF_GENERAL_font"], VCB_SAVE["DBF_GENERAL_fontsize"])

		getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Count"):SetVertexColor(VCB_SAVE["DBF_GENERAL_fontcolor_r"],VCB_SAVE["DBF_GENERAL_fontcolor_g"],VCB_SAVE["DBF_GENERAL_fontcolor_b"],VCB_SAVE["DBF_GENERAL_fontopacity"])
		getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Count"):ClearAllPoints()
		getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Count"):SetPoint("BOTTOMRIGHT", VCB_SAVE["DBF_GENERAL_fontoffset_x"], VCB_SAVE["DBF_GENERAL_fontoffset_y"])
		getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Duration"):SetTextColor(VCB_SAVE["DBF_TIMER_fontcolor_r"],VCB_SAVE["DBF_TIMER_fontcolor_g"],VCB_SAVE["DBF_TIMER_fontcolor_b"],VCB_SAVE["DBF_TIMER_fontopacity"])
	end

	for i=0,1 do
		getglobal("VCB_BF_WEAPON_BUTTON"..i.."Duration"):ClearAllPoints()
		getglobal("VCB_BF_WEAPON_BUTTON"..i.."Duration"):SetPoint("TOPLEFT", getglobal("VCB_BF_WEAPON_BUTTON"..i), "BOTTOMLEFT", -20, VCB_SAVE["Timer_yoffset"])
		getglobal("VCB_BF_WEAPON_BUTTON"..i.."Duration"):SetPoint("TOPRIGHT", getglobal("VCB_BF_WEAPON_BUTTON"..i), "BOTTOMRIGHT", 20, VCB_SAVE["Timer_yoffset"])
		
		getglobal("VCB_BF_WEAPON_BUTTON"..i):ClearAllPoints()
		if VCB_SAVE["WP_GENERAL_verticalmode"] then
			getglobal("VCB_BF_WEAPON_BUTTON"..i):SetPoint("TOPRIGHT", VCB_BF_WEAPON_FRAME, "TOPRIGHT", 0, -(44+VCB_SAVE["WP_GENERAL_padding_v"])*i)
		else
			getglobal("VCB_BF_WEAPON_BUTTON"..i):SetPoint("TOPRIGHT", VCB_BF_WEAPON_FRAME, "TOPRIGHT", -(32+VCB_SAVE["WP_GENERAL_padding_h"])*i, 0)
		end
		if VCB_SAVE["WP_GENERAL_enablebgcolor"] then
			getglobal("VCB_BF_WEAPON_BUTTON"..i.."Icon"):SetVertexColor(VCB_SAVE["WP_GENERAL_bgcolor_r"],VCB_SAVE["WP_GENERAL_bgcolor_g"],VCB_SAVE["WP_GENERAL_bgcolor_b"],VCB_SAVE["WP_GENERAL_bgopacity"])
		else
			getglobal("VCB_BF_WEAPON_BUTTON"..i.."Icon"):SetVertexColor(1,1,1,VCB_SAVE["WP_GENERAL_bgopacity"])
		end
		getglobal("VCB_BF_WEAPON_BUTTON"..i.."Border"):SetTexture(nil)
		if VCB_SAVE["WP_BORDER_enableborder"] then
			if VCB_SAVE["WP_BORDER_usecustomborder"] then
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Border"):SetTexture(VCB_SAVE["WP_BORDER_customborderpath"])
			else
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Border"):SetTexture(VCB_WEAPONBORDER_ARRAY[VCB_SAVE["WP_BORDER_border"]]) -- why does the debuff border not work :/
			end
			getglobal("VCB_BF_WEAPON_BUTTON"..i.."Border"):SetVertexColor(VCB_SAVE["WP_BORDER_bordercolor_r"],VCB_SAVE["WP_BORDER_bordercolor_g"],VCB_SAVE["WP_BORDER_bordercolor_b"],VCB_SAVE["WP_BORDER_borderopacity"])
		end
		if VCB_SAVE["Timer_usecfont"] then
			if VCB_SAVE["WP_TIMER_enableborder"] then
				--getglobal("VCB_BF_WEAPON_BUTTON"..i.."Duration"):SetFont(VCB_SAVE["Timer_customfont"], VCB_SAVE["WP_TIMER_fontsize"], "OUTLINE")
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Duration"):SetFont(VCB_SAVE["Timer_customfont"], VCB_SAVE["WP_TIMER_fontsize"], "NONE")
			else
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Duration"):SetFont(VCB_SAVE["Timer_customfont"], VCB_SAVE["WP_TIMER_fontsize"])
			end
		else
			if VCB_SAVE["WP_TIMER_enableborder"] then
				--getglobal("VCB_BF_WEAPON_BUTTON"..i.."Duration"):SetFont(VCB_SAVE["Timer_font"], VCB_SAVE["WP_TIMER_fontsize"], "OUTLINE")
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Duration"):SetFont(VCB_SAVE["Timer_font"], VCB_SAVE["WP_TIMER_fontsize"], "NONE")
			else
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Duration"):SetFont(VCB_SAVE["Timer_font"], VCB_SAVE["WP_TIMER_fontsize"])
			end
		end
		if VCB_SAVE["WP_GENERAL_usecfont"] then
			if VCB_SAVE["WP_GENERAL_enableborder"] then
				--getglobal("VCB_BF_WEAPON_BUTTON"..i.."Count"):SetFont(VCB_SAVE["WP_GENERAL_customfont"], VCB_SAVE["WP_GENERAL_fontsize"], "OUTLINE")
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Count"):SetFont(VCB_SAVE["WP_GENERAL_customfont"], VCB_SAVE["WP_GENERAL_fontsize"], "NONE")
			else
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Count"):SetFont(VCB_SAVE["WP_GENERAL_customfont"], VCB_SAVE["WP_GENERAL_fontsize"])
			end
		else
			if VCB_SAVE["WP_GENERAL_enableborder"] then
				--getglobal("VCB_BF_WEAPON_BUTTON"..i.."Count"):SetFont(VCB_SAVE["WP_GENERAL_font"], VCB_SAVE["WP_GENERAL_fontsize"], "OUTLINE")
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Count"):SetFont(VCB_SAVE["WP_GENERAL_font"], VCB_SAVE["WP_GENERAL_fontsize"], "NONE")
			else
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Count"):SetFont(VCB_SAVE["WP_GENERAL_font"], VCB_SAVE["WP_GENERAL_fontsize"])
			end
		end
		getglobal("VCB_BF_WEAPON_BUTTON"..i.."Count"):SetVertexColor(VCB_SAVE["WP_GENERAL_fontcolor_r"],VCB_SAVE["WP_GENERAL_fontcolor_g"],VCB_SAVE["WP_GENERAL_fontcolor_b"],VCB_SAVE["WP_GENERAL_fontopacity"])
		getglobal("VCB_BF_WEAPON_BUTTON"..i.."Count"):SetPoint("BOTTOMRIGHT", VCB_SAVE["WP_GENERAL_offset_x"], VCB_SAVE["WP_GENERAL_offset_y"])
		getglobal("VCB_BF_WEAPON_BUTTON"..i.."Duration"):SetTextColor(VCB_SAVE["WP_TIMER_fontcolor_r"],VCB_SAVE["WP_TIMER_fontcolor_g"],VCB_SAVE["WP_TIMER_fontcolor_b"],VCB_SAVE["WP_TIMER_fontopacity"])
	end

	if (not VCB_BF_PM_FRAME:IsVisible()) then
		VCB_BF_WEAPON_BUTTON_OnEvent(false)
	end

  -- 240630 quoted out and update
  VCB_BF_WEAPON_FRAME:SetPoint(VCB_WP_POINT, UIParent, VCB_WP_POINT, VCB_WP_POSX, VCB_WP_POSY)
  VCB_BF_WEAPON_FRAME:SetScale(VCB_SAVE["WP_GENERAL_scale"])


	VCB_BF_BUFF_FRAME:SetScale(VCB_SAVE["BF_GENERAL_scale"])
	VCB_BF_DEBUFF_FRAME:SetScale(VCB_SAVE["DBF_GENERAL_scale"])

	if VCB_SAVE["MISC_disable_CF"] then
		VCB_BF_CONSOLIDATED_ICON:Hide()
	end

	if VCB_MM_ICON then
		VCB_BF_MINIMAP_FRAME:Hide()
	end
end

function VCB_SlashCommandHandler(msg)
	if(msg) then
		VCB_BF_ConfigFrame:Show()
	end
end

function VCB_tablelength(T)
	local count = 0
	for _ in pairs(T) do 
		count = count + 1 
	end 
	return count
end

function VCB_Contains(table, element)
	for _, value in pairs(table) do
		if value == element then
			return true
		end
	end
	return false
end

function VCB_GetKeys(a, b)
	local i = 0
	while true do
		if a[i] == b then
			return i
		end
	end
end

function VCB_Table_GetKeys(a, b)
	local i = 1
	while true do
		if a[i] == b then
			return i
		end
		i = i + 1
	end
end

function VCB_EmptyTable(t)
	for k in pairs (t) do
		t [k] = nil
	end
end

function VCB_SendMessage(msg)
	DEFAULT_CHAT_FRAME:AddMessage("|cFFFF8080VCB v"..VCB_VERSION..":|r "..msg)
end

---------------------------------------OPTION FRAME BEGIN---------------------------------------------------
function VCB_OPTIONS_HIDE_ALL()
	--getglobal("VCB_BF_TIMER_FRAME"):Hide()
	getglobal("VCB_BF_BF_FRAME"):Hide()
	getglobal("VCB_BF_DBF_FRAME"):Hide()
	getglobal("VCB_BF_WP_FRAME"):Hide()
	getglobal("VCB_BF_MISC_FRAME"):Hide()
	getglobal("VCB_BF_PM_FRAME"):Hide()
end

function VCB_OPTIONS_SHOW(frame, text)
	getglobal(frame):Show()
	getglobal("VCB_BF_CONFIG_FRAME_TITLE_TEXT"):SetText(text)
	VCB_PAGEINIT(frame)
	PlaySound("igMainMenuOptionCheckBoxOff")
end

function VCB_PAGEINIT(frame)
  --240630 quoted out and update
  if frame == "VCB_BF_BF_FRAME" then
		getglobal("VCB_BF_BF_FRAME_CHECKBUTTON1"):SetChecked(VCB_SAVE["BF_GENERAL_verticalmode"])
		getglobal("VCB_BF_BF_FRAME_NumPerRowSlider"):SetValue(VCB_SAVE["BF_GENERAL_numperrow"])
		getglobal("VCB_BF_BF_FRAME_NumPerRowSliderText"):SetText(VCB_COMMON_SLIDER_BUFFS_PER_ROW..": "..VCB_SAVE["BF_GENERAL_numperrow"])
		getglobal("VCB_BF_BF_FRAME_AuraPaddingHSlider"):SetValue(VCB_SAVE["BF_GENERAL_padding_h"])
		getglobal("VCB_BF_BF_FRAME_AuraPaddingHSliderText"):SetText(VCB_COMMON_SLIDER_PADDING_H..": "..VCB_SAVE["BF_GENERAL_padding_h"])
		getglobal("VCB_BF_BF_FRAME_AuraPaddingVSlider"):SetValue(VCB_SAVE["BF_GENERAL_padding_v"])
		getglobal("VCB_BF_BF_FRAME_AuraPaddingVSliderText"):SetText(VCB_COMMON_SLIDER_PADDING_V..": "..VCB_SAVE["BF_GENERAL_padding_v"])
		getglobal("VCB_BF_BF_FRAME_ScaleSlider"):SetValue(VCB_SAVE["BF_GENERAL_scale"])
		getglobal("VCB_BF_BF_FRAME_ScaleSliderText"):SetText(VCB_COMMON_SLIDER_SCALE..": "..VCB_SAVE["BF_GENERAL_scale"])
		getglobal("VCB_BF_BF_FRAME_BGOpaSlider"):SetValue(VCB_SAVE["BF_GENERAL_bgopacity"])
		getglobal("VCB_BF_BF_FRAME_BGOpaSliderText"):SetText(VCB_COMMON_SLIDER_BACKGROUND_OPACITY..": "..VCB_SAVE["BF_GENERAL_bgopacity"])
		getglobal("VCB_BF_BF_FRAME_CHECKBUTTON2"):SetChecked(VCB_SAVE["BF_GENERAL_enablebgcolor"])
		getglobal("VCB_BF_BF_FRAME_Color1NormalTexture"):SetVertexColor(VCB_SAVE["BF_GENERAL_bgcolor_r"], VCB_SAVE["BF_GENERAL_bgcolor_g"], VCB_SAVE["BF_GENERAL_bgcolor_b"])
		getglobal("VCB_BF_BF_FRAME_Color1_SwatchBg").r = VCB_SAVE["BF_GENERAL_bgcolor_r"]
		getglobal("VCB_BF_BF_FRAME_Color1_SwatchBg").g = VCB_SAVE["BF_GENERAL_bgcolor_g"]
		getglobal("VCB_BF_BF_FRAME_Color1_SwatchBg").b = VCB_SAVE["BF_GENERAL_bgcolor_b"]
		getglobal("VCB_BF_BF_FRAME_GFontSlider"):SetValue(VCB_Table_GetKeys(VCB_FONT_ARRAY, VCB_SAVE["BF_GENERAL_font"]))
		getglobal("VCB_BF_BF_FRAME_GFontSliderText"):SetText(VCB_COMMON_SLIDER_FONT..": "..VCB_SAVE["BF_GENERAL_font"])
		getglobal("VCB_BF_BF_FRAME_GFontOpacitySlider"):SetValue(VCB_SAVE["BF_GENERAL_fontopacity"])
		getglobal("VCB_BF_BF_FRAME_GFontOpacitySliderText"):SetText(VCB_COMMON_SLIDER_FONT_OPACITY..": "..VCB_SAVE["BF_GENERAL_fontopacity"])
		getglobal("VCB_BF_BF_FRAME_GFontSizeSlider"):SetValue(VCB_SAVE["BF_GENERAL_fontsize"])
		getglobal("VCB_BF_BF_FRAME_GFontSizeSliderText"):SetText(VCB_COMMON_SLIDER_FONT_SIZE..": "..VCB_SAVE["BF_GENERAL_fontsize"])
		getglobal("VCB_BF_BF_FRAME_GFontOffsetXSlider"):SetValue(VCB_SAVE["BF_GENERAL_fontoffset_x"])
		getglobal("VCB_BF_BF_FRAME_GFontOffsetXSliderText"):SetText(VCB_COMMON_SLIDER_FONT_OFFSET_X..": "..VCB_SAVE["BF_GENERAL_fontoffset_x"])
		getglobal("VCB_BF_BF_FRAME_GFontOffsetYSlider"):SetValue(VCB_SAVE["BF_GENERAL_fontoffset_y"])
		getglobal("VCB_BF_BF_FRAME_GFontOffsetYSliderText"):SetText(VCB_COMMON_SLIDER_FONT_OFFSET_Y..": "..VCB_SAVE["BF_GENERAL_fontoffset_y"])
		getglobal("VCB_BF_BF_FRAME_CHECKBUTTON_FBorder"):SetChecked(VCB_SAVE["BF_GENERAL_enableborder"])
		getglobal("VCB_BF_BF_FRAME_Color_fontcolorNormalTexture"):SetVertexColor(VCB_SAVE["BF_GENERAL_fontcolor_r"], VCB_SAVE["BF_GENERAL_fontcolor_g"], VCB_SAVE["BF_GENERAL_fontcolor_b"])
		getglobal("VCB_BF_BF_FRAME_Color_fontcolor_SwatchBg").r = VCB_SAVE["BF_GENERAL_fontcolor_r"]
		getglobal("VCB_BF_BF_FRAME_Color_fontcolor_SwatchBg").g = VCB_SAVE["BF_GENERAL_fontcolor_g"]
		getglobal("VCB_BF_BF_FRAME_Color_fontcolor_SwatchBg").b = VCB_SAVE["BF_GENERAL_fontcolor_b"]
		getglobal("VCB_BF_BF_FRAME_CHECKBUTTON3"):SetChecked(VCB_SAVE["BF_GENERAL_invert"])
		getglobal("VCB_BF_BF_FRAME_CHECKBUTTON_IBO"):SetChecked(VCB_SAVE["BF_GENERAL_invertorientation"])
		getglobal("VCB_BF_BF_FRAME_CHECKBUTTON5"):SetChecked(VCB_SAVE["BF_BORDER_enableborder"])
		getglobal("VCB_BF_BF_FRAME_Color4NormalTexture"):SetVertexColor(VCB_SAVE["BF_BORDER_bordercolor_r"], VCB_SAVE["BF_BORDER_bordercolor_g"], VCB_SAVE["BF_BORDER_bordercolor_b"])
		getglobal("VCB_BF_BF_FRAME_Color4_SwatchBg").r = VCB_SAVE["BF_BORDER_bordercolor_r"]
		getglobal("VCB_BF_BF_FRAME_Color4_SwatchBg").g = VCB_SAVE["BF_BORDER_bordercolor_g"]
		getglobal("VCB_BF_BF_FRAME_Color4_SwatchBg").b = VCB_SAVE["BF_BORDER_bordercolor_b"]
		getglobal("VCB_BF_BF_FRAME_BorderOpacitySlider"):SetValue(VCB_SAVE["BF_BORDER_borderopacity"])
		getglobal("VCB_BF_BF_FRAME_BorderOpacitySliderText"):SetText(VCB_COMMON_SLIDER_BACKGROUND_OPACITY..": "..VCB_SAVE["BF_BORDER_borderopacity"])
		getglobal("VCB_BF_BF_FRAME_BorderSlider"):SetValue(VCB_SAVE["BF_BORDER_border"])
		getglobal("VCB_BF_BF_FRAME_BorderSliderText"):SetText(VCB_COMMON_SLIDER_BORDER..": "..VCB_SAVE["BF_BORDER_border"])
		getglobal("VCB_BF_BF_FRAME_CHECKBUTTON4"):SetChecked(VCB_SAVE["BF_TIMER_border"])
		getglobal("VCB_BF_BF_FRAME_FontSizeSlider"):SetValue(VCB_SAVE["BF_TIMER_fontsize"])
		getglobal("VCB_BF_BF_FRAME_FontSizeSliderText"):SetText(VCB_COMMON_SLIDER_FONT_SIZE..": "..VCB_SAVE["BF_TIMER_fontsize"])
		getglobal("VCB_BF_BF_FRAME_FontOpacitySlider"):SetValue(VCB_SAVE["BF_TIMER_fontopacity"])
		getglobal("VCB_BF_BF_FRAME_FontOpacitySliderText"):SetText(VCB_COMMON_SLIDER_FONT_OPACITY..": "..VCB_SAVE["BF_TIMER_fontopacity"])
		getglobal("VCB_BF_BF_FRAME_Color2NormalTexture"):SetVertexColor(VCB_SAVE["BF_TIMER_fontcolor_r"], VCB_SAVE["BF_TIMER_fontcolor_g"], VCB_SAVE["BF_TIMER_fontcolor_b"])
		getglobal("VCB_BF_BF_FRAME_Color2_SwatchBg").r = VCB_SAVE["BF_TIMER_fontcolor_r"]
		getglobal("VCB_BF_BF_FRAME_Color2_SwatchBg").g = VCB_SAVE["BF_TIMER_fontcolor_g"]
		getglobal("VCB_BF_BF_FRAME_Color2_SwatchBg").b = VCB_SAVE["BF_TIMER_fontcolor_b"]
	elseif frame == "VCB_BF_DBF_FRAME" then
		getglobal("VCB_BF_DBF_FRAME_CHECKBUTTON1"):SetChecked(VCB_SAVE["DBF_GENERAL_verticalmode"])
		getglobal("VCB_BF_DBF_FRAME_NumPerRowSlider"):SetValue(VCB_SAVE["DBF_GENERAL_numperrow"])
		getglobal("VCB_BF_DBF_FRAME_NumPerRowSliderText"):SetText(VCB_COMMON_SLIDER_BUFFS_PER_ROW..": "..VCB_SAVE["DBF_GENERAL_numperrow"])
		getglobal("VCB_BF_DBF_FRAME_AuraPaddingHSlider"):SetValue(VCB_SAVE["DBF_GENERAL_padding_h"])
		getglobal("VCB_BF_DBF_FRAME_AuraPaddingHSliderText"):SetText(VCB_COMMON_SLIDER_PADDING_H..": "..VCB_SAVE["DBF_GENERAL_padding_h"])
		getglobal("VCB_BF_DBF_FRAME_AuraPaddingVSlider"):SetValue(VCB_SAVE["DBF_GENERAL_padding_v"])
		getglobal("VCB_BF_DBF_FRAME_AuraPaddingVSliderText"):SetText(VCB_COMMON_SLIDER_PADDING_V..": "..VCB_SAVE["DBF_GENERAL_padding_v"])
		getglobal("VCB_BF_DBF_FRAME_BGOpaSlider"):SetValue(VCB_SAVE["DBF_GENERAL_bgopacity"])
		getglobal("VCB_BF_DBF_FRAME_BGOpaSliderText"):SetText(VCB_COMMON_SLIDER_BACKGROUND_OPACITY..": "..VCB_SAVE["DBF_GENERAL_bgopacity"])
		getglobal("VCB_BF_DBF_FRAME_ScaleSlider"):SetValue(VCB_SAVE["DBF_GENERAL_scale"])
		getglobal("VCB_BF_DBF_FRAME_ScaleSliderText"):SetText(VCB_COMMON_SLIDER_SCALE..": "..VCB_SAVE["DBF_GENERAL_scale"])
		getglobal("VCB_BF_DBF_FRAME_CHECKBUTTON2"):SetChecked(VCB_SAVE["DBF_GENERAL_enablebgcolor"])
		getglobal("VCB_BF_DBF_FRAME_Color1NormalTexture"):SetVertexColor(VCB_SAVE["DBF_GENERAL_bgcolor_r"], VCB_SAVE["DBF_GENERAL_bgcolor_g"], VCB_SAVE["DBF_GENERAL_bgcolor_b"])
		getglobal("VCB_BF_DBF_FRAME_Color1_SwatchBg").r = VCB_SAVE["DBF_GENERAL_bgcolor_r"]
		getglobal("VCB_BF_DBF_FRAME_Color1_SwatchBg").g = VCB_SAVE["DBF_GENERAL_bgcolor_g"]
		getglobal("VCB_BF_DBF_FRAME_Color1_SwatchBg").b = VCB_SAVE["DBF_GENERAL_bgcolor_b"]
		getglobal("VCB_BF_DBF_FRAME_GFontSlider"):SetValue(VCB_Table_GetKeys(VCB_FONT_ARRAY, VCB_SAVE["DBF_GENERAL_font"]))
		getglobal("VCB_BF_DBF_FRAME_GFontSliderText"):SetText(VCB_COMMON_SLIDER_FONT..": "..VCB_SAVE["DBF_GENERAL_font"])
		getglobal("VCB_BF_DBF_FRAME_GFontOpacitySlider"):SetValue(VCB_SAVE["DBF_GENERAL_fontopacity"])
		getglobal("VCB_BF_DBF_FRAME_GFontOpacitySliderText"):SetText(VCB_COMMON_SLIDER_FONT_OPACITY..": "..VCB_SAVE["DBF_GENERAL_fontopacity"])
		getglobal("VCB_BF_DBF_FRAME_GFontSizeSlider"):SetValue(VCB_SAVE["DBF_GENERAL_fontsize"])
		getglobal("VCB_BF_DBF_FRAME_GFontSizeSliderText"):SetText(VCB_COMMON_SLIDER_FONT_SIZE..": "..VCB_SAVE["DBF_GENERAL_fontsize"])
		getglobal("VCB_BF_DBF_FRAME_GFontOffsetXSlider"):SetValue(VCB_SAVE["DBF_GENERAL_fontoffset_x"])
		getglobal("VCB_BF_DBF_FRAME_GFontOffsetXSliderText"):SetText(VCB_COMMON_SLIDER_FONT_OFFSET_X..": "..VCB_SAVE["DBF_GENERAL_fontoffset_x"])
		getglobal("VCB_BF_DBF_FRAME_GFontOffsetYSlider"):SetValue(VCB_SAVE["DBF_GENERAL_fontoffset_y"])
		getglobal("VCB_BF_DBF_FRAME_GFontOffsetYSliderText"):SetText(VCB_COMMON_SLIDER_FONT_OFFSET_Y..": "..VCB_SAVE["DBF_GENERAL_fontoffset_y"])
		getglobal("VCB_BF_DBF_FRAME_CHECKBUTTON_FBorder"):SetChecked(VCB_SAVE["DBF_GENERAL_enableborder"])
		getglobal("VCB_BF_DBF_FRAME_Color_fontcolorNormalTexture"):SetVertexColor(VCB_SAVE["DBF_GENERAL_fontcolor_r"], VCB_SAVE["DBF_GENERAL_fontcolor_g"], VCB_SAVE["DBF_GENERAL_fontcolor_b"])
		getglobal("VCB_BF_DBF_FRAME_Color_fontcolor_SwatchBg").r = VCB_SAVE["DBF_GENERAL_fontcolor_r"]
		getglobal("VCB_BF_DBF_FRAME_Color_fontcolor_SwatchBg").g = VCB_SAVE["DBF_GENERAL_fontcolor_g"]
		getglobal("VCB_BF_DBF_FRAME_Color_fontcolor_SwatchBg").b = VCB_SAVE["DBF_GENERAL_fontcolor_b"]
		getglobal("VCB_BF_DBF_FRAME_CHECKBUTTON3"):SetChecked(VCB_SAVE["DBF_GENERAL_invert"])
		getglobal("VCB_BF_DBF_FRAME_CHECKBUTTON_IBO"):SetChecked(VCB_SAVE["DBF_GENERAL_invertorientation"])
		getglobal("VCB_BF_DBF_FRAME_CHECKBUTTON5"):SetChecked(VCB_SAVE["DBF_BORDER_enableborder"])
		getglobal("VCB_BF_DBF_FRAME_BorderSlider"):SetValue(VCB_SAVE["DBF_BORDER_border"])
		getglobal("VCB_BF_DBF_FRAME_BorderSliderText"):SetText(VCB_COMMON_SLIDER_BORDER..": "..VCB_SAVE["DBF_BORDER_border"])
		getglobal("VCB_BF_DBF_FRAME_CHECKBUTTON4"):SetChecked(VCB_SAVE["DBF_TIMER_enableborder"])
		getglobal("VCB_BF_DBF_FRAME_Color2NormalTexture"):SetVertexColor(VCB_SAVE["DBF_TIMER_fontcolor_r"], VCB_SAVE["DBF_TIMER_fontcolor_g"], VCB_SAVE["DBF_TIMER_fontcolor_b"])
		getglobal("VCB_BF_DBF_FRAME_Color2_SwatchBg").r = VCB_SAVE["DBF_TIMER_fontcolor_r"]
		getglobal("VCB_BF_DBF_FRAME_Color2_SwatchBg").g = VCB_SAVE["DBF_TIMER_fontcolor_g"]
		getglobal("VCB_BF_DBF_FRAME_Color2_SwatchBg").b = VCB_SAVE["DBF_TIMER_fontcolor_b"]
		getglobal("VCB_BF_DBF_FRAME_FontSizeSlider"):SetValue(VCB_SAVE["DBF_TIMER_fontsize"])
		getglobal("VCB_BF_DBF_FRAME_FontSizeSliderText"):SetText(VCB_COMMON_SLIDER_FONT_SIZE..": "..VCB_SAVE["DBF_TIMER_fontsize"])
		getglobal("VCB_BF_DBF_FRAME_FontOpacitySlider"):SetValue(VCB_SAVE["DBF_TIMER_fontopacity"])
		getglobal("VCB_BF_DBF_FRAME_FontOpacitySliderText"):SetText(VCB_COMMON_SLIDER_FONT_OPACITY..": "..VCB_SAVE["DBF_TIMER_fontopacity"])
		getglobal("VCB_BF_DBF_FRAME_BorderOpacitySlider"):SetValue(VCB_SAVE["DBF_BORDER_borderopacity"])
		getglobal("VCB_BF_DBF_FRAME_BorderOpacitySliderText"):SetText(VCB_COMMON_SLIDER_BACKGROUND_OPACITY..": "..VCB_SAVE["DBF_BORDER_borderopacity"])
		getglobal("VCB_BF_DBF_FRAME_Color_NONENormalTexture"):SetVertexColor(VCB_SAVE["DBF_BORDER_nonecolor_r"], VCB_SAVE["DBF_BORDER_nonecolor_g"], VCB_SAVE["DBF_BORDER_nonecolor_b"])
		getglobal("VCB_BF_DBF_FRAME_Color_NONE_SwatchBg").r = VCB_SAVE["DBF_BORDER_nonecolor_r"]
		getglobal("VCB_BF_DBF_FRAME_Color_NONE_SwatchBg").g = VCB_SAVE["DBF_BORDER_nonecolor_g"]
		getglobal("VCB_BF_DBF_FRAME_Color_NONE_SwatchBg").b = VCB_SAVE["DBF_BORDER_nonecolor_b"]
		getglobal("VCB_BF_DBF_FRAME_Color_POISONNormalTexture"):SetVertexColor(VCB_SAVE["DBF_BORDER_poisoncolor_r"], VCB_SAVE["DBF_BORDER_poisoncolor_g"], VCB_SAVE["DBF_BORDER_poisoncolor_b"])
		getglobal("VCB_BF_DBF_FRAME_Color_POISON_SwatchBg").r = VCB_SAVE["DBF_BORDER_poisoncolor_r"]
		getglobal("VCB_BF_DBF_FRAME_Color_POISON_SwatchBg").g = VCB_SAVE["DBF_BORDER_poisoncolor_g"]
		getglobal("VCB_BF_DBF_FRAME_Color_POISON_SwatchBg").b = VCB_SAVE["DBF_BORDER_poisoncolor_b"]
		getglobal("VCB_BF_DBF_FRAME_Color_MAGICNormalTexture"):SetVertexColor(VCB_SAVE["DBF_BORDER_magiccolor_r"], VCB_SAVE["DBF_BORDER_magiccolor_g"], VCB_SAVE["DBF_BORDER_magiccolor_b"])
		getglobal("VCB_BF_DBF_FRAME_Color_MAGIC_SwatchBg").r = VCB_SAVE["DBF_BORDER_magiccolor_r"]
		getglobal("VCB_BF_DBF_FRAME_Color_MAGIC_SwatchBg").g = VCB_SAVE["DBF_BORDER_magiccolor_g"]
		getglobal("VCB_BF_DBF_FRAME_Color_MAGIC_SwatchBg").b = VCB_SAVE["DBF_BORDER_magiccolor_b"]
		getglobal("VCB_BF_DBF_FRAME_Color_CURSENormalTexture"):SetVertexColor(VCB_SAVE["DBF_BORDER_cursecolor_r"], VCB_SAVE["DBF_BORDER_cursecolor_g"], VCB_SAVE["DBF_BORDER_cursecolor_b"])
		getglobal("VCB_BF_DBF_FRAME_Color_CURSE_SwatchBg").r = VCB_SAVE["DBF_BORDER_cursecolor_r"]
		getglobal("VCB_BF_DBF_FRAME_Color_CURSE_SwatchBg").g = VCB_SAVE["DBF_BORDER_cursecolor_g"]
		getglobal("VCB_BF_DBF_FRAME_Color_CURSE_SwatchBg").b = VCB_SAVE["DBF_BORDER_cursecolor_b"]
		getglobal("VCB_BF_DBF_FRAME_Color_DISEASENormalTexture"):SetVertexColor(VCB_SAVE["DBF_BORDER_diseasecolor_r"], VCB_SAVE["DBF_BORDER_diseasecolor_g"], VCB_SAVE["DBF_BORDER_diseasecolor_b"])
		getglobal("VCB_BF_DBF_FRAME_Color_DISEASE_SwatchBg").r = VCB_SAVE["DBF_BORDER_diseasecolor_r"]
		getglobal("VCB_BF_DBF_FRAME_Color_DISEASE_SwatchBg").g = VCB_SAVE["DBF_BORDER_diseasecolor_g"]
		getglobal("VCB_BF_DBF_FRAME_Color_DISEASE_SwatchBg").b = VCB_SAVE["DBF_BORDER_diseasecolor_b"]
	elseif frame == "VCB_BF_WP_FRAME" then
		getglobal("VCB_BF_WP_FRAME_CHECKBUTTON1"):SetChecked(VCB_SAVE["WP_GENERAL_verticalmode"])
		getglobal("VCB_BF_WP_FRAME_CHECKBUTTON2"):SetChecked(VCB_SAVE["WP_GENERAL_enablebgcolor"])
		getglobal("VCB_BF_WP_FRAME_Color1NormalTexture"):SetVertexColor(VCB_SAVE["WP_GENERAL_bgcolor_r"], VCB_SAVE["WP_GENERAL_bgcolor_g"], VCB_SAVE["WP_GENERAL_bgcolor_b"])
		getglobal("VCB_BF_WP_FRAME_Color1_SwatchBg").r = VCB_SAVE["WP_GENERAL_bgcolor_r"]
		getglobal("VCB_BF_WP_FRAME_Color1_SwatchBg").g = VCB_SAVE["WP_GENERAL_bgcolor_g"]
		getglobal("VCB_BF_WP_FRAME_Color1_SwatchBg").b = VCB_SAVE["WP_GENERAL_bgcolor_b"]
		getglobal("VCB_BF_WP_FRAME_AuraPaddingHSlider"):SetValue(VCB_SAVE["WP_GENERAL_padding_h"])
		getglobal("VCB_BF_WP_FRAME_AuraPaddingHSliderText"):SetText(VCB_COMMON_SLIDER_PADDING_H..": "..VCB_SAVE["WP_GENERAL_padding_h"])
		getglobal("VCB_BF_WP_FRAME_FontSizeSlider"):SetValue(VCB_SAVE["WP_GENERAL_fontsize"])
		getglobal("VCB_BF_WP_FRAME_FontSizeSliderText"):SetText(VCB_COMMON_SLIDER_FONT_SIZE..": "..VCB_SAVE["WP_GENERAL_fontsize"])
		getglobal("VCB_BF_WP_FRAME_BGOpaSlider"):SetValue(VCB_SAVE["WP_GENERAL_bgopacity"])
		getglobal("VCB_BF_WP_FRAME_BGOpaSliderText"):SetText(VCB_COMMON_SLIDER_BACKGROUND_OPACITY..": "..VCB_SAVE["WP_GENERAL_bgopacity"])
		getglobal("VCB_BF_WP_FRAME_ScaleSlider"):SetValue(VCB_SAVE["WP_GENERAL_scale"])
		getglobal("VCB_BF_WP_FRAME_ScaleSliderText"):SetText(VCB_COMMON_SLIDER_SCALE..": "..VCB_SAVE["WP_GENERAL_scale"])
		getglobal("VCB_BF_WP_FRAME_FontSlider"):SetValue(VCB_Table_GetKeys(VCB_FONT_ARRAY, VCB_SAVE["WP_GENERAL_font"]))
		getglobal("VCB_BF_WP_FRAME_FontSliderText"):SetText(VCB_COMMON_SLIDER_FONT..": "..VCB_SAVE["WP_GENERAL_font"])
		getglobal("VCB_BF_WP_FRAME_FontOpacitySlider"):SetValue(VCB_SAVE["WP_GENERAL_fontopacity"])
		getglobal("VCB_BF_WP_FRAME_FontOpacitySliderText"):SetText(VCB_COMMON_SLIDER_FONT_OPACITY..": "..VCB_SAVE["WP_GENERAL_fontopacity"])
		getglobal("VCB_BF_WP_FRAME_AuraPaddingVSlider"):SetValue(VCB_SAVE["WP_GENERAL_padding_v"])
		getglobal("VCB_BF_WP_FRAME_AuraPaddingVSliderText"):SetText(VCB_COMMON_SLIDER_PADDING_V..": "..VCB_SAVE["WP_GENERAL_padding_v"])
		getglobal("VCB_BF_WP_FRAME_Color5NormalTexture"):SetVertexColor(VCB_SAVE["WP_GENERAL_fontcolor_r"], VCB_SAVE["WP_GENERAL_fontcolor_g"], VCB_SAVE["WP_GENERAL_fontcolor_b"])
		getglobal("VCB_BF_WP_FRAME_Color5_SwatchBg").r = VCB_SAVE["WP_GENERAL_fontcolor_r"]
		getglobal("VCB_BF_WP_FRAME_Color5_SwatchBg").g = VCB_SAVE["WP_GENERAL_fontcolor_g"]
		getglobal("VCB_BF_WP_FRAME_Color5_SwatchBg").b = VCB_SAVE["WP_GENERAL_fontcolor_b"]
		getglobal("VCB_BF_WP_FRAME_OffsetXSlider"):SetValue(VCB_SAVE["WP_GENERAL_offset_x"])
		getglobal("VCB_BF_WP_FRAME_OffsetXSliderText"):SetText(VCB_COMMON_SLIDER_FONT_OFFSET_X..": "..VCB_SAVE["WP_GENERAL_offset_x"])
		getglobal("VCB_BF_WP_FRAME_OffsetYSlider"):SetValue(VCB_SAVE["WP_GENERAL_offset_y"])
		getglobal("VCB_BF_WP_FRAME_OffsetYSliderText"):SetText(VCB_COMMON_SLIDER_FONT_OFFSET_Y..": "..VCB_SAVE["WP_GENERAL_offset_y"])
		getglobal("VCB_BF_WP_FRAME_CHECKBUTTON8"):SetChecked(VCB_SAVE["WP_GENERAL_enableborder"])
		getglobal("VCB_BF_WP_FRAME_CHECKBUTTON_INVERTORDER"):SetChecked(VCB_SAVE["WP_GENERAL_invert"])
		getglobal("VCB_BF_WP_FRAME_CHECKBUTTON5"):SetChecked(VCB_SAVE["WP_BORDER_enableborder"])
		getglobal("VCB_BF_WP_FRAME_Color4NormalTexture"):SetVertexColor(VCB_SAVE["WP_BORDER_bordercolor_r"], VCB_SAVE["WP_BORDER_bordercolor_g"], VCB_SAVE["WP_BORDER_bordercolor_b"])
		getglobal("VCB_BF_WP_FRAME_Color4_SwatchBg").r = VCB_SAVE["WP_BORDER_bordercolor_r"]
		getglobal("VCB_BF_WP_FRAME_Color4_SwatchBg").g = VCB_SAVE["WP_BORDER_bordercolor_g"]
		getglobal("VCB_BF_WP_FRAME_Color4_SwatchBg").b = VCB_SAVE["WP_BORDER_bordercolor_b"]
		getglobal("VCB_BF_WP_FRAME_BorderSlider"):SetValue(VCB_SAVE["WP_BORDER_border"])
		getglobal("VCB_BF_WP_FRAME_BorderSliderText"):SetText(VCB_COMMON_SLIDER_BORDER..": "..VCB_SAVE["WP_BORDER_border"])
		getglobal("VCB_BF_WP_FRAME_CHECKBUTTON4"):SetChecked(VCB_SAVE["WP_TIMER_enableborder"])
		getglobal("VCB_BF_WP_FRAME_Color2NormalTexture"):SetVertexColor(VCB_SAVE["WP_TIMER_fontcolor_r"], VCB_SAVE["WP_TIMER_fontcolor_g"], VCB_SAVE["WP_TIMER_fontcolor_b"])
		getglobal("VCB_BF_WP_FRAME_Color2_SwatchBg").r = VCB_SAVE["WP_TIMER_fontcolor_r"]
		getglobal("VCB_BF_WP_FRAME_Color2_SwatchBg").g = VCB_SAVE["WP_TIMER_fontcolor_g"]
		getglobal("VCB_BF_WP_FRAME_Color2_SwatchBg").b = VCB_SAVE["WP_TIMER_fontcolor_b"]
		getglobal("VCB_BF_WP_FRAME_TIMER_FontSizeSlider"):SetValue(VCB_SAVE["WP_TIMER_fontsize"])
		getglobal("VCB_BF_WP_FRAME_TIMER_FontSizeSliderText"):SetText(VCB_COMMON_SLIDER_FONT_SIZE..": "..VCB_SAVE["WP_TIMER_fontsize"])
		getglobal("VCB_BF_WP_FRAME_TIMER_FontOpacitySlider"):SetValue(VCB_SAVE["WP_TIMER_fontopacity"])
		getglobal("VCB_BF_WP_FRAME_TIMER_FontOpacitySliderText"):SetText(VCB_COMMON_SLIDER_FONT_OPACITY..": "..VCB_SAVE["WP_TIMER_fontopacity"])
		getglobal("VCB_BF_WP_FRAME_BorderOpacitySlider"):SetValue(VCB_SAVE["WP_BORDER_borderopacity"])
		getglobal("VCB_BF_WP_FRAME_BorderOpacitySliderText"):SetText(VCB_COMMON_SLIDER_BACKGROUND_OPACITY..": "..VCB_SAVE["WP_BORDER_borderopacity"])
	elseif frame == "VCB_BF_MISC_FRAME" then
		getglobal("VCB_BF_MISC_FRAME_CHECKBUTTON1"):SetChecked(VCB_SAVE["MISC_disable_CF"])
		getglobal("VCB_BF_MISC_FRAME_CHECKBUTTON2"):SetChecked(VCB_SAVE["MISC_disable_BB"])
	elseif frame == "VCB_BF_PM_FRAME" then
		getglobal("VCB_BF_PM_FRAME_LEFT_CURRENT_INBOX_TEXT"):SetText(VCB_CUR_PROFILE)
	end
end

function VCB_BF_CHECKBUTTON(obj)
	if (VCB_SAVE[obj]) then
		VCB_SAVE[obj] = false
	else
		VCB_SAVE[obj] = true
	end
end

function VCB_BF_MINIMAP_OnClick(arg1)
	if arg1 == "LeftButton" then
		if VCB_BF_ConfigFrame:IsVisible() then
			VCB_BF_ConfigFrame:Hide()
		else
			VCB_BF_ConfigFrame:Show()
		end
	else
		VCB_BF_ToggleLock()
	end
end

function VCB_BF_OptionsFrame_SetColor()
	local r,g,b = ColorPickerFrame:GetColorRGB();
	local swatch,frame;
	swatch = getglobal(VCB_BF_COLOR_OBJ:GetName().."NormalTexture"); -- juste le visuel
	frame = getglobal(VCB_BF_COLOR_OBJ:GetName().."_SwatchBg");      -- enregistre la couleur
	swatch:SetVertexColor(r,g,b);
	frame.r = r;
	frame.g = g;
	frame.b = b;

	VCB_SAVE[VCB_BF_COLOR_VAR.."color_r"] = r;
	VCB_SAVE[VCB_BF_COLOR_VAR.."color_g"] = g;
	VCB_SAVE[VCB_BF_COLOR_VAR.."color_b"] = b;
	
	if VCB_BF_COLOR_TYPE == "font" then
		getglobal(VCB_BF_COLOR_TAR):SetTextColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."fontopacity"]);
	elseif VCB_BF_COLOR_TYPE=="bg" then
		getglobal(VCB_BF_COLOR_TAR):SetBackdropColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."opacity"])
	elseif VCB_BF_COLOR_TYPE=="border" then
		getglobal(VCB_BF_COLOR_TAR):SetBackdropBorderColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."opacity"])
	elseif VCB_BF_COLOR_TYPE=="buffsborder" then
		for i=0, VCB_MAXINDEX["buff"] do
			if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_CONSOLIDATED_BUFFFRAME then
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Border"):SetVertexColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."opactiy"])
			end
		end
	elseif VCB_BF_COLOR_TYPE=="buffsbg" then
		for i=0, VCB_MAXINDEX["buff"] do
			if VCB_SAVE[VCB_BF_COLOR_TAR] and getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_CONSOLIDATED_BUFFFRAME then
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Icon"):SetVertexColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."opactiy"])
			end
		end
	elseif VCB_BF_COLOR_TYPE=="buffsfont" then
		for i=0, VCB_MAXINDEX["buff"] do
			if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_CONSOLIDATED_BUFFFRAME then
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Duration"):SetTextColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."opactiy"])
			end
		end
	elseif VCB_BF_COLOR_TYPE=="BFbg" then
		for i=0, VCB_MAXINDEX["buff"] do
			if VCB_SAVE[VCB_BF_COLOR_TAR] and getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_BUFF_FRAME then
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Icon"):SetVertexColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."opactiy"])
			end
		end
	elseif VCB_BF_COLOR_TYPE=="BFborder" then
		for i=0, VCB_MAXINDEX["buff"] do
			if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_BUFF_FRAME and VCB_SAVE[VCB_BF_COLOR_TAR] then
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Border"):SetVertexColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."opactiy"])
			end
		end
	elseif VCB_BF_COLOR_TYPE=="BFfont" then
		for i=0, VCB_MAXINDEX["buff"] do
			if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_BUFF_FRAME then
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Duration"):SetTextColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."opactiy"])
			end
		end
	elseif VCB_BF_COLOR_TYPE=="DebuffBG" then
		for i=0,15 do
			if VCB_SAVE[VCB_BF_COLOR_TAR] then
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Icon"):SetVertexColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."opactiy"])
			end
		end
	elseif VCB_BF_COLOR_TYPE=="DebuffFont" then
		for i=0,15 do
			getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Duration"):SetTextColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."opactiy"])
		end
	elseif VCB_BF_COLOR_TYPE=="DebuffGFont" then
		for i=0,15 do
			getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Count"):SetTextColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."opactiy"])
		end
	elseif VCB_BF_COLOR_TYPE=="BuffGFont" then
		for i=0, VCB_MAXINDEX["buff"] do
			if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_BUFF_FRAME then
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Count"):SetTextColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."opactiy"])
			end
		end
	elseif VCB_BF_COLOR_TYPE=="CFGFont" then
		for i=0, VCB_MAXINDEX["buff"] do
			if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_CONSOLIDATED_BUFFFRAME then
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Count"):SetTextColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."opactiy"])
			end
		end
	elseif VCB_BF_COLOR_TYPE=="WeaponBG" then
		for i=0,1 do
			if VCB_SAVE[VCB_BF_COLOR_TAR] then
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Icon"):SetVertexColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."opactiy"])
			end
		end
	elseif VCB_BF_COLOR_TYPE=="WPFont" then
		for i=0,1 do
			getglobal("VCB_BF_WEAPON_BUTTON"..i.."Count"):SetVertexColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."opactiy"])
		end
	elseif VCB_BF_COLOR_TYPE=="WPBorder" then
		for i=0,1 do
			if VCB_SAVE[VCB_BF_COLOR_TAR] then
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Border"):SetVertexColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."opactiy"])
			end
		end
	elseif VCB_BF_COLOR_TYPE=="WPTimer" then
		for i=0,1 do
			getglobal("VCB_BF_WEAPON_BUTTON"..i.."Duration"):SetTextColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."opactiy"])
		end
	elseif VCB_BF_COLOR_TYPE=="DebuffBorderColor" then
		for i=0,15 do
			if VCB_SAVE[VCB_BF_COLOR_TAR] then
				if i < 3 then
					getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Border"):SetVertexColor(VCB_SAVE["DBF_BORDER_nonecolor_r"],VCB_SAVE["DBF_BORDER_nonecolor_g"],VCB_SAVE["DBF_BORDER_nonecolor_b"],VCB_SAVE["DBF_BORDER_borderopacity"])
				elseif i >= 3 and i < 6 then
					getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Border"):SetVertexColor(VCB_SAVE["DBF_BORDER_poisoncolor_r"],VCB_SAVE["DBF_BORDER_poisoncolor_g"],VCB_SAVE["DBF_BORDER_poisoncolor_b"],VCB_SAVE["DBF_BORDER_borderopacity"])
				elseif i >= 6 and i < 9 then
					getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Border"):SetVertexColor(VCB_SAVE["DBF_BORDER_magiccolor_r"],VCB_SAVE["DBF_BORDER_magiccolor_g"],VCB_SAVE["DBF_BORDER_magiccolor_b"],VCB_SAVE["DBF_BORDER_borderopacity"])
				elseif i >= 9 and i < 12 then
					getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Border"):SetVertexColor(VCB_SAVE["DBF_BORDER_cursecolor_r"],VCB_SAVE["DBF_BORDER_cursecolor_g"],VCB_SAVE["DBF_BORDER_cursecolor_b"],VCB_SAVE["DBF_BORDER_borderopacity"])
				else
					getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Border"):SetVertexColor(VCB_SAVE["DBF_BORDER_diseasecolor_r"],VCB_SAVE["DBF_BORDER_diseasecolor_g"],VCB_SAVE["DBF_BORDER_diseasecolor_b"],VCB_SAVE["DBF_BORDER_borderopacity"])
				end
			end
		end
	end
end

function VCB_BF_OptionsFrame_CancelColor()
	local r = ColorPickerFrame.previousValues.r;
	local g = ColorPickerFrame.previousValues.g;
	local b = ColorPickerFrame.previousValues.b;
	local swatch,frame;
	swatch = getglobal(VCB_BF_COLOR_OBJ:GetName().."NormalTexture"); -- juste le visuel
	frame = getglobal(VCB_BF_COLOR_OBJ:GetName().."_SwatchBg");      -- enregistre la couleur
	swatch:SetVertexColor(r,g,b);
	frame.r = r;
	frame.g = g;
	frame.b = b;

	if VCB_BF_COLOR_TYPE == "font" then
		getglobal(VCB_BF_COLOR_TAR):SetTextColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."fontopacity"]);
	elseif VCB_BF_COLOR_TYPE=="bg" then
		getglobal(VCB_BF_COLOR_TAR):SetBackdropColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."opacity"])
	elseif VCB_BF_COLOR_TYPE=="border" then
		getglobal(VCB_BF_COLOR_TAR):SetBackdropBorderColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."opacity"])
	elseif VCB_BF_COLOR_TYPE=="buffsborder" then
		for i=0, VCB_MAXINDEX["buff"] do
			if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_CONSOLIDATED_BUFFFRAME then
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Border"):SetVertexColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."opactiy"])
			end
		end
	elseif VCB_BF_COLOR_TYPE=="buffsbg" then
		for i=0, VCB_MAXINDEX["buff"] do
			if VCB_SAVE[VCB_BF_COLOR_TAR] and getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_CONSOLIDATED_BUFFFRAME then
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Icon"):SetVertexColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."opactiy"])
			end
		end
	elseif VCB_BF_COLOR_TYPE=="buffsfont" then
		for i=0, VCB_MAXINDEX["buff"] do
			if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_CONSOLIDATED_BUFFFRAME then
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Duration"):SetTextColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."opactiy"])
			end
		end
	elseif VCB_BF_COLOR_TYPE=="BFbg" then
		for i=0, VCB_MAXINDEX["buff"] do
			if VCB_SAVE[VCB_BF_COLOR_TAR] and getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_BUFF_FRAME then
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Icon"):SetVertexColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."opactiy"])
			end
		end
	elseif VCB_BF_COLOR_TYPE=="BFborder" then
		for i=0, VCB_MAXINDEX["buff"] do
			if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_BUFF_FRAME and VCB_SAVE[VCB_BF_COLOR_TAR] then
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Border"):SetVertexColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."opactiy"])
			end
		end
	elseif VCB_BF_COLOR_TYPE=="BFfont" then
		for i=0, VCB_MAXINDEX["buff"] do
			if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_BUFF_FRAME then
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Duration"):SetTextColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."opactiy"])
			end
		end
	elseif VCB_BF_COLOR_TYPE=="DebuffBG" then
		for i=0,15 do
			if VCB_SAVE[VCB_BF_COLOR_TAR] then
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Icon"):SetVertexColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."opactiy"])
			end
		end
	elseif VCB_BF_COLOR_TYPE=="DebuffFont" then
		for i=0,15 do
			getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Duration"):SetTextColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."opactiy"])
		end
	elseif VCB_BF_COLOR_TYPE=="DebuffGFont" then
		for i=0,15 do
			getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Count"):SetTextColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."opactiy"])
		end
	elseif VCB_BF_COLOR_TYPE=="BuffGFont" then
		for i=0, VCB_MAXINDEX["buff"] do
			if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_BUFF_FRAME then
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Count"):SetTextColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."opactiy"])
			end
		end
	elseif VCB_BF_COLOR_TYPE=="CFGFont" then
		for i=0, VCB_MAXINDEX["buff"] do
			if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_CONSOLIDATED_BUFFFRAME then
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Count"):SetTextColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."opactiy"])
			end
		end
	elseif VCB_BF_COLOR_TYPE=="WeaponBG" then
		for i=0,1 do
			if VCB_SAVE[VCB_BF_COLOR_TAR] then
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Icon"):SetVertexColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."opactiy"])
			end
		end
	elseif VCB_BF_COLOR_TYPE=="WPFont" then
		for i=0,1 do
			getglobal("VCB_BF_WEAPON_BUTTON"..i.."Count"):SetVertexColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."opactiy"])
		end
	elseif VCB_BF_COLOR_TYPE=="WPBorder" then
		for i=0,1 do
			if VCB_SAVE[VCB_BF_COLOR_TAR] then
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Border"):SetVertexColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."opactiy"])
			end
		end
	elseif VCB_BF_COLOR_TYPE=="WPTimer" then
		for i=0,1 do
			getglobal("VCB_BF_WEAPON_BUTTON"..i.."Duration"):SetTextColor(r,g,b,VCB_SAVE[VCB_BF_COLOR_VAR.."opactiy"])
		end
	elseif VCB_BF_COLOR_TYPE=="DebuffBorderColor" then
		for i=0,15 do
			if VCB_SAVE[VCB_BF_COLOR_TAR] then
				if i < 3 then
					getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Border"):SetVertexColor(VCB_SAVE["DBF_BORDER_nonecolor_r"],VCB_SAVE["DBF_BORDER_nonecolor_g"],VCB_SAVE["DBF_BORDER_nonecolor_b"],VCB_SAVE["DBF_BORDER_borderopacity"])
				elseif i >= 3 and i < 6 then
					getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Border"):SetVertexColor(VCB_SAVE["DBF_BORDER_poisoncolor_r"],VCB_SAVE["DBF_BORDER_poisoncolor_g"],VCB_SAVE["DBF_BORDER_poisoncolor_b"],VCB_SAVE["DBF_BORDER_borderopacity"])
				elseif i >= 6 and i < 9 then
					getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Border"):SetVertexColor(VCB_SAVE["DBF_BORDER_magiccolor_r"],VCB_SAVE["DBF_BORDER_magiccolor_g"],VCB_SAVE["DBF_BORDER_magiccolor_b"],VCB_SAVE["DBF_BORDER_borderopacity"])
				elseif i >= 9 and i < 12 then
					getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Border"):SetVertexColor(VCB_SAVE["DBF_BORDER_cursecolor_r"],VCB_SAVE["DBF_BORDER_cursecolor_g"],VCB_SAVE["DBF_BORDER_cursecolor_b"],VCB_SAVE["DBF_BORDER_borderopacity"])
				else
					getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Border"):SetVertexColor(VCB_SAVE["DBF_BORDER_diseasecolor_r"],VCB_SAVE["DBF_BORDER_diseasecolor_g"],VCB_SAVE["DBF_BORDER_diseasecolor_b"],VCB_SAVE["DBF_BORDER_borderopacity"])
				end
			end
		end
	end
end

function VCB_BF_OpenColorPicker(obj, var, tar, type)
	VCB_BF_COLOR_OBJ = obj
	VCB_BF_COLOR_VAR = var
	VCB_BF_COLOR_TAR = tar
	VCB_BF_COLOR_TYPE = type
	
	CloseMenus();
	
	button = getglobal(obj:GetName().."_SwatchBg");

	ColorPickerFrame.func = VCB_BF_OptionsFrame_SetColor -- button.swatchFunc;
	ColorPickerFrame:SetColorRGB(button.r, button.g, button.b);
	ColorPickerFrame.previousValues = {r = button.r, g = button.g, b = button.b, opacity = button.opacity};
	ColorPickerFrame.cancelFunc = VCB_BF_OptionsFrame_CancelColor

	ColorPickerFrame:SetPoint("TOPLEFT", obj, "TOPRIGHT", 0, 0)
	
	ColorPickerFrame:SetFrameStrata("TOOLTIP")

	ColorPickerFrame:Show();
end
---------------------------------------OPTION FRAME END-----------------------------------------------------


---------------------------------------START BUFF FRAME-----------------------------------------------------
function VCB_BF_BF_FRAME_VERTICAL_MODE()
	if VCB_SAVE["BF_GENERAL_verticalmode"] then
		VCB_SAVE["BF_GENERAL_verticalmode"] = false
		if VCB_SAVE["WP_GENERAL_attach"] and VCB_SAVE["WP_GENERAL_verticalmode"] then
			VCB_BF_WP_FRAME_VERTICAL_MODE()
		end
	else
		VCB_SAVE["BF_GENERAL_verticalmode"] = true
		if VCB_SAVE["WP_GENERAL_attach"] and (not VCB_SAVE["WP_GENERAL_verticalmode"]) then
			VCB_BF_WP_FRAME_VERTICAL_MODE()
		end
	end
	VCB_BF_WEAPON_BUTTON_OnEvent(false)
	VCB_BF_RepositioningAndResizing()
end

function VCB_BF_BF_FRAME_NumPerRowSlider_CHANGE(obj)
	VCB_SAVE["BF_GENERAL_numperrow"] = obj:GetValue()
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_BUFFS_PER_ROW..": "..VCB_SAVE["BF_GENERAL_numperrow"])
	VCB_BF_RepositioningAndResizing()
end

function VCB_BF_BF_FRAME_AuraPaddingHChange(obj)
	VCB_SAVE["BF_GENERAL_padding_h"] = obj:GetValue()
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_PADDING_H..": "..VCB_SAVE["BF_GENERAL_padding_h"])
	if VCB_SAVE["WP_GENERAL_attach"] and (not VCB_SAVE["WP_GENERAL_verticalmode"]) then
		for i=0,1 do
			getglobal("VCB_BF_WEAPON_BUTTON"..i):ClearAllPoints()
			if VCB_SAVE["BF_GENERAL_invertorientation"] then
				getglobal("VCB_BF_WEAPON_BUTTON"..i):SetPoint("TOPLEFT", (32+VCB_SAVE["BF_GENERAL_padding_h"])*i, 0)
			else
				getglobal("VCB_BF_WEAPON_BUTTON"..i):SetPoint("TOPRIGHT", -(32+VCB_SAVE["BF_GENERAL_padding_h"])*i, 0)
			end
		end
	end
	VCB_BF_RepositioningAndResizing()
end

function VCB_BF_BF_FRAME_AuraPaddingVChange(obj)
	VCB_SAVE["BF_GENERAL_padding_v"] = obj:GetValue()
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_PADDING_V..": "..VCB_SAVE["BF_GENERAL_padding_v"])
	if VCB_SAVE["WP_GENERAL_attach"] and VCB_SAVE["WP_GENERAL_verticalmode"] then
		for i=0,1 do
			getglobal("VCB_BF_WEAPON_BUTTON"..i):ClearAllPoints()
			if VCB_SAVE["BF_GENERAL_invertorientation"] then
				getglobal("VCB_BF_WEAPON_BUTTON"..i):SetPoint("TOPLEFT", 0, -(44+VCB_SAVE["BF_GENERAL_padding_v"])*i)
			else
				getglobal("VCB_BF_WEAPON_BUTTON"..i):SetPoint("TOPRIGHT", 0, -(44+VCB_SAVE["BF_GENERAL_padding_v"])*i)
			end
		end
	end
	VCB_BF_RepositioningAndResizing()
end

function VCB_BF_BF_FRAME_ScaleSliderChange(obj)
	VCB_SAVE["BF_GENERAL_scale"] = string.format("%.1f", obj:GetValue())
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_SCALE..": "..VCB_SAVE["BF_GENERAL_scale"])
	VCB_BF_BUFF_FRAME:SetScale(VCB_SAVE["BF_GENERAL_scale"])
end

function VCB_BF_BF_FRAME_BGOpaSliderChange(obj)
	VCB_SAVE["BF_GENERAL_bgopacity"] = string.format("%.1f", obj:GetValue())
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_BACKGROUND_OPACITY..": "..VCB_SAVE["BF_GENERAL_bgopacity"])
	for i=0, VCB_MAXINDEX["buff"] do
		if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_BUFF_FRAME then
			getglobal("VCB_BF_BUFF_BUTTON"..i):SetAlpha(VCB_SAVE["BF_GENERAL_bgopacity"])
		end
	end
end

function VCB_BF_BF_FRAME_ENABLE_BGCOLOR()
	if VCB_SAVE["BF_GENERAL_enablebgcolor"] then
		VCB_SAVE["BF_GENERAL_enablebgcolor"] = false
		for i=0, VCB_MAXINDEX["buff"] do
			if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_BUFF_FRAME then
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Icon"):SetVertexColor(1,1,1,VCB_SAVE["BF_GENERAL_bgopacity"])
			end
		end
	else
		VCB_SAVE["BF_GENERAL_enablebgcolor"] = true
		for i=0, VCB_MAXINDEX["buff"] do
			if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_BUFF_FRAME then
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Icon"):SetVertexColor(VCB_SAVE["BF_GENERAL_bgcolor_r"],VCB_SAVE["BF_GENERAL_bgcolor_g"],VCB_SAVE["BF_GENERAL_bgcolor_b"],VCB_SAVE["BF_GENERAL_bgopacity"])
			end
		end
	end
end

function VCB_BF_BF_FRAME_ENABLE_BORDER()
	if VCB_SAVE["BF_BORDER_enableborder"] then
		VCB_SAVE["BF_BORDER_enableborder"] = false
		for i=0, VCB_MAXINDEX["buff"] do
			if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_BUFF_FRAME then
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Border"):SetTexture(nil)
			end
		end
	else
		VCB_SAVE["BF_BORDER_enableborder"] = true
		for i=0, VCB_MAXINDEX["buff"] do
			if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_BUFF_FRAME then
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Border"):SetTexture(nil)
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Border"):SetTexture(VCB_AURABORDER_ARRAY[VCB_SAVE["BF_BORDER_border"]])
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Border"):SetVertexColor(VCB_SAVE["BF_BORDER_bordercolor_r"],VCB_SAVE["BF_BORDER_bordercolor_g"],VCB_SAVE["BF_BORDER_bordercolor_b"],VCB_SAVE["BF_BORDER_borderopacity"])
			end
		end
	end
end

function VCB_BF_BF_FRAME_BorderOpacityChange(obj)
	VCB_SAVE["BF_BORDER_borderopacity"] = string.format("%.1f", obj:GetValue())
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_BACKGROUND_OPACITY..": "..VCB_SAVE["BF_BORDER_borderopacity"])
	if VCB_SAVE["BF_BORDER_enableborder"] then
		for i=0, VCB_MAXINDEX["buff"] do
			if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_BUFF_FRAME then
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Border"):SetAlpha(VCB_SAVE["BF_BORDER_borderopacity"])
			end
		end
	end
end

function VCB_BF_BF_FRAME_BorderChange(obj)
	VCB_SAVE["BF_BORDER_border"] = obj:GetValue()
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_BORDER..": "..VCB_SAVE["BF_BORDER_border"])
	if VCB_SAVE["BF_BORDER_enableborder"] then
		for i=0, VCB_MAXINDEX["buff"] do
			if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_BUFF_FRAME then
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Border"):SetTexture(nil)
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Border"):SetTexture(VCB_AURABORDER_ARRAY[VCB_SAVE["BF_BORDER_border"]])
				getglobal("VCB_BF_BUFF_BUTTON"..i.."Border"):SetVertexColor(VCB_SAVE["BF_BORDER_bordercolor_r"],VCB_SAVE["BF_BORDER_bordercolor_g"],VCB_SAVE["BF_BORDER_bordercolor_b"],VCB_SAVE["BF_BORDER_borderopacity"])
			end
		end
	end
end

--240630 quoted out

function VCB_BF_BF_FRAME_TIMER_ENABLE_BORDER()
	if VCB_SAVE["BF_TIMER_border"] then
		VCB_SAVE["BF_TIMER_border"] = false
		for i=0, VCB_MAXINDEX["buff"] do
			if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_BUFF_FRAME then
				if VCB_SAVE["Timer_usecfont"] then
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Duration"):SetFont(VCB_SAVE["Timer_customfont"], VCB_SAVE["BF_TIMER_fontsize"])
				else
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Duration"):SetFont(VCB_SAVE["Timer_font"], VCB_SAVE["BF_TIMER_fontsize"])
				end
			end
		end
	else
		VCB_SAVE["BF_TIMER_border"] = true
		for i=0, VCB_MAXINDEX["buff"] do
			if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_BUFF_FRAME then
				if VCB_SAVE["Timer_usecfont"] then
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Duration"):SetFont(VCB_SAVE["Timer_customfont"], VCB_SAVE["BF_TIMER_fontsize"], "OUTLINE")
				else
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Duration"):SetFont(VCB_SAVE["Timer_font"], VCB_SAVE["BF_TIMER_fontsize"], "OUTLINE")
				end
			end
		end
	end
end

function VCB_BF_BF_FRAME_FontSizeChange(obj)
	VCB_SAVE["BF_TIMER_fontsize"] = obj:GetValue()
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_FONT_SIZE..": "..VCB_SAVE["BF_TIMER_fontsize"])
	for i=0, VCB_MAXINDEX["buff"] do
		if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_BUFF_FRAME then
			if VCB_SAVE["BF_TIMER_border"] then
				if VCB_SAVE["Timer_usecfont"] then
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Duration"):SetFont(VCB_SAVE["Timer_customfont"], VCB_SAVE["BF_TIMER_fontsize"], "OUTLINE")
				else
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Duration"):SetFont(VCB_SAVE["Timer_font"], VCB_SAVE["BF_TIMER_fontsize"], "OUTLINE")
				end
			else
				if VCB_SAVE["Timer_usecfont"] then
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Duration"):SetFont(VCB_SAVE["Timer_customfont"], VCB_SAVE["BF_TIMER_fontsize"])
				else
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Duration"):SetFont(VCB_SAVE["Timer_font"], VCB_SAVE["BF_TIMER_fontsize"])
				end
			end
		end
	end
end

function VCB_BF_BF_FRAME_FontOpacityChange(obj)
	VCB_SAVE["BF_TIMER_fontopacity"] = string.format("%.1f", obj:GetValue())
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_FONT_OPACITY..": "..VCB_SAVE["BF_TIMER_fontopacity"])
	for i=0, VCB_MAXINDEX["buff"] do
		if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_BUFF_FRAME then
			getglobal("VCB_BF_BUFF_BUTTON"..i.."Duration"):SetAlpha(VCB_SAVE["BF_TIMER_fontopacity"])
		end
	end
end

--240630 quoted out

function VCB_BF_BF_FRAME_G_ENABLE_BORDER()
	if VCB_SAVE["BF_GENERAL_enableborder"] then
		VCB_SAVE["BF_GENERAL_enableborder"] = false
		for i=0, VCB_MAXINDEX["buff"] do
			if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_BUFF_FRAME then
				if VCB_SAVE["BF_GENERAL_usecfont"] then
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["BF_GENERAL_customfont"], VCB_SAVE["BF_GENERAL_fontsize"])
				else
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["BF_GENERAL_font"], VCB_SAVE["BF_GENERAL_fontsize"])
				end
			end
		end
	else
		VCB_SAVE["BF_GENERAL_enableborder"] = true
		for i=0, VCB_MAXINDEX["buff"] do
			if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_BUFF_FRAME then
				if VCB_SAVE["BF_GENERAL_usecfont"] then
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["BF_GENERAL_customfont"], VCB_SAVE["BF_GENERAL_fontsize"], "OUTLINE")
				else
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["BF_GENERAL_font"], VCB_SAVE["BF_GENERAL_fontsize"], "OUTLINE")
				end
			end
		end
	end
end

function VCB_BF_BF_FRAME_GFontSizeSliderChange(obj)
	VCB_SAVE["BF_GENERAL_fontsize"] = obj:GetValue()
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_FONT_SIZE..": "..VCB_SAVE["BF_GENERAL_fontsize"])
	for i=0, VCB_MAXINDEX["buff"] do
		if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_BUFF_FRAME then
			if VCB_SAVE["BF_GENERAL_enableborder"] then
				if VCB_SAVE["BF_GENERAL_usecfont"] then
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["BF_GENERAL_customfont"], VCB_SAVE["BF_GENERAL_fontsize"], "OUTLINE")
				else
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["BF_GENERAL_font"], VCB_SAVE["BF_GENERAL_fontsize"], "OUTLINE")
				end
			else
				if VCB_SAVE["BF_GENERAL_usecfont"] then
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["BF_GENERAL_customfont"], VCB_SAVE["BF_GENERAL_fontsize"])
				else
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["BF_GENERAL_font"], VCB_SAVE["BF_GENERAL_fontsize"])
				end
			end
		end
	end
end

function VCB_BF_BF_FRAME_GFontOffsetXSliderChange(obj)
	VCB_SAVE["BF_GENERAL_fontoffset_x"] = obj:GetValue()
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_FONT_OFFSET_X..": "..VCB_SAVE["BF_GENERAL_fontoffset_x"])
	for i=0, VCB_MAXINDEX["buff"] do
		if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_BUFF_FRAME then
			getglobal("VCB_BF_BUFF_BUTTON"..i.."Count"):ClearAllPoints()
			getglobal("VCB_BF_BUFF_BUTTON"..i.."Count"):SetPoint("BOTTOMRIGHT", VCB_SAVE["BF_GENERAL_fontoffset_x"],VCB_SAVE["BF_GENERAL_fontoffset_y"])
		end
	end
end

function VCB_BF_BF_FRAME_GFontOffsetYSliderChange(obj)
	VCB_SAVE["BF_GENERAL_fontoffset_y"] = obj:GetValue()
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_FONT_OFFSET_Y..": "..VCB_SAVE["BF_GENERAL_fontoffset_y"])
	for i=0, VCB_MAXINDEX["buff"] do
		if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_BUFF_FRAME then
			getglobal("VCB_BF_BUFF_BUTTON"..i.."Count"):ClearAllPoints()
			getglobal("VCB_BF_BUFF_BUTTON"..i.."Count"):SetPoint("BOTTOMRIGHT", VCB_SAVE["BF_GENERAL_fontoffset_x"],VCB_SAVE["BF_GENERAL_fontoffset_y"])
		end
	end
end

function VCB_BF_BF_FRAME_GFontSliderChange(obj)
	VCB_SAVE["BF_GENERAL_font"] = VCB_FONT_ARRAY[obj:GetValue()]
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_FONT..": "..VCB_SAVE["BF_GENERAL_font"])
	if (not VCB_SAVE["BF_GENERAL_usecfont"]) then
		for i=0, VCB_MAXINDEX["buff"] do
			if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_BUFF_FRAME then
				if VCB_SAVE["BF_GENERAL_enableborder"] then
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["BF_GENERAL_font"], VCB_SAVE["BF_GENERAL_fontsize"], "OUTLINE")
				else
					getglobal("VCB_BF_BUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["BF_GENERAL_font"], VCB_SAVE["BF_GENERAL_fontsize"])
				end
			end
		end
	end
end

function VCB_BF_BF_FRAME_GFontOpacitySliderChange(obj)
	VCB_SAVE["BF_GENERAL_fontopacity"] = string.format("%.1f", obj:GetValue())
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_FONT_OPACITY..": "..VCB_SAVE["BF_GENERAL_fontopacity"])
	for i=0, VCB_MAXINDEX["buff"] do
		if getglobal("VCB_BF_BUFF_BUTTON"..i):GetParent() == VCB_BF_BUFF_FRAME then
			getglobal("VCB_BF_BUFF_BUTTON"..i.."Count"):SetAlpha(VCB_SAVE["BF_GENERAL_fontopacity"])
		end
	end
end

function VCB_BF_BF_FRAME_INVERTBUFFMODE()
	if VCB_SAVE["BF_GENERAL_invert"] then
		VCB_SAVE["BF_GENERAL_invert"] = false
	else
		VCB_SAVE["BF_GENERAL_invert"] = true
	end
	VCB_BF_RepositioningAndResizing()
end

function VCB_BF_BF_FRAME_INVERT_AURA_ORIENTATION()
	if VCB_SAVE["BF_GENERAL_invertorientation"] then
		VCB_SAVE["BF_GENERAL_invertorientation"] = false
	else
		VCB_SAVE["BF_GENERAL_invertorientation"] = true
	end
	VCB_BF_WEAPON_BUTTON_OnEvent(false)
	VCB_BF_RepositioningAndResizing()
end

--240630 quoted out

---------------------------------------END BUFF FRAME-------------------------------------------------------

---------------------------------------START DEBUFF FRAME---------------------------------------------------
function VCB_BF_DBF_FRAME_VERTICAL_MODE()
	if VCB_SAVE["DBF_GENERAL_verticalmode"] then
		VCB_SAVE["DBF_GENERAL_verticalmode"] = false
		for i=0,15 do
			if VCB_SAVE["DBF_GENERAL_invertorientation"] then
				if VCB_SAVE["DBF_GENERAL_invert"] then
					local j = 15-i
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):ClearAllPoints()
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):SetPoint("TOPLEFT", (32+VCB_SAVE["DBF_GENERAL_padding_h"])*i - floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(32+VCB_SAVE["DBF_GENERAL_padding_h"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]))
				else
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):ClearAllPoints()
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):SetPoint("TOPRIGHT", (32+VCB_SAVE["DBF_GENERAL_padding_h"])*i - floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(32+VCB_SAVE["DBF_GENERAL_padding_h"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]))
				end
			else
				if VCB_SAVE["DBF_GENERAL_invert"] then
					local j = 15-i
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):ClearAllPoints()
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):SetPoint("TOPRIGHT", -(32+VCB_SAVE["DBF_GENERAL_padding_h"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(32+VCB_SAVE["DBF_GENERAL_padding_h"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]))
				else
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):ClearAllPoints()
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):SetPoint("TOPRIGHT", -(32+VCB_SAVE["DBF_GENERAL_padding_h"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(32+VCB_SAVE["DBF_GENERAL_padding_h"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]))
				end
			end
		end
	else
		VCB_SAVE["DBF_GENERAL_verticalmode"] = true
		for i=0,15 do
			if VCB_SAVE["DBF_GENERAL_invertorientation"] then
				if VCB_SAVE["DBF_GENERAL_invert"] then
					local j = 15-i
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):ClearAllPoints()
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):SetPoint("TOPLEFT", (32+VCB_SAVE["DBF_GENERAL_padding_h"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(44+VCB_SAVE["DBF_GENERAL_padding_v"]))
				else
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):ClearAllPoints()
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):SetPoint("TOPLEFT", (32+VCB_SAVE["DBF_GENERAL_padding_h"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(44+VCB_SAVE["DBF_GENERAL_padding_v"]))
				end
			else
				if VCB_SAVE["DBF_GENERAL_invert"] then
					local j = 15-i
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):ClearAllPoints()
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):SetPoint("TOPRIGHT", -(32+VCB_SAVE["DBF_GENERAL_padding_h"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(44+VCB_SAVE["DBF_GENERAL_padding_v"]))
				else
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):ClearAllPoints()
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):SetPoint("TOPRIGHT", -(32+VCB_SAVE["DBF_GENERAL_padding_h"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(44+VCB_SAVE["DBF_GENERAL_padding_v"]))
				end
			end
		end
	end
end

function VCB_BF_DBF_FRAME_NumPerRowSliderChange(obj)
	VCB_SAVE["DBF_GENERAL_numperrow"] = obj:GetValue()
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_BUFFS_PER_ROW..": "..VCB_SAVE["DBF_GENERAL_numperrow"])
	for i=0,15 do
		if VCB_SAVE["DBF_GENERAL_invertorientation"] then
			if VCB_SAVE["DBF_GENERAL_verticalmode"] then
				if VCB_SAVE["DBF_GENERAL_invert"] then
					local j = 15-i
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):ClearAllPoints()
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):SetPoint("TOPLEFT", (32+VCB_SAVE["DBF_GENERAL_padding_h"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(44+VCB_SAVE["DBF_GENERAL_padding_v"]))
				else
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):ClearAllPoints()
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):SetPoint("TOPLEFT", (32+VCB_SAVE["DBF_GENERAL_padding_h"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(44+VCB_SAVE["DBF_GENERAL_padding_v"]))
				end
			else
				if VCB_SAVE["DBF_GENERAL_invert"] then
					local j = 15-i
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):ClearAllPoints()
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):SetPoint("TOPLEFT", (32+VCB_SAVE["DBF_GENERAL_padding_h"])*i - floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(32+VCB_SAVE["DBF_GENERAL_padding_h"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]))
				else
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):ClearAllPoints()
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):SetPoint("TOPLEFT", (32+VCB_SAVE["DBF_GENERAL_padding_h"])*i - floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(32+VCB_SAVE["DBF_GENERAL_padding_h"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]))
				end
			end
		else
			if VCB_SAVE["DBF_GENERAL_verticalmode"] then
				if VCB_SAVE["DBF_GENERAL_invert"] then
					local j = 15-i
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):ClearAllPoints()
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):SetPoint("TOPRIGHT", -(32+VCB_SAVE["DBF_GENERAL_padding_h"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(44+VCB_SAVE["DBF_GENERAL_padding_v"]))
				else
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):ClearAllPoints()
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):SetPoint("TOPRIGHT", -(32+VCB_SAVE["DBF_GENERAL_padding_h"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(44+VCB_SAVE["DBF_GENERAL_padding_v"]))
				end
			else
				if VCB_SAVE["DBF_GENERAL_invert"] then
					local j = 15-i
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):ClearAllPoints()
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):SetPoint("TOPRIGHT", -(32+VCB_SAVE["DBF_GENERAL_padding_h"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(32+VCB_SAVE["DBF_GENERAL_padding_h"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]))
				else
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):ClearAllPoints()
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):SetPoint("TOPRIGHT", -(32+VCB_SAVE["DBF_GENERAL_padding_h"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(32+VCB_SAVE["DBF_GENERAL_padding_h"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]))
				end
			end
		end
	end
end

function VCB_BF_DBF_FRAME_AuraPaddingHSliderChange(obj)
	VCB_SAVE["DBF_GENERAL_padding_h"] = obj:GetValue()
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_PADDING_H..": "..VCB_SAVE["DBF_GENERAL_padding_h"])
	for i=0,15 do
		if VCB_SAVE["DBF_GENERAL_invertorientation"] then
			if VCB_SAVE["DBF_GENERAL_verticalmode"] then
				if VCB_SAVE["DBF_GENERAL_invert"] then
					local j = 15-i
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):ClearAllPoints()
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):SetPoint("TOPLEFT", (32+VCB_SAVE["DBF_GENERAL_padding_h"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(44+VCB_SAVE["DBF_GENERAL_padding_v"]))
				else
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):ClearAllPoints()
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):SetPoint("TOPLEFT", (32+VCB_SAVE["DBF_GENERAL_padding_h"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(44+VCB_SAVE["DBF_GENERAL_padding_v"]))
				end
			else
				if VCB_SAVE["DBF_GENERAL_invert"] then
					local j = 15-i
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):ClearAllPoints()
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):SetPoint("TOPLEFT", (32+VCB_SAVE["DBF_GENERAL_padding_h"])*i - floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(32+VCB_SAVE["DBF_GENERAL_padding_h"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]))
				else
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):ClearAllPoints()
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):SetPoint("TOPLEFT", (32+VCB_SAVE["DBF_GENERAL_padding_h"])*i - floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(32+VCB_SAVE["DBF_GENERAL_padding_h"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]))
				end
			end
		else
			if VCB_SAVE["DBF_GENERAL_verticalmode"] then
				if VCB_SAVE["DBF_GENERAL_invert"] then
					local j = 15-i
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):ClearAllPoints()
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):SetPoint("TOPRIGHT", -(32+VCB_SAVE["DBF_GENERAL_padding_h"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(44+VCB_SAVE["DBF_GENERAL_padding_v"]))
				else
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):ClearAllPoints()
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):SetPoint("TOPRIGHT", -(32+VCB_SAVE["DBF_GENERAL_padding_h"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(44+VCB_SAVE["DBF_GENERAL_padding_v"]))
				end
			else
				if VCB_SAVE["DBF_GENERAL_invert"] then
					local j = 15-i
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):ClearAllPoints()
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):SetPoint("TOPRIGHT", -(32+VCB_SAVE["DBF_GENERAL_padding_h"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(32+VCB_SAVE["DBF_GENERAL_padding_h"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]))
				else
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):ClearAllPoints()
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):SetPoint("TOPRIGHT", -(32+VCB_SAVE["DBF_GENERAL_padding_h"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(32+VCB_SAVE["DBF_GENERAL_padding_h"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]))
				end
			end
		end
	end
end

function VCB_BF_DBF_FRAME_AuraPaddingVSliderChange(obj)
	VCB_SAVE["DBF_GENERAL_padding_v"] = obj:GetValue()
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_PADDING_V..": "..VCB_SAVE["DBF_GENERAL_padding_v"])
	for i=0,15 do
		if VCB_SAVE["DBF_GENERAL_invertorientation"] then
			if VCB_SAVE["DBF_GENERAL_verticalmode"] then
				if VCB_SAVE["DBF_GENERAL_invert"] then
					local j = 15-i
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):ClearAllPoints()
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):SetPoint("TOPLEFT", (32+VCB_SAVE["DBF_GENERAL_padding_h"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(44+VCB_SAVE["DBF_GENERAL_padding_v"]))
				else
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):ClearAllPoints()
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):SetPoint("TOPLEFT", (32+VCB_SAVE["DBF_GENERAL_padding_h"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(44+VCB_SAVE["DBF_GENERAL_padding_v"]))
				end
			else
				if VCB_SAVE["DBF_GENERAL_invert"] then
					local j = 15-i
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):ClearAllPoints()
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):SetPoint("TOPLEFT", (32+VCB_SAVE["DBF_GENERAL_padding_h"])*i - floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(32+VCB_SAVE["DBF_GENERAL_padding_h"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]))
				else
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):ClearAllPoints()
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):SetPoint("TOPLEFT", (32+VCB_SAVE["DBF_GENERAL_padding_h"])*i - floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(32+VCB_SAVE["DBF_GENERAL_padding_h"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]))
				end
			end
		else
			if VCB_SAVE["DBF_GENERAL_verticalmode"] then
				if VCB_SAVE["DBF_GENERAL_invert"] then
					local j = 15-i
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):ClearAllPoints()
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):SetPoint("TOPRIGHT", -(32+VCB_SAVE["DBF_GENERAL_padding_h"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(44+VCB_SAVE["DBF_GENERAL_padding_v"]))
				else
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):ClearAllPoints()
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):SetPoint("TOPRIGHT", -(32+VCB_SAVE["DBF_GENERAL_padding_h"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(44+VCB_SAVE["DBF_GENERAL_padding_v"]))
				end
			else
				if VCB_SAVE["DBF_GENERAL_invert"] then
					local j = 15-i
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):ClearAllPoints()
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):SetPoint("TOPRIGHT", -(32+VCB_SAVE["DBF_GENERAL_padding_h"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(32+VCB_SAVE["DBF_GENERAL_padding_h"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]))
				else
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):ClearAllPoints()
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):SetPoint("TOPRIGHT", -(32+VCB_SAVE["DBF_GENERAL_padding_h"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(32+VCB_SAVE["DBF_GENERAL_padding_h"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]))
				end
			end
		end
	end
end

function VCB_BF_DBF_FRAME_BGOpaSliderChange(obj)
	VCB_SAVE["DBF_GENERAL_bgopacity"] = string.format("%.1f", obj:GetValue())
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_BACKGROUND_OPACITY..": "..VCB_SAVE["DBF_GENERAL_bgopacity"])
	for i=0,15 do
		getglobal("VCB_BF_DEBUFF_BUTTON"..i):SetAlpha(VCB_SAVE["DBF_GENERAL_bgopacity"])
	end
end

function VCB_BF_DBF_FRAME_ScaleSliderChange(obj)
	VCB_SAVE["DBF_GENERAL_scale"] = string.format("%.1f", obj:GetValue())
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_SCALE..": "..VCB_SAVE["DBF_GENERAL_scale"])
	VCB_BF_DEBUFF_FRAME:SetScale(VCB_SAVE["DBF_GENERAL_scale"])
end

function VCB_BF_DBF_FRAME_ENABLE_BGCOLOR()
	if VCB_SAVE["DBF_GENERAL_enablebgcolor"] then
		VCB_SAVE["DBF_GENERAL_enablebgcolor"] = false
		for i=0,15 do
			getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Icon"):SetVertexColor(1,1,1,VCB_SAVE["DBF_GENERAL_bgopacity"])
		end
	else
		VCB_SAVE["DBF_GENERAL_enablebgcolor"] = true
		for i=0,15 do
			getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Icon"):SetVertexColor(VCB_SAVE["DBF_GENERAL_bgcolor_r"],VCB_SAVE["DBF_GENERAL_bgcolor_g"],VCB_SAVE["DBF_GENERAL_bgcolor_b"],VCB_SAVE["DBF_GENERAL_bgopacity"])
		end
	end
end

function VCB_BF_DBF_FRAME_ENABLE_BORDER()
	if VCB_SAVE["DBF_BORDER_enableborder"] then
		VCB_SAVE["DBF_BORDER_enableborder"] = false
		for i=0,15 do
			getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Border"):SetTexture(nil)
		end
	else
		VCB_SAVE["DBF_BORDER_enableborder"] = true
		for i=0,15 do
			getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Border"):SetTexture(nil)
			if VCB_SAVE["DBF_BORDER_usecustomborder"] then
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Border"):SetTexture(VCB_SAVE["DBF_BORDER_customborderpath"])
			else
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Border"):SetTexture(VCB_AURABORDER_ARRAY[VCB_SAVE["DBF_BORDER_border"]])
			end
			if i < 3 then
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Border"):SetVertexColor(VCB_SAVE["DBF_BORDER_nonecolor_r"],VCB_SAVE["DBF_BORDER_nonecolor_g"],VCB_SAVE["DBF_BORDER_nonecolor_b"],VCB_SAVE["DBF_BORDER_borderopacity"])
			elseif i >= 3 and i < 6 then
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Border"):SetVertexColor(VCB_SAVE["DBF_BORDER_poisoncolor_r"],VCB_SAVE["DBF_BORDER_poisoncolor_g"],VCB_SAVE["DBF_BORDER_poisoncolor_b"],VCB_SAVE["DBF_BORDER_borderopacity"])
			elseif i >= 6 and i < 9 then
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Border"):SetVertexColor(VCB_SAVE["DBF_BORDER_magiccolor_r"],VCB_SAVE["DBF_BORDER_magiccolor_g"],VCB_SAVE["DBF_BORDER_magiccolor_b"],VCB_SAVE["DBF_BORDER_borderopacity"])
			elseif i >= 9 and i < 12 then
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Border"):SetVertexColor(VCB_SAVE["DBF_BORDER_cursecolor_r"],VCB_SAVE["DBF_BORDER_cursecolor_g"],VCB_SAVE["DBF_BORDER_cursecolor_b"],VCB_SAVE["DBF_BORDER_borderopacity"])
			else
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Border"):SetVertexColor(VCB_SAVE["DBF_BORDER_diseasecolor_r"],VCB_SAVE["DBF_BORDER_diseasecolor_g"],VCB_SAVE["DBF_BORDER_diseasecolor_b"],VCB_SAVE["DBF_BORDER_borderopacity"])
			end
		end
	end
end

--240630 quoted out

function VCB_BF_DBF_FRAME_BorderSliderChange(obj)
	VCB_SAVE["DBF_BORDER_border"] = obj:GetValue()
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_BORDER..": "..VCB_SAVE["DBF_BORDER_border"])
	if VCB_SAVE["DBF_BORDER_enableborder"] and (not VCB_SAVE["DBF_BORDER_usecustomborder"]) then
		for i=0,15 do
			getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Border"):SetTexture(nil)
			getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Border"):SetTexture(VCB_AURABORDER_ARRAY[VCB_SAVE["DBF_BORDER_border"]])
		end
	end
end

function VCB_BF_DBF_FRAME_ENABLE_FONTBORDER()
	if VCB_SAVE["DBF_TIMER_enableborder"] then
		VCB_SAVE["DBF_TIMER_enableborder"] = false
		for i=0,15 do
			if VCB_SAVE["Timer_usecfont"] then
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Duration"):SetFont(VCB_SAVE["Timer_customfont"], VCB_SAVE["DBF_TIMER_fontsize"])
			else
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Duration"):SetFont(VCB_SAVE["Timer_font"], VCB_SAVE["DBF_TIMER_fontsize"])
			end
		end
	else
		VCB_SAVE["DBF_TIMER_enableborder"] = true
		for i=0,15 do
			if VCB_SAVE["Timer_usecfont"] then
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Duration"):SetFont(VCB_SAVE["Timer_customfont"], VCB_SAVE["DBF_TIMER_fontsize"], "OUTLINE")
			else
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Duration"):SetFont(VCB_SAVE["Timer_font"], VCB_SAVE["DBF_TIMER_fontsize"], "OUTLINE")
			end
		end
	end
end

function VCB_BF_DBF_FRAME_FontSizeSliderChange(obj)
	VCB_SAVE["DBF_TIMER_fontsize"] = obj:GetValue()
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_FONT_SIZE..": "..VCB_SAVE["DBF_TIMER_fontsize"])
	for i=0,15 do
		if VCB_SAVE["DBF_TIMER_enableborder"] then
			if VCB_SAVE["Timer_usecfont"] then
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Duration"):SetFont(VCB_SAVE["Timer_customfont"], VCB_SAVE["DBF_TIMER_fontsize"], "OUTLINE")
			else
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Duration"):SetFont(VCB_SAVE["Timer_font"], VCB_SAVE["DBF_TIMER_fontsize"], "OUTLINE")
			end
		else
			if VCB_SAVE["Timer_usecfont"] then
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Duration"):SetFont(VCB_SAVE["Timer_customfont"], VCB_SAVE["DBF_TIMER_fontsize"])
			else
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Duration"):SetFont(VCB_SAVE["Timer_font"], VCB_SAVE["DBF_TIMER_fontsize"])
			end
		end
	end
end

function VCB_BF_DBF_FRAME_FontOpacitySliderChange(obj)
	VCB_SAVE["DBF_TIMER_fontopacity"] = string.format("%.1f", obj:GetValue())
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_FONT_OPACITY..": "..VCB_SAVE["DBF_TIMER_fontopacity"])
	for i=0,15 do
		getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Duration"):SetAlpha(VCB_SAVE["DBF_TIMER_fontopacity"])
	end
end

function VCB_BF_DBF_FRAME_BorderOpacitySliderChange(obj)
	VCB_SAVE["DBF_BORDER_borderopacity"] = string.format("%.1f", obj:GetValue())
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_BACKGROUND_OPACITY..": "..VCB_SAVE["DBF_BORDER_borderopacity"])
	for i=0,15 do
		getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Border"):SetAlpha(VCB_SAVE["DBF_BORDER_borderopacity"])
	end
end

--240630 quoted out

function VCB_BF_DBF_FRAME_G_ENABLE_BORDER()
	if VCB_SAVE["DBF_GENERAL_enableborder"] then
		VCB_SAVE["DBF_GENERAL_enableborder"] = false
		for i=0, 15 do
			if VCB_SAVE["DBF_GENERAL_usecfont"] then
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["DBF_GENERAL_customfont"], VCB_SAVE["DBF_GENERAL_fontsize"])
			else
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["DBF_GENERAL_font"], VCB_SAVE["DBF_GENERAL_fontsize"])
			end
		end
	else
		VCB_SAVE["DBF_GENERAL_enableborder"] = true
		for i=0, 15 do
			if VCB_SAVE["DBF_GENERAL_usecfont"] then
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["DBF_GENERAL_customfont"], VCB_SAVE["DBF_GENERAL_fontsize"], "OUTLINE")
			else
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["DBF_GENERAL_font"], VCB_SAVE["DBF_GENERAL_fontsize"], "OUTLINE")
			end
		end
	end
end

function VCB_BF_DBF_FRAME_GFontSizeSliderChange(obj)
	VCB_SAVE["DBF_GENERAL_fontsize"] = obj:GetValue()
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_FONT_SIZE..": "..VCB_SAVE["DBF_GENERAL_fontsize"])
	for i=0, 15 do
		if VCB_SAVE["DBF_GENERAL_enableborder"] then
			if VCB_SAVE["DBF_GENERAL_usecfont"] then
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["DBF_GENERAL_customfont"], VCB_SAVE["DBF_GENERAL_fontsize"], "OUTLINE")
			else
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["DBF_GENERAL_font"], VCB_SAVE["DBF_GENERAL_fontsize"], "OUTLINE")
			end
		else
			if VCB_SAVE["DBF_GENERAL_usecfont"] then
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["DBF_GENERAL_customfont"], VCB_SAVE["DBF_GENERAL_fontsize"])
			else
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["DBF_GENERAL_font"], VCB_SAVE["DBF_GENERAL_fontsize"])
			end
		end
	end
end

function VCB_BF_DBF_FRAME_GFontOffsetXSliderChange(obj)
	VCB_SAVE["DBF_GENERAL_fontoffset_x"] = obj:GetValue()
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_FONT_OFFSET_X..": "..VCB_SAVE["DBF_GENERAL_fontoffset_x"])
	for i=0,15 do
		getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Count"):ClearAllPoints()
		getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Count"):SetPoint("BOTTOMRIGHT", VCB_SAVE["DBF_GENERAL_fontoffset_x"],VCB_SAVE["DBF_GENERAL_fontoffset_y"])
	end
end

function VCB_BF_DBF_FRAME_GFontOffsetYSliderChange(obj)
	VCB_SAVE["DBF_GENERAL_fontoffset_y"] = obj:GetValue()
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_FONT_OFFSET_Y..": "..VCB_SAVE["DBF_GENERAL_fontoffset_y"])
	for i=0,15 do
		getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Count"):ClearAllPoints()
		getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Count"):SetPoint("BOTTOMRIGHT", VCB_SAVE["DBF_GENERAL_fontoffset_x"],VCB_SAVE["DBF_GENERAL_fontoffset_y"])
	end
end

function VCB_BF_DBF_FRAME_GFontSliderChange(obj)
	VCB_SAVE["DBF_GENERAL_font"] = VCB_FONT_ARRAY[obj:GetValue()]
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_FONT..": "..VCB_SAVE["DBF_GENERAL_font"])
	if (not VCB_SAVE["DBF_GENERAL_usecfont"]) then
		for i=0, 15 do
			if VCB_SAVE["DBF_GENERAL_enableborder"] then
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["DBF_GENERAL_font"], VCB_SAVE["DBF_GENERAL_fontsize"], "OUTLINE")
			else
				getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Count"):SetFont(VCB_SAVE["DBF_GENERAL_font"], VCB_SAVE["DBF_GENERAL_fontsize"])
			end
		end
	end
end

function VCB_BF_DBF_FRAME_GFontOpacitySliderChange(obj)
	VCB_SAVE["DBF_GENERAL_fontopacity"] = string.format("%.1f", obj:GetValue())
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_FONT_OPACITY..": "..VCB_SAVE["DBF_GENERAL_fontopacity"])
	for i=0,15 do
		getglobal("VCB_BF_DEBUFF_BUTTON"..i.."Count"):SetAlpha(VCB_SAVE["DBF_GENERAL_fontopacity"])
	end
end

function VCB_BF_DBF_FRAME_INVERTBUFFORDER()
	if VCB_SAVE["DBF_GENERAL_invert"] then
		VCB_SAVE["DBF_GENERAL_invert"] = false
		for i=0,15 do
			getglobal("VCB_BF_DEBUFF_BUTTON"..i):ClearAllPoints()
			if VCB_SAVE["DBF_GENERAL_invertorientation"] then
				if VCB_SAVE["DBF_GENERAL_verticalmode"] then
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):SetPoint("TOPLEFT", (32+VCB_SAVE["DBF_GENERAL_padding_h"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(44+VCB_SAVE["DBF_GENERAL_padding_v"]))
				else
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):SetPoint("TOPLEFT", (32+VCB_SAVE["DBF_GENERAL_padding_h"])*i - floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(32+VCB_SAVE["DBF_GENERAL_padding_h"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]))
				end
			else
				if VCB_SAVE["DBF_GENERAL_verticalmode"] then
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):SetPoint("TOPRIGHT", -(32+VCB_SAVE["DBF_GENERAL_padding_h"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(44+VCB_SAVE["DBF_GENERAL_padding_v"]))
				else
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):SetPoint("TOPRIGHT", -(32+VCB_SAVE["DBF_GENERAL_padding_h"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(32+VCB_SAVE["DBF_GENERAL_padding_h"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]))
				end
			end
		end
	else
		VCB_SAVE["DBF_GENERAL_invert"] = true
		for i=0,15 do
			local j = 15-i
			getglobal("VCB_BF_DEBUFF_BUTTON"..j):ClearAllPoints()
			if VCB_SAVE["DBF_GENERAL_invertorientation"] then
				if VCB_SAVE["DBF_GENERAL_verticalmode"] then
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):SetPoint("TOPLEFT", (32+VCB_SAVE["DBF_GENERAL_padding_h"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(44+VCB_SAVE["DBF_GENERAL_padding_v"]))
				else
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):SetPoint("TOPLEFT", (32+VCB_SAVE["DBF_GENERAL_padding_h"])*i - floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(32+VCB_SAVE["DBF_GENERAL_padding_h"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]))
				end
			else
				if VCB_SAVE["DBF_GENERAL_verticalmode"] then
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):SetPoint("TOPRIGHT", -(32+VCB_SAVE["DBF_GENERAL_padding_h"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(44+VCB_SAVE["DBF_GENERAL_padding_v"]))
				else
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):SetPoint("TOPRIGHT", -(32+VCB_SAVE["DBF_GENERAL_padding_h"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(32+VCB_SAVE["DBF_GENERAL_padding_h"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]))
				end
			end
		end
	end
end

function VCB_BF_DBF_FRAME_INVERT_AURA_ORIENTATION()
	if VCB_SAVE["DBF_GENERAL_invertorientation"] then
		VCB_SAVE["DBF_GENERAL_invertorientation"] = false
		for i=0,15 do
			if VCB_SAVE["DBF_GENERAL_invert"] then
				local j = 15-i
				getglobal("VCB_BF_DEBUFF_BUTTON"..j):ClearAllPoints()
				if VCB_SAVE["DBF_GENERAL_verticalmode"] then
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):SetPoint("TOPRIGHT", -(32+VCB_SAVE["DBF_GENERAL_padding_h"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(44+VCB_SAVE["DBF_GENERAL_padding_v"]))
				else
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):SetPoint("TOPRIGHT", -(32+VCB_SAVE["DBF_GENERAL_padding_h"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(32+VCB_SAVE["DBF_GENERAL_padding_h"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]))
				end
			else
				getglobal("VCB_BF_DEBUFF_BUTTON"..i):ClearAllPoints()
				if VCB_SAVE["DBF_GENERAL_verticalmode"] then
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):SetPoint("TOPRIGHT", -(32+VCB_SAVE["DBF_GENERAL_padding_h"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(44+VCB_SAVE["DBF_GENERAL_padding_v"]))
				else
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):SetPoint("TOPRIGHT", -(32+VCB_SAVE["DBF_GENERAL_padding_h"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(32+VCB_SAVE["DBF_GENERAL_padding_h"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]))
				end
			end
		end
	else
		VCB_SAVE["DBF_GENERAL_invertorientation"] = true
		for i=0,15 do
			if VCB_SAVE["DBF_GENERAL_invert"] then
				local j = 15-i
				getglobal("VCB_BF_DEBUFF_BUTTON"..j):ClearAllPoints()
				if VCB_SAVE["DBF_GENERAL_verticalmode"] then
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):SetPoint("TOPLEFT", (32+VCB_SAVE["DBF_GENERAL_padding_h"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(44+VCB_SAVE["DBF_GENERAL_padding_v"]))
				else
					getglobal("VCB_BF_DEBUFF_BUTTON"..j):SetPoint("TOPLEFT", (32+VCB_SAVE["DBF_GENERAL_padding_h"])*i - floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(32+VCB_SAVE["DBF_GENERAL_padding_h"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]))
				end
			else
				getglobal("VCB_BF_DEBUFF_BUTTON"..i):ClearAllPoints()
				if VCB_SAVE["DBF_GENERAL_verticalmode"] then
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):SetPoint("TOPLEFT", (32+VCB_SAVE["DBF_GENERAL_padding_h"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*i + floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(44+VCB_SAVE["DBF_GENERAL_padding_v"]))
				else
					getglobal("VCB_BF_DEBUFF_BUTTON"..i):SetPoint("TOPLEFT", (32+VCB_SAVE["DBF_GENERAL_padding_h"])*i - floor(i/VCB_SAVE["DBF_GENERAL_numperrow"])*VCB_SAVE["DBF_GENERAL_numperrow"]*(32+VCB_SAVE["DBF_GENERAL_padding_h"]), -(44+VCB_SAVE["DBF_GENERAL_padding_v"])*floor(i/VCB_SAVE["DBF_GENERAL_numperrow"]))
				end
			end
		end
	end
end

--240630 quoted out

---------------------------------------END DEBUFF FRAME-----------------------------------------------------

---------------------------------------START WP FRAME-------------------------------------------------------
function VCB_BF_WP_FRAME_VERTICAL_MODE()
	if VCB_SAVE["WP_GENERAL_verticalmode"] then
		VCB_SAVE["WP_GENERAL_verticalmode"] = false
		for i=0,1 do
			getglobal("VCB_BF_WEAPON_BUTTON"..i):ClearAllPoints()
			getglobal("VCB_BF_WEAPON_BUTTON"..i):SetPoint("TOPRIGHT", -(32+VCB_SAVE["WP_GENERAL_padding_h"])*i, 0)
		end
		if (VCB_SAVE["BF_GENERAL_verticalmode"]) and VCB_SAVE["WP_GENERAL_attach"] then
			VCB_BF_BF_FRAME_VERTICAL_MODE()
		end
	else
		VCB_SAVE["WP_GENERAL_verticalmode"] = true
		for i=0,1 do
			getglobal("VCB_BF_WEAPON_BUTTON"..i):ClearAllPoints()
			getglobal("VCB_BF_WEAPON_BUTTON"..i):SetPoint("TOPRIGHT", 0, -(44+VCB_SAVE["WP_GENERAL_padding_v"])*i)
		end
		if (not VCB_SAVE["BF_GENERAL_verticalmode"]) and VCB_SAVE["WP_GENERAL_attach"] then
			VCB_BF_BF_FRAME_VERTICAL_MODE()
		end
	end
end

function VCB_BF_WP_FRAME_ENABLEBGCOLOR()
	if VCB_SAVE["WP_GENERAL_enablebgcolor"] then
		VCB_SAVE["WP_GENERAL_enablebgcolor"] = false
		for i=0,1 do
			getglobal("VCB_BF_WEAPON_BUTTON"..i.."Icon"):SetVertexColor(1,1,1, VCB_SAVE["WP_GENERAL_bgopacity"])
		end
	else
		VCB_SAVE["WP_GENERAL_enablebgcolor"] = true
		for i=0,1 do
			getglobal("VCB_BF_WEAPON_BUTTON"..i.."Icon"):SetVertexColor(VCB_SAVE["WP_GENERAL_bgcolor_r"],VCB_SAVE["WP_GENERAL_bgcolor_g"],VCB_SAVE["WP_GENERAL_bgcolor_b"],VCB_SAVE["WP_GENERAL_bgopacity"])
		end
	end
end

--240630 quoted out

function VCB_BF_WP_FRAME_AuraPaddingHSliderChange(obj)
	VCB_SAVE["WP_GENERAL_padding_h"] = obj:GetValue()
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_PADDING_H..": "..VCB_SAVE["WP_GENERAL_padding_h"])
	if (not VCB_SAVE["WP_GENERAL_attach"]) and (not VCB_SAVE["WP_GENERAL_verticalmode"]) then
		for i=0,1 do
			getglobal("VCB_BF_WEAPON_BUTTON"..i):ClearAllPoints()
			getglobal("VCB_BF_WEAPON_BUTTON"..i):SetPoint("TOPRIGHT", -(32+VCB_SAVE["WP_GENERAL_padding_h"])*i, 0)
		end
	end
end

function VCB_BF_WP_FRAME_FontSizeSliderChange(obj)
	VCB_SAVE["WP_GENERAL_fontsize"] = obj:GetValue()
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_FONT_SIZE..": "..VCB_SAVE["WP_GENERAL_fontsize"])
	for i=0,1 do
		if VCB_SAVE["WP_GENERAL_enableborder"] then
			if VCB_SAVE["WP_GENERAL_usecfont"] then
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Count"):SetFont(VCB_SAVE["WP_GENERAL_customfont"], VCB_SAVE["WP_GENERAL_fontsize"], "OUTLINE")
			else
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Count"):SetFont(VCB_SAVE["WP_GENERAL_font"], VCB_SAVE["WP_GENERAL_fontsize"], "OUTLINE")
			end
		else
			if VCB_SAVE["WP_GENERAL_usecfont"] then
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Count"):SetFont(VCB_SAVE["WP_GENERAL_customfont"], VCB_SAVE["WP_GENERAL_fontsize"])
			else
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Count"):SetFont(VCB_SAVE["WP_GENERAL_font"], VCB_SAVE["WP_GENERAL_fontsize"])
			end
		end
	end
end

function VCB_BF_WP_FRAME_BGOpaSliderChange(obj)
	VCB_SAVE["WP_GENERAL_bgopacity"] = string.format("%.1f", obj:GetValue())
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_BACKGROUND_OPACITY..": "..VCB_SAVE["WP_GENERAL_bgopacity"])
	for i=0,1 do
		getglobal("VCB_BF_WEAPON_BUTTON"..i.."Icon"):SetAlpha(VCB_SAVE["WP_GENERAL_bgopacity"])
	end
end

function VCB_BF_WP_FRAME_ScaleSliderChange(obj)
	VCB_SAVE["WP_GENERAL_scale"] = string.format("%.1f", obj:GetValue())
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_SCALE..": "..VCB_SAVE["WP_GENERAL_scale"])
	if (not VCB_SAVE["WP_GENERAL_attach"]) then
		VCB_BF_WEAPON_FRAME:SetScale(VCB_SAVE["WP_GENERAL_scale"])
	end
end

function VCB_BF_WP_FRAME_FontSliderChange(obj)
	VCB_SAVE["WP_GENERAL_font"] = VCB_FONT_ARRAY[obj:GetValue()]
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_FONT..": "..VCB_SAVE["WP_GENERAL_font"])
	if (not VCB_SAVE["WP_GENERAL_usecfont"]) then
		for i=0,1 do
			if VCB_SAVE["WP_GENERAL_enableborder"] then
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Count"):SetFont(VCB_SAVE["WP_GENERAL_font"], VCB_SAVE["WP_GENERAL_fontsize"], "OUTLINE")
			else
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Count"):SetFont(VCB_SAVE["WP_GENERAL_font"], VCB_SAVE["WP_GENERAL_fontsize"])
			end
		end
	end
end

function VCB_BF_WP_FRAME_ENABLE_BORDER()
	if VCB_SAVE["WP_BORDER_enableborder"] then
		VCB_SAVE["WP_BORDER_enableborder"] = false
		for i=0,1 do
			getglobal("VCB_BF_WEAPON_BUTTON"..i.."Border"):SetTexture(nil)
		end
	else
		VCB_SAVE["WP_BORDER_enableborder"] = true
		for i=0,1 do
			getglobal("VCB_BF_WEAPON_BUTTON"..i.."Border"):SetTexture(nil)
			if VCB_SAVE["WP_BORDER_usecustomborder"] then
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Border"):SetTexture(VCB_SAVE["WP_BORDER_customborderpath"])
			else
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Border"):SetTexture(VCB_WEAPONBORDER_ARRAY[VCB_SAVE["WP_BORDER_border"]])
			end
			getglobal("VCB_BF_WEAPON_BUTTON"..i.."Border"):SetVertexColor(VCB_SAVE["WP_BORDER_bordercolor_r"],VCB_SAVE["WP_BORDER_bordercolor_g"],VCB_SAVE["WP_BORDER_bordercolor_b"],VCB_SAVE["WP_BORDER_borderopacity"])
		end
	end
end

--240630 quoted out

function VCB_BF_WP_FRAME_BorderSliderChange(obj)
	VCB_SAVE["WP_BORDER_border"] = obj:GetValue()
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_BORDER..": "..VCB_SAVE["WP_BORDER_border"])
	if VCB_SAVE["WP_BORDER_enableborder"] and (not VCB_SAVE["WP_BORDER_usecustomborder"]) then
		for i=0,1 do
			getglobal("VCB_BF_WEAPON_BUTTON"..i.."Border"):SetTexture(nil)
			getglobal("VCB_BF_WEAPON_BUTTON"..i.."Border"):SetTexture(VCB_WEAPONBORDER_ARRAY[VCB_SAVE["WP_BORDER_border"]])
		end
	end
end

function VCB_BF_WP_FRAME_TIMER_ENABLE_BORDER()
	if VCB_SAVE["WP_TIMER_enableborder"] then
		VCB_SAVE["WP_TIMER_enableborder"] = false
		for i=0,1 do
			if VCB_SAVE["Timer_usecfont"] then
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Duration"):SetFont(VCB_SAVE["Timer_customfont"], VCB_SAVE["WP_TIMER_fontsize"])
			else
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Duration"):SetFont(VCB_SAVE["Timer_font"], VCB_SAVE["WP_TIMER_fontsize"])
			end
		end
	else
		VCB_SAVE["WP_TIMER_enableborder"] = true
		for i=0,1 do
			if VCB_SAVE["Timer_usecfont"] then
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Duration"):SetFont(VCB_SAVE["Timer_customfont"], VCB_SAVE["WP_TIMER_fontsize"], "OUTLINE")
			else
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Duration"):SetFont(VCB_SAVE["Timer_font"], VCB_SAVE["WP_TIMER_fontsize"], "OUTLINE")
			end
		end
	end
end

function VCB_BF_WP_FRAME_TIMER_FontSizeSliderChange(obj)
	VCB_SAVE["WP_TIMER_fontsize"] = obj:GetValue()
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_FONT_SIZE..": "..VCB_SAVE["WP_TIMER_fontsize"])
	for i=0,1 do
		if VCB_SAVE["WP_TIMER_enableborder"] then
			if VCB_SAVE["Timer_usecfont"] then
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Duration"):SetFont(VCB_SAVE["Timer_customfont"], VCB_SAVE["WP_TIMER_fontsize"], "OUTLINE")
			else
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Duration"):SetFont(VCB_SAVE["Timer_font"], VCB_SAVE["WP_TIMER_fontsize"], "OUTLINE")
			end
		else
			if VCB_SAVE["Timer_usecfont"] then
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Duration"):SetFont(VCB_SAVE["Timer_customfont"], VCB_SAVE["WP_TIMER_fontsize"])
			else
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Duration"):SetFont(VCB_SAVE["Timer_font"], VCB_SAVE["WP_TIMER_fontsize"])
			end
		end
	end
end

function VCB_BF_WP_FRAME_TIMER_FontOpacitySliderChange(obj)
	VCB_SAVE["WP_TIMER_fontopacity"] = string.format("%.1f", obj:GetValue())
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_FONT_OPACITY..": "..VCB_SAVE["WP_TIMER_fontopacity"])
	for i=0,1 do
		getglobal("VCB_BF_WEAPON_BUTTON"..i.."Duration"):SetAlpha(VCB_SAVE["WP_TIMER_fontopacity"])
	end
end

--240630 quoted out

function VCB_BF_WP_FRAME_BorderOpacitySliderChange(obj)
	VCB_SAVE["WP_BORDER_borderopacity"] = string.format("%.1f", obj:GetValue())
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_BACKGROUND_OPACITY..": "..VCB_SAVE["WP_BORDER_borderopacity"])
	for i=0,1 do
		getglobal("VCB_BF_WEAPON_BUTTON"..i.."Border"):SetAlpha(VCB_SAVE["WP_BORDER_borderopacity"])
	end
end

function VCB_BF_WP_FRAME_FontOpacitySliderChange(obj)
	VCB_SAVE["WP_GENERAL_fontopacity"] = string.format("%.1f", obj:GetValue())
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_FONT_OPACITY..": "..VCB_SAVE["WP_GENERAL_fontopacity"])
	for i=0,1 do
		getglobal("VCB_BF_WEAPON_BUTTON"..i.."Count"):SetAlpha(VCB_SAVE["WP_GENERAL_fontopacity"])
	end
end

function VCB_BF_WP_FRAME_AuraPaddingVSliderChange(obj)
	VCB_SAVE["WP_GENERAL_padding_v"] = obj:GetValue()
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_PADDING_V..": "..VCB_SAVE["WP_GENERAL_padding_v"])
	if VCB_SAVE["WP_GENERAL_verticalmode"] and (not VCB_SAVE["WP_GENERAL_attach"]) then
		for i=0,1 do
			getglobal("VCB_BF_WEAPON_BUTTON"..i):ClearAllPoints()
			getglobal("VCB_BF_WEAPON_BUTTON"..i):SetPoint("TOPRIGHT", 0, -(44+VCB_SAVE["WP_GENERAL_padding_v"])*i)
		end
	end
end

function VCB_BF_WP_FRAME_ENABLE_FONT_BORDER()
	if VCB_SAVE["WP_GENERAL_enableborder"] then
		VCB_SAVE["WP_GENERAL_enableborder"] = false
		for i=0,1 do
			if VCB_SAVE["WP_GENERAL_usecfont"] then
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Count"):SetFont(VCB_SAVE["WP_GENERAL_customfont"], VCB_SAVE["WP_GENERAL_fontsize"])
			else
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Count"):SetFont(VCB_SAVE["WP_GENERAL_font"], VCB_SAVE["WP_GENERAL_fontsize"])
			end
		end
	else
		VCB_SAVE["WP_GENERAL_enableborder"] = true
		for i=0,1 do
			if VCB_SAVE["WP_GENERAL_usecfont"] then
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Count"):SetFont(VCB_SAVE["WP_GENERAL_customfont"], VCB_SAVE["WP_GENERAL_fontsize"], "OUTLINE")
			else
				getglobal("VCB_BF_WEAPON_BUTTON"..i.."Count"):SetFont(VCB_SAVE["WP_GENERAL_font"], VCB_SAVE["WP_GENERAL_fontsize"], "OUTLINE")
			end
		end
	end
end

function VCB_BF_WP_FRAME_OffsetXSliderChange(obj)
	VCB_SAVE["WP_GENERAL_offset_x"] = obj:GetValue()
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_FONT_OFFSET_X..": "..VCB_SAVE["WP_GENERAL_offset_x"])
	for i=0,1 do
		getglobal("VCB_BF_WEAPON_BUTTON"..i.."Count"):SetPoint("BOTTOMRIGHT", VCB_SAVE["WP_GENERAL_offset_x"], VCB_SAVE["WP_GENERAL_offset_y"])
	end
end

function VCB_BF_WP_FRAME_OffsetYSliderChange(obj)
	VCB_SAVE["WP_GENERAL_offset_y"] = obj:GetValue()
	getglobal(obj:GetName().."Text"):SetText(VCB_COMMON_SLIDER_FONT_OFFSET_Y..": "..VCB_SAVE["WP_GENERAL_offset_y"])
	for i=0,1 do
		getglobal("VCB_BF_WEAPON_BUTTON"..i.."Count"):SetPoint("BOTTOMRIGHT", VCB_SAVE["WP_GENERAL_offset_x"], VCB_SAVE["WP_GENERAL_offset_y"])
	end
end

--240630 quoted out

---------------------------------------END WP FRAME---------------------------------------------------------

---------------------------------------START MISC FRAME-----------------------------------------------------
function VCB_BF_MISC_FRAME_DISABLE_CF()
	if VCB_SAVE["MISC_disable_CF"] then
		VCB_SAVE["MISC_disable_CF"] = false
		VCB_BF_CONSOLIDATED_ICON:Show()
		VCB_BF_CONSOLIDATED_BUFFFRAME:Show()
		VCB_BF_CONSOLIDATED_BUFFFRAME:Hide()
		for i=0, 6 do
			getglobal("VCB_BF_BUFF_BUTTON"..i):SetParent(VCB_BF_CONSOLIDATED_BUFFFRAME)
		end
	else
		VCB_SAVE["MISC_disable_CF"] = true
		VCB_BF_CONSOLIDATED_ICON:Hide()
		for i=0, 6 do
			getglobal("VCB_BF_BUFF_BUTTON"..i):SetParent(VCB_BF_BUFF_FRAME)
			getglobal("VCB_BF_BUFF_BUTTON"..i):Show()
		end
	end
	VCB_BF_RepositioningAndResizing()
end

--240630 quoted out


---------------------------------------END MISC FRAME-------------------------------------------------------

---------------------------------------START PROFILE MANAGER FRAME------------------------------------------
function VCB_BF_PM_FRAME_RIGHT_SCROLLFRAME_Update()
	local line -- 1 through 5 of our window to scroll
	local lineplusoffset -- an index into our data calculated from the scroll offset
	local FRAME = getglobal("VCB_BF_PM_FRAME_RIGHT_SCROLLFRAME")
	FauxScrollFrame_Update(FRAME,VCB_tablelength(VCB_Profile_Name),10,40)
	for line=1,10 do
		lineplusoffset = line + FauxScrollFrame_GetOffset(FRAME)
		if VCB_Profile_Name[lineplusoffset] ~= nil then
			getglobal("VCB_PM_ENTRY"..line.."_Text"):SetText(lineplusoffset..". "..VCB_Profile_Name[lineplusoffset])
			getglobal("VCB_PM_ENTRY"..line).name = VCB_Profile_Name[lineplusoffset]
			getglobal("VCB_PM_ENTRY"..line):Show()
		else
			getglobal("VCB_PM_ENTRY"..line):Hide()
		end
	end
end

function VCB_PM_SCROLLFRAME_ENTRY(button)
	getglobal("VCB_BF_PM_FRAME_LEFT_SELECTED_INBOX_TEXT"):SetText(button.name)
end

function VCB_BF_PM_FRAME_SAVE()
	local name = getglobal("VCB_BF_PM_FRAME_EditBox"):GetText()
	local temp = {}
	if (name) then
		for cat, val in pairs(VCB_SAVE) do
			temp[cat] = VCB_SAVE[cat]
		end
		table.insert(VCB_Profile_Name, name)
		table.insert(VCB_Profile, temp)
		getglobal("VCB_BF_PM_FRAME_LEFT_CURRENT_INBOX_TEXT"):SetText(name)
		VCB_CUR_PROFILE = name
		VCB_SendMessage(VCB_TEXT_PROFILE..name..VCB_HAS_BEEN_SAVED)
	end
	VCB_BF_PM_FRAME_RIGHT_SCROLLFRAME_Update()
end

function VCB_BF_PM_FRAME_LOAD()
	local name = getglobal("VCB_BF_PM_FRAME_LEFT_SELECTED_INBOX_TEXT"):GetText()
	if (name) then
		local key = VCB_Table_GetKeys(VCB_Profile_Name, name)
		if (key) then
			for cat, val in pairs(VCB_SAVE) do
				VCB_SAVE[cat] = VCB_Profile[key][cat]
			end
			VCB_INITIALIZE()
			VCB_BF_RepositioningAndResizing()
			getglobal("VCB_BF_PM_FRAME_LEFT_CURRENT_INBOX_TEXT"):SetText(name)
			VCB_CUR_PROFILE = name
			VCB_SendMessage(VCB_TEXT_PROFILE..name..VCB_HAS_BEEN_LOADED)
		end
	end
end

function VCB_BF_PM_FRAME_DELETE()
	local name = getglobal("VCB_BF_PM_FRAME_LEFT_SELECTED_INBOX_TEXT"):GetText()
	if (name) then
		local key = VCB_Table_GetKeys(VCB_Profile_Name, name)
		if (key) then
			table.remove(VCB_Profile_Name, key)
			table.remove(VCB_Profile, key)
			VCB_SendMessage(VCB_TEXT_PROFILE..name..VCB_HAS_BEEN_REMOVED)
		end
	end
	VCB_BF_PM_FRAME_RIGHT_SCROLLFRAME_Update()
end
---------------------------------------END PROFILE MANAGER FRAME--------------------------------------------