local result, reason = ""

do
	local handle, chunk = component.proxy(component.list("internet")() or error("Required internet component is missing")).request("https://raw.githubusercontent.com/Epicaaron85/epia-OS/main/installer/main.lua")

	while true do
		chunk = handle.read(math.huge)
		
		if chunk then
			result = result .. chunk
		else
			break
		end
	end

	handle.close()
end

result, reason = load(result, "=installer")

if result then
	result, reason = xpcall(result, debug.traceback)

	if not result then
		error(reason)
	end
else
	error(reason)	
end

-- wget -f https://raw.githubusercontent.com/Epicaaron85/epia-OS/main/installer/bios.lua /tmp/bios.lua && flash -q /tmp/bios.lua && reboot