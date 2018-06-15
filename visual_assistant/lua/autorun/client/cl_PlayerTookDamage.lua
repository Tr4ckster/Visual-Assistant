CreateClientConVar("SetVARNumber", 255, true)
CreateClientConVar("SetVAGNumber", 255, true)
CreateClientConVar("SetVABNumber", 255, true)
CreateClientConVar("SetVAANumber", 255, true)
CreateClientConVar("SetVAAttention", 1, true)
CreateClientConVar("SetVAAntidote", 1, true)
CreateClientConVar("SetVAElectric", 1, true)
CreateClientConVar("SetVAGeneric", 1, true)
CreateClientConVar("SetVAPoison", 1, true)
CreateClientConVar("SetVABullet", 1, true)
CreateClientConVar("SetVAAcid", 1, true)
CreateClientConVar("SetVABurn", 1, true)
CreateClientConVar("SetVAFall", 1, true)
CreateClientConVar("SetVADthScr", 1, true)
CreateClientConVar("SetVABeep", 1, true)
local ShouldOccour = true
local ChosenColor = nil
local r = 255
local g = 255 
local b = 255
local a = 255
local rcon = GetConVar("SetVARNumber"):GetInt()
local gcon = GetConVar("SetVAGNumber"):GetInt() 
local bcon = GetConVar("SetVABNumber"):GetInt()
local acon = GetConVar("SetVAANumber"):GetInt()
local function VAMenu()
	local frame = vgui.Create("DFrame")
	frame:SetSize(500,450)
	frame:SetTitle("Welcome to the Visual Assistant Menu")
	frame:Center()
	frame:SetVisible(true)
	frame:MakePopup()

	local Headline = vgui.Create("DLabel", frame)
	Headline:SetPos(15,25)
	Headline:SetText("Pick a Color")
	local Headline2 = vgui.Create("DLabel", frame)
	Headline2:SetPos(frame:GetWide()-200,25)
	Headline2:SetText("Show this:")
	local Headline3 = vgui.Create("DLabel", frame)
	Headline3:SetPos(frame:GetWide()-200,frame:GetTall()-190)
	Headline3:SetText("Options")
	
	local Mixer = vgui.Create("DColorMixer", frame)
	Mixer:SetPos(10,50)
	Mixer:SetPalette(true)
	Mixer:SetAlphaBar(false)
	Mixer:SetWangs(true)
	Mixer:SetColor(Color(255,255,255))

	local Confirm = vgui.Create("DButton", frame )
	Confirm:SetText("I want this color")
	Confirm:SetSize(90, 30)
	Confirm:SetPos(100, frame:GetTall()-150)
	Confirm.DoClick = function()
		ChosenColor = Mixer:GetColor()
		r = ChosenColor.r
		g = ChosenColor.g
		b = ChosenColor.b
		a = ChosenColor.a
		LocalPlayer():ConCommand("SetVARNumber "..r)
		LocalPlayer():ConCommand("SetVAGNumber "..g)
		LocalPlayer():ConCommand("SetVABNumber "..b)
		LocalPlayer():ConCommand("SetVAANumber "..a)
		rcon = GetConVar("SetVARNumber"):GetInt()
		gcon = GetConVar("SetVAGNumber"):GetInt()
		bcon = GetConVar("SetVABNumber"):GetInt()
		acon = GetConVar("SetVAANumber"):GetInt()
		chat.AddText(Color(rcon,gcon,bcon),"[Visual Assistant] Element colors have sucessfully been changed!")
	end
	
	local function CheckBoxes(high, text, convar)
	CheckBox = vgui.Create("DCheckBoxLabel", frame)
	CheckBox:SetPos(frame:GetWide()-200,high)
	CheckBox:SetText(text)
	CheckBox:SetConVar(convar)
	end
	CheckBoxes(50, "Seek Medical Attention", "SetVAAttention")
	CheckBoxes(70, "High Voltage Detected", "SetVAElectric")
	CheckBoxes(90, "Toxic Material Detected", "SetVAAcid")
	CheckBoxes(110, "Critical Hit Detected", "SetVABullet")
	CheckBoxes(130, "Critical Heat Detected", "SetVABurn")
	CheckBoxes(150, "Bone Fracture Detected", "SetVAFall")
	CheckBoxes(170, "PO. Material Detected", "SetVAPoison")
	CheckBoxes(190, "Generic Damage Detected", "SetVAGeneric")
	CheckBoxes(210, "Administered Antidote", "SetVAAntidote")
	CheckBoxes(290, "VA Deathscreen", "SetVADthScr")
	CheckBoxes(310, "VA Beep Sounds", "SetVABeep")
end
concommand.Add("VA_Menu", VAMenu)

local function electricdmg()
	local shouldElectr = GetConVar("SetVAElectric"):GetInt()
	if shouldElectr == 1 then
		hook.Add("HUDPaint", "Assistantelectricdmg", function()
			local electric = Material( "electricdamage.vmt" )
			surface.SetMaterial( electric )
			surface.SetDrawColor( rcon,gcon,bcon )
			surface.DrawTexturedRect( 20, (ScrH()/2)-(ScrH()/2.7), ScrW()/9.2, 100 )
		end)
		timer.Simple(5, function() hook.Remove("HUDPaint", "Assistantelectricdmg") end)
	end
end

local function aciddmg()
	local shouldAcid   = GetConVar("SetVAAcid"):GetInt()
	if shouldAcid == 1 then
		hook.Add("HUDPaint", "Assistantaciddmg", function()
			local toxic = Material( "aciddamage.vmt" )
			surface.SetMaterial( toxic )
			surface.SetDrawColor( rcon,gcon,bcon )
			surface.DrawTexturedRect( 20, (ScrH()/2)-(ScrH()/3.6), ScrW()/9.2, 100 )
		end)
		timer.Simple(5, function() hook.Remove("HUDPaint", "Assistantaciddmg") end)
	end
end

local function bulletdmg()
	local shouldBullet = GetConVar("SetVABullet"):GetInt()
	if shouldBullet == 1 then
		hook.Add("HUDPaint", "Assistantbulletdmg", function()
			local bullet = Material( "bulletdamage.vmt" )
			surface.SetMaterial( bullet )
			surface.SetDrawColor( rcon,gcon,bcon )
			surface.DrawTexturedRect( 20, (ScrH()/2)-(ScrH()/5.4), ScrW()/9.2, 100 )
		end)
		timer.Simple(5, function() hook.Remove("HUDPaint", "Assistantbulletdmg") end)
	end
end

local function burndmg()
	local shouldBurn   = GetConVar("SetVABurn"):GetInt()
	if shouldBurn == 1 then
		hook.Add("HUDPaint", "Assistantburndmg", function()
			local burn = Material( "burndamage.vmt" )
			surface.SetMaterial( burn )
			surface.SetDrawColor( rcon,gcon,bcon )
			surface.DrawTexturedRect( 20, (ScrH()/2)-(ScrH()/10.8), ScrW()/9.2, 100 )
		end)
		timer.Simple(5, function() hook.Remove("HUDPaint", "Assistantburndmg") end)
	end
end

local function falldmg()
	local shouldFall   = GetConVar("SetVAFall"):GetInt()
	if shouldFall == 1 then
		hook.Add("HUDPaint", "Assistantfalldmg", function()
			local fall = Material( "falldamage.vmt" )
			surface.SetMaterial( fall )
			surface.SetDrawColor( rcon,gcon,bcon )
			surface.DrawTexturedRect( 20, ScrH()/2, ScrW()/9.2, 100 )
		end)
		timer.Simple(5,function() hook.Remove("HUDPaint", "Assistantfalldmg") end)
	end
end

local function antidode()
	local shouldAntido = GetConVar("SetVAAntidote"):GetInt()
	if shouldAntido == 1 then
		hook.Add("HUDPaint", "Assistantantidode", function()
			local antidode = Material( "administer_antidode.vmt" )
			surface.SetMaterial( antidode )
			surface.SetDrawColor( rcon,gcon,bcon )
			surface.DrawTexturedRect( 20, (ScrH()/2)+(ScrH()/3.6), ScrW()/9.2, 100 )
		end)
		timer.Simple(5, function() hook.Remove("HUDPaint", "Assistantantidode") end)
	end
end

local function poisondmg()
	local shouldPoison = GetConVar("SetVAPoison"):GetInt()
	antidode()
	if shouldPoison == 1 then
		hook.Add("HUDPaint", "Assistantpoisondmg", function()
			local poison = Material( "poisondamage.vmt" )
			surface.SetMaterial( poison )
			surface.SetDrawColor( rcon,gcon,bcon )
			surface.DrawTexturedRect( 20, (ScrH()/2)+(ScrH()/10.8), ScrW()/9.2, 100 )	
		end)
		timer.Simple(5, function() hook.Remove("HUDPaint", "Assistantpoisondmg") end)
	end
end

local function genericdmg()
	local shouldGeneri = GetConVar("SetVAGeneric"):GetInt()
	if shouldGeneri == 1 then 
		hook.Add("HUDPaint", "Assistantgenericdmg", function()
			local generic = Material( "genericdamage.vmt" )
			surface.SetMaterial( generic )
			surface.SetDrawColor( rcon,gcon,bcon )
			surface.DrawTexturedRect( 20, (ScrH()/2)+(ScrH()/5.4), ScrW()/9.2, 100 )
		end)
		timer.Simple(5, function() hook.Remove("HUDPaint", "Assistantgenericdmg") end)
	end
end

net.Receive("AssistantPlayerTookDamage", function()
	local shouldBeep   = GetConVar("SetVABeep"):GetInt()
	if ShouldOccour and ShouldBeep() and shouldBeep == 1 then
		ShouldOccour = false
		surface.PlaySound("3beeps_slow.mp3")
		timer.Simple(5,function() ShouldOccour = true end)
	end
end)
net.Receive("AssistantAcid", aciddmg)
net.Receive("AssistantBullet", bulletdmg)
net.Receive("AssistantBurn", burndmg)
net.Receive("AssistantElectric", electricdmg)
net.Receive("AssistantFall", falldmg)
net.Receive("AssistantGeneric", genericdmg)
net.Receive("AssistantPoison", poisondmg)

concommand.Add("VA_All", function()
	aciddmg()
	bulletdmg()
	burndmg()
	electricdmg()
	falldmg()
	genericdmg()
	poisondmg()
end)