CreateThread(
    function()
        while true do
            Wait(0)
            if IsPedArmed(PlayerPedId(), 4 | 2) then
                if (IsPlayerFreeAiming(PlayerId())) then
                    SendNUIMessage({display = "crosshairShow"})
                    Wait(100)
                else
                    SendNUIMessage({display = "crosshairHide"})
                    Wait(100)
                end
            else
                SendNUIMessage({display = "crosshairHide"})
                Wait(1000)
            end
        end
    end
)

function ManageReticle()
    local ped = GetPlayerPed( -1 )

    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then
        if ( GetFollowPedCamViewMode() ~= 4 and IsPlayerFreeAiming() ) then 
            HideHudComponentThisFrame( 14 )
        end
        Citizen.Wait( 0 )
    end 
    HideHudComponentThisFrame( 14 )
end 

Citizen.CreateThread( function()
    while true do 
        ManageReticle()
        Citizen.Wait(1)
    end 
end )
