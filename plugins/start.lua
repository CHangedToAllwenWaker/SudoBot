local function do_keyboard_robot()
    local keyboard = {}
    keyboard.inline_keyboard = {
		{
    					{text = 'Share Robot Contact 🤖🤘🏾', callback_data = '!share'},
    					},
    					{
    		    		{text = 'Buy Group 💸', callback_data = '!buygroup'},
    		    		{text = 'Support 👥', url = 'https://telegram.me/joinchat/B882eT8UBJuv6gfyMbv5pw'},
	    },
	    {
	    {text = '🔙', callback_data = '!home'}
        }
    }
    return keyboard
end
local function do_keyboard_buygroup()
    local keyboard = {}
    keyboard.inline_keyboard = {
{
    		    		{text = 'Iranians', url = 'http://salam.im/buy/ecgvlup3ld'},
    		    		{text = 'Other countries', url = 'https://telegram.me/joinchat/B882eT8UBJuv6gfyMbv5pw'},
	    },
	    {
	    {text = '🔙', callback_data = '!robot'}
        }
    }
    return keyboard
end
local function do_keyboard_private()
    local keyboard = {}
    keyboard.inline_keyboard = {
    	{
    		{text = '🌐 Site', url = 'http:/sudoteamt.ir'},
    		{text = '📡 Channels', callback_data = '!channel'},
	    },
		{
	        {text = '📥 Contact Us 📤', callback_data = '/start'},
        },
		{
	        {text = 'About Us 👥', callback_data = '!aboutus'},
        },
	    {
	        {text = '🛢Sudo Bot🛢', callback_data = '!robot'},
        }
    }
    return keyboard
end

local function do_keyboard_startme()
    local keyboard = {}
    keyboard.inline_keyboard = {
    	{
    		{text = '🙃�اینجا بزن !�🙃', url = 'https://telegram.me/'..bot.username}
	    }
    }
    return keyboard
end
local function do_keyboard_channel()
    local keyboard = {}
    keyboard.inline_keyboard = {
    	{
    		{text = 'Join ! �', url = 'https://telegram.me/sudo_tm'},
	    },
	{
	        		{text = 'Join ! 🇬🇧', url = 'https://telegram.me/sudo_tm'},
    },
		{
					{text = 'Join 🗣', url = 'https://telegram.me/Sudo_Tm'},
		},
		{
	    {text = '🔙', callback_data = '!home'},
        }
    
    }
    return keyboard
end
local action = function(msg, blocks, ln)
    if blocks[1] == 'starts' or blocks[1] == 'helps' then
        db:hset('bot:users', msg.from.id, 'xx')
        db:hincrby('bot:general', 'users', 1)
        if msg.chat.type == 'private' then
            local message = [[📍 *Welcome Sudo Tm Official Bot*  📍
-------------------------------------------------------------
🗣 `Please select an option ...`]]
            local keyboard = do_keyboard_private()
            api.sendKeyboard(msg.from.id, message, keyboard, true)
            end
			if msg.chat.type == 'group' or msg.chat.type == 'supergroup' then
          api.sendKeyboard(msg.chat.id, '_سلام !_👋برای چت منو استارت کن 😀�',do_keyboard_startme(), true)
        end
        return
    end
    if msg.cb then
        local query = blocks[1]
        local msg_id = msg.message_id
        local text
        if query == 'channel' then
            local text = '📡 OurChannel 😅 :*'
            local keyboard = do_keyboard_channel()
        api.editMessageText(msg.chat.id, msg_id, text, keyboard, true)
end
if query == 'robot' then
            local text = [[🔸*BeatBotTG*🔹
🚩 _An advanced robot for entertainment group manager and anti-spam_]]
            local keyboard = do_keyboard_robot()
        api.editMessageText(msg.chat.id, msg_id, text, keyboard, true)
end
if query == 'buygroup' then
            local text = [[_Please wait after payment_ 
_We will be call to you_]]
            local keyboard = do_keyboard_buygroup()
        api.editMessageText(msg.chat.id, msg_id, text, keyboard, true)
end
if query == 'home' then
            local text = [[📍 *Welcome Sudo Tm Official Bot*  📍
-------------------------------------------------------------
🗣 `Please select an option ...`]]
            local keyboard = do_keyboard_private()
        api.editMessageText(msg.chat.id, msg_id, text, keyboard, true)
end
        if query == 'share' then
     api.sendContact(msg.from.id, '+6288972821479', 'Sudo Bot $')
end
    end
end
return {
	action = action,
	triggers = {
	    '^/(start)@BeatBotTeamBot$',
	    '^/(start)$',
	    '^/(help)$',
	    '^###cb:!(home)',
		'^###cb:!(buygroup)',
	    '^###cb:!(channel)',
	    '^###cb:!(robot)',
	    '^###cb:!(share)',
    }
}
