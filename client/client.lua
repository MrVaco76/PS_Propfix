
if Config.Framework == "ESX" then
    ESX = exports['es_extended']:getSharedObject()
end

-- Add a wait loop to ensure ESX is loaded
if Config.Framework == "ESX" then
    while not ESX do
        Citizen.Wait(100)
    end
end

if Config.Framework == "qb-core" then
    QBCore = exports['qb-core']:GetCoreObject()
end


RegisterCommand(Config.PropFixCommand, function(source, args, rawCommand)
    local xPlayer = PlayerPedId()
    
   
    function RemoveAttachedObjects(ped)
      

        local handle, object = FindFirstObject()
        local finished = false
        local count = 0

        repeat
            if DoesEntityExist(object) then
                if IsEntityAttachedToEntity(object, ped) then
                    DetachEntity(object, true, true) 
                    SetEntityAsMissionEntity(object, true, true) 
                    DeleteObject(object) 
                    Wait(0) 
                    if not DoesEntityExist(object) then
                        count = count + 1
                       
                    else
                       
                    end
                end
            end
            finished, object = FindNextObject(handle)
        until not finished

        EndFindObject(handle)
        
    end

    RemoveAttachedObjects(xPlayer)

    if Config.SendNotification then 
        local msg = Config.NotificationMsg
        local type = "success"

        Notify(msg, type)
    end
    if Config.ResetTasks then
        ClearPedTasks(xPlayer)
    end
end, false)



function Notify(msg, type)
    if Config.Notify == "ESX" then
        if type == "info" then 
            ESX.ShowNotification(msg, type, 5000)   
        end
        if type == "success" then
            ESX.ShowNotification(msg, type, 5000)   
        end
        if type == "error" then
            ESX.ShowNotification(msg, type, 5000)
        end
    elseif Config.Notify == "qb-core" then
        if type == "primary" then 
            QBCore.Functions.Notify(msg, "primary", 5000)
        end
        if type == "success" then
            QBCore.Functions.Notify(msg, "success", 5000)
        end
        if type == "error" then
            QBCore.Functions.Notify(msg, "error", 5000)
        end
    elseif Config.Notify == "standalone" then
        ShowNotification(msg)
    elseif Config.Notify == "custom" then
        --add here your notify trigger
    else
        print("Unknown framework specified in Config.Framework!")
    end
end

function ShowNotification(msg)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(msg)
    DrawNotification(false, true)
end
