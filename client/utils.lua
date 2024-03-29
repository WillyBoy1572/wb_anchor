function canAnchor(vehicle)
    if not DoesEntityExist(vehicle) then
        return false
    end

    local model = GetEntityModel(vehicle)

    if not model or model == 0 then
        return false
    end

    if not (IsThisModelABoat(model) or IsThisModelAJetski(model) or IsThisModelAnAmphibiousCar(model) or IsThisModelAnAmphibiousQuadbike(model)) then
        return false
    end

    if GetEntitySpeed(vehicle) > tonumber(shared.maxSpeed) then
        onTooFast(vehicle)
        return false
    end

    return true
end

function isOwner(vehicle)
    local ownerId = GetPlayerServerId(NetworkGetEntityOwner(vehicle))

    if ownerId == -1 then
        return false
    end

    if ownerId ~= client.serverId then
        return false
    end

    return true
end

function forceCalculation(vehicle, vector, distance)
    local direction = vector / distance
    local distance = direction * (distance + 3.0) ^ 3
    local speed = math.min(GetEntitySpeed(vehicle), 2.0) * 0.10

    return distance * math.max(speed, 0.25)
end

function onTooFast(vehicle)
    lib.notify({
        description = 'Le bateau va trop vite ! Ralentissez pour jeter l\'ancre !',
        position = 'top',
        type = 'error'
    })
end

function onUnanchored(vehicle)
    lib.notify({
        description = 'Le bateau a été déancré !',
        position = 'top',
        type = 'inform'
    })
end

function onAnchoring(vehicle)
    lib.notify({
        description = 'Le bateau  été ancré !',
        position = 'top',
        type = 'success'
    })
    return true
end

function onAnchorBroke(vehicle)
    lib.notify({
        description = 'Attention ! Ancre brisé',
        position = 'top',
        type = 'error'
    })
end
