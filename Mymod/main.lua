local mod = RegisterMod("My Mod", 1)
local pShoot = Isaac.GetItemIdByName("Precision Shot")
local shootSpeedValue = 2
local damageValue = 2

function mod:EvaluateCache(player, cacheFlags)
	if cacheFlags & CacheFlag.CACHE_SHOTSPEED == CacheFlag.CACHE_SHOTSPEED then
		local itemCount = player:GetCollectibleNum(pShoot)
		if itemCount > 0 then
			local shootSpeedToAdd = shootSpeedValue * itemCount
			player.ShotSpeed = player.ShotSpeed + shootSpeedToAdd
		end
	end

	if cacheFlags & CacheFlag.CACHE_DAMAGE == CacheFlag.CACHE_DAMAGE then
		local itemCount = player:GetCollectibleNum(pShoot)
		if itemCount > 0 then
			local damageToAdd = damageValue * itemCount
			player.Damage = player.Damage + damageToAdd
		end
	end
end

mod:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, mod.EvaluateCache)
