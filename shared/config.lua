Config = {}

--Command
Config.Command = {
    Givearmour = 'marmour',
    Removearmour = 'mtarmour',
    Kill = 'mkill',
    Revive = 'mrevive',
    Freeze = 'freeze',
    UnFreeze = 'unfreeze',
    Heal = 'mheal',
    Kick = 'mkick',
    Relog = 'mrelog',
    Speedtp = 'gh',
    Fix = 'mfix',
    Clear = 'mclear',
    ClearAll = 'mclearall',
    SetGroup = 'msetgroup',
    SetJob = 'msetjob',
    Giveitem = 'mgiveitem',
    GiveaccountMoney = 'giveaccountmoney',
    Removeaccountmoney = 'removeaccountmoney',
    FpubTp = 'fpub',
    EmsTp = 'ems',
    LspdTp = 'lspd'
}

Config.Perms = {
    Givearmour = {"superadmin","owner"},
    Removearmour = {"superadmin","owner"},
    Kill = {"superadmin","owner"},
    Revive = {"superadmin","owner"},
    Freeze = {"superadmin","owner"},
    UnFreeze = {"superadmin","owner"},
    Heal = {"superadmin","owner"},
    setname = {"superadmin","owner"},
    Relog = {"superadmin","owner"},
    Speedtp = {"superadmin","owner"},
    Fix = {"superadmin","owner"},
    ClearAll = {"superadmin","owner"},
    Kick = {"superadmin","owner"},
    SetGroup = {"superadmin","owner"},
    SetJob = {"superadmin","owner"},
    Giveitem =  {"superadmin","owner"},
    GiveaccountMoney = {"superadmin","owner"},
    Removeaccountmoney = {"superadmin","owner"},
    FpubTp = {"superadmin","owner"},
    EmsTp = {"superadmin","owner"},
    LspdTp = {"superadmin","owner"},
}

Config.Webhook = 'https://discord.com/api/webhooks/1274427956349108294/P53NFZcQrymjQ_tLj2-TkJ71ItyekqNVEab0CCSIZm7lCw36u7lFcB3V4s8XwHaH3MWO'
Config.RelogReason = "Relog"
Config.SpeedTpCoords = vector4(259.8163, -792.8162, 55.2277, 76.6270)
Config.FpubCoords = vector4(219.2495, -812.0759, 30.6322, 339.1399)
Config.EmsCoords = vector4(296.6069, -586.1129, 43.1296, 75.9855)
Config.LspdCoords = vector4(427.6615, -980.2275, 30.7158, 90.1285)
Config.esx_ambulancejob = true -- true or false , revive command using esx_ambulancejob or ars_ambulancejob