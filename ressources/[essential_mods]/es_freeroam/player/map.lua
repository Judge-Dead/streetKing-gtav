local blips = {
   -- Airport and Airfield
   {name="Airport", id=90, x=-1032.690, y=-2728.141, z=13.757, color=27},
   {name="Airport", id=90, x=1743.6820, y=3286.2510, z=40.087, color=27},
   -- BUS DE SA MERE A POIL
   {name="Depot Bus", id=106, x=1026.080, y=-2500.622, z=28.430, color=2},
   -- gouvernement
   {name="Gouvernement", id=419, x=-429.456, y=1109.420, z=327.682, color=45},
   -- Depaneur
   {name="Depaneur", id=198, x=850.588, y=-1358.749, z=26.099, color=60},
    -- Gas stations
    {name="Gas Station", id=361, x=49.4187,   y=2778.793,  z=58.043, color=1},
    {name="Gas Station", id=361, x=263.894,   y=2606.463,  z=44.983, color=1},
    {name="Gas Station", id=361, x=1039.958,  y=2671.134,  z=39.550, color=1},
    {name="Gas Station", id=361, x=1207.260,  y=2660.175,  z=37.899, color=1},
    {name="Gas Station", id=361, x=2539.685,  y=2594.192,  z=37.944, color=1},
    {name="Gas Station", id=361, x=2679.858,  y=3263.946,  z=55.240, color=1},
    {name="Gas Station", id=361, x=2005.055,  y=3773.887,  z=32.403, color=1},
    {name="Gas Station", id=361, x=1687.156,  y=4929.392,  z=42.078, color=1},
    {name="Gas Station", id=361, x=1701.314,  y=6416.028,  z=32.763, color=1},
    {name="Gas Station", id=361, x=179.857,   y=6602.839,  z=31.868, color=1},
    {name="Gas Station", id=361, x=-94.4619,  y=6419.594,  z=31.489, color=1},
    {name="Gas Station", id=361, x=-2554.996, y=2334.40,  z=33.078, color=1},
    {name="Gas Station", id=361, x=-1800.375, y=803.661,  z=138.651, color=1},
    {name="Gas Station", id=361, x=-1437.622, y=-276.747,  z=46.207, color=1},
    {name="Gas Station", id=361, x=-2096.243, y=-320.286,  z=13.168, color=1},
    {name="Gas Station", id=361, x=-724.619, y=-935.1631,  z=19.213, color=1},
    {name="Gas Station", id=361, x=-526.019, y=-1211.003,  z=18.184, color=1},
    {name="Gas Station", id=361, x=-70.2148, y=-1761.792,  z=29.534, color=1},
    {name="Gas Station", id=361, x=265.648,  y=-1261.309,  z=29.292, color=1},
    {name="Gas Station", id=361, x=819.653,  y=-1028.846,  z=26.403, color=1},
    {name="Gas Station", id=361, x=1208.951, y= -1402.567, z=35.224, color=1},
    {name="Gas Station", id=361, x=1181.381, y= -330.847,  z=69.316, color=1},
    {name="Gas Station", id=361, x=620.843,  y= 269.100,  z=103.089, color=1},
    {name="Gas Station", id=361, x=2581.321, y=362.039, 108.468, color=1},
    -- Police Stations
    {name="Police Station", id=60, x=425.130, y=-979.558, z=30.711, color=63},
    {name="Police Station", id=60, x=1859.234, y= 3678.742, z=33.690, color=63},
    {name="Police Station", id=60, x=-438.862, y=6020.768, z=31.490, color=63},
    {name="Police Station", id=60, x=818.221, y=-1289.883, z=26.300, color=63},
    {name="Prison", id=285, x=1679.049, y=2513.711, z=45.565, color=85},
    -- Hospitals
    {name="Hospital", id=61, x= 1151.21, y= -1529.62, z= 35.37, color=2},
    -- Mineur
    {name="Mineur Recolte", id=17, x= 2645.971, y= 2806.372, z= 33.992, color=28},
    {name="Mineur Traitement", id=18, x= 1038.343, y= 2261.368, z= 43.729, color=28},
    {name="Mineur Vente", id=19, x= 172.151, y= 2279.622, z= 92.690, color=28},
  }

Citizen.CreateThread(function()

    for _, item in pairs(blips) do
      item.blip = AddBlipForCoord(item.x, item.y, item.z)
      SetBlipSprite(item.blip, item.id)
      SetBlipAsShortRange(item.blip, true)
      SetBlipColour(item.blip, item.color)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(item.name)
      EndTextCommandSetBlipName(item.blip)
    end

  --load unloaded ipl's
  LoadMpDlcMaps()
  EnableMpDlcMaps(true)
  RequestIpl("chop_props")
  RequestIpl("FIBlobby")
  RemoveIpl("FIBlobbyfake")
  RequestIpl("FBI_colPLUG")
  RequestIpl("FBI_repair")
  RequestIpl("v_tunnel_hole")
  RequestIpl("TrevorsMP")
  RequestIpl("TrevorsTrailer")
  RequestIpl("TrevorsTrailerTidy")
  RemoveIpl("farm_burnt")
  RemoveIpl("farm_burnt_lod")
  RemoveIpl("farm_burnt_props")
  RemoveIpl("farmint_cap")
  RemoveIpl("farmint_cap_lod")
  RequestIpl("farm")
  RequestIpl("farmint")
  RequestIpl("farm_lod")
  RequestIpl("farm_props")
  RequestIpl("facelobby")
  RemoveIpl("CS1_02_cf_offmission")
  RequestIpl("CS1_02_cf_onmission1")
  RequestIpl("CS1_02_cf_onmission2")
  RequestIpl("CS1_02_cf_onmission3")
  RequestIpl("CS1_02_cf_onmission4")
  RequestIpl("v_rockclub")
  RemoveIpl("hei_bi_hw1_13_door")
  RequestIpl("bkr_bi_hw1_13_int")
  RequestIpl("ufo")
  RemoveIpl("v_carshowroom")
  RemoveIpl("shutter_open")
  RemoveIpl("shutter_closed")
  RemoveIpl("shr_int")
  RemoveIpl("csr_inMission")
  RequestIpl("v_carshowroom")
  RequestIpl("shr_int")
  RequestIpl("shutter_closed")
  RequestIpl("smboat")
  RequestIpl("cargoship")
  RequestIpl("railing_start")
  RemoveIpl("sp1_10_fake_interior")
  RemoveIpl("sp1_10_fake_interior_lod")
  RequestIpl("sp1_10_real_interior")
  RequestIpl("sp1_10_real_interior_lod")
  RemoveIpl("id2_14_during_door")
  RemoveIpl("id2_14_during1")
  RemoveIpl("id2_14_during2")
  RemoveIpl("id2_14_on_fire")
  RemoveIpl("id2_14_post_no_int")
  RemoveIpl("id2_14_pre_no_int")
  RemoveIpl("id2_14_during_door")
  RequestIpl("id2_14_during1")
  RequestIpl("coronertrash")
  RequestIpl("Coroner_Int_on")
  RemoveIpl("Coroner_Int_off")
  RemoveIpl("bh1_16_refurb")
  RemoveIpl("jewel2fake")
  RemoveIpl("bh1_16_doors_shut")
  RequestIpl("refit_unload")
  RequestIpl("post_hiest_unload")
  RequestIpl("Carwash_with_spinners")
  RequestIpl("ferris_finale_Anim")
  RemoveIpl("ch1_02_closed")
  RequestIpl("ch1_02_open")
  RequestIpl("AP1_04_TriAf01")
  RequestIpl("CS2_06_TriAf02")
  RequestIpl("CS4_04_TriAf03")
  RemoveIpl("scafstartimap")
  RequestIpl("scafendimap")
  RemoveIpl("DT1_05_HC_REMOVE")
  RequestIpl("DT1_05_HC_REQ")
  RequestIpl("DT1_05_REQUEST")
  RequestIpl("FINBANK")
  RemoveIpl("DT1_03_Shutter")
  RemoveIpl("DT1_03_Gr_Closed")
  RequestIpl("ex_sm_13_office_01a")
  RequestIpl("ex_sm_13_office_01b")
  RequestIpl("ex_sm_13_office_02a")
  RequestIpl("ex_sm_13_office_02b")
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local players = {}

    for i = 0, 31 do
      if NetworkIsPlayerActive(i) then
        table.insert(players, i)
      end
    end

    for k, v in pairs(players) do
      if not GetBlipFromEntity(GetPlayerPed(v)) then
        if GetPlayerPed(v) == GetPlayerPed(-1) then return end
        local blip = AddBlipForEntity(GetPlayerPed(v))
        SetBlipColour(blip, 1)
      end
    end
  end
end)
