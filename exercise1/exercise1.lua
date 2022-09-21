local argv_cmds = {};

function exercise1(argv)
	for k, v in ipairs(argv) do
		if argv_cmds[v] then
			argv_cmds[v](argv, k);
		end
	end
end

argv_cmds["bg"] = function(argv, index)
	local img_path = argv[index + 1];
	local _, type = resource(img_path, APPL_RESOURCE);

	if (type == "file") then
		local img = load_image(img_path);
		show_image(img);
	else
		warning("Given image does not exist.");
		return shutdown();
	end
end
