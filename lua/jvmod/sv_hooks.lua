hook.Add("OnEntityCreated", "jvm.vehicleInit", function(ent)
    if ent:GetClass() == "prop_vehicle_jeep" then
        JVMOD.InitVehicle(ent)
    end
end)
