/datum/job/shaft_miner
	title = JOB_NAME_SHAFTMINER
	flag = MINER
	department_head = list(JOB_NAME_HEADOFPERSONNEL)
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 4
	spawn_positions = 4
	supervisors = "the quartermaster and the " + JOB_NAME_HEADOFPERSONNEL //NSV13
	selection_color = "#dcba97"

	outfit = /datum/outfit/job/miner

	access = list(ACCESS_MAINT_TUNNELS, ACCESS_MAILSORTING, ACCESS_CARGO, ACCESS_QM, ACCESS_MINING, ACCESS_MECH_MINING,
					ACCESS_MINING_STATION, ACCESS_MINERAL_STOREROOM, ACCESS_AUX_BASE,
					ACCESS_MINING_ENGINEERING, ACCESS_MINING_BRIDGE) //NSV13 - mining ship access
	minimal_access = list(ACCESS_MINING, ACCESS_MECH_MINING, ACCESS_MINING_STATION, ACCESS_MAILSORTING, ACCESS_MINERAL_STOREROOM,
					ACCESS_AUX_BASE,
					ACCESS_MINING_ENGINEERING, ACCESS_MINING_BRIDGE) //NSV13 - mining ship access
	paycheck = PAYCHECK_HARD
	paycheck_department = ACCOUNT_CAR

	display_order = JOB_DISPLAY_ORDER_SHAFT_MINER
	departments = DEPARTMENT_BITFLAG_CARGO
	rpg_title = "Adventurer"

	species_outfits = list(
		SPECIES_PLASMAMAN = /datum/outfit/plasmaman/shaft_miner
	)

/datum/outfit/job/miner
	name = JOB_NAME_SHAFTMINER
	jobtype = /datum/job/shaft_miner

	id = /obj/item/card/id/job/shaft_miner
	belt = /obj/item/pda/shaft_miner
	ears = /obj/item/radio/headset/headset_cargo/shaft_miner
	shoes = /obj/item/clothing/shoes/workboots/mining
	gloves = /obj/item/clothing/gloves/color/black
	uniform = /obj/item/clothing/under/rank/cargo/miner/lavaland
	l_pocket = /obj/item/reagent_containers/hypospray/medipen/survival
	r_pocket = /obj/item/storage/bag/ore	//causes issues if spawned in backpack
	backpack_contents = list(
		/obj/item/flashlight/seclite=1,\
		/obj/item/kitchen/knife/combat/survival=1,\
		/obj/item/mining_voucher=1,\
		/obj/item/stack/marker_beacon/ten=1,\
		/obj/item/discovery_scanner=1)

	backpack = /obj/item/storage/backpack/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	duffelbag = /obj/item/storage/backpack/duffelbag
	box = /obj/item/storage/box/survival_mining

	chameleon_extras = /obj/item/gun/energy/kinetic_accelerator

/datum/outfit/job/miner/equipped
	name = "Shaft Miner (Equipment)"
	suit = /obj/item/clothing/suit/hooded/explorer
	mask = /obj/item/clothing/mask/gas/explorer
	glasses = /obj/item/clothing/glasses/meson
	suit_store = /obj/item/tank/internals/oxygen
	internals_slot = ITEM_SLOT_SUITSTORE
	backpack_contents = list(
		/obj/item/flashlight/seclite=1,\
		/obj/item/kitchen/knife/combat/survival=1,
		/obj/item/mining_voucher=1,
		/obj/item/t_scanner/adv_mining_scanner/lesser=1,
		/obj/item/gun/energy/kinetic_accelerator=1,\
		/obj/item/stack/marker_beacon/ten=1)

/datum/outfit/job/miner/equipped/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	if(istype(H.wear_suit, /obj/item/clothing/suit/hooded))
		var/obj/item/clothing/suit/hooded/S = H.wear_suit
		S.ToggleHood()

/datum/outfit/job/miner/equipped/hardsuit
	name = "Shaft Miner (Equipment + Hardsuit)"
	suit = /obj/item/clothing/suit/space/hardsuit/mining
	mask = /obj/item/clothing/mask/breath
