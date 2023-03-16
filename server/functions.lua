GetReports = function()
    local reports = MySQL.Sync.fetchAll("SELECT * FROM (SELECT * FROM `mdt_reports` ORDER BY `id` DESC LIMIT 3) sub ORDER BY `id` DESC")
    for i = 1, #reports do
        reports[i].charges = json.decode(reports[i].charges)
    end
    return reports
end
GetWarrants = function()
    local warrants = MySQL.Sync.fetchAll("SELECT * FROM (SELECT * FROM `mdt_warrants` ORDER BY `id` DESC LIMIT 3) sub ORDER BY `id` DESC")
    for i = 1, #warrants do
        warrants[i].charges = json.decode(warrants[i].charges)
    end
    return warrants
end
SearchVehicle = function(plate)
    local vehicles = MySQL.Sync.fetchAll("SELECT * FROM `owned_vehicles` WHERE `plate` = ?", {plate})
    return vehicles
end
GetFineTypes = function()
    local fines_types = MySQL.Sync.fetchAll("SELECT * FROM fine_types")
    return fines_types
end