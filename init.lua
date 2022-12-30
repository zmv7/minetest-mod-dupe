core.register_chatcommand("dupe", {
  description = "Dupe wielded item",
  privs = {creative=true},
  params = "[count]",
  func = function(name, param)
	local player = core.get_player_by_name(name)
	if not player then
		return false, 'No player'
	end
	local count = tonumber(param) or 1
	local item = player:get_wielded_item()
	local inv = player:get_inventory()
	if not (item and inv) then
		return false, "Error"
	end
	for i=1,count do
		inv:add_item("main",item)
	end
	return true, 'Duped '..item:get_name()..(count > 1 and " x"..param or "")
end})
