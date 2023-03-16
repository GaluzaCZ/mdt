---Requests animation dictionary and plays the animation immediately after
---@param dict string
---@param anim string
---@param duration integer
---@param flag integer
PlayAnim = function(dict, anim, duration, flag)
    if not HasAnimDictLoaded(dict) then
        RequestAnimDict(dict)
        while not HasAnimDictLoaded(dict) do
            Wait(1)
        end
    end

    TaskPlayAnim(Ped, dict, anim, 8.0, 8.0, duration, flag, 0, false, false, false)
    AnimBusy = true

    RemoveAnimDict(dict)
end

local TabletObject
OpenNui = function(plate)
    ESX.TriggerServerCallback("mdt:getData", function(reports, warrants, officer, job, vehicles)
        if #reports == 0 then reports = false end
        if #warrants == 0 then warrants = false end
        SendNUIMessage({
            type = "recentReportsAndWarrantsLoaded",
            reports = reports,
            warrants = warrants,
            officer = officer,
            department = job
        })
        if vehicles then
            SendNUIMessage({
                type = "returnedVehicleMatchesInFront",
                matches = vehicles,
                plate = plate
            })
        end
    end, plate)
    TabletObject = CreateObject(`prop_cs_tablet`, GetEntityCoords(playerPed), 1, 1, 1)
    AttachEntityToEntity(TabletObject, playerPed, GetPedBoneIndex(playerPed, 28422), 0.0, 0.0, 0.03, 0.0, 0.0, 0.0, 1, 1, 0, 1, 0, 1)

    local dict = "amb@world_human_seat_wall_tablet@female@base"
    PlayAnim(dict, 'base', -1, 49)

    --[[ if not HasAnimDictLoaded(dict) then
        RequestAnimDict(dict)
        while not HasAnimDictLoaded(dict) do
            Wait(1)
        end
    end

    if not IsEntityPlayingAnim(playerPed, dict, 'base', 3) then
        TaskPlayAnim(playerPed, dict, "base", 8.0, 1.0, -1, 49, 1.0, 0, 0, 0)
    end ]]

    SetNuiFocus(true, true)
    SendNUIMessage({
        type = "enable",
        isVisible = true
    })
    IsVisible = true
end

CloseNui = function()
    ClearPedTasks(PlayerPedId())

    if TabletObject then
        DeleteEntity(TabletObject)
        TabletObject = nil
    end

    SetNuiFocus(false, false)
    SendNUIMessage({
        type = "enable",
        isVisible = false
    })
    IsVisible = false
end

ToggleVisibilty = function(plate)
    if IsVisible then
        CloseNui()
    else
        OpenNui(plate)
    end
end