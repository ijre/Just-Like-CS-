::JustLikeCS <-
{
  OnGameEvent_round_start_pre_entity = function(args)
  {
    PrecacheSound("Player.Manager_TakeSubMachineGun03");
  }

  OnGameEvent_player_use = function(args)
  {
    local player = GetPlayerFromUserID(args.userid);
    local weapon = Ent(args.targetid);
    local classname = weapon.GetClassname();

    local acceptedWeps =
    [
      "weapon_rifle_sg552"
      "weapon_sniper_awp"
      "weapon_sniper_military"
      "weapon_smg_mp5"
      "weapon_pistol_magnum"
      "weapon_rifle_ak47"
      "weapon_autoshotgun"
    ];

    local accepted = false;
    for (local i = 0; i < 7; i++)
    {
      if (classname == acceptedWeps[i])
      {
        accepted = true;
        break;
      }
    }

    if (!accepted)
    {
      if (classname != "weapon_melee" || NetProps.GetPropString(weapon, "m_strMapSetScriptName") != "knife")
      {
        return;
      }
    }

    if (RandomInt(0, 7) == 0)
    {
      EmitSoundOn("Player.Manager_TakeSubMachineGun03", player);
    }
  }
}

__CollectEventCallbacks(::JustLikeCS, "OnGameEvent_", "GameEventCallbacks", RegisterScriptGameEventListener);