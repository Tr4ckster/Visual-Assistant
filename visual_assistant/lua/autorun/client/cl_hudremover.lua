local hide = {
	CHudPoisonDamageIndicator = true
}
hook.Add( "HUDShouldDraw", "AssistantHidElements", function( name )
	if ( hide[ name ] ) then return false end
end )