

Citizen.CreateThread(function()
    while true do
        Wait(1)
        SetPauseMenuActive(false)
        if (IsControlJustPressed(0, 200) and IsPauseMenuActive() == false) then
            TransitionToBlurred(1000)
            SetNuiFocus(true, true)
            SendNUIMessage({
                open = true
            })
        end
    end
end)

-- Permet de fermer le menu
function ClosePause()
    TransitionFromBlurred(1000)
    SetNuiFocus(false, false)
    SendNUIMessage({
        open = false
    })
end

function OpenSettings()
    ClosePause()
    ActivateFrontendMenu(GetHashKey('FE_MENU_VERSION_MP_PAUSE'),0,6)
    
    
end

function OpenMap()
    ClosePause()
    ActivateFrontendMenu(GetHashKey('FE_MENU_VERSION_MP_PAUSE'),0,-1)
    

end

-- Reçoit l'appel du jquery
RegisterNUICallback('closemenu', function(data)
    ClosePause()
end)

RegisterNUICallback('config', function(data)
    OpenSettings()
end)

RegisterNUICallback('map', function(data)
    OpenMap()
end)