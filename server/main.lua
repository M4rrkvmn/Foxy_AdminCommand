ESX = exports["es_extended"]:getSharedObject()

function logdclog(name,message)
    if not Config.Webhook then return end 
    local connect = {
        {
            ["color"] = 16711680, -- ZÜLD: 27946 PIROS: 10616832
            ["title"] = "**".. name .."**",
            ["description"] = message,
            ["footer"] = {
                ["text"] = os.date("%Y-%m-%d %X"),
            },
        }
    }
    PerformHttpRequest(Config.Webhook, function(err, text, headers) end, 'POST', json.encode({embeds = connect}), { ['Content-Type'] = 'application/json' })
end

function GivearmourIsAdmin(playerGroup)
    for _, perm in ipairs(Config.Perms.Givearmour) do
        if playerGroup == perm then
            return true
        end
    end
    return false
end

function RemovearmourIsAdmin(playerGroup)
    for _, perm in ipairs(Config.Perms.Removearmour) do
        if playerGroup == perm then
            return true
        end
    end
    return false
end

function KillIsAdmin(playerGroup)
    for _, perm in ipairs(Config.Perms.Kill) do
        if playerGroup == perm then
            return true
        end
    end
    return false
end

function ReviveIsAdmin(playerGroup)
    for _, perm in ipairs(Config.Perms.Revive) do
        if playerGroup == perm then
            return true
        end
    end
    return false
end

function FreezeIsAdmin(playerGroup)
    for _, perm in ipairs(Config.Perms.Freeze) do
        if playerGroup == perm then
            return true
        end
    end
    return false
end

function UnFreezeIsAdmin(playerGroup)
    for _, perm in ipairs(Config.Perms.UnFreeze) do
        if playerGroup == perm then
            return true
        end
    end
    return false
end

function HealIsAdmin(playerGroup)
    for _, perm in ipairs(Config.Perms.Heal) do
        if playerGroup == perm then
            return true
        end
    end
    return false
end

function RelogIsAdmin(playerGroup)
    for _, perm in ipairs(Config.Perms.Relog) do
        if playerGroup == perm then
            return true
        end
    end
    return false
end

function SpeedIsAdmin(playerGroup)
    for _, perm in ipairs(Config.Perms.Speedtp) do
        if playerGroup == perm then
            return true
        end
    end
    return false
end

function FixIsAdmin(playerGroup)
    for _, perm in ipairs(Config.Perms.Fix) do
        if playerGroup == perm then
            return true
        end
    end
    return false
end

function ClearIsAdmin(playerGroup)
    for _, perm in ipairs(Config.Perms.Clear) do
        if playerGroup == perm then
            return true
        end
    end
    return false
end

function ClearallIsAdmin(playerGroup)
    for _, perm in ipairs(Config.Perms.ClearAll) do
        if playerGroup == perm then
            return true
        end
    end
    return false
end

function TeleporttoPlayerIsAdmin(playerGroup)
    for _, perm in ipairs(Config.Perms.TeleporttoPlayer) do
        if playerGroup == perm then
            return true
        end
    end
    return false
end

function TeleporttoPlayermeIsAdmin(playerGroup)
    for _, perm in ipairs(Config.Perms.TeleporttoPlayerme) do
        if playerGroup == perm then
            return true
        end
    end
    return false
end

function KickIsAdmin(playerGroup)
    for _, perm in ipairs(Config.Perms.Kick) do
        if playerGroup == perm then
            return true
        end
    end
    return false
end

function SetGroupIsAdmin(playerGroup)
    for _, perm in ipairs(Config.Perms.SetGroup) do
        if playerGroup == perm then
            return true
        end
    end
    return false
end

function SetJobIsAdmin(playerGroup)
    for _, perm in ipairs(Config.Perms.SetJob) do
        if playerGroup == perm then
            return true
        end
    end
    return false
end

function GiveitemIsAdmin(playerGroup)
    for _, perm in ipairs(Config.Perms.Giveitem) do
        if playerGroup == perm then
            return true
        end
    end
    return false
end

function GiveaccountmoneyIsAdmin(playerGroup)
    for _, perm in ipairs(Config.Perms.GiveaccountMoney) do
        if playerGroup == perm then
            return true
        end
    end
    return false
end

function RemoveaccountmoneyIsAdmin(playerGroup)
    for _, perm in ipairs(Config.Perms.Removeaccountmoney) do
        if playerGroup == perm then
            return true
        end
    end
    return false
end

function FpubTpIsAdmin(playerGroup)
    for _, perm in ipairs(Config.Perms.FpubTp) do
        if playerGroup == perm then
            return true
        end
    end
    return false
end

function EmsTpIsAdmin(playerGroup)
    for _, perm in ipairs(Config.Perms.EmsTp) do
        if playerGroup == perm then
            return true
        end
    end
    return false
end

function LspdTpIsAdmin(playerGroup)
    for _, perm in ipairs(Config.Perms.LspdTp) do
        if playerGroup == perm then
            return true
        end
    end
    return false
end

RegisterCommand(Config.Command.Givearmour, function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    local targetId = tonumber(args[1])
    local adminGroup = xPlayer.getGroup()

    if GivearmourIsAdmin(adminGroup) then
    if targetId == nil then
        TriggerClientEvent('esx:showNotification', source, 'Armort adtál magadnak!')
        xPlayer.triggerEvent('armour')
        logdclog('' .. GetPlayerName(source) ..' ['..xPlayer.getGroup()..'] [ID :'.. xPlayer.source ..']','/'..Config.Command.Givearmour..' Parancsot használta magán')
    else
        local targetPlayer = ESX.GetPlayerFromId(targetId)

        if targetPlayer then
            TriggerClientEvent('esx:showNotification', source,
                'Armort adtál neki '..GetPlayerName(targetPlayer.source)..' [ID : '..targetId..']')
                TriggerClientEvent('esx:showNotification', targetPlayer.source, 'Armort adott neked ['..xPlayer.getGroup()..'] '..GetPlayerName(source)..'')
                targetPlayer.triggerEvent('armour')
                logdclog('' .. GetPlayerName(source) ..' ['..xPlayer.getGroup()..'] [ID :'.. xPlayer.source ..']','/'..Config.Command.Givearmour..' Parancsot használta rajta: '.. GetPlayerName(targetId) ..' [ID :'..targetPlayer.source..'] ')
        else
            TriggerClientEvent('esx:showNotification', source, 'Nincs ilyen ID-jű játékos.')
        end
    end
    else
    return TriggerClientEvent('esx:showNotification',source, 'Nincs jogod a parancshoz.')
end
end, false)


RegisterCommand(Config.Command.Removearmour, function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    local targetId = tonumber(args[1])
    local adminGroup = xPlayer.getGroup()

    if RemovearmourIsAdmin(adminGroup) then
    if targetId == nil then
        TriggerClientEvent('esx:showNotification', source, 'Elvetted a saját armorod magadnak!')
        xPlayer.triggerEvent('Removearmour')
        logdclog('' .. GetPlayerName(source) ..' ['..xPlayer.getGroup()..'] [ID :'.. xPlayer.source ..']','/'..Config.Command.Removearmour..' Parancsot használta magán')
    else
        local targetPlayer = ESX.GetPlayerFromId(targetId)

        if targetPlayer then
            TriggerClientEvent('esx:showNotification', source,
                'Elvetted az armortját neki '..GetPlayerName(targetPlayer.source)..' [ID : '..targetId..']')
                TriggerClientEvent('esx:showNotification', targetPlayer.source, 'Elvette az armorodat ['..xPlayer.getGroup()..'] '..GetPlayerName(source)..'')
                targetPlayer.triggerEvent('Removearmour')
                logdclog('' .. GetPlayerName(source) ..' ['..xPlayer.getGroup()..'] [ID :'.. xPlayer.source ..']','/'..Config.Command.Removearmour..' Parancsot használta rajta: '.. GetPlayerName(targetId) ..' [ID :'..targetPlayer.source..'] ')
        else
            TriggerClientEvent('esx:showNotification', source, 'Nincs ilyen ID-jű játékos.')
        end
    end
    else
        return TriggerClientEvent('esx:showNotification',source,'Nincs jogod a parancshoz.')
end
end, false)

    RegisterCommand(Config.Command.Kill, function(source, args, rawCommand)
        local targetId = tonumber(args[1])
        local xTarget = ESX.GetPlayerFromId(targetId)
        local xPlayer = ESX.GetPlayerFromId(source)
        local adminGroup = xPlayer.getGroup()

        if KillIsAdmin(adminGroup) then   
        if xPlayer.identifier == xPlayer.getIdentifier() then
            if xTarget then
                TriggerClientEvent('esx:showNotification',source,'Le killelted őt '..GetPlayerName(xTarget.source)..' [ID : '..targetId..']')
                TriggerClientEvent('esx:showNotification',xTarget.source, 'Le killelt téged ['..xPlayer.getGroup()..'] '..GetPlayerName(source)..'')
                xTarget.triggerEvent('Kill')
                logdclog('' .. GetPlayerName(source) ..' ['..xPlayer.getGroup()..'] [ID :'.. xPlayer.source ..']','/'..Config.Command.Kill..' Parancsot használta rajta: '.. GetPlayerName(targetId) ..' [ID :'..xTarget.source..'] ')
                else
                TriggerClientEvent('esx:showNotification', source, 'Nincs ilyen ID-jű játékos.')
            end
        end
        else
            return TriggerClientEvent('esx:showNotification',source,'Nincs jogod a parancshoz.')
    end
    end,false)

    RegisterCommand(Config.Command.Revive, function(source, args, rawCommand)
        local xPlayer = ESX.GetPlayerFromId(source)
        local targetId = tonumber(args[1])
        local adminGroup = xPlayer.getGroup()

        if ReviveIsAdmin(adminGroup) then
        if targetId == nil then
            TriggerClientEvent('esx:showNotification', source, 'Revive-oltad magad!')
            xPlayer.triggerEvent('Revive')
            logdclog('' .. GetPlayerName(source) ..' ['..xPlayer.getGroup()..'] [ID :'.. xPlayer.source ..']','/'..Config.Command.Revive..' Parancsot használta magán')
        else
            local targetPlayer = ESX.GetPlayerFromId(targetId)
    
            if targetPlayer then
                TriggerClientEvent('esx:showNotification', source,
                    'Revive-oltad őt '..GetPlayerName(targetPlayer.source)..' [ID : '..targetId..']')
                    TriggerClientEvent('esx:showNotification',targetPlayer.source,'Revive-lt téged ['..xPlayer.getGroup()..'] '..GetPlayerName(source)..'')
                    targetPlayer.triggerEvent('Revive')
                    logdclog('' .. GetPlayerName(source) ..' ['..xPlayer.getGroup()..'] [ID :'.. xPlayer.source ..']','/'..Config.Command.Revive..' Parancsot használta rajta: '.. GetPlayerName(targetId) ..' [ID :'..targetPlayer.source..'] ')
            else
                TriggerClientEvent('esx:showNotification', source, 'Nincs ilyen ID-jű játékos.')
            end
        end
        else
            return TriggerClientEvent('esx:showNotification',source,'Nincs jogod a parancshoz.')
    end
    end, false)

    RegisterCommand(Config.Command.Fix, function(source, args, rawCommand)
        local xPlayer = ESX.GetPlayerFromId(source)
        local targetId = tonumber(args[1])
        local adminGroup = xPlayer.getGroup()
        
        if FixIsAdmin(adminGroup) then
        if targetId == nil then
            xPlayer.triggerEvent('RepairVeh')
            logdclog('' .. GetPlayerName(source) ..' ['..xPlayer.getGroup()..'] [ID :'.. xPlayer.source ..']','/'..Config.Command.Fix..' Parancsot használta magán')
        else
            local targetPlayer = ESX.GetPlayerFromId(targetId)
    
            if targetPlayer then
                    targetPlayer.triggerEvent('RepairVeh')
                    logdclog('' .. GetPlayerName(source) ..' ['..xPlayer.getGroup()..'] [ID :'.. xPlayer.source ..']','/'..Config.Command.Fix..' Parancsot használta rajta: '.. GetPlayerName(targetId) ..' [ID :'..targetPlayer.source..'] ')
            else
                TriggerClientEvent('esx:showNotification', source, 'Nincs ilyen ID-jű játékos.')
            end
        end
        else
            return TriggerClientEvent('esx:showNotification',source,'Nincs jogod a parancshoz.')
        end
    end, false)


    RegisterCommand(Config.Command.Freeze, function(source, args, rawCommand)
        local xPlayer = ESX.GetPlayerFromId(source)
        local targetId = tonumber(args[1])
            local targetPlayer = ESX.GetPlayerFromId(targetId)
            local adminGroup = xPlayer.getGroup()

            if FreezeIsAdmin(adminGroup) then
            if targetPlayer then
                TriggerClientEvent('esx:showNotification', source,
                    'Le Freezelted '..GetPlayerName(targetPlayer.source)..' [ID : '..targetId..']')
                    TriggerClientEvent('esx:showNotification',targetPlayer.source, 'Le Freezelt téged ['..xPlayer.getGroup()..'] '..GetPlayerName(source)..'')
                    targetPlayer.triggerEvent('Freeze')
                    logdclog('' .. GetPlayerName(source) ..' ['..xPlayer.getGroup()..'] [ID :'.. xPlayer.source ..']','/'..Config.Command.Freeze..' Parancsot használta rajta: '.. GetPlayerName(targetId) ..' [ID :'..targetPlayer.source..'] ')
            else
                TriggerClientEvent('esx:showNotification', source, 'Nincs ilyen ID-jű játékos.')
            end
            else
                return TriggerClientEvent('esx:showNotification',source,'Nincs jogod a parancshoz.')
            end
    end, false)

    RegisterCommand(Config.Command.UnFreeze, function(source, args, rawCommand)
        local xPlayer = ESX.GetPlayerFromId(source)
        local targetId = tonumber(args[1])
            local targetPlayer = ESX.GetPlayerFromId(targetId)
            local adminGroup = xPlayer.getGroup()
    
            if UnFreezeIsAdmin(adminGroup) then
            if targetPlayer then
                TriggerClientEvent('esx:showNotification', source, 'UnFreezelted őt '..GetPlayerName(targetPlayer.source)..' [ID : '..targetId..']')
                TriggerClientEvent('esx:showNotification',targetPlayer.source,'UnFreezelt téged ['..xPlayer.getGroup()..'] '..GetPlayerName(source)..'')
                    targetPlayer.triggerEvent('UnFreeze')
                    logdclog('' .. GetPlayerName(source) ..' ['..xPlayer.getGroup()..'] [ID :'.. xPlayer.source ..']','/'..Config.Command.UnFreeze..' Parancsot használta rajta: '.. GetPlayerName(targetId) ..' [ID :'..targetPlayer.source..'] ')
            else
                TriggerClientEvent('esx:showNotification', source, 'Nincs ilyen ID-jű játékos.')
            end
            else
                return TriggerClientEvent('esx:showNotification',source,'Nincs jogod a parancshoz.')
            end
    end, false)

RegisterCommand(Config.Command.Heal, function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    local targetId = tonumber(args[1])
    local adminGroup = xPlayer.getGroup()

    if HealIsAdmin(adminGroup) then
    if targetId == nil then
        TriggerClientEvent('esx:showNotification', source, 'Fel healted magad!')
        xPlayer.triggerEvent('Heal')
        logdclog('' .. GetPlayerName(source) ..' ['..xPlayer.getGroup()..'] [ID :'.. xPlayer.source ..']','/'..Config.Command.Heal..' Parancsot használta magán')
    else
        local targetPlayer = ESX.GetPlayerFromId(targetId)

        if targetPlayer then
            TriggerClientEvent('esx:showNotification', source, 'Fel healelted őt '..GetPlayerName(targetPlayer.source)..' [ID : '..targetId..']')
            TriggerClientEvent('esx:showNotification', targetPlayer.source, 'Fel Healet téged ['..xPlayer.getGroup()..'] '..GetPlayerName(source)..'')
                targetPlayer.triggerEvent('Heal')
                logdclog('' .. GetPlayerName(source) ..' ['..xPlayer.getGroup()..'] [ID :'.. xPlayer.source ..']','/'..Config.Command.Heal..' Parancsot használta rajta: '.. GetPlayerName(targetId) ..' [ID :'..targetPlayer.source..'] ')
        else
            TriggerClientEvent('esx:showNotification', source, 'Nincs ilyen ID-jű játékos.')
        end
    end
    else
        return TriggerClientEvent('esx:showNotification',source,'Nincs jogod a parancshoz.')
    end
end, false)

RegisterCommand(Config.Command.Relog, function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    local targetId = tonumber(args[1])
        local targetPlayer = ESX.GetPlayerFromId(targetId)
        local adminGroup = xPlayer.getGroup()

        if RelogIsAdmin(adminGroup) then 
        if targetPlayer then
            TriggerClientEvent('esx:showNotification', source,
                'Relog-oltadtad őt '..GetPlayerName(targetPlayer.source)..' [ID : '..targetId..']')
                targetPlayer.kick(Config.RelogReason)
                logdclog('' .. GetPlayerName(source) ..' ['..xPlayer.getGroup()..'] [ID :'.. xPlayer.source ..']','/'..Config.Command.Relog..' Parancsot használta rajta: '.. GetPlayerName(targetId) ..' [ID :'..targetPlayer.source..'] ')
        else
            TriggerClientEvent('esx:showNotification', source, 'Nincs ilyen ID-jű játékos.')
        end
        else
            return TriggerClientEvent('esx:showNotification',source,'Nincs jogod a parancshoz.')
        end
end, false)

RegisterCommand(Config.Command.Kick, function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    local targetId = tonumber(args[1])
    local Reason = args[2]
        local targetPlayer = ESX.GetPlayerFromId(targetId)
        local adminGroup = xPlayer.getGroup()

        if KickIsAdmin(adminGroup) then 
        if targetPlayer then
            TriggerClientEvent('esx:showNotification', source,
                'Kickelted őt '..GetPlayerName(targetPlayer.source)..' [ID : '..targetId..']')
                targetPlayer.kick('Kickelt téged ['..GetPlayerName(source)..'] Indok : '..Reason..'')
                logdclog(''..GetPlayerName(source)' ['..xPlayer.getGroup()'] [ID :'..xPlayer.source..']','/'..Config.Command.Kick..' Parancsot használta rajta: '..GetPlayerName(targetId)' [ID :'..targetPlayer.source..'] Indok: '..Reason..'')
        else
            TriggerClientEvent('esx:showNotification', source, 'Nincs ilyen ID-jű játékos.')
        end
        else
            return TriggerClientEvent('esx:showNotification',source,'Nincs jogod a parancshoz.')
        end
end, false)

RegisterCommand(Config.Command.Clear, function (source,args)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.triggerEvent('chat:clear')
end)

RegisterCommand(Config.Command.ClearAll, function (source,args)
    local xPlayer = ESX.GetPlayerFromId(source)
    local adminGroup = xPlayer.getGroup()

    if ClearallIsAdmin(adminGroup) then
    TriggerClientEvent('chat:clear', -1)
    logdclog('' .. GetPlayerName(source) ..' ['..xPlayer.getGroup()..'] [ID :'.. xPlayer.source ..']','/'..Config.Command.ClearAll..' Parancsot használta')
    else
        return TriggerClientEvent('esx:showNotification',source,'Nincs jogod a parancshoz.')
    end
end)

RegisterCommand(Config.Command.Speedtp,function (source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local adminGroup = xPlayer.getGroup()

    if SpeedIsAdmin(adminGroup) then
    xPlayer.setCoords(Config.SpeedTpCoords)
    logdclog('' .. GetPlayerName(source) ..' ['..xPlayer.getGroup()..'] [ID :'.. xPlayer.source ..']','/'..Config.Command.ClearAll..' Parancsot használta')
    else
        return TriggerClientEvent('esx:showNotification',source,'Nincs jogod a parancshoz.')
    end
end)

RegisterCommand(Config.Command.SetGroup, function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    local targetId = tonumber(args[1])
    local Group = args[2]
        local targetPlayer = ESX.GetPlayerFromId(targetId)
        local adminGroup = xPlayer.getGroup()

        if SetGroupIsAdmin(adminGroup) then 
        if targetPlayer then
            if Group == nil then
                return
            end
            TriggerClientEvent('esx:showNotification', source,
                'Set Groupoltad őt '..GetPlayerName(targetPlayer.source)..' [ID : '..targetId..'] ebbe ['..Group..']')
                targetPlayer.setGroup(Group)
                logdclog(''..GetPlayerName(source)..' ['..xPlayer.getGroup()'] [ID :'..xPlayer.source..']','/'..Config.Command.SetJob..' Parancsot használta rajta: '..GetPlayerName(targetId)..' [ID :'..targetPlayer.source..'] Group = '..Group..'')
        else
            TriggerClientEvent('esx:showNotification', source, 'Nincs ilyen ID-jű játékos.')
        end
        else
            return TriggerClientEvent('esx:showNotification',source,'Nincs jogod a parancshoz.')
        end
end, false)

RegisterCommand(Config.Command.SetJob, function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    local targetId = tonumber(args[1])
    local job = args[2]
    local grade = args[3]
        local targetPlayer = ESX.GetPlayerFromId(targetId)
        local adminGroup = xPlayer.getGroup()

        if not ESX.DoesJobExist(job,grade) then
            return TriggerClientEvent('esx:showNotification',source,'Nem létezik ilyen job!')
        end
        
        if SetJobIsAdmin(adminGroup) then 
        if targetPlayer then
            if job == nil then return end
            TriggerClientEvent('esx:showNotification', source,
                'Set Joboltad őt '..GetPlayerName(targetPlayer.source)..' [ID : '..targetId..']')
                targetPlayer.setJob(job,grade)
                logdclog(''..GetPlayerName(source)..' ['..xPlayer.getGroup()'] [ID :'..xPlayer.source..']','/'..Config.Command.SetJob..' Parancsot használta rajta: '..GetPlayerName(targetId)..' [ID :'..targetPlayer.source..'] Job = '..job..' Grade = '..grade..'')
        else
            TriggerClientEvent('esx:showNotification', source, 'Nincs ilyen ID-jű játékos.')
        end
        else
            return TriggerClientEvent('esx:showNotification',source,'Nincs jogod a parancshoz.')
        end
end, false)

RegisterCommand(Config.Command.Giveitem, function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    local targetId = tonumber(args[1])
    local item = args[2]
    local count = tonumber(args[3])
        local targetPlayer = ESX.GetPlayerFromId(targetId)
        local adminGroup = xPlayer.getGroup()

        if count == nil then count = 1 end
        if GiveitemIsAdmin(adminGroup) then 
        if targetPlayer then
            if item == nil then return TriggerClientEvent('esx:showNotification',source,'Nem létezik ilyen item!') end
            TriggerClientEvent('esx:showNotification', source,
                'Addoltál neki '..GetPlayerName(targetPlayer.source)..' [ID : '..targetId..']')
                targetPlayer.addInventoryItem(item, count)
                logdclog(''..GetPlayerName(source)..' ['..xPlayer.getGroup()'] [ID :'..xPlayer.source..']','/'..Config.Command.Giveitem..' Parancsot használta rajta: '..GetPlayerName(targetId)..' [ID :'..targetPlayer.source..'] Item = '..item..' Count = '..count..'')
        else
            TriggerClientEvent('esx:showNotification', source, 'Nincs ilyen ID-jű játékos.')
        end
        else
            return TriggerClientEvent('esx:showNotification',source,'Nincs jogod a parancshoz.')
        end
end, false)

RegisterCommand(Config.Command.GiveaccountMoney, function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    local targetId = tonumber(args[1])
    local account = args[2]
    local money = tonumber(args[3])
        local targetPlayer = ESX.GetPlayerFromId(targetId)
        local adminGroup = xPlayer.getGroup()

        if not targetPlayer.getAccount(account) then
            return TriggerClientEvent('esx:showNotification',source,'Nem létezik ilyen account!')
        end

        if money == nil then money = 1 end
        if GiveaccountmoneyIsAdmin(adminGroup) then 
        if targetPlayer then
            if account == nil then return TriggerClientEvent('esx:showNotification',source,'Nem létezik ilyen account money!') end
            TriggerClientEvent('esx:showNotification', source,
                'Addoltál neki '..GetPlayerName(targetPlayer.source)..' [ID : '..targetId..']')
                targetPlayer.addAccountMoney(account, money)
                logdclog(''..GetPlayerName(source)..' ['..xPlayer.getGroup()..'] [ID :'..xPlayer.source..']','/'..Config.Command.Giveaccountmoney..' Parancsot használta rajta: '..GetPlayerName(targetId)' [ID :'..targetPlayer..'] Account = '..account..' Money = '..money..'')
        else
            TriggerClientEvent('esx:showNotification', source, 'Nincs ilyen ID-jű játékos.')
        end
        else
            return TriggerClientEvent('esx:showNotification',source,'Nincs jogod a parancshoz.')
        end
end, false)

RegisterCommand(Config.Command.Removeaccountmoney, function (source,args,rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    local targetId = tonumber(args[1])
    local account = args[2]
    local money = tonumber(args[3])
    local targetPlayer = ESX.GetPlayerFromId(targetId)
    local adminGroup = xPlayer.getGroup()

    if not targetPlayer.getAccount(account) then
        return TriggerClientEvent('esx:showNotification',source,'Nem létezik ilyen account!')
    end

    if money == nil then money = 1 end
    if RemoveaccountmoneyIsAdmin(adminGroup) then
        if targetPlayer then
            if account == nil then return TriggerClientEvent('esx:showNotification',source,'Nem létezik ilyen account money!') end
            TriggerClientEvent('esx:showNotification', source,
                'Addoltál neki '..GetPlayerName(targetPlayer.source)..' [ID : '..targetId..']')
                targetPlayer.removeAccountMoney(account, money)
                logdclog(''..GetPlayerName(source)..' ['..xPlayer.getGroup()..'] [ID :'..xPlayer.source..']','/'..Config.Command.Removeaccountmoney..' Parancsot használta rajta: '..GetPlayerName(targetId)' [ID :'..targetPlayer..'] Account = '..account..' Money = '..money..'')
            else
                TriggerClientEvent('esx:showNotification', source, 'Nincs ilyen ID-jű játékos.')
        end
        else
            return TriggerClientEvent('esx:showNotification',source,'Nincs jogod a parancshoz.')
    end
end)

RegisterCommand(Config.Command.FpubTp, function (source, args,rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    local targetId = tonumber(args[1])
    local targetPlayer = ESX.GetPlayerFromId(targetId)
    local adminGroup = xPlayer.getGroup()

    if FpubTpIsAdmin(adminGroup) then
    if targetPlayer == nil then
        xPlayer.setCoords(Config.FpubCoords)
        else
            if targetPlayer then
                targetPlayer.setCoords(Config.FpubCoords)
                else
                TriggerClientEvent('esx:showNotification', source, 'Nincs ilyen ID-jű játékos.')
            end
    end
    else
        return TriggerClientEvent('esx:showNotification',source,'Nincs jogod a parancshoz.')
    end
end)

RegisterCommand(Config.Command.EmsTp, function (source, args,rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    local targetId = tonumber(args[1])
    local targetPlayer = ESX.GetPlayerFromId(targetId)
    local adminGroup = xPlayer.getGroup()

    if EmsTpIsAdmin(adminGroup) then
    if targetPlayer == nil then
        xPlayer.setCoords(Config.EmsCoords)
        else
            if targetPlayer then
                targetPlayer.setCoords(Config.EmsCoords)
                else
                TriggerClientEvent('esx:showNotification', source, 'Nincs ilyen ID-jű játékos.')
            end
    end
    else
        return TriggerClientEvent('esx:showNotification',source,'Nincs jogod a parancshoz.')
    end
end)

RegisterCommand(Config.Command.LspdTp, function (source, args,rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    local targetId = tonumber(args[1])
    local targetPlayer = ESX.GetPlayerFromId(targetId)
    local adminGroup = xPlayer.getGroup()

    if LspdTpIsAdmin(adminGroup) then
    if targetPlayer == nil then
        xPlayer.setCoords(Config.LspdCoords)
        else
            if targetPlayer then
                targetPlayer.setCoords(Config.LspdCoords)
                else
                TriggerClientEvent('esx:showNotification', source, 'Nincs ilyen ID-jű játékos.')
            end
    end
    else
        return TriggerClientEvent('esx:showNotification',source,'Nincs jogod a parancshoz.')
    end
end)
