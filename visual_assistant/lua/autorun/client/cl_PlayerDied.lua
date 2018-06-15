net.Receive("AssistantPlayerDies", function()
    local shouldshow = GetConVar("SetVADthScr"):GetInt()
    if shouldshow == 1 then
        local Randomizer = math.random(1,5)
        hook.Add( "HUDShouldDraw", "AssistantRemoveDeathScreen", function( name ) 
            if name == "CHudDamageIndicator" then 
               return false 
            end
        end)
        hook.Add("HUDPaint", "AssistantSystemError", function()
            if Randomizer ~= 3 then
                local dead = Material( "systemerror.vmt" )
                surface.SetMaterial( dead )
                surface.SetDrawColor( 255, 255, 255 )
                surface.DrawTexturedRect( 0, 0, ScrW(), ScrH() )
            else
                local deadglitch = Material( "systemerrorglitch.vmt" )
                    surface.SetMaterial( deadglitch )
                surface.SetDrawColor( 255, 255, 255 )
                surface.DrawTexturedRect( 0, 0, ScrW(), ScrH() )
            end
        end)
    end
end)

--Remove the System Error
net.Receive("AssistantPlayerSpawns", function()
    hook.Remove("HUDPaint", "AssistantSystemError")
end)