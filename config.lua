Config = {}


Config.Framework = "standalone" -- ESX / qb-core / standalone
Config.PropFixCommand = "propfix" --Add here your command to delet the props.
Config.ResetTasks = true  --If this is true, all animations will be canceled to.
Config.SendNotification = true --If you want that the player get a notification then put this to ture
Config.NotificationMsg = "All bugged props got deleted!" -- Add here your notification text that should displayed for your players
Config.Notify = "standalone" --Change here you notifysystem qb-core / ESX / standalone / custom (for custom you need to add the trigger in the client.lua line 73)
