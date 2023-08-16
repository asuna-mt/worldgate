--
-- Overrides for Telemosaic settings
--

-- Give extenders a lot more range
if minetest.settings:get_bool("worldgate.superextenders",true) then
  -- Global extender values
  telemosaic.extender_ranges = { 250, 750, 1500 }

  -- Tier 1 extenders
  local tier1range = telemosaic.extender_ranges[1]
  local tier1groups = minetest.registered_nodes["telemosaic:extender_one"].groups
  tier1groups.telemosaic_extender = tier1range
  minetest.override_item("telemosaic:extender_one",{ groups = tier1groups })

  -- Tier 2 extenders
  local tier2range = telemosaic.extender_ranges[2]
  local tier2groups = minetest.registered_nodes["telemosaic:extender_two"].groups
  tier2groups.telemosaic_extender = tier2range
  minetest.override_item("telemosaic:extender_two",{ groups = tier2groups })

  -- Tier 3 extenders
  local tier3range = telemosaic.extender_ranges[3]
  local tier3groups = minetest.registered_nodes["telemosaic:extender_three"].groups
  tier3groups.telemosaic_extender = tier3range
  minetest.override_item("telemosaic:extender_three",{ groups = tier3groups })
end

-- Implement a longer minimum delay for teleportation to prevent spamming and
-- weirdness with loading/unloading mapblocks
local min_delay = 5
if telemosaic.teleport_delay < min_delay then
  telemosaic.teleport_delay = min_delay
end

-- Override beacons to give off light if configured
if minetest.settings:get_bool("worldgate.beaconglow",true) then
  for _,beacon in ipairs({
    "telemosaic:beacon",
    "telemosaic:beacon_protected",
    "telemosaic:beacon_err",
    "telemosaic:beacon_err_protected",
  }) do
    minetest.override_item(beacon,{
      light_source = 15,
    })
  end
end