# Discord Integration
A FiveM script created to assign Ace permissions based on roles in a Discord guild

## Why use this when there are already others?
While there are plenty of good resources already, I believe many of them are overly complex for what most users want to do. The big feature of this script is the ability to **reload** roles while in game through a command, allowing users to get updated roles without a server restart or client reconnect.

## How do I install this?
To install this, it's rather simple:
- Firstly, grab the latest [release](https://github.com/JakeHamblin/DiscordIntegration/releases/latest).
- Drag and drop ths `DiscordIntegration` folder into your `resources` folder. **NOTE: This resource <ins>CAN</ins> be renamed**
- Open the `config.lua`
  - Set the `bot_token` key to be the token of a bot in your guild. If you have not done this before, take a look at [creating a bot](https://docs.jakehamblin.com/discord-bots/create) and [inviting a bot](https://docs.jakehamblin.com/discord-bots/invite).
  - Set the `guild_id` key to be the guild ID of your guild
  - Populate the `roles` array in the following format:
    - ```["{NAME}"] = {Discord Role ID},```
    - `group.{NAME}` will be assigned to any user that has the specified `{Discord Role ID}`
- Add the following lines to either your `server.cfg` or `permissions.cfg` (from vMenu):
  - `add_ace resource.DiscordIntegration command.add_ace allow`
  - `add_ace resource.DiscordIntegration command.add_principal allow`
  - `add_ace resource.DiscordIntegration command.remove_principal allow`
  - `add_ace resource.DiscordIntegration command.add_principal allow`
  - `add_ace resource.DiscordIntegration command.sets allow`
  - **NOTE: If you changed the name of the resource, replace `DiscordIntegration` with the name of the resource**

## Why are people not getting their group permissions after I installed this?
One of two things has happened:
1. The specificed configuration of your bot token and guild ID are incorrect. Verify that the guild ID is correct, that your bot token is correct, and that the bot is in your guild and has admin permissions.
2. The user who is connecting to your server **doesn't** have their Discord connected to their FiveM account. Have them follow [this](https://support.cfx.re/hc/en-us/articles/16677419444508-How-to-link-your-Discord-account) guide from the team at CFX to connect their Discord.

## How do I reload roles while in game?
To be able to reload permissions while in game, you need to add a permission node to a group that administrators are assigned to. You can do so by adding the following to your `server.cfg` or `permissions.cfg` (from vMenu):
 - `add_ace group.{GROUP NAME} JakeHamblin.Reload allow`

After this, you should perform a server restart. You should then be able to run the `/reload` command in FiveM on a specific ID to refresh their roles. **NOTE: This uses their actual in-game ID, not their Discord ID**


<br><br><p align="center">
 <img src="https://jakehamblin.com/images/hosturly.png">
</p>

### Hosting Company
Are you looking for a reliable and affordable host? Well, with many years of experience working with websites, website hosting, and dedicated server hosting, I can say that I've got a pretty good idea when a host is good. [Hosturly](https://jakehamblin.com/hosturly) is up for the task. Don't trust me? Read their reviews. They've got an almost 5 star rating, and with many years in the industry, they're here to stay. Use code `JAKE` for 10% off your order.