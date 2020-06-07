--[[
    All functions that are used by JVMod and shouldn't be used by other scripts
]]

function JVMOD.InitVehicle(veh)
    if veh.JVMOD ~= nil then return end
    veh.JVMOD = {
        Seats = {},
        Lights = {},
        Fuel = 100
    }

    http.Fetch("https://raw.githubusercontent.com/itsjustinc2105/jvmod/master/vehicledata/".. veh:GetVehicleClass() ..".txt?token=AP3WRR7OG2YUEBFQZAOATIC63SBPGa", function(body,size,table,code)
        print(body)
    end,
    function(err)
        -- kill script
        print("Error")
    end)
end
