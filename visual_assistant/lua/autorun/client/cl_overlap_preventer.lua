local ShouldOccur = true
function ShouldBeep()
	if ShouldOccur then
		ShouldOccur = false
		timer.Simple(5,function() ShouldOccur = true end)
		return true
	end
end