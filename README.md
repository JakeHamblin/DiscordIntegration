# Discord Integration
A FiveM script created to assign Ace permissions based on roles in a Discord guild

## Why use this when there are already others?
While there are plenty of good resources already, I believe many of them are overly complex for what most users want to do. The big feature of this script is the ability to **reload** roles while in-game, allowing users to get updated roles without a server restart or client reconnect.

## How do I install this?
To install this, it's rather simple:
- Firstly, grab the latest [release](https://github.com/JakeHamblin/DiscordIntegration/releases/latest).
- Drag and drop ths `DiscordIntegration` folder into your `resources` folder. **NOTE: this resource <ins>CAN</ins> be renamed**
- Open the `config.lua`
  - Set the `bot_token` key to be the token of a bot in your guild. If you have not done this before, take a look at [creating a bot](https://docs.jakehamblin.com/discord-bots/create) and [inviting a bot](https://docs.jakehamblin.com/discord-bots/invite).
  - Set the `guild_id` key to be the guild ID of your guild
  - Populate the `roles` array in the following format:
    - ```["{NAME}"] = {Discord Role ID},```
    - `group.{NAME}` will be assigned to any user that has the specified `{Discord Role ID}`

## Why are people not getting their group permissions after I installed this?
One of two things has happened:
1. The specificed configuration of your bot token and guild ID are incorrect. Verify that the guild ID is correct, that your bot token is correct, and that the bot is in your guild and has admin permissions.
2. The user who is connecting to your server **doesn't** have their Discord connected to their FiveM account. Have them follow [this](https://support.cfx.re/hc/en-us/articles/16677419444508-How-to-link-your-Discord-account) guide from the team at CFX to connect their Discord.


<br><br><p align="center">
 <img src="https://jakehamblin.com/images/hosturly.png">
</p>

### Hosting Company
Are you looking for a reliable and affordable host? Well, with many years of experience working with websites, website hosting, and dedicated server hosting, I can say that I've got a pretty good idea when a host is good. [Hosturly](https://jakehamblin.com/hosturly) is up for the task. Don't trust me? Read their reviews. They've got an almost 5 star rating, and with many years in the industry, they're here to stay. Use code `JAKE` for 10% off your order.