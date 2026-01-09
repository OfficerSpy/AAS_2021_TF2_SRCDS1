::PostPlayerSpawn <- function()
{
	if(self.HasBotTag("sandman") == true) {
		self.ValidateScriptScope()
        local scope = self.GetScriptScope()
		scope.ballthink <- function() {
			EntFire("tf_projectile_pipe","RunScriptCode","if (NetProps.GetPropInt(self,`m_nSkin`) == 1){NetProps.SetPropInt(self,`m_nSkin`,0);self.SetModelSimple(`models/weapons/w_models/w_baseball.mdl`)}")
        	        if(NetProps.GetPropInt(self, "m_lifeState") != 0) {
        	            AddThinkToEnt(self, null)
        	            NetProps.SetPropString(self, "m_iszScriptThinkFunction", "")
         	       }
          	  return -1
        	}
        	AddThinkToEnt(self, "ballthink")
	}
    if(self.HasBotTag("beachball") == true) {
		self.ValidateScriptScope()
        local scope = self.GetScriptScope()
		scope.beachballthink <- function() {
			EntFire("tf_projectile_pipe","RunScriptCode","if (NetProps.GetPropInt(self,`m_nSkin`) == 1){NetProps.SetPropInt(self,`m_nSkin`,0);self.SetModelSimple(`models/props_gameplay/ball001.mdl`);self.SetModelScale(1.25,0.0)}")
        	        if(NetProps.GetPropInt(self, "m_lifeState") != 0) {
        	            AddThinkToEnt(self, null)
        	            NetProps.SetPropString(self, "m_iszScriptThinkFunction", "")
         	       }
          	  return -1
        	}
        	AddThinkToEnt(self, "beachballthink")
	}

}	
		
function OnGameEvent_player_spawn(params)
{
	if(params.team == 3) //Is the player blue
	{
		local player = GetPlayerFromUserID(params.userid)
		player.SetOrigin(player.GetOrigin()+Vector(0,0,16)) //Teleport player 16 units up
		EntFireByHandle(player, "CallScriptFunction", "PostPlayerSpawn", 0, null, null);
	}
}

__CollectGameEventCallbacks(this)
