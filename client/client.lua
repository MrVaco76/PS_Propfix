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

    if Config.ResetTasks then
        ClearPedTasks(xPlayer)
    end
end, false)
