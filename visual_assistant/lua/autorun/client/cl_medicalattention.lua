local ShouldOccur = true
hook.Add("HUDPaint", "SeekMedicalAttention", function()
	local ply = LocalPlayer()
	local health = ply:Health()
	local shouldshow = GetConVar("SetVAAttention"):GetInt()
	local shouldBeep = GetConVar("SetVABeep"):GetInt()
	if health <= 25 and ply:Alive() then
		if ShouldOccur and shouldBeep == 1 then 
			surface.PlaySound("3beeps_fast.mp3")
			ShouldOccur = false
		end
		if shouldshow == 1 then
			local medical = Material( "medicalattention.vmt" )
			surface.SetMaterial( medical )
			surface.SetDrawColor( 255, 255, 255 )
			surface.DrawTexturedRect( 20, (ScrH()/2)-(ScrH()/2.16), ScrW()/9.2, 100 )
		end
	end
end)

net.Receive("AssistantPlayerCanPickupItem", function()
	ShouldOccur = true
end)