
TriggerEvent('chat:addSuggestion', '/mclear', "Chat törlése")
TriggerEvent('chat:addSuggestion', '/mclearall', "Chat törlése szerverszinten")
TriggerEvent('chat:addSuggestion', '/gh', "Admin hq teleport")

TriggerEvent('chat:addSuggestion', '/mheal', "Játékos gyógyítása", {
    { name = "id", help = "Játékos ID" },
})

TriggerEvent('chat:addSuggestion', '/mrevive', "Játékos feltámasztása", {
    { name = "id", help = "Játékos ID" },
})

TriggerEvent('chat:addSuggestion','/freeze',"Játékos le freezelése", {
   { name = "id", help = "Játékos ID"}
})

TriggerEvent('chat:addSuggestion','/unfreeze',"Játékos unfreezelése", {
    { name = "id", help = "Játékos ID"}
})

TriggerEvent('chat:addSuggestion','/mrelog',"Játékos kickelése Relog Indokal", {
    { name = "id", help = "Játékos ID"}
})

TriggerEvent('chat:addSuggestion','/mfix',"Gépjármű javítása", {
    { name = "id", help = "Játékos ID"}
})

TriggerEvent('chat:addSuggestion','/mkill',"Játékos le killelése", {
    { name = "id", help = "Játékos ID"}
})

TriggerEvent('chat:addSuggestion','/marmour',"Játékosnak armour adás.", {
    { name = "id", help = "Játékos ID"}
})

TriggerEvent('chat:addSuggestion','/mtarmour',"Játékos armourjának elvétele", {
    { name = "id", help = "Játékos ID"}
})

TriggerEvent('chat:addSuggestion','/msetgroup',"Játékosnak név változtatás", {
    { name = "id", help = "Játékos ID"},
    { name = "group", help = "Játékost amilyen groupba szeretnéd tenni"},
})

TriggerEvent('chat:addSuggestion','/mkick',"Játékos kickelése", {
    { name = "id", help = "Játékos ID"},
    { name = "Indok", help = "Játékost milyen indokkal teszed ki!"},
})

TriggerEvent('chat:addSuggestion','/msetjob',"Játékos kickelése", {
    { name = "id", help = "Játékos ID"},
    { name = "job", help = "Job"},
    { name = "grade", help = "Rang"},
})

TriggerEvent('chat:addSuggestion','/msetgroup',"Játékos kickelése", {
    { name = "id", help = "Játékos ID"},
    { name = "group", help = " Group"},
})

TriggerEvent('chat:addSuggestion','/mgiveitem',"Játékosnak addolás", {
   { name = "id", help = "Játékos ID"},
   { name = "item", help = "Item amit szeretnél addolni"},
   { name = "count", help = "Mennyiség amennyit szeretnél addolni"}
})

TriggerEvent('chat:addSuggestion','/giveaccountmoney',"Játékosnak addolás", {
    { name = "id", help = "Játékos ID"},
    { name = "account", help = "bank or money"},
    { name = "count", help = "Mennyiség amennyit szeretnél addolni"}
 })

 TriggerEvent('chat:addSuggestion','/removeaccountmoney',"Játékos pénzének elvétele", {
    { name = "id", help = "Játékos ID"},
    { name = "account", help = "bank or money"},
    { name = "count", help = "Mennyiség amennyit szeretnél addolni"}
 })