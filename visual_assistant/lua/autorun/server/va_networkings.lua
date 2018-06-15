resource.AddWorkshop("1528306948")
util.AddNetworkString("AssistantPlayerCanPickupItem")
util.AddNetworkString("AssistantPlayerTookDamage")
util.AddNetworkString("AssistantPlayerDies")
util.AddNetworkString("AssistantAcid")
util.AddNetworkString("AssistantBullet")
util.AddNetworkString("AssistantBurn")
util.AddNetworkString("AssistantElectric")
util.AddNetworkString("AssistantFall")
util.AddNetworkString("AssistantGeneric")
util.AddNetworkString("AssistantPoison")
util.AddNetworkString("AssistantPlayerSpawns")
--Starting the Players Damage Symbols
hook.Add("EntityTakeDamage", "AssistantPlayerTookDamage", function(ply , dmginfo)
	local dmgtype = dmginfo:GetDamageType()
	if ply:IsPlayer() then
		net.Start("AssistantPlayerTookDamage")
		net.Send(ply)
		if dmgtype == 256 then
			net.Start("AssistantElectric")
			net.Send(ply)
		elseif dmgtype == 1048576 or dmgtype == 262144 then
			net.Start("AssistantAcid")
			net.Send(ply)
		elseif dmgtype == 2 or dmgtype == 536870914 or dmgtype == 1073741824 then
			net.Start("AssistantBullet")
			net.Send(ply)
		elseif dmgtype == 8 then
			net.Start("AssistantBurn")
			net.Send(ply)
		elseif dmgtype == 32 then
			net.Start("AssistantFall")
			net.Send(ply)
		elseif dmgtype == 131072 or dmgtype == 32768 then
			net.Start("AssistantPoison")
			net.Send(ply)
		else
			net.Start("AssistantGeneric")
			net.Send(ply)
		end
	end
end)

--Reseting the Med Assistant Beep
hook.Add("PlayerCanPickupItem", "AssistantPlayerCanPickupItem", function(ply , ent)
	if ent:GetClass() == "item_healthvial" or ent:GetClass() == "item_healthkit" then
		net.Start("AssistantPlayerCanPickupItem")
		net.Send(ply)
	end
end)

--Giving the Player the System Error
hook.Add("DoPlayerDeath", "AssistantDoPlayerDeath", function(ply)
	net.Start("AssistantPlayerDies")
	net.Send(ply)
end)

--Removing the Players System Error
hook.Add("PlayerSpawn", "AssistantRemoveSystemError", function(ply)
	net.Start("AssistantPlayerSpawns")
	net.Send(ply)
end)