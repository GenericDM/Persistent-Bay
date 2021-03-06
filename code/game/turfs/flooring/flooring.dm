GLOBAL_LIST_EMPTY(flooring_types)

/proc/setupFlooring()
	for(var/path in subtypesof(/decl/flooring))
		GLOB.flooring_types["[path]"] = new path

/proc/get_flooring_data(var/flooring_path)
	return GLOB.flooring_types["[flooring_path]"]

// State values:
// [icon_base]: initial base icon_state without edges or corners.
// if has_base_range is set, append 0-has_base_range ie.
//   [icon_base][has_base_range]
// [icon_base]_broken: damaged overlay.
// if has_damage_range is set, append 0-damage_range for state ie.
//   [icon_base]_broken[has_damage_range]
// [icon_base]_edges: directional overlays for edges.
// [icon_base]_corners: directional overlays for non-edge corners.

/decl/flooring
	var/name
	var/desc
	var/icon
	var/icon_base
	var/color

	var/has_base_range
	var/has_damage_range
	var/has_burn_range
	var/damage_temperature
	var/apply_thermal_conductivity
	var/apply_heat_capacity

	var/build_type      // Unbuildable if not set. Must be /obj/item/stack.
	var/build_cost = 1  // Stack units.
	var/build_time = 0  // BYOND ticks.

	var/descriptor = "tiles"
	var/flags
	var/can_paint

/decl/flooring/proc/on_remove()
	return

/decl/flooring/grass
	name = "grass"
	desc = "Do they smoke grass out in space, Bowie? Or do they smoke AstroTurf?"
	icon = 'icons/turf/flooring/grass.dmi'
	icon_base = "grass"
	has_base_range = 3
	damage_temperature = T0C+80
	flags = TURF_HAS_EDGES | TURF_REMOVE_SHOVEL
	build_type = /obj/item/stack/tile/grass

/decl/flooring/asteroidspa
	name = "coarse sand"
	desc = "Gritty and unpleasant."
	icon = 'icons/turf/flooring/asteroid.dmi'
	icon_base = "asteroid"
	flags = TURF_HAS_EDGES | TURF_REMOVE_SHOVEL
	build_type = null

/decl/flooring/carpet
	name = "brown carpet"
	desc = "Comfy and fancy carpeting."
	icon = 'icons/turf/flooring/carpet.dmi'
	icon_base = "brown"
	build_type = /obj/item/stack/tile/carpet
	damage_temperature = T0C+200
	flags = TURF_HAS_EDGES | TURF_HAS_CORNERS | TURF_REMOVE_CROWBAR | TURF_CAN_BURN

/decl/flooring/carpet/blue
	name = "blue carpet"
	icon_base = "blue1"
	build_type = /obj/item/stack/tile/carpetblue

/decl/flooring/carpet/blue2
	name = "pale blue carpet"
	icon_base = "blue2"
	build_type = /obj/item/stack/tile/carpetblue2

/decl/flooring/carpet/purple
	name = "purple carpet"
	icon_base = "purple"
	build_type = /obj/item/stack/tile/carpetpurple

/decl/flooring/carpet/orange
	name = "orange carpet"
	icon_base = "orange"
	build_type = /obj/item/stack/tile/carpetorange

/decl/flooring/carpet/green
	name = "green carpet"
	icon_base = "green"
	build_type = /obj/item/stack/tile/carpetgreen

/decl/flooring/carpet/red
	name = "red carpet"
	icon_base = "red"
	build_type = /obj/item/stack/tile/carpetred

/decl/flooring/linoleum
	name = "linoleum"
	desc = "It's like the 2390's all over again."
	icon = 'icons/turf/flooring/linoleum.dmi'
	icon_base = "lino"
	can_paint = 1
	build_type = /obj/item/stack/tile/linoleum
	flags = TURF_REMOVE_SCREWDRIVER

/decl/flooring/tiling
	name = "floor"
	desc = "Scuffed from the passage of countless greyshirts."
	icon = 'icons/turf/flooring/tiles.dmi'
	icon_base = "tiled"
	color = COLOR_GUNMETAL
	has_damage_range = 4
	damage_temperature = T0C+1400
	apply_thermal_conductivity = 45
	apply_heat_capacity = 480
	flags = TURF_REMOVE_CROWBAR | TURF_CAN_BREAK | TURF_CAN_BURN
	build_type = /obj/item/stack/tile/floor
	can_paint = 1

/decl/flooring/tiling/mono
	icon_base = "monotile"
	build_type = /obj/item/stack/tile/floor_white/mono

/decl/flooring/tiling/white
	desc = "How sterile."
	color = COLOR_WHITE
	build_type = /obj/item/stack/tile/floor_white

/decl/flooring/tiling/white/mono
	icon_base = "monotile"
	build_type = /obj/item/stack/tile/floor_white/mono

/decl/flooring/tiling/dark
	desc = "How ominous."
	color = COLOR_DARK_GRAY
	build_type = /obj/item/stack/tile/floor_dark

/decl/flooring/tiling/dark/mono
	icon_base = "monotile"
	build_type = /obj/item/stack/tile/floor_dark/mono

/decl/flooring/tiling/freezer
	desc = "Don't slip."
	icon_base = "freezer"
	color = null
	has_damage_range = null
	flags = TURF_REMOVE_CROWBAR | TURF_ACID_IMMUNE | TURF_CAN_BREAK
	build_type = /obj/item/stack/tile/floor_freezer
	apply_thermal_conductivity = 0.035
	apply_heat_capacity = 1000
	can_paint = 1

/decl/flooring/wood
	name = "wooden floor"
	desc = "Polished redwood planks."
	icon = 'icons/turf/flooring/wood.dmi'
	icon_base = "wood"
	has_damage_range = 6
	damage_temperature = T0C+200
	apply_thermal_conductivity = 0.14
	apply_heat_capacity = 1200
	descriptor = "planks"
	build_type = /obj/item/stack/tile/wood
	flags = TURF_CAN_BREAK | TURF_IS_FRAGILE | TURF_REMOVE_SCREWDRIVER

/decl/flooring/reinforced
	name = "reinforced floor"
	desc = "Heavily reinforced with steel plating."
	icon = 'icons/turf/flooring/tiles.dmi'
	icon_base = "reinforced"
	flags = TURF_REMOVE_WRENCH | TURF_ACID_IMMUNE
	build_type = /obj/item/stack/material/steel
	build_cost = 1
	build_time = 30
	apply_thermal_conductivity = 0.025
	apply_heat_capacity = 325000
	can_paint = 1

/decl/flooring/reinforced/circuit
	name = "processing strata"
	icon = 'icons/turf/flooring/circuit.dmi'
	icon_base = "bcircuit"
	build_type = null
	flags = TURF_ACID_IMMUNE | TURF_CAN_BREAK | TURF_REMOVE_WRENCH
	can_paint = 1

/decl/flooring/reinforced/circuit/green
	icon_base = "gcircuit"

/decl/flooring/reinforced/circuit/red
	icon_base = "rcircuit"
	flags = TURF_ACID_IMMUNE
	can_paint = 0

/decl/flooring/reinforced/cult
	name = "engraved floor"
	desc = "Unsettling whispers waver from the surface..."
	icon = 'icons/turf/flooring/cult.dmi'
	icon_base = "cult"
	build_type = null
	has_damage_range = 6
	flags = TURF_ACID_IMMUNE | TURF_CAN_BREAK | TURF_REMOVE_WRENCH
	can_paint = null

/decl/flooring/reinforced/cult/on_remove()
	cult.remove_cultiness(CULTINESS_PER_TURF)

/decl/flooring/reinforced/shuttle
	name = "floor"
	icon = 'icons/turf/shuttle.dmi'
	build_type = /obj/item/stack/tile/shuttle/blue
	flags = TURF_ACID_IMMUNE | TURF_CAN_BREAK | TURF_REMOVE_WRENCH | TURF_CAN_BURN
	can_paint = 1
	has_damage_range = 4
	damage_temperature = T0C+1400
	build_time = 5 SECONDS

/decl/flooring/reinforced/shuttle/blue
	icon_base = "floor"
	build_type = /obj/item/stack/tile/shuttle/blue

/decl/flooring/reinforced/shuttle/yellow
	icon_base = "floor2"
	build_type = /obj/item/stack/tile/shuttle/yellow

/decl/flooring/reinforced/shuttle/white
	icon_base = "floor3"
	build_type = /obj/item/stack/tile/shuttle/white

/decl/flooring/reinforced/shuttle/red
	icon_base = "floor4"
	build_type = /obj/item/stack/tile/shuttle/red

/decl/flooring/reinforced/shuttle/purple
	icon_base = "floor5"
	build_type = /obj/item/stack/tile/shuttle/purple

/decl/flooring/reinforced/shuttle/darkred
	icon_base = "floor6"
	build_type = /obj/item/stack/tile/shuttle/darkred

/decl/flooring/reinforced/shuttle/black
	icon_base = "floor7"
	build_type = /obj/item/stack/tile/shuttle/black

/decl/flooring/reinforced/shuttle/plates
	icon_base = "vfloor"
	build_type = /obj/item/stack/tile/shuttle/plates
/*
/decl/flooring/diona
	name = "biomass"
	desc = "a mass of small intertwined aliens forming a floor... Creepy."
	icon = 'icons/turf/floors.dmi'
	icon_base = "diona"
	flags = TURF_ACID_IMMUNE | TURF_REMOVE_SHOVEL
*/

/decl/flooring/concrete
	name = "concrete"
	desc = "Good old concrete."
	icon = 'icons/turf/flooring/misc.dmi'
	icon_base = "concrete"
	build_type = /obj/item/stack/tile/concrete
	damage_temperature = T0C+1500
	flags = TURF_REMOVE_CROWBAR | TURF_CAN_BURN | TURF_CAN_BREAK
	apply_thermal_conductivity = 1.13
	apply_heat_capacity = 1000

/decl/flooring/rockvault
	name = "vault floor"
	desc = "Sturdy looking floor."
	icon = 'icons/turf/flooring/misc.dmi'
	icon_base = "rockvault"
	build_type = /obj/item/stack/tile/rockvault
	flags = TURF_REMOVE_CROWBAR | TURF_CAN_BREAK

/decl/flooring/sandstonevault
	name = "sandstone vault floor"
	desc = "Sturdy looking floor."
	icon = 'icons/turf/flooring/misc.dmi'
	icon_base = "sandstonevault"
	build_type = /obj/item/stack/tile/sandstonevault
	flags = TURF_REMOVE_CROWBAR | TURF_CAN_BREAK

/decl/flooring/elevatorshaft
	name = "elevator shaft floor"
	icon = 'icons/turf/flooring/misc.dmi'
	icon_base = "elevatorshaft"
	build_type = null
