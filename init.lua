minetest.register_node("crates_and_barrels:crate", {
	description = "Wood Crate",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"crates_and_barrels_crate.png"},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
	sounds = default.node_sound_wood_defaults(),
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec",
			"size[8,9]" ..
			default.gui_bg..
			default.gui_bg_img..
			default.gui_slots..
			"list[context;contents;2,0.5;4,4;]" ..
			"list[current_player;main;0,5;8,4;]")

		local inv = meta:get_inventory()
		inv:set_size('contents', 16)
	end,

	on_blast = function(pos)
		local drops = {}
		default.get_inventory_drops(pos, "contents", drops)
		drops[#drops+1] = "crates_and_barrels:crate"
		minetest.remove_node(pos)
		return drops
	end,
})


minetest.register_node("crates_and_barrels:barrel", {
	description = "Barrel",
	drawtype = "mesh",
	mesh = "crates_and_barrels_barrel.b3d",
	visual_scale = 0.05,
	wield_scale = {x = 0.06, y = 0.06, z = 0.06},
	paramtype2 = "facedir",
	tiles = {"crates_and_barrels_barrel.png"},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
	sounds = default.node_sound_wood_defaults(),
	node_box = {
			type = "fixed",
			fixed = {-0.4, -0.5, -0.4, 0.4, 0.5, 0.4},
		},
	selection_box = {
			type = "fixed",
			fixed = {-0.4, -0.5, -0.4, 0.4, 0.5, 0.4},
		},

	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec",
			"size[8,9]" ..
			default.gui_bg..
			default.gui_bg_img..
			default.gui_slots..
			"list[context;contents;2,0.5;4,4;]" ..
			"list[current_player;main;0,5;8,4;]")

		local inv = meta:get_inventory()
		inv:set_size('contents', 16)
	end,

	on_blast = function(pos)
		local drops = {}
		default.get_inventory_drops(pos, "contents", drops)
		drops[#drops+1] = "crates_and_barrels:crate"
		minetest.remove_node(pos)
		return drops
	end,
})
