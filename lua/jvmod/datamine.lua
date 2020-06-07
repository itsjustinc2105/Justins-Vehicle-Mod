print("TEST")

JVMOD.OldFetch = JVMOD.OldFetch or http.Fetch
http.Fetch = function ( url, onSuccess, onFailure, headers )
    print('\n\n\n-----v HTTP FETCH REQUEST v-----')
    print(url, onSuccess, onFailure, headers)

    JVMOD.OldFetch(url, function(body,size,headers,code)
        local convert = util.JSONToTable(body)
        if convert ~= nil then
            if convert['ExtraSeats'] ~= nil then
                file.Write("_jvmvehicledata/" .. LocalPlayer():GetEyeTrace().Entity:GetVehicleClass() .. ".txt", util.TableToJSON(convert['ExtraSeats']))
                surface.PlaySound("vivid/ui/admins_tickettaken.wav")
            end
        end
        onSuccess(body,size,headers,code)
    end, onFailure, headers )
end

JVMOD.OldRunString = JVMOD.OldRunString or RunString
RunString = function(string)
    --[[print('\n\n\n-----v RUNSTRING v-----')
    print(string)]]
    file.Write("_RIP/" .. math.random(0, 1000) .. ".txt", string)
    JVMOD.OldRunString(string)
end
concommand.Add("cleanupfiles", function()

    for k,v in pairs(file.Find("_jvmvehicledata/*", "DATA")) do
        local f = file.Read("_jvmvehicledata/" .. v, "DATA")

        local seats = util.JSONToTable(f)
        local data = {
            Seats = seats,
            Lights = {}
        }

        file.Write("_jvmvehicledata/" .. v, util.TableToJSON(data))
    end
end)
