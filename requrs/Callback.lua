function RunBank(msg)
plugin = dofile("./requrs/Bank.lua")
if plugin and plugin.SILV and msg then
results = plugin.SILV(msg)
end
end
function RunCallBack(data)
if data and data.luatele and data.luatele == "updateChatMember" then
UserCheck = data.new_chat_member.member_id.user_id
local Result = bot.getUser(data.actor_user_id)
if data.new_chat_member.status.luatele == "chatMemberStatusLeft" and data.old_chat_member.status.luatele == "chatMemberStatusCreator" then
local Get_Chat = bot.getChat(data.chat_id)
local Info_Chats = bot.getSupergroupFullInfo(data.chat_id)
local UserInfo = bot.getUser(data.actor_user_id)
send(data.actor_user_id,0,'\nليش تركت قروبك\nName ▸ ['..UserInfo.first_name..'](tg://user?id='..data.actor_user_id..')\nId ▸ '..data.actor_user_id..'\nTime ▸ '..os.date("%p %I:%M:%S")..'\nDate ▸ '..os.date("%Y/%m/%d")..'\nLink ▸ ['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')',"md",true) 
send(data.chat_id,0,'\nمالك القروب غادر 😨\nName ▸ ['..UserInfo.first_name..'](tg://user?id='..data.actor_user_id..')\nId ▸ '..data.actor_user_id..'\nTime ▸ '..os.date("%p %I:%M:%S")..'\nDate ▸ '..os.date("%Y/%m/%d")..'\n️',"md",true) 
end
if data.new_chat_member.status.luatele == "chatMemberStatusCreator" and data.old_chat_member.status.luatele == "chatMemberStatusLeft" then
local UserInfo = bot.getUser(data.actor_user_id)
send(data.chat_id,0,'\nالقروب مايسوى بدونك 😍 ( المالك )\nName ▸ ['..UserInfo.first_name..'](tg://user?id='..data.actor_user_id..')\nId ▸ '..data.actor_user_id..'\nTime ▸ '..os.date("%p %I:%M:%S")..'\nDate ▸ '..os.date("%Y/%m/%d")..'\n️',"md",true) 
end
if data.new_chat_member.status.luatele == "chatMemberStatusLeft" and data.old_chat_member.status.luatele == "chatMemberStatusAdministrator" then
if data.actor_user_id == UserCheck and tonumber(SILV) ~= UserCheck then
local Get_Chat = bot.getChat(data.chat_id)
local Info_Chats = bot.getSupergroupFullInfo(data.chat_id)
local UserInfo = bot.getUser(data.actor_user_id)
send(data.actor_user_id,0,'\nليش تركت رتبتك ( مشرف ) وغادرت\nName ▸ ['..UserInfo.first_name..'](tg://user?id='..data.actor_user_id..')\nId ▸ '..data.actor_user_id..'\nTime ▸ '..os.date("%p %I:%M:%S")..'\nDate ▸ '..os.date("%Y/%m/%d")..'\nLink ▸ ['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')\n️',"md",true) 
send(data.chat_id,0,'\nمشرف غادر القروب 😞\nName ▸ ['..UserInfo.first_name..'](tg://user?id='..data.actor_user_id..')\nId ▸ '..data.actor_user_id..'\nTime ▸ '..os.date("%p %I:%M:%S")..'\nDate ▸ '..os.date("%Y/%m/%d")..'\n️',"md",true) 
end
end
if data.new_chat_member.status.luatele == "chatMemberStatusLeft" and data.old_chat_member.status.luatele == "chatMemberStatusMember" then
if not Redis:get(SILV.."gdbye"..data.chat_id) then
if data.actor_user_id == UserCheck and tonumber(SILV) ~= UserCheck then
local Get_Chat = bot.getChat(data.chat_id)
local Info_Chats = bot.getSupergroupFullInfo(data.chat_id)
local UserInfo = bot.getUser(data.actor_user_id)
send(data.actor_user_id,0,'\nهناك من غادر مجموعة\nName ▸ ['..UserInfo.first_name..'](tg://user?id='..data.actor_user_id..')\nId ▸ '..data.actor_user_id..'\nTime ▸ '..os.date("%p %I:%M:%S")..'\nDate ▸ '..os.date("%Y/%m/%d")..'\nLink ▸ ['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')\n️',"md",true) 
send(data.chat_id,0,'\nهناك من غادر مجموعة\nName ▸ ['..UserInfo.first_name..'](tg://user?id='..data.actor_user_id..')\nId ▸ '..data.actor_user_id..'\nTime ▸ '..os.date("%p %I:%M:%S")..'\nDate ▸ '..os.date("%Y/%m/%d")..'\n️',"md",true) 
end
end
end
if data.new_chat_member.member_id.user_id == tonumber(SILV) or data.old_chat_member.member_id.user_id == tonumber(SILV) then
if data.new_chat_member.status.rights.can_delete_messages == true or data.old_chat_member.status.rights.can_delete_messages == true then
local chat_id = data.chat_id
local who_promot = data.actor_user_id
--code start
if Redis:sismember(SILV..'SILV:listBan:',chat_id) then ---check if ban
send(chat_id,0,"\n*⇜ هذه القروب محظور سوف اغادر جاوو*","md",true)  
bot.leaveChat(chat_id)
end ---end check if ban
local Info_Chats = bot.getSupergroupFullInfo(chat_id) ---check if count is true
if tonumber(Info_Chats.member_count) < tonumber((Redis:get(SILV..'Mero:Num:Add:Bot') or 0)) then
send(chat_id,0,'• عدد الاعضاء قليل لا يمكن تفعيل القروب\n يجب ان يكون اكثر من '..Redis:get(SILV..'Mero:Num:Add:Bot'),"md",true)
bot.leaveChat(chat_id)
end---end check if count is true
if not Redis:get(SILV.."Mero:BotFree") then
return send(chat_id,0,"\n⇜ الوضع الخدمي تم تعطيله من قبل مطور البوت ","md",true)  
end
if not Redis:sismember(SILV.."Mero:ChekBotAdd", chat_id) then ---done active
local Get_Chat = bot.getChat(chat_id)
local Info_Chats = bot.getSupergroupFullInfo(chat_id)
local UserInfo = bot.getUser(who_promot)
----
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = Get_Chat.title, url = Info_Chats.invite_link.invite_link}, 
},
}
}
send(Sudo_Id,0,'\n⇜ تم تفعيل قروب جديد \n⇜ من قبل : ['..UserInfo.first_name..'](tg://user?id='..who_promot..')\n⇜ معلومات القروب :\n⇜ عدد الاعضاء : '..Info_Chats.member_count..'\n⇜ عدد الادمنيه : '..Info_Chats.administrator_count..'\n⇜ عدد المطرودين : '..Info_Chats.banned_count..'\n⇜ عدد المقيدين : '..Info_Chats.restricted_count..'\n⇜ الرابط : ['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')\n⇜ ايدي القروب : `'..chat_id..'`',"md",true, false, false, false, reply_markup)
-----
Redis:set(SILV.."Mero:Alzwag:Chat"..chat_id,"true")
Redis:set(SILV.."Mero:Aldel:Chat"..chat_id,"true")
Redis:set(SILV.."NSFW:"..chat_id,"true")
Redis:set(SILV..'tagallgroup'..chat_id,'open') 
Redis:set(SILV.."Mero:Status:Link"..chat_id,true) 
Redis:set(SILV.."Mero:Status:Games"..chat_id,true) 
Redis:set(SILV.."replayallbot"..chat_id,true)
Redis:set(SILV.."rebomsg"..chat_id,true)
Redis:set(SILV.."Mero:AlThther:Chat"..chat_id,"true")
Redis:set(SILV.."Mero:Status:Welcome"..chat_id,true) 
Redis:set(SILV.."Mero:AlThther:Chat"..chat_id,"true")
Redis:set(SILV..'tagall@all'..chat_id,'open') 
Redis:set(SILV.."Mero:Status:IdPhoto"..chat_id,true) 
Redis:del(SILV.."spammkick"..chat_id)
Redis:set(SILV.."gdbye"..msg.chat_id,true)  
Redis:set(SILV.."Mero:Lock:edit"..chat_id,true) 
Redis:sadd(SILV.."Mero:ChekBotAdd",chat_id)
Redis:set(SILV.."Mero:Status:Id"..chat_id,true)
Redis:set(SILV.."Mero:Status:Reply"..chat_id,true)
Redis:set(SILV.."Mero:Status:ReplySudo"..chat_id,true)
Redis:set(SILV.."Mero:Status:BanId"..chat_id,true)
Redis:set(SILV.."Mero:Status:SetId"..chat_id,true) 
-----
local Info_Members = bot.getSupergroupMembers(chat_id, "Administrators", "*", 0, 200)
local List_Members = Info_Members.members
for k, v in pairs(List_Members) do
if Info_Members.members[k].bot_info == nil then
if Info_Members.members[k].status.luatele == "chatMemberStatusCreator" then
Redis:sadd(SILV.."Mero:TheBasicsQ:Group"..chat_id ,v.member_id.user_id) 
else
Redis:sadd(SILV.."Mero:Addictive:Group"..chat_id ,v.member_id.user_id) 
end
end
end
-----
local txt = '⇜ من 「 ['..UserInfo.first_name..'](tg://user?id='..who_promot..')⁪⁬‌‌‌‌ 」\n⇜ تم تفعيل المجموعة ['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..') تلقائياً\n'
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = ''..Get_Chat.title..'', url = "t.me/"..chsource},
},
}
}
return send(chat_id, 0 , txt, 'md', true , false, false, false, reply_markup)
end ---end done active
--code end
end
end
end

if data and data.luatele and data.luatele == "updateNewInlineCallbackQuery" then
local Text = bot.base64_decode(data.payload.data)
if Text and Text:match('/Hmsa1@(%d+)@(%d+)/(%d+)') then
local ramsesadd = {string.match(Text,"^/Hmsa1@(%d+)@(%d+)/(%d+)$")}
if tonumber(data.sender_user_id) == tonumber(ramsesadd[1]) or tonumber(ramsesadd[2]) == tonumber(data.sender_user_id) then
local inget = Redis:get(SILV..'hmsabots'..ramsesadd[3]..data.sender_user_id)
https.request("https://api.telegram.org/bot"..Token..'/answerCallbackQuery?callback_query_id='..data.id..'&text='..URL.escape(inget)..'&show_alert=true')
else
https.request("https://api.telegram.org/bot"..Token..'/answerCallbackQuery?callback_query_id='..data.id..'&text='..URL.escape('𖦹 هذه الهمسه ليست لك 𖦹')..'&show_alert=true')
end
end
end
if data and data.luatele and data.luatele == "updateNewInlineQuery" then
local Text = data.query
if Text and Text:match("^(.*) @(.*)$")  then
local username = {string.match(Text,"^(.*) @(.*)$")}
local UserId_Info = bot.searchPublicChat(username[2])
if UserId_Info.id then
local idnum = math.random(1,64)
local input_message_content = {message_text = 'هذي الهمسة للحلو ( [@'..username[2]..'] )\nهو اللي يقدر يشوفها 📧', parse_mode = 'Markdown'}	
local reply_markup = {inline_keyboard={{{text = 'لرؤية الهمسة', callback_data = '/Hmsa1@'..data.sender_user_id..'@'..UserId_Info.id..'/'..idnum}}}}	
local resuult = {{type = 'article', id = idnum, title = 'هذه همسه سرية الى [@'..username[2]..']', input_message_content = input_message_content, reply_markup = reply_markup}}	
https.request("https://api.telegram.org/bot"..Token..'/answerInlineQuery?inline_query_id='..data.id..'&results='..JSON.encode(resuult))
Redis:set(SILV..'hmsabots'..idnum..UserId_Info.id,username[1])
Redis:set(SILV..'hmsabots'..idnum..data.sender_user_id,username[1])
end
end
end
if data and data.luatele and data.luatele == "updateSupergroup" then
local Get_Chat = bot.getChat('-100'..data.supergroup.id)
if data.supergroup.status.luatele == "chatMemberStatusBanned" then
Redis:srem(SILV.."Mero:ChekBotAdd",'-100'..data.supergroup.id)
return send(Sudo_Id,0,'\n⇜ تم طرد البوت من قروب جديد \n⇜ اسم القروب : '..Get_Chat.title..'\n⇜ ايدي القروب : `-100'..data.supergroup.id..'`\n⇜ تم مسح جميع البيانات المتعلقة بالقروب',"md")
end
elseif data and data.luatele and data.luatele == "updateMessageSendSucceeded" then
local msg = data.message
local Chat = msg.chat_id
if msg.content.text then
text = msg.content.text.text
end
if msg.content.sticker then
Redis:sadd(SILV.."Mero:all:sticker"..msg.chat_id, msg.id)
Redis:scard(SILV.."Mero:all:sticker"..msg.chat_id)  
end
if msg.content.video_note or msg.content.video then
Redis:sadd(SILV.."Mero:all:video"..msg.chat_id, msg.id)
Redis:scard(SILV.."Mero:all:video"..msg.chat_id)  
end
if msg.content.document then
Redis:sadd(SILV.."Mero:all:docu"..msg.chat_id, msg.id)
Redis:scard(SILV.."Mero:all:docu"..msg.chat_id)  
end
if msg.content.audio then
Redis:sadd(SILV.."Mero:all:audio"..msg.chat_id, msg.id)
Redis:scard(SILV.."Mero:all:audio"..msg.chat_id)  
end
if msg.content.voice_note then
Redis:sadd(SILV.."Mero:all:voice"..msg.chat_id, msg.id)
Redis:scard(SILV.."Mero:all:voice"..msg.chat_id)  
end
if msg.content.photo then
Redis:sadd(SILV.."Mero:all:photo"..msg.chat_id, msg.id)
Redis:scard(SILV.."Mero:all:photo"..msg.chat_id)  
end
if msg.content.animation then
Redis:sadd(SILV.."Mero:all:anim"..msg.chat_id, msg.id)
Redis:scard(SILV.."Mero:all:anim"..msg.chat_id)  
end
if msg.content.video_note or msg.content.document or msg.content.audio or msg.content.video or msg.content.voice_note or msg.content.sticker or msg.content.animation or msg.content.photo then
Redis:sadd(SILV.."Mero:allM"..msg.chat_id, msg.id)
if Redis:get(SILV.."Mero:Status:Del:Media"..msg.chat_id) then    
local Numbardel = Redis:get(SILV.."Mero:allM:numdel"..msg.chat_id) or 200
local gmedia = Redis:scard(SILV.."Mero:allM"..msg.chat_id)  
if tonumber(gmedia) >= tonumber(Numbardel) then
local liste = Redis:smembers(SILV.."Mero:allM"..msg.chat_id)
for k,v in pairs(liste) do
local Mesge = v
if Mesge then
t = "⇜ تم مسح ( "..k.." ) من الوسائط تلقائياً\n⇜ يمكنك تعطيل الميزة باستخدام الامر ( `تعطيل المسح التلقائي` )"
bot.deleteMessages(msg.chat_id,{[1]= Mesge})
end
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⇜ من ['..UserInfo.first_name..'](tg://user?id='..msg.sender_id.user_id..')\n'
send(msg.chat_id,msg.id, Teext..t,"md",true)
Redis:del(SILV.."Mero:allM"..msg.chat_id)
end
end
end
if msg.content.video_note then
if msg.content.video_note.video.remote.id == Redis:get(SILV.."Mero:PinMsegees:"..msg.chat_id) then
bot.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(SILV.."Mero:PinMsegees:"..msg.chat_id)
end
elseif msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
if idPhoto == Redis:get(SILV.."Mero:PinMsegees:"..msg.chat_id) then
bot.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(SILV.."Mero:PinMsegees:"..msg.chat_id)
end
elseif msg.content.sticker then 
if msg.content.sticker.sticker.remote.id == Redis:get(SILV.."Mero:PinMsegees:"..msg.chat_id) then
bot.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(SILV.."Mero:PinMsegees:"..msg.chat_id)
end
elseif msg.content.voice_note then 
if msg.content.voice_note.voice.remote.id == Redis:get(SILV.."Mero:PinMsegees:"..msg.chat_id) then
bot.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(SILV.."Mero:PinMsegees:"..msg.chat_id)
end
elseif msg.content.video then 
if msg.content.video.video.remote.id == Redis:get(SILV.."Mero:PinMsegees:"..msg.chat_id) then
bot.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(SILV.."Mero:PinMsegees:"..msg.chat_id)
end
elseif msg.content.animation then 
if msg.content.animation.animation.remote.id ==  Redis:get(SILV.."Mero:PinMsegees:"..msg.chat_id) then
bot.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(SILV.."Mero:PinMsegees:"..msg.chat_id)
end
elseif msg.content.document then
if msg.content.document.document.remote.id == Redis:get(SILV.."Mero:PinMsegees:"..msg.chat_id) then
bot.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(SILV.."Mero:PinMsegees:"..msg.chat_id)
end
elseif msg.content.audio then
if msg.content.audio.audio.remote.id == Redis:get(SILV.."Mero:PinMsegees:"..msg.chat_id) then
bot.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(SILV.."Mero:PinMsegees:"..msg.chat_id)
end
elseif text then
if text == Redis:get(SILV.."Mero:PinMsegees:"..msg.chat_id) then
bot.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(SILV.."Mero:PinMsegees:"..msg.chat_id)
end
end
elseif data and data.luatele and data.luatele == "updateNewMessage" then
if data.message.content.luatele == "messageChatDeleteMember" or data.message.content.luatele == "messageChatAddMembers" or data.message.content.luatele == "messagePinMessage" or data.message.content.luatele == "messageChatChangeTitle" or data.message.content.luatele == "messageChatJoinByLink" then
if Redis:get(SILV.."Mero:Lock:tagservr"..data.message.chat_id) then
bot.deleteMessages(data.message.chat_id,{[1]= data.message.id})
end
end 
if tonumber(data.message.sender_user_id) == tonumber(SILV) then
return false
end
if chat_type(data.message.chat_id) == "GroupBot" and Redis:sismember(SILV.."Mero:ChekBotAdd",data.message.chat_id) then
 msg = data.message
local msg_chat_id = msg.chat_id
local msg_reply_id = msg.reply_to_message_id
local msg_user_send_id = msg.sender_id.user_id
local msg_id = msg.id
local text = nil
if msg.date and msg.date < tonumber(os.time() - 15) then
print("->> Old Message End <<-")
return false
end
if msg.content.text then
text = msg.content.text.text
end
if tonumber(msg.sender_id.user_id) == tonumber(SILV) then
print('This is reply for Bot')
return false
end
if msg.sender_id.luatele == "messageSenderChat" then
if Redis:sismember(SILV.."Mero:SilentGroup:Group"..msg_chat_id,msg.sender_id.chat_id) then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
end
if Redis:get(SILV.."Mero:Lock:SenderChat"..msg_chat_id) then
local m = Redis:get(SILV.."chadmin"..msg_chat_id) 
if msg.sender_id.chat_id == tonumber(m) then
return false
else
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
end
end
return false
end
if tonumber(msg.sender_id.user_id) == 5242981884 then
msg.Name_Controller = '𝗠𝗬𝗧𝗛️'
msg.The_Controller = 1
elseif tonumber(msg.sender_id.user_id) == 526621981884 then
msg.Name_Controller = 'Master🎖️'
msg.The_Controller = 1
elseif The_ControllerAll(msg.sender_id.user_id) == true then  
msg.The_Controller = 1
msg.Name_Controller = 'Dev🎖️'
elseif Redis:sismember(SILV.."Mero:DevelopersQ:Groups",msg.sender_id.user_id) == true then
msg.The_Controller = 2
msg.Name_Controller = 'MYtm🎖️️'
elseif Redis:sismember(SILV.."Mero:Developers:Groups",msg.sender_id.user_id) == true then
msg.The_Controller = 3
msg.Name_Controller = Redis:get(SILV..'Mero:SetRt'..msg.chat_id..':'..msg.sender_id.user_id) or Redis:get(SILV.."Mero:Developer:Bot:Reply"..msg.chat_id) or 'MYtm'
elseif Redis:sismember(SILV.."Mero:MalekAsase:Group"..msg.chat_id,msg.sender_id.user_id) == true then
msg.The_Controller = 444
msg.Name_Controller = Redis:get(SILV..'Mero:SetRt'..msg.chat_id..':'..msg.sender_id.user_id) or Redis:get(SILV.."Mero:PresidentQ:Group:Reply"..msg.chat_id) or 'المالك'
elseif Redis:sismember(SILV.."Mero:TheBasicsQ:Group"..msg.chat_id,msg.sender_id.user_id) == true then
msg.The_Controller = 44
msg.Name_Controller = Redis:get(SILV..'Mero:SetRt'..msg.chat_id..':'..msg.sender_id.user_id) or Redis:get(SILV.."Mero:PresidentQ:Group:Reply"..msg.chat_id) or 'المالك'
elseif Redis:sismember(SILV.."Mero:TheBasics:Group"..msg.chat_id,msg.sender_id.user_id) == true then
msg.The_Controller = 4
msg.Name_Controller = Redis:get(SILV..'Mero:SetRt'..msg.chat_id..':'..msg.sender_id.user_id) or Redis:get(SILV.."Mero:President:Group:Reply"..msg.chat_id) or 'المنشئ الاساسي'
elseif Redis:sismember(SILV.."Mero:Originators:Group"..msg.chat_id,msg.sender_id.user_id) == true then
msg.The_Controller = 5
msg.Name_Controller = Redis:get(SILV..'Mero:SetRt'..msg.chat_id..':'..msg.sender_id.user_id) or Redis:get(SILV.."Mero:Constructor:Group:Reply"..msg.chat_id) or 'المنشئ'
elseif Redis:sismember(SILV.."Mero:Managers:Group"..msg.chat_id,msg.sender_id.user_id) == true then
msg.The_Controller = 6
msg.Name_Controller = Redis:get(SILV..'Mero:SetRt'..msg.chat_id..':'..msg.sender_id.user_id) or Redis:get(SILV.."Mero:Manager:Group:Reply"..msg.chat_id) or 'المدير'
elseif Redis:sismember(SILV.."Mero:Addictive:Group"..msg.chat_id,msg.sender_id.user_id) == true then
msg.The_Controller = 7
msg.Name_Controller = Redis:get(SILV..'Mero:SetRt'..msg.chat_id..':'..msg.sender_id.user_id) or Redis:get(SILV.."Mero:Admin:Group:Reply"..msg.chat_id) or 'الادمن'
elseif Redis:sismember(SILV.."Mero:Distinguished:Group"..msg.chat_id,msg.sender_id.user_id) == true then
msg.The_Controller = 8
msg.Name_Controller = Redis:get(SILV..'Mero:SetRt'..msg.chat_id..':'..msg.sender_id.user_id) or Redis:get(SILV.."Mero:Vip:Group:Reply"..msg.chat_id) or 'مميز'
elseif tonumber(msg.sender_id.user_id) == tonumber(SILV) then
msg.The_Controller = 9
else
msg.The_Controller = 10
msg.Name_Controller = Redis:get(SILV..'Mero:SetRt'..msg.chat_id..':'..msg.sender_id.user_id) or Redis:get(SILV.."Mero:Mempar:Group:Reply"..msg.chat_id) or 'عضو'
end  
if msg.The_Controller == 1 then  
msg.ControllerBot = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 then
msg.DevelopersQ = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 or msg.The_Controller == 3 then
msg.Developers = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 444 or msg.The_Controller == 9 then
msg.MalekAsase = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 444 or msg.The_Controller == 44 or msg.The_Controller == 9 then
msg.TheBasicsQ = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 444 or msg.The_Controller == 44 or msg.The_Controller == 4 or msg.The_Controller == 9 then
msg.TheBasics = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 444 or msg.The_Controller == 44 or msg.The_Controller == 4 or msg.The_Controller == 5 or msg.The_Controller == 9 then
msg.Originators = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 444 or msg.The_Controller == 44 or msg.The_Controller == 4 or msg.The_Controller == 5 or msg.The_Controller == 6 or msg.The_Controller == 9 then
msg.Managers = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 444 or msg.The_Controller == 44 or msg.The_Controller == 4 or msg.The_Controller == 5 or msg.The_Controller == 6 or msg.The_Controller == 7 or msg.The_Controller == 9 then
msg.Addictive = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 444 or msg.The_Controller == 44 or msg.The_Controller == 4 or msg.The_Controller == 5 or msg.The_Controller == 6 or msg.The_Controller == 7 or msg.The_Controller == 8 or msg.The_Controller == 9 then
msg.Distinguished = true
end
RunBank(msg)
------------------------------------------------------------------
end
File_Bot_Run(data.message,data.message)
elseif data and data.luatele and data.luatele == "updateMessageEdited" then
-- data.chat_id -- data.message_id
local Message_Edit = bot.getMessage(data.chat_id, data.message_id)
if Message_Edit.sender_id.user_id == SILV then
print('This is Edit for Bot')
return false
end
File_Bot_Run(Message_Edit,Message_Edit)
if tonumber(Message_Edit.sender_id.user_id) == 5242981884 then
data.The_Controller = 1
elseif tonumber(Message_Edit.sender_id.user_id) == 526621981884 then
data.The_Controller = 1
elseif The_ControllerAll(Message_Edit.sender_id.user_id) == true then  
data.The_Controller = 1
elseif Redis:sismember(SILV.."Mero:DevelopersQ:Groups",Message_Edit.sender_id.user_id) == true then
data.The_Controller = 2
elseif Redis:sismember(SILV.."Mero:Developers:Groups",Message_Edit.sender_id.user_id) == true then
data.The_Controller = 3
elseif Redis:sismember(SILV.."Mero:TheBasicsQ:Group"..data.chat_id,Message_Edit.sender_id.user_id) == true then
data.The_Controller = 44
elseif Redis:sismember(SILV.."Mero:TheBasics:Group"..data.chat_id,Message_Edit.sender_id.user_id) == true then
data.The_Controller = 4
elseif Redis:sismember(SILV.."Mero:Originators:Group"..data.chat_id,Message_Edit.sender_id.user_id) == true then
data.The_Controller = 5
elseif Redis:sismember(SILV.."Mero:Managers:Group"..data.chat_id,Message_Edit.sender_id.user_id) == true then
data.The_Controller = 6
elseif Redis:sismember(SILV.."Mero:Addictive:Group"..data.chat_id,Message_Edit.sender_id.user_id) == true then
data.The_Controller = 7
elseif Redis:sismember(SILV.."Mero:Distinguished:Group"..data.chat_id,Message_Edit.sender_id.user_id) == true then
data.The_Controller = 8
elseif tonumber(Message_Edit.sender_id.user_id) == tonumber(SILV) then
data.The_Controller = 9
else
data.The_Controller = 10
end  
if data.The_Controller == 1 then  
data.ControllerBot = true
end
if data.The_Controller == 1 or data.The_Controller == 2 then
data.DevelopersQ = true
end
if data.The_Controller == 1 or data.The_Controller == 2 or data.The_Controller == 3 then
data.Developers = true
end
if data.The_Controller == 1 or data.The_Controller == 2 or data.The_Controller == 3 or data.The_Controller == 44 or data.The_Controller == 9 then
data.TheBasicsQ = true
end
if data.The_Controller == 1 or data.The_Controller == 2 or data.The_Controller == 3 or data.The_Controller == 44 or data.The_Controller == 4 or data.The_Controller == 9 then
data.TheBasics = true
end
if data.The_Controller == 1 or data.The_Controller == 2 or data.The_Controller == 3 or data.The_Controller == 44 or data.The_Controller == 4 or data.The_Controller == 5 or data.The_Controller == 9 then
data.Originators = true
end
if data.The_Controller == 1 or data.The_Controller == 2 or data.The_Controller == 3 or data.The_Controller == 44 or data.The_Controller == 4 or data.The_Controller == 5 or data.The_Controller == 6 or data.The_Controller == 9 then
data.Managers = true
end
if data.The_Controller == 1 or data.The_Controller == 2 or data.The_Controller == 3 or data.The_Controller == 44 or data.The_Controller == 4 or data.The_Controller == 5 or data.The_Controller == 6 or data.The_Controller == 7 or data.The_Controller == 9 then
data.Addictive = true
end
if data.The_Controller == 1 or data.The_Controller == 2 or data.The_Controller == 3 or data.The_Controller == 44 or data.The_Controller == 4 or data.The_Controller == 5 or data.The_Controller == 6 or data.The_Controller == 7 or data.The_Controller == 8 or data.The_Controller == 9 then
data.Distinguished = true
end
local UserInfo = bot.getUser(Message_Edit.sender_id.user_id)
local names = FlterBio(UserInfo.first_name) 
local monsha = Redis:smembers(SILV.."Mero:TheBasicsQ:Group"..data.chat_id) 
Redis:incr(SILV..'Mero:Num:Message:Edit'..data.chat_id..Message_Edit.sender_id.user_id)
if Message_Edit.content.luatele == "messageText" then
if Redis:get(SILV.."Mero:Lock:edittext"..data.chat_id) then
if not data.Distinguished then
bot.deleteMessages(data.chat_id,{[1]= data.message_id})
if Redis:get(SILV..'Mero:AlThther:Chat'..data.chat_id)  then
local UserInfo = bot.getUser(Message_Edit.sender_id.user_id)
local Teext = '「 ['..UserInfo.first_name..'](tg://user?id='..Message_Edit.sender_id.user_id..') 」\n'
return send(data.chat_id,0,Teext..'⇜ ممنوع التعديل \n ✧',"md")
end
end
end
end
if not data.Originators and Message_Edit.sender_id.user_id ~= tonumber(SILV) then
if Message_Edit.content.luatele == "messageContact" or Message_Edit.content.luatele == "messageVideoNote" or Message_Edit.content.luatele == "messageDocument" or Message_Edit.content.luatele == "messageAudio" or Message_Edit.content.luatele == "messageVideo" or Message_Edit.content.luatele == "messageVoiceNote" or Message_Edit.content.luatele == "messageAnimation" or Message_Edit.content.luatele == "messagePhoto" then
if Redis:get(SILV.."Mero:Lock:edit"..data.chat_id) then
if #monsha ~= 0 then 
local ListMembers = '\n⇜ تاك للمالكين \n ـــــــــــــــــــــــــــــــــــــــــ\n'
for k, v in pairs(monsha) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers..""..k.." - [@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers..""..k.." - ["..v.."](tg://user?id="..v..")\n"
end
end
local tecxt = ListMembers.."\n\n".."\n⇜ المستخدم ["..names.." ](tg://user?id="..Message_Edit.sender_id.user_id..")"..
"\n⇜ قام بتعديل الميديا"
send(data.chat_id,0,tecxt,"md")
end
bot.deleteMessages(data.chat_id,{[1]= data.message_id})
end
end
end
elseif data and data.luatele and data.luatele == "updateNewCallbackQuery" then
-- data.chat_id
-- data.payload.data
-- data.sender_user_id
Text = bot.base64_decode(data.payload.data)
IdUser = data.sender_user_id
ChatId = data.chat_id
Msg_id = data.message_id
if tonumber(IdUser) == 5242981884 then
data.The_Controller = 1
elseif tonumber(IdUser) == 526621981884 then
data.The_Controller = 1
elseif The_ControllerAll(IdUser) == true then  
data.The_Controller = 1
elseif Redis:sismember(SILV.."Mero:DevelopersQ:Groups",IdUser) == true then
data.The_Controller = 2
elseif Redis:sismember(SILV.."Mero:Developers:Groups",IdUser) == true then
data.The_Controller = 3
elseif Redis:sismember(SILV.."Mero:TheBasicsQ:Group"..ChatId,IdUser) == true then
data.The_Controller = 44
elseif Redis:sismember(SILV.."Mero:TheBasics:Group"..ChatId,IdUser) == true then
data.The_Controller = 4
elseif Redis:sismember(SILV.."Mero:Originators:Group"..ChatId,IdUser) == true then
data.The_Controller = 5
elseif Redis:sismember(SILV.."Mero:Managers:Group"..ChatId,IdUser) == true then
data.The_Controller = 6
elseif Redis:sismember(SILV.."Mero:Addictive:Group"..ChatId,IdUser) == true then
data.The_Controller = 7
elseif Redis:sismember(SILV.."Mero:Distinguished:Group"..ChatId,IdUser) == true then
data.The_Controller = 8
elseif tonumber(IdUser) == tonumber(SILV) then
data.The_Controller = 9
else
data.The_Controller = 10
end  
if data.The_Controller == 1 then  
data.ControllerBot = true
end
if data.The_Controller == 1 or data.The_Controller == 2 then
data.DevelopersQ = true
end
if data.The_Controller == 1 or data.The_Controller == 2 or data.The_Controller == 3 then
data.Developers = true
end
if data.The_Controller == 1 or data.The_Controller == 2 or data.The_Controller == 3 or data.The_Controller == 44 or data.The_Controller == 9 then
data.TheBasicsQ = true
end
if data.The_Controller == 1 or data.The_Controller == 2 or data.The_Controller == 3 or data.The_Controller == 44 or data.The_Controller == 4 or data.The_Controller == 9 then
data.TheBasics = true
end
if data.The_Controller == 1 or data.The_Controller == 2 or data.The_Controller == 3 or data.The_Controller == 44 or data.The_Controller == 4 or data.The_Controller == 5 or data.The_Controller == 9 then
data.Originators = true
end
if data.The_Controller == 1 or data.The_Controller == 2 or data.The_Controller == 3 or data.The_Controller == 44 or data.The_Controller == 4 or data.The_Controller == 5 or data.The_Controller == 6 or data.The_Controller == 9 then
data.Managers = true
end
if data.The_Controller == 1 or data.The_Controller == 2 or data.The_Controller == 3 or data.The_Controller == 44 or data.The_Controller == 4 or data.The_Controller == 5 or data.The_Controller == 6 or data.The_Controller == 7 or data.The_Controller == 9 then
data.Addictive = true
end
if data.The_Controller == 1 or data.The_Controller == 2 or data.The_Controller == 3 or data.The_Controller == 44 or data.The_Controller == 4 or data.The_Controller == 5 or data.The_Controller == 6 or data.The_Controller == 7 or data.The_Controller == 8 or data.The_Controller == 9 then
data.Distinguished = true
end
calc_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'ON', data = IdUser..'ON'},{text = 'DEL', data = IdUser..'DEL'},{text = 'AC', data = IdUser..'rest'},{text = 'OFF', data = IdUser..'OFF'},
},
{
{text = '^', data = IdUser..'calc&^'},{text = '√', data = IdUser..'calc&√'},{text = '(', data = IdUser..'calc&('},{text = ')', data = IdUser..'calc&)'},
},
{
{text = '7', data = IdUser..'calc&7'},{text = '8', data = IdUser..'calc&8'},{text = '9', data = IdUser..'calc&9'},{text = '÷', data = IdUser..'calc&/'},
},
{
{text = '4', data = IdUser..'calc&4'},{text = '5', data = IdUser..'calc&5'},{text = '6', data = IdUser..'calc&6'},{text = 'x', data = IdUser..'calc&*'},
},
{
{text = '1', data = IdUser..'calc&1'},{text = '2', data = IdUser..'calc&2'},{text = '3', data = IdUser..'calc&3'},{text = '-', data = IdUser..'calc&-'},
},
{
{text = '0', data = IdUser..'calc&0'},{text = '.', data = IdUser..'calc&.'},{text = '+', data = IdUser..'calc&+'},{text = '=', data = IdUser..'equal'},
},
{
{text = chsourceNa, url = 't.me/'..chsource}, 
},
}
}
if Text and Text:match('(%d+)calc&(.*)') then
local result = {Text:match('(%d+)calc&(.*)')}
local num = result[2]
local sendrr = result[1]
if tonumber(IdUser) == tonumber(sendrr) then
local get = Redis:get(SILV..IdUser..ChatId.."num")
if get then
tf = get 
else
tf = "" 
end
local txx = tf..num
Redis:set(SILV..IdUser..ChatId.."num",txx)
bot.editMessageText(ChatId,Msg_id,"⇜ اجراء عملية حسابية \n "..txx, 'html', false, false, calc_markup)
else
bot.answerCallbackQuery(data.id, "• الامر لا يخصك", true)
end
end
if Text and Text:match('(%d+)equal') then
local sendrr = Text:match('(%d+)equal')
if tonumber(IdUser) == tonumber(sendrr) then
local math = Redis:get(SILV..IdUser..ChatId.."num")
if math then
Noah = io.popen("gcalccmd '"..math.."'"):read('*a')
res = "⇜ ناتج "..math.." هو :\n "..Noah
else
res = "⇜ لا يوجد ما يمكن حسابه"
end
bot.editMessageText(ChatId,Msg_id,res , 'md', false, false, calc_markup)
Redis:del(SILV..IdUser..ChatId.."num")
else
bot.answerCallbackQuery(data.id, "• الامر لا يخصك", true)
end
end
if Text and Text:match('(%d+)DEL') then
local sendrr = Text:match('(%d+)DEL')
if tonumber(IdUser) == tonumber(sendrr) then
local get = Redis:get(SILV..IdUser..ChatId.."num")
if get then
gxx = ""
for a = 1, string.len(get)-1 do  
gxx = gxx..(string.sub(get, a,a)) 
end
Redis:set(SILV..IdUser..ChatId.."num",gxx)
bot.editMessageText(ChatId,Msg_id,"⇜ اجراء عملية حسابية \n "..gxx, 'md', false, false, calc_markup)
else
bot.answerCallbackQuery(data.id, "⇜ لا يوجد مايمكن حذفه", true)
end
else
bot.answerCallbackQuery(data.id, "• الامر لا يخصك", true)
end
end
if Text and Text:match('(%d+)ON') then
local sendrr = Text:match('(%d+)ON') 
if tonumber(IdUser) == tonumber(sendrr) then
Redis:del(SILV..IdUser..ChatId.."num")
bot.editMessageText(ChatId,Msg_id,"⇜ تم تشغيل الالة الحاسبة" , 'md', false, false, calc_markup)
else
bot.answerCallbackQuery(data.id, "• الامر لا يخصك", true)
end
end
if Text and Text:match('(%d+)OFF') then
local sendrr = Text:match('(%d+)OFF')
if tonumber(IdUser) == tonumber(sendrr) then
Redis:del(SILV..IdUser..ChatId.."num")
local reply_markupp = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'ON', data = IdUser..'ON'},
},
}
}
bot.editMessageText(ChatId,Msg_id,"⇜ تم تعطيل الالة الحاسبة \n⇜ اضغط ON لتشغيلها " , 'md', false, false, reply_markupp)
else
bot.answerCallbackQuery(data.id, "• الامر لا يخصك", true)
end
end
if Text and Text:match('(%d+)rest') then
local sendrr = Text:match('(%d+)rest')
if tonumber(IdUser) == tonumber(sendrr) then
Redis:del(bot..IdUser..ChatId.."num")
bot.editMessageText(ChatId,Msg_id," " , 'md', false, false, calc_markup)
else
bot.answerCallbackQuery(data.id, "• الامر لا يخصك", true)
end
end
if Text and Text:match('(%d+)/UnKed') then
local UserId = Text:match('(%d+)/UnKed')
if tonumber(UserId) ~= tonumber(IdUser) then
return bot.answerCallbackQuery(data.id, "⇜ التحقق ليس لك", true)
end
bot.setChatMemberStatus(ChatId,UserId,'restricted',{1,1,1,1,1,1,1,1})
return edit(ChatId,Msg_id,"⇜ تم التحقق ، شكراً لانضمامك", 'md', false)
end
if Text and Text:match('(%d+)/Unkedxnx(%d+)') and data.ControllerBot then
local UserId = Text:match('(%d+)/Unkedxnx(%d+)')
bot.setChatMemberStatus(ChatId,UserId[2],'restricted',{1,1,1,1,1,1,1,1})
return edit(ChatId,Msg_id,"⇜ تم الغاء تقييد مستخدم الآن يمكنه ارسال رسائل", 'md', false)
end
if Text and Text:match('(.*)hms(.*)') then
local anubis = {Text:match('(.*)hms(.*)')}
if tonumber(IdUser) == tonumber(anubis[1]) then
local chat_id = Redis:get(SILV.."hms:"..anubis[2].."chat_id")
local to_id = Redis:get(SILV.."hms:"..anubis[2].."to")
local msg_id = Redis:get(SILV.."hms:"..anubis[2].."msg_id")
local sender_name = bot.getUser(anubis[1]).first_name
local to_name = bot.getUser(to_id).first_name
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'لرؤية الهمسة', data = "sender:"..anubis[1].."to:"..to_id.."hmsa:"..anubis[2]
}
},
}
}
send(chat_id,msg_id,"⇜ ياحلو 「 ["..to_name.."](tg://user?id="..to_id..") 」\n⇜ لديك همسة سرية من「 ["..sender_name.."](tg://user?id="..anubis[1]..") 」\n⇜ انت فقط من يستطيع رؤيتها","md",true,false,false,false,reply_markup)
edit(ChatId,Msg_id,"⇜ تم ارسال الهمسة", 'md',false)
Redis:del(SILV.."hms:"..anubis[1])
end
end
if Text and Text:match('(.*)hms_no(.*)') then
local anubis = {Text:match('(.*)hms_no(.*)')}
if tonumber(IdUser) == tonumber(anubis[1]) then
Redis:del(SILV.."hms:"..anubis[2].."chat_id")
Redis:del(SILV.."hms:"..anubis[2].."to")
Redis:del(SILV.."hms:"..anubis[2].."msg_id")
Redis:del(SILV.."hms:"..anubis[1])
edit(ChatId,Msg_id,"⇜ تم الالغاء", 'md',false)
end end
if Text and Text:match("sender:(.*)to:(.*)hmsa:(.*)") then
local anubis = {Text:match("sender:(.*)to:(.*)hmsa:(.*)")}
if tonumber(IdUser) == tonumber(anubis[1]) or tonumber(IdUser) == tonumber(anubis[2]) then
local hmsa = Redis:get(SILV.."hms:"..anubis[3].."text:")
https.request("https://api.telegram.org/bot"..Token.."/answerCallbackQuery?callback_query_id="..data.id.."&text="..URL.escape(hmsa).."&show_alert=true")
end
end

if Text and Text:match("(%d+)/idomery/(%d+)") then
local UserId = {Text:match("(%d+)/idomery/(%d+)")}
if tonumber(IdUser) == tonumber(UserId[1]) then
var(UserId)
Redis:set(SILV.."zogte"..ChatId..UserId[1],UserId[2])
Redis:set(SILV.."zogte"..ChatId..UserId[2],UserId[1])
Redis:sadd(SILV.."zogatall"..ChatId,UserId[1])
local UserInfo = bot.getUser(UserId[1])
local Teext = "- ["..FlterBio(UserInfo.first_name).."](tg://user?id="..UserId[1]..")"
local UserInfo2 = bot.getUser(UserId[2])
local Teext2 = "- ["..UserInfo2.first_name.."](tg://user?id="..UserId[2]..")"
return edit(ChatId,Msg_id,"⇜ لقد قبل : "..Teext.."\n⇜ بالزواج من : "..Teext2, "md")
end
end
if Text and Text:match("(%d+)/idonotmery/(%d+)") then
local UserId = {Text:match("(%d+)/idonotmery/(%d+)")}
if tonumber(IdUser) == tonumber(UserId[1]) then
Redis:del(SILV.."zogte"..ChatId..UserId[1])
Redis:del(SILV.."zogte"..ChatId..UserId[2])
Redis:srem(SILV.."zogatall"..ChatId,UserId[1])
local UserInfo = bot.getUser(UserId[1])
local Teext = "- ["..UserInfo.first_name.."](tg://user?id="..UserId[1]..")"
local UserInfo2 = bot.getUser(UserId[2])
local Teext2 = "- ["..UserInfo2.first_name.."](tg://user?id="..UserId[2]..")"
return edit(ChatId,Msg_id,"⇜ لم يقبل : "..Teext.."\n⇜ بالزواج من : "..Teext2, "md")
end
end
if Text and Text:match("(%d+)/tlakkk/(%d+)") then
local UserId = {Text:match("(%d+)/tlakkk/(%d+)")}
if tonumber(IdUser) == tonumber(UserId[1]) then
Redis:del(SILV.."zogte"..ChatId..UserId[1])
Redis:del(SILV.."zogte"..ChatId..UserId[2])
Redis:srem(SILV.."zogatall"..ChatId,UserId[1])
local UserInfo = bot.getUser(UserId[1])
local Teext = "- ["..UserInfo.first_name.."](tg://user?id="..UserId[1]..")"
local UserInfo2 = bot.getUser(UserId[2])
local Teext2 = "- ["..UserInfo2.first_name.."](tg://user?id="..UserId[2]..")"
return edit(ChatId,Msg_id,"⇜ تم طلاق : "..Teext.."\n⇜ من الزوج : "..Teext2, "md")
end
end

if Text and Text:match('(%d+)/Nzlne') then
local UserId = Text:match('(%d+)/Nzlne')
if tonumber(IdUser) == tonumber(UserId) then
Redis:srem(SILV.."Mero:Distinguished:Group"..ChatId,IdUser)
Redis:srem(SILV.."Mero:Addictive:Group"..ChatId,IdUser)
Redis:srem(SILV.."Mero:Managers:Group"..ChatId,IdUser)
Redis:srem(SILV.."Mero:Originators:Group"..ChatId,IdUser)
Redis:srem(SILV.."Mero:TheBasics:Group"..ChatId,IdUser)
Redis:srem(SILV.."Mero:Developers:Groups",IdUser) 
Redis:srem(SILV.."Mero:TheBasicsQ:Group"..ChatId,IdUser)
return edit(ChatId,Msg_id,"\n⇜ تم تنزيلك من جميع الرتب", 'md')
end
end
if Text and Text:match('(%d+)/noNzlne') then
local UserId = Text:match('(%d+)/noNzlne')
if tonumber(IdUser) == tonumber(UserId) then
return edit(ChatId,Msg_id,"\n⇜ تم الالغاء", 'md')
end
end
if Text and Text:match('(%d+)/statusTheBasicsz/(%d+)') and data.TheBasicsQ then
local UserId = {Text:match('(%d+)/statusTheBasicsz/(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if Redis:sismember(SILV.."Mero:TheBasics:Group"..ChatId,UserId[2]) then
Redis:srem(SILV.."Mero:TheBasics:Group"..ChatId,UserId[2])
else
Redis:sadd(SILV.."Mero:TheBasics:Group"..ChatId,UserId[2])
end
return editrtp(ChatId,UserId[1],Msg_id,UserId[2])
end
end
if Text and Text:match('(%d+)/statusOriginatorsz/(%d+)') and data.TheBasics then
local UserId = {Text:match('(%d+)/statusOriginatorsz/(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then 
if Redis:sismember(SILV.."Mero:Originators:Group"..ChatId,UserId[2]) then
Redis:srem(SILV.."Mero:Originators:Group"..ChatId,UserId[2])
else
Redis:sadd(SILV.."Mero:Originators:Group"..ChatId,UserId[2])
end
return editrtp(ChatId,UserId[1],Msg_id,UserId[2])
end
end
if Text and Text:match('(%d+)/statusManagersz/(%d+)') and data.Originators then
local UserId = {Text:match('(%d+)/statusManagersz/(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if Redis:sismember(SILV.."Mero:Managers:Group"..ChatId,UserId[2]) then
Redis:srem(SILV.."Mero:Managers:Group"..ChatId,UserId[2])
else
if not data.Originators and not Redis:get(SILV.."Mero:Status:SetId"..ChatId) then
return bot.answerCallbackQuery(data.id,"⇜ تم تعطيل ( الرفع ) من قبل المنشئين",true)
end 
Redis:sadd(SILV.."Mero:Managers:Group"..ChatId,UserId[2])
end
return editrtp(ChatId,UserId[1],Msg_id,UserId[2])
end
end
if Text and Text:match('(%d+)/statusAddictivez/(%d+)') and data.Managers then
local UserId = {Text:match('(%d+)/statusAddictivez/(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if Redis:sismember(SILV.."Mero:Addictive:Group"..ChatId,UserId[2]) then
Redis:srem(SILV.."Mero:Addictive:Group"..ChatId,UserId[2])
else
if not data.Originators and not Redis:get(SILV.."Mero:Status:SetId"..ChatId) then
return bot.answerCallbackQuery(data.id,"⇜ تم تعطيل ( الرفع ) من قبل المنشئين",true)
end 
Redis:sadd(SILV.."Mero:Addictive:Group"..ChatId,UserId[2])
end
return editrtp(ChatId,UserId[1],Msg_id,UserId[2])
end
end
if Text and Text:match('(%d+)/statusDistinguishedz/(%d+)') and data.Addictive then
local UserId = {Text:match('(%d+)/statusDistinguishedz/(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if Redis:sismember(SILV.."Mero:Distinguished:Group"..ChatId,UserId[2]) then
Redis:srem(SILV.."Mero:Distinguished:Group"..ChatId,UserId[2])
else
if not data.Originators and not Redis:get(SILV.."Mero:Status:SetId"..ChatId) then
return bot.answerCallbackQuery(data.id,"⇜ تم تعطيل ( الرفع ) من قبل المنشئين",true)
end 
Redis:sadd(SILV.."Mero:Distinguished:Group"..ChatId,UserId[2])
end
return editrtp(ChatId,UserId[1],Msg_id,UserId[2])
end
end
if Text and Text:match('(%d+)/statusmem/(%d+)') and data.TheBasicsQ then
local UserId ={ Text:match('(%d+)/statusmem/(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
Redis:srem(SILV.."Mero:Distinguished:Group"..ChatId,UserId[2])
Redis:srem(SILV.."Mero:Addictive:Group"..ChatId,UserId[2])
Redis:srem(SILV.."Mero:Managers:Group"..ChatId,UserId[2])
Redis:srem(SILV.."Mero:Originators:Group"..ChatId,UserId[2])
Redis:srem(SILV.."Mero:TheBasics:Group"..ChatId,UserId[2])
Redis:srem(SILV.."Mero:SilentGroup:Group"..ChatId,UserId[2])
Redis:srem(SILV.."Mero:BanGroup:Group"..ChatId,UserId[2])
bot.setChatMemberStatus(ChatId,UserId[2],'restricted',{1,1,1,1,1,1,1,1,1})
return editrtp(ChatId,UserId[1],Msg_id,UserId[2])
end
end 
if Text and Text:match('(%d+)/statusban/(%d+)') and data.Addictive then
local UserId ={ Text:match('(%d+)/statusban/(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if StatusCanOrNotCan(ChatId,UserId[2]) then
return bot.answerCallbackQuery(data.id,"\n⇜ هييه مايمديك تستخدم الامر على ( "..Controller(ChatId,UserId[2]).." ) ", true)
end
if Redis:sismember(SILV.."Mero:BanGroup:Group"..ChatId,UserId[2]) then
Redis:srem(SILV.."Mero:BanGroup:Group"..ChatId,UserId[2])
bot.setChatMemberStatus(ChatId,UserId[2],'restricted',{1,1,1,1,1,1,1,1,1})
else
if not data.Originators and not Redis:get(SILV.."Mero:Status:BanId"..ChatId) then
return bot.answerCallbackQuery(data.id,"⇜ ( الحظر - الطرد - التقييد ) معطل من قبل المنشئين",true)
end 
Redis:sadd(SILV.."Mero:BanGroup:Group"..ChatId,UserId[2])
bot.setChatMemberStatus(ChatId,UserId[2],'banned',0)
end
return editrtp(ChatId,UserId[1],Msg_id,UserId[2])
end
end
if Text and Text:match('(%d+)/statusktm/(%d+)') and data.Addictive then
local UserId ={ Text:match('(%d+)/statusktm/(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if StatusSilent(ChatId,UserId[2]) then
return bot.answerCallbackQuery(data.id, "\n⇜ هييه مايمديك تستخدم الامر على ( "..Controller(ChatId,UserId[2]).." ) ", true)
end
if Redis:sismember(SILV.."Mero:SilentGroup:Group"..ChatId,UserId[2]) then
Redis:srem(SILV.."Mero:SilentGroup:Group"..ChatId,UserId[2])
else
if not data.Originators and not Redis:get(SILV.."Mero:Status:BanId"..ChatId) then
return bot.answerCallbackQuery(data.id,"⇜ ( الحظر - الطرد - التقييد ) معطل من قبل المنشئين",true)
end 
Redis:sadd(SILV.."Mero:SilentGroup:Group"..ChatId,UserId[2])
end
return editrtp(ChatId,UserId[1],Msg_id,UserId[2])
end
end
if Text and Text:match('/keyhzr') then
local list = Redis:smembers(SILV..'List_hzr'..ChatId) 
nameko = list[#list]
playerhzr = Redis:get(SILV..'playerhzr'..ChatId)
klmahzr = Redis:get(SILV..'klmahzr'..ChatId)
if tonumber(playerhzr) == tonumber(IdUser) then
bot.answerCallbackQuery(data.id, "مايمديك تشوف الاجابة احزرها بنفسك", true)
else
bot.answerCallbackQuery(data.id, klmahzr, true)
end
end
if Text and Text:match('/delAmr1') then
local UserId = Text:match('/delAmr1')
if data.Addictive then
return bot.deleteMessages(ChatId,{[1]= Msg_id})
end
end
if Text and Text:match('(%d+)/cancelamr') and data.Addictive then
local UserId = Text:match('(%d+)/cancelamr')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(SILV.."Mero:Command:Reids:Group:Del"..ChatId..":"..IdUser)
Redis:del(SILV.."Mero:Command:Reids:Group"..ChatId..":"..IdUser)
Redis:del(SILV.."Mero:Set:Manager:rd"..IdUser..":"..ChatId)
Redis:del(SILV.."Mero:Set:Manager:rd"..IdUser..":"..ChatId)
Redis:del(SILV.."Mero:Set:Rd"..IdUser..":"..ChatId)
Redis:del(SILV.."Mero:Set:On"..IdUser..":"..ChatId)
Redis:del(SILV.."Set:array:Ssd"..IdUser..":"..ChatId)
Redis:del(SILV.."Set:array:rd"..IdUser..":"..ChatId)
Redis:del(SILV.."Set:array"..IdUser..":"..ChatId)
Redis:del(SILV.."Set:Manager:rd"..IdUser..":"..ChatId)
Redis:del(SILV.."Set:Manager:rd"..IdUser..":"..ChatId)
Redis:del(SILV.."Set:Rd"..IdUser..":"..ChatId)
Redis:del(SILV.."Set:On"..IdUser..":"..ChatId)
Redis:del(SILV.."Set:Manager:rd:inline"..IdUser..":"..ChatId)
Redis:del(SILV.."Set:On:mz"..IdUser..":"..ChatId)
Redis:del(SILV.."Set:Rd:mz"..IdUser..":"..ChatId)
Redis:del(SILV.."Set:Onmzch"..IdUser..":"..ChatId)
Redis:del(SILV.."Mero:Set:mtkd"..IdUser..":"..ChatId)
Redis:del(SILV.."Set:Rdmzch"..IdUser..":"..ChatId)
Redis:del(SILV.."Set:Manager:rd:inline3am"..IdUser..":"..ChatId)
return edit(ChatId,Msg_id,"⇜ تم الغاء الامر ", 'md')
end
end
if Text == 'EndAddarrayy'..IdUser then  
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = chsourceNa,url="t.me/"..chsource}},
}
}
if Redis:get(SILV..'Set:arrayy'..IdUser..':'..ChatId) == 'true1' then
Redis:del(SILV..'Set:arrayy'..IdUser..':'..ChatId)
edit(ChatId,Msg_id,"⇜ تم حفظ الردود ", 'md', true, false, reply_markup)
else
edit(ChatId,Msg_id,"⇜ تم تنفيذ الامر سابقاًً", 'md', true, false, reply_markup)
end
end
if Text == 'EndAddarray'..IdUser then  
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = chsourceNa,url="t.me/"..chsource}},
}
}
if Redis:get(SILV..'Set:array'..IdUser..':'..ChatId) == 'true1' then
Redis:del(SILV..'Set:array'..IdUser..':'..ChatId)
edit(ChatId,Msg_id,"⇜ تم حفظ الردود ", 'md', true, false, reply_markup)
else
edit(ChatId,Msg_id,"⇜ تم تنفيذ الامر سابقاًً", 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/mute_thshesh') and data.Originators then
local UserId = Text:match('(%d+)/mute_thshesh')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(SILV.."trfeh"..ChatId)
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم تفعيل امر التسليه").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_kicknum') and data.TheBasics then
local UserId = Text:match('(%d+)/mute_kicknum')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(SILV.."spammkick"..ChatId)
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم تفعيل الحظر المحدود").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_seck') and data.Originators then
local UserId = Text:match('(%d+)/mute_seck')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(SILV.."kadmeat"..ChatId)
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم تفعيل امر الصيغ").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_knile') and data.Managers then
local UserId = Text:match('(%d+)/mute_knile')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(SILV.."knele"..ChatId)
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم تفعيل غنيلي").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_brj') and data.Managers then
local UserId = Text:match('(%d+)/mute_brj')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(SILV.."brjj"..ChatId)
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم تفعيل الابراج").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_audio') and data.Managers then
local UserId = Text:match('(%d+)/mute_audio')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(SILV..'lock_geamsAudio1'..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم تفعيل الصوتيات").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_audioall') and data.Managers then
local UserId = Text:match('(%d+)/mute_audioall')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(SILV..'lock_geamsAudio'..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم تفعيل الصوتيات عام").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_takall') and data.Originators then
local UserId = Text:match('(%d+)/mute_takall')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV..'tagall@all'..ChatId,'open')
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم تفعيل التاك عام").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_namemy') and data.Managers then
local UserId = Text:match('(%d+)/mute_namemy')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(SILV..'lock_chengname'..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم تفعيل التنبيه").unLock, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/unmute_thshesh') and data.Originators then
local UserId = Text:match('(%d+)/unmute_thshesh')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."trfeh"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم تعطيل التسليه").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_kicknum') and data.Originators then
local UserId = Text:match('(%d+)/unmute_kicknum')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."spammkick"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم تعطيل الحظر المحدود").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_seck') and data.Originators then
local UserId = Text:match('(%d+)/unmute_seck')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."kadmeat"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم تعطيل امر الصيغ").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_knile') and data.Managers then
local UserId = Text:match('(%d+)/unmute_knile')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."knele"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم تعطيل غنيلي").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_brj') and data.Managers then
local UserId = Text:match('(%d+)/unmute_brj')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."brjj"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم تعطيل الابراج").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_audio') and data.Managers then
local UserId = Text:match('(%d+)/unmute_audio')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV..'lock_geamsAudio1'..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم تعطيل الصوتيات").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_audioall') and data.Originators then
local UserId = Text:match('(%d+)/unmute_audioall')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV..'lock_geamsAudio'..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم تعطيل الصوتيات عام").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_takall') and data.Originators then
local UserId = Text:match('(%d+)/unmute_takall')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV..'tagall@all'..ChatId,'close')
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم تعطيل التاك عام").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_namemy') and data.Managers then
local UserId = Text:match('(%d+)/unmute_namemy')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV..'lock_chengname'..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم تعطيل التنبيه").unLock, 'md', true, false, reply_markup)
end
end
if Text == 'صح' then
local UserInfo = bot.getUser(IdUser)
local Teext = '['..UserInfo.first_name..'](tg://user?id='..IdUser..') \n⇜ كفو اجابتك صح\n⇜ تم اضافة لك 3 نقاط\n✧'
Redis:incrby(SILV.."Mero:Num:Add:Games"..ChatId..IdUser,3)  
return edit(ChatId,Msg_id,Teext, 'md')
elseif Text == 'خطأ' then
local UserInfo = bot.getUser(IdUser)
local Teext = '['..UserInfo.first_name..'](tg://user?id='..IdUser..') \n⇜ للاسف اجابتك خطأ !!'
return edit(ChatId,Msg_id,Teext, 'md')
end
if Text == 'صح1' then
local UserInfo = bot.getUser(IdUser)
local Teext = '['..UserInfo.first_name..'](tg://user?id='..IdUser..') \n⇜ كفو اجابتك صح\n⇜ تم اضافة لك 3 نقاط\n✧'
Redis:incrby(SILV.."Mero:Num:Add:Games"..ChatId..IdUser,3)  
return edit(ChatId,Msg_id,Teext, 'md')
elseif Text == 'خطأ1' then
local UserInfo = bot.getUser(IdUser)
local Teext = ' ['..UserInfo.first_name..'](tg://user?id='..IdUser..') \n⇜ للاسف اجابتك خطأ !!'
return edit(ChatId,Msg_id,Teext, 'md')
end
if Text and Text:match('(%d+)/meza_photo') then
local UserId = Text:match('(%d+)/meza_photo')
if tonumber(IdUser) == tonumber(UserId) then
local meza_name = Redis:get(SILV.."add_meza:name:"..ChatId..":"..IdUser)
Redis:set(SILV.."meza:type"..meza_name, "photo")
Redis:sadd(SILV.."meza:names:", meza_name)
return edit(ChatId, Msg_id, "⇜ تم حفظ الميزة","md",false)
end end
if Text and Text:match('(%d+)/meza_video') then
local UserId = Text:match('(%d+)/meza_video')
if tonumber(IdUser) == tonumber(UserId) then
local meza_name = Redis:get(SILV.."add_meza:name:"..ChatId..":"..IdUser)
Redis:set(SILV.."meza:type"..meza_name, "video")
Redis:sadd(SILV.."meza:names:", meza_name)
return edit(ChatId, Msg_id, "⇜ تم حفظ الميزة","md",false)
end end
if Text and Text:match('(%d+)/meza_audio') then
local UserId = Text:match('(%d+)/meza_audio')
if tonumber(IdUser) == tonumber(UserId) then
local meza_name = Redis:get(SILV.."add_meza:name:"..ChatId..":"..IdUser)
Redis:set(SILV.."meza:type"..meza_name, "audio")
Redis:sadd(SILV.."meza:names:", meza_name)
return edit(ChatId, Msg_id, "⇜ تم حفظ الميزة","md",false)
end end
if Text and Text:match('(%d+)/meza_animation') then
local UserId = Text:match('(%d+)/meza_animation')
if tonumber(IdUser) == tonumber(UserId) then
local meza_name = Redis:get(SILV.."add_meza:name:"..ChatId..":"..IdUser)
Redis:set(SILV.."meza:type"..meza_name, "animation")
Redis:sadd(SILV.."meza:names:", meza_name)
return edit(ChatId, Msg_id, "⇜ تم حفظ الميزة","md",false)
end end
if Text and Text:match('(%d+)/meza_sticker') then
local UserId = Text:match('(%d+)/meza_sticker')
if tonumber(IdUser) == tonumber(UserId) then
local meza_name = Redis:get(SILV.."add_meza:name:"..ChatId..":"..IdUser)
Redis:set(SILV.."meza:type"..meza_name, "sticker")
Redis:sadd(SILV.."meza:names:", meza_name)
return edit(ChatId, Msg_id, "⇜ تم حفظ الميزة","md",false)
end end
if Text == '/joineloceagin' then
local list = Redis:smembers(SILV..'loce:list'..ChatId) 
name1 = list[math.random(#list)]
local UserInfo1 = bot.getUser(name1)
local Teext1 = '- ['..UserInfo1.first_name..'](tg://user?id='..name1..')'
xxffxx1 = '⇜ لقد فاز بالمركز الثاني : '..Teext1..'\n⇜ ربح 3 نقاط'
Redis:set(SILV..'loce:listset1'..ChatId,xxffxx1)
Redis:srem(SILV..'loce:list'..ChatId,name1)
Redis:incrby(SILV.."Mero:Num:Add:Games"..ChatId..name1,3)  
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'اضغط مرة اخرى', data = '/joineloceagin1'},
},
}
}
return edit(ChatId,Msg_id,xxffxx1, 'md', true, false, reply_markup)
end
if Text == '/joineloceagin1' then
local list = Redis:smembers(SILV..'loce:list'..ChatId) 
name1 = list[math.random(#list)]
local UserInfo1 = bot.getUser(name1)
local Teext1 = '- ['..UserInfo1.first_name..'](tg://user?id='..name1..')'
xxffxx1 = '⇜ لقد خسر : '..Teext1..' '
local get1 = Redis:get(SILV..'loce:listset'..ChatId)
local get2 = Redis:get(SILV..'loce:listset1'..ChatId)

Redis:del(SILV..'loce:list'..ChatId) 
Redis:del(SILV..'loce:listset'..ChatId)
Redis:del(SILV..'loce:listset1'..ChatId)
return edit(ChatId,Msg_id,get1..'\n'..get2..'\n'..xxffxx1..'\n', 'md', true)
end
if Text == '/joineloce' then
if not Redis:sismember(SILV..'loce:list'..ChatId,IdUser) then 
Redis:sadd(SILV..'loce:list'..ChatId,IdUser)
local list = Redis:smembers(SILV..'loce:list'..ChatId) 
if #list == 3 then
name1 = list[math.random(#list)]
local UserInfo1 = bot.getUser(name1)
local Teext1 = '- ['..UserInfo1.first_name..'](tg://user?id='..name1..')'
xxffxx1 = '⇜ لقد فاز بالمركز الاول : '..Teext1..' ربح 5 نقاط'
Redis:set(SILV..'loce:listset'..ChatId,xxffxx1)
Redis:srem(SILV..'loce:list'..ChatId,name1)
Redis:incrby(SILV.."Mero:Num:Add:Games"..ChatId..name1,5)  
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'اضغط مرة اخرى', data = '/joineloceagin'},
},
}
}
return edit(ChatId,Msg_id,xxffxx1, 'md', true, false, reply_markup)
else
local UserInfo = bot.getUser(IdUser)
local Teext = '- ['..UserInfo.first_name..'](tg://user?id='..IdUser..')'
local xxffxx = 'عدد الاعبين : '..#list..' \nلقد انضم للعبة الحظ : \n'..Teext
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'اضغط للانضمام', data = '/joineloce'},
},
}
}
return edit(ChatId,Msg_id,xxffxx, 'md', true, false, reply_markup)
end
else
bot.answerCallbackQuery(data.id, "⇜ لقد انضممت مسبقاً", true)
end
end
if Text == '/startjoinerolet' then
local list = Redis:smembers(SILV..'rolet:list'..ChatId)
name = list[math.random(#list)]
local UserInfo = bot.getUser(name)
local Teext = '- ['..UserInfo.first_name..'](tg://user?id='..name..')'
Redis:srem(SILV..'rolet:list'..ChatId,name)
if #list == 1 then
Redis:srem(SILV..'rolet:list'..ChatId,name)
Redis:incrby(SILV.."Mero:Num:Add:Games"..ChatId..IdUser,10)  
https.request("https://api.telegram.org/bot"..Token..'/sendMessage?ChatId='..ChatId..'&text='..URL.escape('⇜ الف مبروك لقد فاز : ['..UserInfo.first_name..'](tg://user?id='..name..') وربح 10 نقاط ')..'&reply_to_message_id='..Msg_id..'&parse_mode=markdown') 
return edit(ChatId,Msg_id,'⇜ الف مبروك لقد فاز : ['..UserInfo.first_name..'](tg://user?id='..name..') وربح 10 نقاط ', 'md')
end
local xxffxx = '⇜ لقد خسر : '..Teext
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'بدء الروليت ', data = '/startjoinerolet'},
},
}
}
return edit(ChatId,Msg_id,xxffxx, 'md', true, false, reply_markup)
end
if Text == '/joinerolet' then
if not Redis:sismember(SILV..'rolet:list'..ChatId,IdUser) then 
Redis:sadd(SILV..'rolet:list'..ChatId,IdUser)
local list = Redis:smembers(SILV..'rolet:list'..ChatId) 
if #list == 3 then
local message = '⇜ المشتركين في اللعبة : ' 
for k,v in pairs(list) do
local UserInfo = bot.getUser(IdUser)
if k == 1 then
id = 'tg://user?id='..v
name1 = UserInfo.first_name
end
if k == 2 then
id1 = 'tg://user?id='..v
name2 = UserInfo.first_name
end
if k == 3 then
id2 = 'tg://user?id='..v
name3 = UserInfo.first_name
end
if k == #list then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = name1, url = id}, 
},
{
{text = name2, url = id1}, 
},
{
{text = name3, url = id2}, 
},
{
{text = 'اضغط لبدء اللعبة', data = '/startjoinerolet'},
},
}
}
return edit(ChatId,Msg_id,message, 'md', true, false, reply_markup)
end
end
else
local UserInfo = bot.getUser(IdUser)
local Teext = '- ['..UserInfo.first_name..'](tg://user?id='..IdUser..')'
local xxffxx = 'عدد الاعبين : '..#list..' \nلقد انضم للروليت : \n'..Teext
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'اضغط للانضمام', data = '/joinerolet'},
},
}
}
return edit(ChatId,Msg_id,xxffxx, 'md', true, false, reply_markup)
end
else
https.request("https://api.telegram.org/bot"..Token..'/answerCallbackQuery?callback_query_id='..data.id_..'&text='..URL.escape('لقد انضممت مسبقاً')..'&show_alert=true')
end
end
if Text and Text:match('(%d+)/iktm/(%d+)') then
local GetUserReply = {Text:match('(%d+)/iktm/(%d+)')}
if tonumber(GetUserReply[2]) ~= tonumber(IdUser) then
return bot.answerCallbackQuery(data.id, "⇜ الامر ليس لك", true)
end  
local UserInfo = bot.getUser(GetUserReply[1])
local Teext = ' ['..UserInfo.first_name..'](tg://user?id='..GetUserReply[1]..')'
Redis:sadd(SILV.."Mero:SilentGroup:Group"..ChatId,GetUserReply[1]) 
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'رجوع', data = GetUserReply[1]..'/backinthar/'..GetUserReply[2]},
},
}
}
return edit(ChatId,Msg_id,Teext.."\n⇜ تم كتمه بسبب الانذارات ", 'md', true, false, reply_markup)
end
if Text and Text:match('(%d+)/iban/(%d+)') then
local GetUserReply = {Text:match('(%d+)/iban/(%d+)')}
if tonumber(GetUserReply[2]) ~= tonumber(IdUser) then
return bot.answerCallbackQuery(data.id, "⇜ الامر ليس لك", true)
end  
local UserInfo = bot.getUser(GetUserReply[1])
local Teext = ' ['..UserInfo.first_name..'](tg://user?id='..GetUserReply[1]..')'
Redis:sadd(SILV.."Mero:BanGroup:Group"..ChatId,GetUserReply[1]) 
bot.setChatMemberStatus(ChatId,GetUserReply[1],'banned',0)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'رجوع', data = GetUserReply[1]..'/backinthar/'..GetUserReply[2]},
},
}
}
return edit(ChatId,Msg_id,Teext.."\n⇜ تم حظره بسبب الانذارات ", 'md', true, false, reply_markup)
end
if Text and Text:match('(%d+)/ikick/(%d+)') then
local GetUserReply = {Text:match('(%d+)/ikick/(%d+)')}
if tonumber(GetUserReply[2]) ~= tonumber(IdUser) then
return bot.answerCallbackQuery(data.id, "⇜ الامر ليس لك", true)
end  
local UserInfo = bot.getUser(GetUserReply[1])
local Teext = ' ['..UserInfo.first_name..'](tg://user?id='..GetUserReply[1]..')'
bot.setChatMemberStatus(ChatId,GetUserReply[1],'banned',0)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'رجوع', data = GetUserReply[1]..'/backinthar/'..GetUserReply[2]},
},
}
}
return edit(ChatId,Msg_id,Teext.."\n⇜ تم طرده بسبب الانذارات ", 'md', true, false, reply_markup)
end
if Text and Text:match('(%d+)/ikide/(%d+)') then
local GetUserReply = {Text:match('(%d+)/ikide/(%d+)')}
if tonumber(GetUserReply[2]) ~= tonumber(IdUser) then
return bot.answerCallbackQuery(data.id, "⇜ الامر ليس لك", true)
end  
local UserInfo = bot.getUser(GetUserReply[1])
local Teext = ' ['..UserInfo.first_name..'](tg://user?id='..GetUserReply[1]..')'
bot.setChatMemberStatus(ChatId,GetUserReply[1],'restricted',{1,0,0,0,0,0,0,0,0})
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'رجوع', data = GetUserReply[1]..'/backinthar/'..GetUserReply[2]},
},
}
}
return edit(ChatId,Msg_id,Teext.."\n⇜ تم تقييده بسبب الانذارات ", 'md', true, false, reply_markup)
end

if Text and Text:match('(%d+)/backinthar/(%d+)') then
local GetUserReply = {Text:match('(%d+)/backinthar/(%d+)')}
if tonumber(GetUserReply[2]) ~= tonumber(IdUser) then
return bot.answerCallbackQuery(data.id, "⇜ الامر ليس لك", true)
end  
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'كتم', data = GetUserReply[1]..'/iktm/'..GetUserReply[2]},{text = 'حظر', data = GetUserReply[1]..'/iban/'..GetUserReply[2]},
},
{
{text = 'تقييد', data = GetUserReply[1]..'/ikide/'..GetUserReply[2]}, {text = 'طرد', data = GetUserReply[1]..'/ikick/'..GetUserReply[2]}, 
},
{
{text = 'تنزيل الرتب', data = GetUserReply[1]..'/iTnzelall/'..GetUserReply[2]},{text = 'رفع القيود', data = GetUserReply[1]..'/rafaall/'..GetUserReply[2]}, 
},
}
}
local UserInfo = bot.getUser(GetUserReply[1])
local Teext = ' ['..UserInfo.first_name..'](tg://user?id='..GetUserReply[1]..')'
return edit(ChatId,Msg_id,Teext.."\n⇜ الان تحكم بما يلي", 'md', true, false, reply_markup)
end
if Text and Text:match('(%d+)/iTnzelall/(%d+)') then
local GetUserReply = {Text:match('(%d+)/iTnzelall/(%d+)')}
if tonumber(GetUserReply[2]) ~= tonumber(IdUser) then
return bot.answerCallbackQuery(data.id, "⇜ الامر ليس لك", true)
end  
Redis:srem(SILV.."Mero:Distinguished:Group"..ChatId,GetUserReply[1]) 
return bot.answerCallbackQuery(data.id, "⇜ تم تنزيله من الرتب يمكنك الان ان تتحكم به ", true)
end
if Text and Text:match('(%d+)/rafaall/(%d+)') then
local GetUserReply = {Text:match('(%d+)/rafaall/(%d+)')}
if tonumber(GetUserReply[2]) ~= tonumber(IdUser) then
return bot.answerCallbackQuery(data.id, "⇜ الامر ليس لك", true)
end  
bot.setChatMemberStatus(ChatId,GetUserReply[1],'restricted',{1,1,1,1,1,1,1,1,1})
Redis:srem(SILV.."Mero:BanGroup:Group"..ChatId,GetUserReply[1]) 
Redis:srem(SILV.."Mero:SilentGroup:Group"..ChatId,GetUserReply[1]) 
return bot.answerCallbackQuery(data.id, "⇜ تم رفع القيود عنه", true)
end
if Text and Text:match('(%d+)/okiktm') then
local GetUserReply = Text:match('(%d+)/okiktm')
if tonumber(GetUserReply) == tonumber(IdUser) then
return bot.answerCallbackQuery(data.id, "⇜ لاتستطيع التصويت لنفسك", true)
end 
local UserInfo = bot.getUser(GetUserReply)
local Teext = ' ['..UserInfo.first_name..'](tg://user?id='..GetUserReply..')'
if Redis:sismember(SILV.."Mero:Num:okiktm"..ChatId, IdUser) then
return bot.answerCallbackQuery(data.id, "⇜ قمت بالتصويت مسبقاً", true)
end
Redis:sadd(SILV.."Mero:Num:okiktm"..ChatId, IdUser)  
local list = Redis:smembers(SILV.."Mero:Num:okiktm"..ChatId)
if #list >= tonumber(3) then
Redis:del(SILV.."Mero:Num:okiktm"..ChatId)
if tonumber(GetUserReply) == 5242981884 then
testser = true
elseif tonumber(GetUserReply) == 526621981884 then
testser = true
elseif The_ControllerAll(GetUserReply) == true then  
testser = true
else
testser = false
end
if testser == false then
Redis:sadd(SILV.."Mero:SilentGroup:Group"..ChatId,GetUserReply) 
end
return edit(ChatId,Msg_id,Teext.."\n⇜ تم وصول عدد الموافقين 3 وتم كتمك", 'md', true)
end
return bot.answerCallbackQuery(data.id, "⇜ تم تسجيل صوتك", true)
end
if Text and Text:match('(%d+)/noiktm') then
local GetUserReply = Text:match('(%d+)/noiktm')
if tonumber(GetUserReply) == tonumber(IdUser) then
return bot.answerCallbackQuery(data.id, "⇜ لاتستطيع التصويت لنفسك", true)
end 
local UserInfo = bot.getUser(GetUserReply)
local Teext = ' ['..UserInfo.first_name..'](tg://user?id='..GetUserReply..')'
if Redis:sismember(SILV.."Mero:Num:noiktm"..ChatId, IdUser) then
return bot.answerCallbackQuery(data.id, "⇜ قمت بالتصويت مسبقاً", true)
end
Redis:sadd(SILV.."Mero:Num:noiktm"..ChatId, IdUser)  
local list = Redis:smembers(SILV.."Mero:Num:noiktm"..ChatId)
if #list >= tonumber(3) then
Redis:del(SILV.."Mero:Num:noiktm"..ChatId)
Redis:srem(SILV.."Mero:SilentGroup:Group"..ChatId,GetUserReply) 
return edit(ChatId,Msg_id,Teext.."\n⇜ تم تركك في حال سبيلك صوتوا 3 غير موافقين تنكتم ", 'md', true)
end
return bot.answerCallbackQuery(data.id, "⇜ تم تسجيل صوتك", true)
end
if Text and Text:match('(%d+)/kanele') then
local UserId = Text:match('(%d+)/kanele')
if tonumber(IdUser) == tonumber(UserId) then
Abs = math.random(2,140);
local Text = '[🎙](t.me/'..(Redis:get(SILV..'Mero:Channel:Join') or 't.me/PST3B')
keyboard = {}
keyboard.inline_keyboard = {
{
{text = '• اغنية اخرى •', callback_data =IdUser..'/kanele'}, 
},
}

https.request("https://api.telegram.org/bot"..Token..'/sendvoice?chat_id=' .. ChatId .. '&voice=https://t.me/TEAMSUL/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id=0&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
bot.deleteMessages(ChatId,{[1]= Msg_id})
end
end
if Text and Text:match('(%d+)/rabbtuo') then
local UserId = Text:match('(%d+)/rabbtuo')
if tonumber(IdUser) == tonumber(UserId) then
Abs = math.random(2,153);
local Text = '[🔊](t.me/'..(Redis:get(SILV..'Mero:Channel:Join') or 't.me/PST3B')
keyboard = {}
keyboard.inline_keyboard = {
{
{text = '• راب اخرى •', callback_data =IdUser..'/rabbtuo'}, 
},
}
https.request("https://api.telegram.org/bot"..Token..'/sendvoice?chat_id=' .. ChatId .. '&voice=https://t.me/rderil/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id=0&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
bot.deleteMessages(ChatId,{[1]= Msg_id})
end
end
if Text and Text:match('(%d+)/kazedas') then
local UserId = Text:match('(%d+)/kazedas')
if tonumber(IdUser) == tonumber(UserId) then
Abs = math.random(2,184)
local Text = '[🖋️](t.me/'..(Redis:get(SILV..'Mero:Channel:Join') or 't.me/PST3B')
keyboard = {}
keyboard.inline_keyboard = {
{
{text = '• قصيده اخرى •', callback_data =IdUser..'/kazedas'}, 
},
}
https.request("https://api.telegram.org/bot"..Token..'/sendvoice?chat_id=' .. ChatId .. '&voice=https://t.me/shaarShahum/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id=0&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
bot.deleteMessages(ChatId,{[1]= Msg_id})
end
end
if Text and Text:match('(%d+)/iktsaratcall') then
local UserId = Text:match('(%d+)/iktsaratcall')
if tonumber(data.sender_user_id) == tonumber(UserId) then
local Teztz = {
[[
 ~ أضغـط علئ الأختصار المناسب من الأسفل .
~ لـيتم نسخهُ لكَ فوراً .
  — — — — — — — — —
`جَيتـﮧ`
`ﺣَبيبي ﯛأللۿ`
`اڪﯛلڪـﮧ`
`بَأﯛ؏`
`صَدﯛڪﮧ`
`شُڪݛأ`
`فِديتـﮧ`
`ﺄمـَشـʊ̤ .`
`ؤلـَـʊ̤ .`
`شَعلـʊ̤ .`
`مَـدرʊ̤ .`
`ﺄنڪَلعـʊ̤ .`
`نجـَبـʊ̤`
`ﺄنـَـʊ̤`
`خلـَـʊ̤`
`ﺄʊ̤`
`ﺄۈڪَـʊ̤`
`حَبيبـʊ̤`
`حَيأتـʊ̤`
`؏ُـمݛʊ̤`
`ڪَلبـʊ̤`
`بنيتَـʊ̤`
`أنجَبيـﮧ`
`تِعبتـﮧ`
`بأيـﮧَ`
`ۿوهـﮧ`
`حبَيـﮧ`
`ﺷِنـو`
`ﺷِڪو`
`ﻣَـأﺷشي`
`ﺄيـﮧَ`
`بـَـأʊ̤ .`
`ﺄحِـبڪك .`
`ﺄنجـَب .`
`ۈڪك .`
`ۈلـڪ .`
`صـݪيتـʊ̤`
`جۅ؏ـآنـۿ`
`؏ـطشِآنـۿ`
`؏ـۅفينـَـʊ̤`
`صـَـآيمـۿ`
]],
[[
~ أضغـط علئ الأختصار المناسب من الأسفل .
  — — — — — — — — —
قلبيـہٰ
ڪل
؏ــام
گـٖٖﻡﻡٰ۟ـر
ڪيكۿ
ـلاا
لافيـوۿﮧَ
لحظـهہ
شــــْكد
؏ـنديٰ
لـ؏ــد
مـتتِ
مححهۂ
مسيوۿﮧَ
ممُكنہ
نجبيہ
نورتيـہ
هـِٰاإعمـِري
ه‍ﮧلاٱ
هسهہ
ۿــم
ههلاو ᴗ̈ ،
ههههههههههههۃ
ـهههۃ
هوايہ
ڪݪخـرا 
نجَـيہ
؏ـمرჂ̤ .
ۿـا .
ـلا .
حَياتـჂ̤ .
سَـرسَحي .
ڪياتۿهۃ .
فدوۿهۃ .
حَبيبـჂ̤ .
حَبيبتـჂ̤ .
مَڪدࢪ .
حَيوانۿهۃ .
ﺂوڪيـۃ .
ۿـلو .
وَلـჂ̤ .
ههههۃ .
لَـطيف .
لَطيفهۃ .
رﯢحـيہ .
راحتـჂ̤ .
ڪݪبـيہ .
ﺂنام .
ﺂڪل .
طالـ؏ .
طالعهۃ .
مَۃ ﺂدرჂ̤ .
شَڪو ؟ .
؏َـليهۃ .
؏َـليَك .
ﺂوفـٰہ .
ﺂمـﯢ؏ .
حَبڪـٰہ .
حَبجـٰہ .
ﺂحـح .
يـﺂჂ̤ .
بـﺂჂ̤ .
نـﺂنـჂ̤ .
ﺂبـﯢﺳـہ .
ﺂڪࢪط .
ﺂ؏ـضـہ .
يَـۃ فِـدﯢا
ۿـواჂ̤ .
ساعۿۃ .
دَقيقهۃ .
لَحضهۃ .
ﺂمـوتہ .
غَصيتہ .
يـما .
قَنـﺂتـჂ̤ .
بـۅتـჂ̤ .
مݪصَقاتہ .
مُسـﺂبقهۃ .
ﺂسمـჂ̤ .
نتعَࢪفـہ ؟.
ࢪاحتـჂ̤ .
ﺂنـჂ̤ .
ﺂنتـჂ̤ .
؏ـشقيہ .
وݪيدჂ̤ .
بنَيتيہ .
طِفݪتيہ .
تَـعي .
وَݪـيہ .
موتبيڪہ .
موتبيجہ .
موتعَليڪہ .
نصعَد ؟.
صۅتَڪ .
صۅتِجہ .
ﺂبـوسـہ.
نَعَست .
ﺂجيت.
نجَبـჂ̤ .
ڪݪزَقہ .
نَـعـال .
زَࢪبـۿهۃ .
زاحفَۿهۃ .
حَڪـہ .
ﮪـہلاﯠﯠ
ههيہلآﯛﯛ
أههہـﯠﯠ
شنـيہ 
هآيـہ
يـ؏
أﯠﯠ؏
]],
[[
~ أضغـط علئ الأختصار المناسب من الأسفل .
  — — — — — — — — —
- ݪۈ 💕.
- دَزيٰۿَا 💕.
- ؏َـسَݪ 💕.
- ﺂسَابَيٰع 💕.
- ؏َـافِيهۿَ 💕.
- ﺎڪٰۅݪ 💕. 
- طَاݪعۿَہٰ 💕.
- شَۿَلوِضعٰ 💞.
- ؏ـدِڪٰم 💕.
- ؏ـيوِنَۿَا 💕.
- بَسٰݪامۿَہٰ 💕.
- ڪٰميَۿَ 💕.
- ضٰحِڪٰتِي 💕.
- مٖاݪتَيٰ 💕.
- نَعسٰانِۿَہٰ 💕.
- شٰسوِينَ 💕.
- ڪٰوِݪيٰݪۿَ 💕.
- ﺂنَتظٰݛكَ 💕.
- صٰبَݛჂ̤ 💕.
- ݛﺂيٰحَۿَ 💕.
- ﺂسِݪوٰب 💕. 
- تٰعاِݪ 💕.
- ڪٰيَوٰتِ 💕.
- ﺂدِݛჂ̤ 💕.
- ۿوَﺂيِ💕.
- ݪطَافۿہٰ 💕.
- ح٘قَيٰݛ 💕.
- ﺂغٰاِݛ 💕.
- ݪتَݛوحٰ 💕.
- شدِسٰوينَ 💕.
- ﺂݪيٰ 💕.
- ﺂݪصݛاحٰۿَہٰ 💕.
- تَغٰيِݛتٰ 💕.
- ﺂحَسنٰ 💕.
- تَافِۿَيٰنِ 💕.
- حَاݪۿہٰ 💕.
- صٰدِكَ 💕.
- ﺂسَفۿَہٰ 💕.
- زٰعݪانۿَہٰ 💕.
- مٖݛحَتٰ 💕.
- مٖلݪ 💕 . 
- ﺂڪٰتفَيٰ 💕.
- ݛخِيٰصَ 💕.
- ح٘اݛۿَ 💕.
- ڪِݪشَ 💕.
- ۿَݪاوَاتٰ 💕.
- ڪِيفيٰ 💕.
- شتٱقيتـِلكَۃ 💕. 
- تَعوٰدَتٰ 💕.
- ﺂبقِۿ 💕. 
شٰصايَݛ 💕.
- ۿَمَجٖ 💕.
- ڪِانسٰݛ 💕.
- ﺂݛتَقيٰ 💕.
- ݛسَاݪۿَہٰ 💕.
- مٖصِايٓݛ 💕.
- ﺂتَعجٓبٰ 💕.
- تخِيݪيٰ 💕.
- ﺂفٖڪَݛ 💕.
- ڪٰݛﺂمَتكٓ 💕.
- ﺂسَحٰݪ 💕.
- مٖهمِۿَہٰ 💕.
- بَغٰݛفتَيٰ 💕.
- ح٘ݛوَحٰ 💕.
- مٖݪيَتٓ 💕.
- ﺂلبَيٰتَ 💕.
- ݛجٰاݪَ 💕.
- ممَݛتبطۿَہٰ 💕.
- ﺂݛتَاحٓ 💕.
- جٖاهَݪ 💕.
- تِندَمٰ 💕.
- ﺂلَساعٰۿہٰ 💕.
- طَاحضٰكِ 💕.
- خٓݪيَكٓ 💕.
- صُباحكَہ عافِيۿہ💕. 
- ﺂتَنفسَكٰ 💕.
- ۈݪيَ 💕.
- ݛﺂيَحۿَہٰ 💕.
- ﭑبِاو؏َ 💕.
- ﺂفَݪامٰ 💕.
- ݪتَنامِہٰ 💕.
- ݛحَتٓ 💕.
- مٖشٰتاقَۿَہٰ 💕.
- نَفسيٰتيٰ 💕.
- شٰسويتٰ 💕.
- ڪَاعٰدَۿہٰ 💕.
]]
}
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• اختصارات اخرى •', data = IdUser..'/iktsaratcall'},
},
}
}
local Text_ixtda = Teztz[math.random(#Teztz)] 
edit(ChatId,Msg_id,Text_ixtda, 'md', true, false, reply_markup)
end
end


if Text and Text:match('(%d+)/wsofatcall') then
local UserId = Text:match('(%d+)/wsofatcall')
if tonumber(data.sender_user_id) == tonumber(UserId) then
local Teztz = {
[[
ـ ࢪابط كـروب ،🍭🍿.
- لـ نـِآسہ الـ ࢪاقيـةه  ،🍭🍿.
- منريـد تفاعـل و؏ـدد نبَغا حتيـت ،🍭🍿.
----
- ړابط ڪࢪوب ⁽☆₎ 💞 ،
- ݪݪناسِ ﭑݪڪياتهُۿْہ والࢪاقيةه ،💕🧸. 
- ادخخل تونس  وضحكك ،💕🧸 .
- معدنةه مشاڪݪ وي اݪڪلہ ،💕🧸 .
----
]],[[
ـ ࢪﭑبط. اسم كروب 🍇👋🏿.
ـ ڪڪࢪوب ﭑلناس ﭑلمـࢪتبةة 🍇👋🏿.
- ڪڪࢪوب يـࢪيدوڪم وياهم بل عائلةة 🍇👋🏿.
ـ تـ؏ـﭑلو ب ؏ـﭑلمنةة يـڪيوت🍇👋🏿.

- مـاڪو شـيء يوصـفنةه 🍇.
- ࢪبـع ؏ ڪد حالنةه 🍇.
- ؏ـائلةه اسم كروب. 🍇.
- اݪࢪسسمـي 🍇.
- ؏ـائلةه اسم كروب تࢪحب بڪم 🍇.

---
]],[[
ـ ࢪﭑبط. اسم كروب 🦦💘.
ـ ڪڪࢪوب ﭑلناس ﭑلمـࢪتبةة 🦦💘.
- ڪڪࢪوب يـࢪيدوڪم وياهم بل عائلةة 🦦💘.
ـ تـ؏ـﭑلو ب ؏ـﭑلمنةة يـڪيوت 🦦💘.

---
ࢪﭑبط دخول عالمنا الحَلو  عالمَ لطافهَ 🙆🏻♥️ .
للناس ﭑݪمَثٛقفة وﭑݪحَلۉۿ جـماعهَ التنقيطَ  🙆🏻♥️ .
ﭑدخݪ تونس بدون مَـﺷۭۘـاڪٰٖݪ وڪٰٖفاࢪ سَوﭑݪف جهَال ڪٰٖبل حظر 🙆🏻♥️.
]],[[
- ڪـࢪوب تبع الحاتين ♥️👋🏿.
- تـجمـ؏ صاڪين ﭑلـتلي ♥️👋🏿.
- بدون مشاڪࢦ وكانسࢪ وهاي♥️👋🏿.
- نࢪيد ناسسَ مثقفه يلا دشوو ♥️👋🏿 . 
- ࢪابط الدخول :
]],[[
- ڪـࢪوب  ﭑلڪياتةة 🍫🍬.
ـ ڪࢪوب ﭑلناس ﭑلمـࢪتبةة 🍫🍬.
-  ﭑࢪيد مدࢪاء كفو ودمنيه 🍫🍬.
ـ تـ؏ـﭑلو ب ؏ـﭑلمنةة الطيف 🍫🍬.
- ࢪابط الدخول
]],[[
- رابـط ڪٰـٍروب اسم كروب 🍟🥥.
- لـكمَ الـمقاعدَ ولـي الـمنصةَ 🍟🥥.
- قـدامـهۃ تـليڪٰـٍرام פَـبيبي 🍟🥥.
- ڪٰـٍروب اسم كروب 🍟🥥.
- ملاحظـهۃ مـنريـد مـ؏ـدان 🍟🥥.
]],[[
- ڪـروب  للناس الـلطيفـۿ ، 💞. 
- دۉنت مشاڪل وحدث ؏ـمـريـہ ، 💞. 
-  تمبلࢪ ، ومرتبين💞.

--
]],[[
: ☆ كـروب للـناس اللطيفهـ، 💘.
: ☆ دونـت مشاكـل وحـدث عمريـ 💘.
: ☆ مَـ يهمنهـ تفـاعل وعـدد 💘.
: ☆ بدونن كـانسغيااُه 💘.
]],[[
- ڪݛوب موســكـو حك ﭑلـ حَتيت 💘🦄.
- مَہ يهمنهۂ تفاﭑععہﻝ ۅعدد 💘🦄.
- ﭑههَم شي لمتناﭑه 💘🦄.
- بدوننِ ڪانسغياﭑه💘🦄.

---
]],[[

~ دونت كانـسريه وفشار 🤍🦦.
~ انزع الهوبزه و +١٨ وفوت تونس 🤍🦦.
~ اربط فيشه ونسـه العيـشه 🤍🦦. 
]]
}
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• اختصارات اخرى •', data = IdUser..'/wsofatcall'},
},
}
}
local Text_ixtda = Teztz[math.random(#Teztz)] 
edit(ChatId,Msg_id,Text_ixtda, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/asmaarb') then
local UserId = Text:match('(%d+)/asmaarb')
if tonumber(data.sender_user_id) == tonumber(UserId) then
local Teztz = {
[[
— — — — — — — — — — — —
- ؏َـثمانَ 🍇.

- ؏ـمرَ  🍇.

- ؏َـلييہَ 🍇.

- تو͡୭ما 🍇.

— — — — — — — — — — — —
]]
}
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• اسماء اخرى •', data = IdUser..'/asmaarb'},
},
}
}
local Text_ixtda = Teztz[math.random(#Teztz)] 
edit(ChatId,Msg_id,Text_ixtda, 'md', true, false, reply_markup)
end
end


if Text == "/kill_the_ant" then
local from_name = bot.getUser(IdUser).first_name
local tag = "["..from_name.."](tg://user?id="..IdUser..")"
local media ={
type = "photo",
media = "https://te.legra.ph/file/adb1c649693a9abb5cc8f.jpg",
caption = 'هو القتلها '..tag..' ',
parse_mode = "Markdown"
}
local keyboard = {}
keyboard.inline_keyboard = {
{
{text = chsourceNa, url="t.me/"..chsource}
},
}
local msg_rep = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..msg_rep.."&media="..JSON.encode(media).."&reply_markup="..JSON.encode(keyboard))
end
if Text and Text:match('(%d+)/restas') then -- البدء من جديد / أول صفحه
Redis:del(SILV.."readables"..IdUser)
local photo = "https://quran.ksu.edu.sa/png_big/1.png"
local caption = "الصفحه 1"
local readable = 0
local ratpep = readable + 1
Redis:set(SILV.."readables"..IdUser , math.floor(ratpep))
local keyboard = {} 
keyboard.inline_keyboard = {
{
{text = ' التالي ', callback_data="/nextts"},
},
{
{text = ' السابق ', callback_data="/priors"},
},
}
local msg_rep = Msg_id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id="..ChatId.."&reply_to_message_id="..msg_rep.."&photo="..photo.."&caption="..URL.escape(caption).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if Text == "/nextts" then -- التالي
readablet = Redis:get(SILV.."readables"..IdUser) or 0
if readablet == 604 then -- اخر صفحه
return false
end
local ratpep = readablet + 1
Redis:set(SILV.."readables"..IdUser , math.floor(ratpep))
local media ={
type = "photo",
media = "https://quran.ksu.edu.sa/png_big/"..math.floor(ratpep)..".png",
caption = 'الصفحه '..math.floor(ratpep)..' ',
parse_mode = "Markdown"
}
local keyboard = {}
keyboard.inline_keyboard = {
{
{text = ' التالي ', callback_data="/nextts"},
},
{
{text = ' السابق ', callback_data="/priors"},
},
}
local msg_rep = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..msg_rep.."&media="..JSON.encode(media).."&reply_markup="..JSON.encode(keyboard))
end
if Text == "/priors" then -- السابق
readablet = Redis:get(SILV.."readables"..IdUser) or 2
if readablet == 1 then
return false
end
local ratpep = readablet - 1
Redis:set(SILV.."readables"..IdUser , math.floor(ratpep))
local media ={
type = "photo",
media = "https://quran.ksu.edu.sa/png_big/"..math.floor(ratpep)..".png",
caption = 'الصفحه '..math.floor(ratpep)..' ',
parse_mode = "Markdown"
}
local keyboard = {}
keyboard.inline_keyboard = {
{
{text = ' التالي ', callback_data="/nextts"},
},
{
{text = ' السابق ', callback_data="/priors"},
},
}
local msg_rep = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..msg_rep.."&media="..JSON.encode(media).."&reply_markup="..JSON.encode(keyboard))
end
if Text and Text:match('(%d+)/estisaf') then -- استئناف
readablet = Redis:get(SILV.."readables"..IdUser) or 1
local photo = "https://quran.ksu.edu.sa/png_big/"..readablet..".png"
local caption = "الصفحه "..readablet..""
local readable = 1
local ratpep = readable + 1
Redis:set(SILV.."readables"..IdUser , math.floor(ratpep))
local keyboard = {} 
keyboard.inline_keyboard = {
{
{text = ' التالي ', callback_data="/nextts"},
},
{
{text = ' السابق ', callback_data="/priors"},
},
}
local msg_rep = Msg_id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id="..ChatId.."&reply_to_message_id="..msg_rep.."&photo="..photo.."&caption="..URL.escape(caption).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if Text and Text:match('(.*)/yes_z/(.*)') then
  local anubis = {Text:match('(.*)/yes_z/(.*)')}
  local zwga_id = anubis[1]
  local zwg_id = anubis[2]
  if tonumber(zwga_id) == tonumber(IdUser) then
    local zwga_name = bot.getUser(zwga_id).first_name
    local zwg_name = bot.getUser(zwg_id).first_name
    Redis:set(SILV..ChatId..zwga_id.."mtzwga:", zwg_id)
    Redis:set(SILV..ChatId..zwg_id.."mtzwga:", zwga_id)
    return edit(ChatId, Msg_id, "⇜ مبرووووك ياحلوة ["..zwga_name.."](tg://user?id="..zwga_id..")\n⇜ مبروك ياحلو  ["..zwg_name.."](tg://user?id="..zwg_id..")","md",false)
  end
end
if Text and Text:match('(.*)/no_z/(.*)') then
  local anubis = {Text:match('(.*)/no_z/(.*)')}
  local zwga_id = anubis[1]
  local zwg_id = anubis[2]
  if tonumber(zwga_id) == tonumber(IdUser) then
    return edit(ChatId, Msg_id, "⇜ هييه ماودك تتزوجي !","md",false)
  end
end
if Text and Text:match('(%d+)/zeng') then
  local UserId = Text:match('(%d+)/zeng')
  if tonumber(UserId) == tonumber(IdUser) then
    Redis:set(SILV..ChatId..IdUser.."zkrf:", "zeng")
    edit(ChatId, Msg_id, "𖦹 ارسل لي الكلمة لزخرفتها", "md",false)
  end
  end
  if Text and Text:match('(.*)/yes_zw/(.*)') then
  local anubis = {Text:match('(.*)/yes_zw/(.*)')}
  local zwga_id = anubis[1]
  local zwg_id = anubis[2]
  if tonumber(zwga_id) == tonumber(IdUser) then
    local zwga_name = bot.getUser(zwga_id).first_name
    local zwg_name = bot.getUser(zwg_id).first_name
    Redis:set(SILV..ChatId..zwga_id.."mtzwga:", zwg_id)
    Redis:set(SILV..ChatId..zwg_id.."mtzwga:", zwga_id)
    return edit(ChatId, Msg_id, "⇜ مبروووك يالعريس 「["..zwga_name.."](tg://user?id="..zwga_id..")」\n⇜ تم زواجك من 「["..zwg_name.."](tg://user?id="..zwg_id..")」","md",false)
  end
end
if Text and Text:match('(.*)/no_zw/(.*)') then
  local anubis = {Text:match('(.*)/no_zw/(.*)')}
  local zwga_id = anubis[1]
  local zwg_id = anubis[2]
  if tonumber(zwga_id) == tonumber(IdUser) then
    return edit(ChatId, Msg_id, "⇜ ادري منت قد المسؤلية توكل بس ","md",false)
  end
end

if Text == ('/Hgr') then
local KlamSpeed = {"🪨","📃","✂"}
local name = KlamSpeed[math.random(#KlamSpeed)]
local UserInfo = bot.getUser(IdUser)
local Teext = '['..UserInfo.first_name..'](tg://user?id='..IdUser..')'
if name == "🪨" then
return edit(ChatId,Msg_id,"\n⇜ انت : 🪨 \n⇜ انا : "..name.."\n⇜ النتيجة : تعادل", 'md')
end
if name == "✂" then
Redis:incrby(SILV.."Mero:Num:Add:Games"..ChatId..IdUser, 1)  
return edit(ChatId,Msg_id,"\n⇜ انت : 🪨 \n⇜ انا : "..name.."\n⇜ النتيجة : فزت انت "..Teext, 'md')
end
if name == "📃" then
return edit(ChatId,Msg_id,"\n⇜ انت : 🪨 \n⇜ انا : "..name.."\n⇜ النتيجة : انا ربحت ", 'md')
end
end
if Text == ('/Warka') then
local KlamSpeed = {"🪨","📃","✂"}
local name = KlamSpeed[math.random(#KlamSpeed)]
local UserInfo = bot.getUser(IdUser)
local Teext = '['..UserInfo.first_name..'](tg://user?id='..IdUser..')'
if name == "📃" then
return edit(ChatId,Msg_id,"\n⇜ انت : 📃 \n⇜ انا : "..name.."\n⇜ النتيجة : تعادل", 'md')
end
if name == "🪨" then
Redis:incrby(SILV.."Mero:Num:Add:Games"..ChatId..IdUser, 1)  
return edit(ChatId,Msg_id,"\n⇜ انت : 📃 \n⇜ انا : "..name.."\n⇜ النتيجة : فزت انت "..Teext, 'md')
end
if name == "✂" then
return edit(ChatId,Msg_id,"\n⇜ انت : 📃 \n⇜ انا : "..name.."\n⇜ النتيجة : انا ربحت ", 'md')
end
end
if Text == ('/Mukas') then
local KlamSpeed = {"🪨","📃","✂"}
local name = KlamSpeed[math.random(#KlamSpeed)]
local UserInfo = bot.getUser(IdUser)
local Teext = '['..UserInfo.first_name..'](tg://user?id='..IdUser..')'
if name == "✂" then
return edit(ChatId,Msg_id,"\n⇜ انت : ✂ \n⇜ انا : "..name.."\n⇜ النتيجة : تعادل", 'md')
end
if name == "📃" then
Redis:incrby(SILV.."Mero:Num:Add:Games"..ChatId..IdUser, 1)  
return edit(ChatId,Msg_id,"\n⇜ انت : ✂ \n⇜ انا : "..name.."\n⇜ النتيجة : فزت انت "..Teext, 'md')
end
if name == "🪨" then
return edit(ChatId,Msg_id,"\n⇜ انت : ✂ \n⇜ انا : "..name.."\n⇜ النتيجة : انا ربحت ", 'md')
end
end
----------
if Text and Text:match('(.*)/zwag_yes/(.*)/mahr/(.*)') then
local Data = {Text:match('(.*)/zwag_yes/(.*)/mahr/(.*)')}
if tonumber(Data[1]) ~= tonumber(IdUser) then
return bot.answerCallbackQuery(data.id, "شو رأيك نزوجك بدالهم ؟", true)
end
if tonumber(IdUser) == tonumber(Data[1]) then
if Redis:get(SILV.."zwag_request:"..Data[1]) then
local zwga_id = tonumber(Data[1])
local zwg_id = tonumber(Data[2])
local coniss = Data[3]
local zwg = bot.getUser(zwg_id)
local zwga = bot.getUser(zwga_id)
local zwg_tag = '['..zwg.first_name.."](tg://user?id="..zwg_id..")"
local zwga_tag = '['..zwga.first_name.."](tg://user?id="..zwga_id..")"
local hadddd = tonumber(coniss)
ballanceekk = tonumber(coniss) / 100 * 15
ballanceekkk = tonumber(coniss) - ballanceekk
local convert_mony = string.format("%.0f",ballanceekkk)
ballancee = Redis:get(SILV.."boob"..zwg_id) or 0
ballanceea = Redis:get(SILV.."boob"..zwga_id) or 0
zogtea = ballanceea + ballanceekkk
zeugh = ballancee - tonumber(coniss)
Redis:set(SILV.."boob"..zwg_id , math.floor(zeugh))
Redis:sadd(SILV.."roogg1",zwg_id)
Redis:sadd(SILV.."roogga1",zwga_id)
Redis:set(SILV.."roog1"..zwg_id,zwg_id)
Redis:set(SILV.."rooga1"..zwg_id,zwga_id)
Redis:set(SILV.."roogte1"..zwga_id,zwga_id)
Redis:set(SILV.."rahr1"..zwg_id,tonumber(coniss))
Redis:set(SILV.."rahr1"..zwga_id,tonumber(coniss))
Redis:set(SILV.."roog1"..zwga_id,zwg_id)
Redis:set(SILV.."rahrr1"..zwg_id,math.floor(ballanceekkk))
Redis:set(SILV.."rooga1"..zwga_id,zwga_id)
Redis:set(SILV.."rahrr1"..zwga_id,math.floor(ballanceekkk))
return edit(ChatId,Msg_id,"كولولولولويششش\nاليوم عقدنا قران :\n\nالزوج "..zwg_tag.." 🤵🏻\n   💗\nالزوجة "..zwga_tag.." 👰🏻‍♀️\nالمهر : "..convert_mony.." دولار بعد الضريبة 15%\nعشان تشوفون وثيقة زواجكم اكتبوا : زواجي", 'md', false)
else
return edit(ChatId,Msg_id,"انتهى الطلب وين كنتي لما طلب ايدك", 'md', false)
end
end
end
if Text and Text:match('(%d+)/zwag_no/(%d+)') then
local UserId = {Text:match('(%d+)/zwag_no/(%d+)')}
if tonumber(UserId[1]) ~= tonumber(IdUser) then
return bot.answerCallbackQuery(data.id, "شو رأيك نزوجك بدالهم ؟", true)
else
Redis:del(SILV.."zwag_request:"..UserId[1])
Redis:del(SILV.."zwag_request:"..UserId[2])
return edit(ChatId,Msg_id,"خليكي عانس ؟؟", 'md', false)
end
end
----
if Text and Text:match('(%d+)/toptop') then
local UserId = Text:match('(%d+)/toptop')
if tonumber(data.sender_user_id) == tonumber(UserId) then
if Redis:ttl(SILV.."deletbank" .. 111) >= 1036800 then
day = "13 يوم"
elseif Redis:ttl(SILV.."deletbank" .. 111) >= 950400 then
day = "12 يوم"
elseif Redis:ttl(SILV.."deletbank" .. 111) >= 864000 then
day = "11 يوم"
elseif Redis:ttl(SILV.."deletbank" .. 111) >= 777600 then
day = "10 ايام"
elseif Redis:ttl(SILV.."deletbank" .. 111) >= 691200 then
day = "9 ايام"
elseif Redis:ttl(SILV.."deletbank" .. 111) >= 604800 then
day = "8 ايام"
elseif Redis:ttl(SILV.."deletbank" .. 111) >= 518400 then
day = "7 ايام"
elseif Redis:ttl(SILV.."deletbank" .. 111) >= 432000 then
day = "6 ايام"
elseif Redis:ttl(SILV.."deletbank" .. 111) >= 345600 then
day = "5 ايام"
elseif Redis:ttl(SILV.."deletbank" .. 111) >= 259200 then
day = "4 ايام"
elseif Redis:ttl(SILV.."deletbank" .. 111) >= 172800 then
day = "3 ايام"
elseif Redis:ttl(SILV.."deletbank" .. 111) >= 86400 then
day = "يومان"
elseif Redis:ttl(SILV.."deletbank" .. 111) <= 86400 then
day = "يوم واحد"
else
day = " لم يحدد الوقت "
end
local toptop = "⇜ أهلين يا روح بوت هذي أوامري :\n⇜ اختر نوع التوب من الازرار\n\n⇜ تتصفر اللعبة بعد ↤ "..day.."\n✧"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'توب الفلوس', data = data.sender_user_id..'/topmon'},{text = 'توب الحراميه', data = data.sender_user_id..'/topzrf'},
},
{
{text = 'توب المتزوجين', data = data.sender_user_id..'/zoztee'}, {text = 'توب المتبرعين', data = data.sender_user_id..'/motbra'},
},
{
{text = 'توب النوادي', data = data.sender_user_id..'/topnade'},{text = 'توب المزارع', data = data.sender_user_id..'/mazratee'},
},
{
{text = 'توب التفاعل', data = data.sender_user_id..'/tafaillt'}, 
},
{
{text = 'اخفاء', data = data.sender_user_id..'/delAmr'}, 
},
{
{text = chsourceNa, url="t.me/"..chsource},
},
}
}
edit(ChatId,Msg_id,toptop, 'md', true, false, reply_markup)
end
end

if Text and Text:match('(%d+)/topnade') then
local UserId = Text:match('(%d+)/topnade')
if tonumber(data.sender_user_id) == tonumber(UserId) then
local bank_users = Redis:smembers(SILV.."ownernade")
if #bank_users == 0 then
return send(ChatId,Msg_id,"⇜ لا يوجد نوادي","md",true)
end
top_monyd = "⇜ توب اعلى 10 نوادي :\n\n"
mony_listd = {}
for k,v in pairs(bank_users) do
local mony = Redis:get(SILV.."nokatnade"..v) or 0
table.insert(mony_listd, {tonumber(mony) , v})
end
table.sort(mony_listd, function(a, b) return a[1] > b[1] end)
num = 1
emoji ={ 
"🥇" ,
"🥈",
"🥉",
"4)",
"5)",
"6)",
"7)",
"8)",
"9)",
"10)"
}
for k,v in pairs(mony_listd) do
if num <= 10 then
local user_name = bot.getUser(v[2]).first_name or "لا يوجد اسم"
tt =  "["..user_name.."]("..user_name..")"
tt = tt:gsub("🇾🇪️",'')
tt = tt:gsub("🇹🇳",'')
tt = tt:gsub("🇸🇾",'')
tt = tt:gsub("🇸🇩",'')
tt = tt:gsub("🇸🇦",'')
tt = tt:gsub("🇶🇦",'')
tt = tt:gsub("🇵🇸",'')
tt = tt:gsub("🇴🇲",'')
tt = tt:gsub("🇲🇦",'')
tt = tt:gsub("🇱🇾",'')
tt = tt:gsub("🇱🇧",'')
tt = tt:gsub("🇰🇼️",'')
tt = tt:gsub("🇯🇴",'')
tt = tt:gsub("🇮🇶",'')
tt = tt:gsub("🇪🇬",'')
tt = tt:gsub("🇧🇭",'')
tt = tt:gsub("🇩🇿️",'')
tt = tt:gsub("🇦🇪",'')
tt = tt:gsub("@[%a%d_]+",'')
tt = tt:gsub("#[%a%d_]+",'')
local kk = Redis:get(SILV.."lkbnade"..v[2])
kk = kk:gsub("🇾🇪️",'')
kk = kk:gsub("🇹🇳",'')
kk = kk:gsub("🇸🇾",'')
kk = kk:gsub("🇸🇩",'')
kk = kk:gsub("🇸🇦",'')
kk = kk:gsub("🇶🇦",'')
kk = kk:gsub("🇵🇸",'')
kk = kk:gsub("🇴🇲",'')
kk = kk:gsub("🇲🇦",'')
kk = kk:gsub("🇱🇾",'')
kk = kk:gsub("🇱🇧",'')
kk = kk:gsub("🇰🇼️",'')
kk = kk:gsub("🇯🇴",'')
kk = kk:gsub("🇮🇶",'')
kk = kk:gsub("🇪🇬",'')
kk = kk:gsub("🇧🇭",'')
kk = kk:gsub("🇩🇿️",'')
kk = kk:gsub("🇦🇪",'')
kk = kk:gsub("@[%a%d_]+",'')
kk = kk:gsub("#[%a%d_]+",'')
local mony = v[1]
local doltebank = Redis:get(SILV.."doltebank"..v[2]) or " "
local convert_mony = string.format("%.0f",mony)
local emo = emoji[k]
num = num + 1
gflos = string.format("%.0f", mony):reverse():gsub( "(%d%d%d)" , "%1," ):reverse():gsub("^,","")
top_monyd = top_monyd..emo.." "..gflos.."  l "..kk.." ( "..tt.." "..doltebank.." ) \n"
gg = " ━━━━━━━━━\n\n⇜ ملاحظة : اي شخص مخالف للعبة بالغش او حاط يوزر بينحظر من اللعبه وتتصفر فلوسه"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• رجوع •', data = data.sender_user_id..'/toptop'}, 
},
{
{text = chsourceNa,url="t.me/"..chsource}, 
},
}
}
edit(ChatId,Msg_id,top_monyd..gg, 'md', true, false, reply_markup)
end
end

if Text and Text:match('(%d+)/mazratee') then
local UserId = Text:match('(%d+)/mazratee')
if tonumber(data.sender_user_id) == tonumber(UserId) then
local bank_users = Redis:smembers(SILV.."ownerfram")
if #bank_users == 0 then
return send(ChatId,Msg_id,"⇜ لا يوجد مزارع","md",true)
end
top_monyd = "توب اعلى 10 مزارع :\n\n"
mony_listd = {}
for k,v in pairs(bank_users) do
local mony = Redis:get(SILV.."toplvfarm"..v) or 0
table.insert(mony_listd, {tonumber(mony) , v})
end
table.sort(mony_listd, function(a, b) return a[1] > b[1] end)
num = 1
emoji ={ 
"🥇" ,
"🥈",
"🥉",
"4)",
"5)",
"6)",
"7)",
"8)",
"9)",
"10)"
}
for k,v in pairs(mony_listd) do
if num <= 10 then
local user_name = bot.getUser(v[2]).first_name or "لا يوجد اسم"
tt =  "["..user_name.."]("..user_name..")"
tt = tt:gsub("🇾🇪️",'')
tt = tt:gsub("🇹🇳",'')
tt = tt:gsub("🇸🇾",'')
tt = tt:gsub("🇸🇩",'')
tt = tt:gsub("🇸🇦",'')
tt = tt:gsub("🇶🇦",'')
tt = tt:gsub("🇵🇸",'')
tt = tt:gsub("🇴🇲",'')
tt = tt:gsub("🇲🇦",'')
tt = tt:gsub("🇱🇾",'')
tt = tt:gsub("🇱🇧",'')
tt = tt:gsub("🇰🇼️",'')
tt = tt:gsub("🇯🇴",'')
tt = tt:gsub("🇮🇶",'')
tt = tt:gsub("🇪🇬",'')
tt = tt:gsub("🇧🇭",'')
tt = tt:gsub("🇩🇿️",'')
tt = tt:gsub("🇦🇪",'')
tt = tt:gsub("@[%a%d_]+",'')
tt = tt:gsub("#[%a%d_]+",'')
local kk = Redis:get(SILV.."namefram"..v[2])
kk = kk:gsub("🇾🇪️",'')
kk = kk:gsub("🇹🇳",'')
kk = kk:gsub("🇸🇾",'')
kk = kk:gsub("🇸🇩",'')
kk = kk:gsub("🇸🇦",'')
kk = kk:gsub("🇶🇦",'')
kk = kk:gsub("🇵🇸",'')
kk = kk:gsub("🇴🇲",'')
kk = kk:gsub("🇲🇦",'')
kk = kk:gsub("🇱🇾",'')
kk = kk:gsub("🇱🇧",'')
kk = kk:gsub("🇰🇼️",'')
kk = kk:gsub("🇯🇴",'')
kk = kk:gsub("🇮🇶",'')
kk = kk:gsub("🇪🇬",'')
kk = kk:gsub("🇧🇭",'')
kk = kk:gsub("🇩🇿️",'')
kk = kk:gsub("🇦🇪",'')
kk = kk:gsub("@[%a%d_]+",'')
kk = kk:gsub("#[%a%d_]+",'')
local doltebank = Redis:get(SILV.."doltebank"..v[2]) or " "
local mony = v[1]
local convert_mony = string.format("%.0f",mony)
local emo = emoji[k]
num = num + 1
gflos = string.format("%.0f", mony):reverse():gsub( "(%d%d%d)" , "%1," ):reverse():gsub("^,","")
top_monyd = top_monyd..emo.." "..gflos.."  l "..kk.." ( "..tt.." "..doltebank.." ) \n"
gg = " ━━━━━━━━━\n\nملاحظة : اي شخص مخالف للعبة بالغش او حاط يوزر بينحظر من اللعبه وتتصفر فلوسه"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• رجوع •', data = data.sender_user_id..'/toptop'}, 
},
{
{text = chsourceNa,url="t.me/"..chsource}, 
},
}
}
edit(ChatId,Msg_id,top_monyd..gg, 'md', true, false, reply_markup)
end
end

if Text and Text:match('(%d+)/motbra') then
local UserId = Text:match('(%d+)/motbra')
if tonumber(data.sender_user_id) == tonumber(UserId) then
  local F_Name = bot.getUser(data.sender_user_id).first_name
Redis:set(SILV..data.sender_user_id.."first_name:", F_Name)
local ban = bot.getUser(data.sender_user_id)
if ban.first_name then
news = "["..ban.first_name.."]("..ban.first_name..")"
news = news:gsub("🇾🇪️",'')
news = news:gsub("🇹🇳",'')
news = news:gsub("🇸🇾",'')
news = news:gsub("🇸🇩",'')
news = news:gsub("🇸🇦",'')
news = news:gsub("🇶🇦",'')
news = news:gsub("🇵🇸",'')
news = news:gsub("🇴🇲",'')
news = news:gsub("🇲🇦",'')
news = news:gsub("🇱🇾",'')
news = news:gsub("🇱🇧",'')
news = news:gsub("🇰🇼️",'')
news = news:gsub("🇯🇴",'')
news = news:gsub("🇮🇶",'')
news = news:gsub("🇪🇬",'')
news = news:gsub("🇧🇭",'')
news = news:gsub("🇩🇿️",'')
news = news:gsub("🇦🇪",'')
else
news = " لا يوجد"
end
ballancee = Redis:get(SILV.."tabbroat"..data.sender_user_id) or 0
local bank_users = Redis:smembers(SILV.."taza")
if #bank_users == 0 then
return send(ChatId,Msg_id,"⇜ لا يوجد حسابات في البنك","md",true)
end
top_mony = "توب اعلى 20 شخص بالتبرعات :\n\n"
tabr_list = {}
for k,v in pairs(bank_users) do
local mony = Redis:get(SILV.."tabbroat"..v)
table.insert(tabr_list, {tonumber(mony) , v})
end
table.sort(tabr_list, function(a, b) return a[1] > b[1] end)
num = 1
emoji ={ 
"🥇" ,
"🥈",
"🥉",
"4)",
"5)",
"6)",
"7)",
"8)",
"9)",
"10)",
"11)",
"12)",
"13)",
"14)",
"15)",
"16)",
"17)",
"18)",
"19)",
"20)"
}
for k,v in pairs(tabr_list) do
if num <= 20 then
local user_name = bot.getUser(v[2]).first_name or "لا يوجد اسم"
tt =  "["..user_name.."]("..user_name..")"
tt = tt:gsub("🇾🇪️",'')
tt = tt:gsub("🇹🇳",'')
tt = tt:gsub("🇸🇾",'')
tt = tt:gsub("🇸🇩",'')
tt = tt:gsub("🇸🇦",'')
tt = tt:gsub("🇶🇦",'')
tt = tt:gsub("🇵🇸",'')
tt = tt:gsub("🇴🇲",'')
tt = tt:gsub("🇲🇦",'')
tt = tt:gsub("🇱🇾",'')
tt = tt:gsub("🇱🇧",'')
tt = tt:gsub("🇰🇼️",'')
tt = tt:gsub("🇯🇴",'')
tt = tt:gsub("🇮🇶",'')
tt = tt:gsub("🇪🇬",'')
tt = tt:gsub("🇧🇭",'')
tt = tt:gsub("🇩🇿️",'')
tt = tt:gsub("🇦🇪",'')
tt = tt:gsub("@[%a%d_]+",'')
tt = tt:gsub("#[%a%d_]+",'')
local doltebank = Redis:get(SILV.."doltebank"..v[2]) or " "
local mony = v[1]
local convert_mony = string.format("%.0f",mony)
local emo = emoji[k]
num = num + 1
gflos = string.format("%.0f", mony):reverse():gsub( "(%d%d%d)" , "%1," ):reverse():gsub("^,","")
top_mony = top_mony..emo.." "..gflos.." 💵 l "..tt.." "..doltebank.." \n"
gflous = string.format("%.0f", ballancee):reverse():gsub( "(%d%d%d)" , "%1," ):reverse():gsub("^,","")
gg = " ━━━━━━━━━\n• you) "..gflous.." 💵 l "..news.." \n\nملاحظة : اي شخص مخالف للعبة بالغش او حاط يوزر بينحظر من اللعبه وتتصفر فلوسه"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• رجوع •', data = data.sender_user_id..'/toptop'}, 
},
{
{text = chsourceNa,url="t.me/"..chsource}, 
},
}
}
edit(ChatId,Msg_id,top_mony..gg, 'md', true, false, reply_markup)
end
end

if Text and Text:match('(%d+)/zoztee') then
local UserId = Text:match('(%d+)/zoztee')
if tonumber(data.sender_user_id) == tonumber(UserId) then
  local zwag_users = Redis:smembers(SILV.."roogg1")
  if #zwag_users == 0 then
  return edit(ChatId,Msg_id,"⇜ مافي زواجات حاليا","md",true)
  end
  top_zwag = "توب 30 اغلى زواجات :\n\n"
  zwag_list = {}
  for k,v in pairs(zwag_users) do
  local mahr = Redis:get(SILV.."rahr1"..v)
  local zwga = Redis:get(SILV.."rooga1"..v)
  table.insert(zwag_list, {tonumber(mahr) , v , zwga})
  end
  table.sort(zwag_list, function(a, b) return a[1] > b[1] end)
  znum = 1
  zwag_emoji ={ 
"🥇" ,
"🥈",
"🥉",
"4)",
"5)",
"6)",
"7)",
"8)",
"9)",
"10)",
"11)",
"12)",
"13)",
"14)",
"15)",
"16)",
"17)",
"18)",
"19)",
"20)",
"21)",
"22)",
"23)",
"24)",
"25)",
"26)",
"27)",
"28)",
"29)",
"30)"
  }
  for k,v in pairs(zwag_list) do
  if znum <= 30 then
  local zwg_name = bot.getUser(v[2]).first_name or "لا يوجد اسم"
  local zwga_name = bot.getUser(v[3]).first_name or Redis:get(SILV..v[3].."first_name:") or "لا يوجد اسم"
tt =  "["..zwg_name.."]("..zwg_name..")"
tt = tt:gsub("🇾🇪️",'')
tt = tt:gsub("🇹🇳",'')
tt = tt:gsub("🇸🇾",'')
tt = tt:gsub("🇸🇩",'')
tt = tt:gsub("🇸🇦",'')
tt = tt:gsub("🇶🇦",'')
tt = tt:gsub("🇵🇸",'')
tt = tt:gsub("🇴🇲",'')
tt = tt:gsub("🇲🇦",'')
tt = tt:gsub("🇱🇾",'')
tt = tt:gsub("🇱🇧",'')
tt = tt:gsub("🇰🇼️",'')
tt = tt:gsub("🇯🇴",'')
tt = tt:gsub("🇮🇶",'')
tt = tt:gsub("🇪🇬",'')
tt = tt:gsub("🇧🇭",'')
tt = tt:gsub("🇩🇿️",'')
tt = tt:gsub("🇦🇪",'')
tt = tt:gsub("@[%a%d_]+",'')
tt = tt:gsub("#[%a%d_]+",'')
kk = "["..zwga_name.."]("..zwga_name..")"
kk = kk:gsub("🇾🇪️",'')
kk = kk:gsub("🇹🇳",'')
kk = kk:gsub("🇸🇾",'')
kk = kk:gsub("🇸🇩",'')
kk = kk:gsub("🇸🇦",'')
kk = kk:gsub("🇶🇦",'')
kk = kk:gsub("🇵🇸",'')
kk = kk:gsub("🇴🇲",'')
kk = kk:gsub("🇲🇦",'')
kk = kk:gsub("🇱🇾",'')
kk = kk:gsub("🇱🇧",'')
kk = kk:gsub("🇰🇼️",'')
kk = kk:gsub("🇯🇴",'')
kk = kk:gsub("🇮🇶",'')
kk = kk:gsub("🇪🇬",'')
kk = kk:gsub("🇧🇭",'')
kk = kk:gsub("🇩🇿️",'')
kk = kk:gsub("🇦🇪",'')
kk = kk:gsub("@[%a%d_]+",'')
kk = kk:gsub("#[%a%d_]+",'')
local doltebank = Redis:get(SILV.."doltebank"..v[2]) or " "
local doltebankz = Redis:get(SILV.."doltebank"..v[3]) or " "
local mony = v[1]
local convert_mony = string.format("%.0f",mony)
local emo = zwag_emoji[k]
znum = znum + 1
gflos = string.format("%.0f", mony):reverse():gsub( "(%d%d%d)" , "%1," ):reverse():gsub("^,","")
top_zwag = top_zwag..emo.." "..gflos.." 💵 l "..tt.." "..doltebank.." 👫 "..kk.." "..doltebankz.."\n"
gg = "\n\nملاحظة : اي شخص مخالف للعبة بالغش او حاط يوزر بينحظر من اللعبه وتتصفر فلوسه"
  end
  end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• رجوع •', data = data.sender_user_id..'/toptop'}, 
},
{
{text = chsourceNa,url="t.me/"..chsource}, 
},
}
}
edit(ChatId,Msg_id,top_zwag..gg, 'md', true, false, reply_markup)
end
end

if Text and Text:match('(%d+)/topzrf') then
local UserId = Text:match('(%d+)/topzrf')
if tonumber(data.sender_user_id) == tonumber(UserId) then
local ban = bot.getUser(data.sender_user_id)
if ban.first_name then
news = "["..ban.first_name.."]("..ban.first_name..")"
news = news:gsub("🇾🇪️",'')
news = news:gsub("🇹🇳",'')
news = news:gsub("🇸🇾",'')
news = news:gsub("🇸🇩",'')
news = news:gsub("🇸🇦",'')
news = news:gsub("🇶🇦",'')
news = news:gsub("🇵🇸",'')
news = news:gsub("🇴🇲",'')
news = news:gsub("🇲🇦",'')
news = news:gsub("🇱🇾",'')
news = news:gsub("🇱🇧",'')
news = news:gsub("🇰🇼️",'')
news = news:gsub("🇯🇴",'')
news = news:gsub("🇮🇶",'')
news = news:gsub("🇪🇬",'')
news = news:gsub("🇧🇭",'')
news = news:gsub("🇩🇿️",'')
news = news:gsub("🇦🇪",'')
else
news = " لا يوجد"
end
zrfee = Redis:get(SILV.."rrfff"..data.sender_user_id) or 0
local ty_users = Redis:smembers(SILV.."rrfffid")
if #ty_users == 0 then
return send(ChatId,Msg_id,"⇜ لا يوجد احد","md",true)
end
ty_anubis = "توب 20 شخص زرفوا فلوس :\n\n"
ty_list = {}
for k,v in pairs(ty_users) do
local mony = Redis:get(SILV.."rrfff"..v)
table.insert(ty_list, {tonumber(mony) , v})
end
table.sort(ty_list, function(a, b) return a[1] > b[1] end)
num_ty = 1
emojii ={ 
"🥇" ,
"🥈",
"🥉",
"4)",
"5)",
"6)",
"7)",
"8)",
"9)",
"10)",
"11)",
"12)",
"13)",
"14)",
"15)",
"16)",
"17)",
"18)",
"19)",
"20)"
}
for k,v in pairs(ty_list) do
if num_ty <= 20 then
local user_name = bot.getUser(v[2]).first_name or "لا يوجد اسم"
tt =  "["..user_name.."]("..user_name..")"
tt = tt:gsub("🇾🇪️",'')
tt = tt:gsub("🇹🇳",'')
tt = tt:gsub("🇸🇾",'')
tt = tt:gsub("🇸🇩",'')
tt = tt:gsub("🇸🇦",'')
tt = tt:gsub("🇶🇦",'')
tt = tt:gsub("🇵🇸",'')
tt = tt:gsub("🇴🇲",'')
tt = tt:gsub("🇲🇦",'')
tt = tt:gsub("🇱🇾",'')
tt = tt:gsub("🇱🇧",'')
tt = tt:gsub("🇰🇼️",'')
tt = tt:gsub("🇯🇴",'')
tt = tt:gsub("🇮🇶",'')
tt = tt:gsub("🇪🇬",'')
tt = tt:gsub("🇧🇭",'')
tt = tt:gsub("🇩🇿️",'')
tt = tt:gsub("🇦🇪",'')
tt = tt:gsub("@[%a%d_]+",'')
tt = tt:gsub("#[%a%d_]+",'')
local doltebank = Redis:get(SILV.."doltebank"..v[2]) or " "
local mony = v[1]
local convert_mony = string.format("%.0f",mony)
local emoo = emojii[k]
num_ty = num_ty + 1
gflos = string.format("%.0f", mony):reverse():gsub( "(%d%d%d)" , "%1," ):reverse():gsub("^,","")
ty_anubis = ty_anubis..emoo.." "..gflos.." 💵 l "..tt.." "..doltebank.."\n"
gflous = string.format("%.0f", zrfee):reverse():gsub( "(%d%d%d)" , "%1," ):reverse():gsub("^,","")
gg = "\n━━━━━━━━━\n• you) "..gflous.." 💵 l "..news.." \n\nملاحظة : اي شخص مخالف للعبة بالغش او حاط يوزر بينحظر من اللعبه وتتصفر فلوسه"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• رجوع •', data = data.sender_user_id..'/toptop'}, 
},
{
{text = chsourceNa,url="t.me/"..chsource}, 
},
}
}
edit(ChatId,Msg_id,ty_anubis..gg, 'md', true, false, reply_markup)
end
end

if Text and Text:match('(%d+)/topmon') then
local UserId = Text:match('(%d+)/topmon')
if tonumber(data.sender_user_id) == tonumber(UserId) then
local F_Name = bot.getUser(data.sender_user_id).first_name
Redis:set(SILV..data.sender_user_id.."first_name:", F_Name)
local ban = bot.getUser(data.sender_user_id)
if ban.first_name then
news = "["..ban.first_name.."]("..ban.first_name..")"
news = news:gsub("🇾🇪️",'')
news = news:gsub("🇹🇳",'')
news = news:gsub("🇸🇾",'')
news = news:gsub("🇸🇩",'')
news = news:gsub("🇸🇦",'')
news = news:gsub("🇶🇦",'')
news = news:gsub("🇵🇸",'')
news = news:gsub("🇴🇲",'')
news = news:gsub("🇲🇦",'')
news = news:gsub("🇱🇾",'')
news = news:gsub("🇱🇧",'')
news = news:gsub("🇰🇼️",'')
news = news:gsub("🇯🇴",'')
news = news:gsub("🇮🇶",'')
news = news:gsub("🇪🇬",'')
news = news:gsub("🇧🇭",'')
news = news:gsub("🇩🇿️",'')
news = news:gsub("🇦🇪",'')
else
news = " لا يوجد"
end
ballancee = Redis:get(SILV.."boob"..data.sender_user_id) or 0
local bank_users = Redis:smembers(SILV.."booob")
if #bank_users == 0 then
return send(ChatId,Msg_id,"⇜ لا يوجد حسابات في البنك","md",true)
end
top_mony = "توب اغنى 20 شخص :\n\n"
mony_list = {}
for k,v in pairs(bank_users) do
local mony = Redis:get(SILV.."boob"..v)
table.insert(mony_list, {tonumber(mony) , v})
end
table.sort(mony_list, function(a, b) return a[1] > b[1] end)
num = 1
emoji ={ 
"🥇" ,
"🥈",
"🥉",
"4)",
"5)",
"6)",
"7)",
"8)",
"9)",
"10)",
"11)",
"12)",
"13)",
"14)",
"15)",
"16)",
"17)",
"18)",
"19)",
"20)"
}
for k,v in pairs(mony_list) do
if num <= 20 then
local user_name = bot.getUser(v[2]).first_name or "لا يوجد اسم"
tt =  "["..user_name.."]("..user_name..")"
tt = tt:gsub("🇾🇪️",'')
tt = tt:gsub("🇹🇳",'')
tt = tt:gsub("🇸🇾",'')
tt = tt:gsub("🇸🇩",'')
tt = tt:gsub("🇸🇦",'')
tt = tt:gsub("🇶🇦",'')
tt = tt:gsub("🇵🇸",'')
tt = tt:gsub("🇴🇲",'')
tt = tt:gsub("🇲🇦",'')
tt = tt:gsub("🇱🇾",'')
tt = tt:gsub("🇱🇧",'')
tt = tt:gsub("🇰🇼️",'')
tt = tt:gsub("🇯🇴",'')
tt = tt:gsub("🇮🇶",'')
tt = tt:gsub("🇪🇬",'')
tt = tt:gsub("🇧🇭",'')
tt = tt:gsub("🇩🇿️",'')
tt = tt:gsub("🇦🇪",'')
tt = tt:gsub("@[%a%d_]+",'')
tt = tt:gsub("#[%a%d_]+",'')
local doltebank = Redis:get(SILV.."doltebank"..v[2]) or " "
local mony = v[1]
local convert_mony = string.format("%.0f",mony)
local emo = emoji[k]
num = num + 1
gflos = string.format("%.0f", mony):reverse():gsub( "(%d%d%d)" , "%1," ):reverse():gsub("^,","")
top_mony = top_mony..emo.." "..gflos.." 💵 l "..tt.." "..doltebank.."\n"
gflous = string.format("%.0f", ballancee):reverse():gsub( "(%d%d%d)" , "%1," ):reverse():gsub("^,","")
gg = " ━━━━━━━━━\nyou ) "..gflous.." 💵 l "..news.." \n\n⇜ ملاحظة : اي شخص مخالف للعبة بالغش او حاط يوزر بينحظر من اللعبه وتتصفر فلوسه"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• رجوع •', data = data.sender_user_id..'/toptop'}, 
},
{
{text = chsourceNa,url="t.me/"..chsource}, 
},
}
}
edit(ChatId,Msg_id,top_mony..gg, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/tafaillt') then
local UserId = Text:match('(%d+)/tafaillt')
if tonumber(data.sender_user_id) == tonumber(UserId) then
Info_User = bot.getUser(UserId) 
if Info_User.type.luatele == "userTypeRegular" then
GroupAllRtba = Redis:hgetall(SILV..':GroupUserCountMsgg:'..ChatId)
GetAllNames = Redis:hgetall(SILV..':GroupNameUser:'..ChatId)
GroupAllRtbaL = {}
for k,v in pairs(GroupAllRtba) do
table.insert(GroupAllRtbaL,{v,k})
end
Count,Kount,i = 10 , 0 , 1
for _ in pairs(GroupAllRtbaL) do 
Kount = Kount + 1 
end
table.sort(GroupAllRtbaL,function(a, b)
return tonumber(a[1]) > tonumber(b[1]) end)
if Count >= Kount then
Count = Kount 
end
Text = "*⇜ أكثر "..Count.." أعضاء تفاعلاً في القروب*\n━━━━━━━━━━━━\n"
for k,v in ipairs(GroupAllRtbaL) do
if i <= Count then
if i==1 then 
t="🏆"
elseif i==2 then
t="🥈" 
elseif i==3 then
t="🥉" 
elseif i==4 then
t="🏅" 
else 
t="🎖" 
end 
Text = Text..i..") : *"..v[1].."* l  ["..(GetAllNames[v[2]] or "خطأ بالاسم").."](tg://user?id="..v[2]..") "..t.."\n"
end
i=i+1
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• رجوع •', data = data.sender_user_id..'/toptop'}, 
},
{
{text = chsourceNa,url="t.me/"..chsource}, 
},
}
}
edit(ChatId,Msg_id,Text, 'md', true, false, reply_markup)
end
end
end
if Text and Text:match('(%d+)/syria') then
local UserId = Text:match('(%d+)/syria')
if tonumber(data.sender_user_id) == tonumber(UserId) then
doltebank = "🇸🇾"
Redis:set(SILV.."doltebank"..data.sender_user_id,doltebank)
cccall = Redis:get(SILV.."boobb"..data.sender_user_id)
ccctype = Redis:get(SILV.."bbobb"..data.sender_user_id)
shakse = Redis:get(SILV.."shkse"..data.sender_user_id)
if shakse == "طيبة" then
shakseshakse = "طيبة 😇"
else
shakseshakse = "شريرة 😈"
end
msalm = "⇜ وسوينا لك حساب في بنك بوت\n⇜ وشحنالك ٥٠ دولار 💸 هديه\n\n⇜ رقم حسابك ↤ ❲ `"..cccall.."` ❳\n⇜ نوع البطاقة ↤ ❲ "..ccctype.." ❳\n⇜ فلوسك ↤ ❲ 50 ريال 💸 ❳\n⇜ شخصيتك ↤ "..shakseshakse.."\n⇜ دولتك ↤ ❲ 🇸🇾 ❳"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = chsourceNa,url="t.me/"..chsource}, 
},
}
}
edit(ChatId,Msg_id,msalm, 'md', true, false, reply_markup)
end
end
------------------------------------------------------------------------
if Text and Text:match('/CancelChannelVip:'..tonumber(IdUser)..'(.*)') then
local UserId = Text:match('/CancelChannelVip:'..tonumber(IdUser)..'(.*)')
Redis:del(SILV..'SetChannelVip'..IdUser)
Text = "⇜ تم الغاء حفظ قناتك"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text=chsourceNa,url="t.me/"..chsource}},
}}
bot.editMessageText(ChatId,msg_id,Text, 'md', true, false, reply_markup)
return false
end
if Text and Text:match('/ChangeChannelVip:'..tonumber(IdUser)..'(.*)') then
local UserId = Text:match('/ChangeChannelVip:'..tonumber(IdUser)..'(.*)')
Redis:set(SILV..'SetChannelVip'..IdUser,true)
local Text = "⇜ ارسل لي قناتك الان"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text=" الغاء ",data="/CancelChannelVip:"..IdUser}},
{{text=chsourceNa,url="t.me/"..chsource}},
}}
bot.editMessageText(ChatId,msg_id,Text, 'md', true, false, reply_markup)
return false
end
if Redis:get(SILV..'SetChannelVip'..IdUser) then 
if text =='الغاء' then 
send(msg_chat_id,msg_id, '⇜ تم الغاء حفظ قناتك ',"md",true)  
Redis:del(SILV..'SetChannelVip'..IdUser)
return false  
end 
Redis:del(SILV..'SetChannelVip'..IdUser)
Redis:set(SILV..'SOFI:Channel:Vip'..IdUser,text)
local text = "⇜ تم حفظ قناتك"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text="• تغيير قناتي •",data="/ChangeChannelVip:"..IdUser},{text="• مسح قناتي •",data="/DelChannelVip:"..IdUser}},
{{text="• اخفاء •",data="/HideChannelVip:"..IdUser}},
{{text=chsourceNa,url="t.me/"..chsource}},
}}
bot.editMessageText(ChatId,msg_id,text, 'md', true, false, reply_markup)
return false   
end
if Text and Text:match('/DelChannelVip:'..tonumber(IdUser)..'(.*)') then
local UserId = Text:match('/DelChannelVip:'..tonumber(IdUser)..'(.*)')
Redis:del(SILV..'SOFI:Channel:Vip'..IdUser)
Text = "⇜ تم حذف قناتك"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text="• وضع قناتي •",data="/ChangeChannelVip:"..IdUser}},
{{text="• اخفاء •",data="/HideChannelVip:"..IdUser}},
{{text=chsourceNa,url="t.me/"..chsource}},
}}
bot.editMessageText(ChatId,msg_id,Text, 'md', true, false, reply_markup)
return false
end
if Text and Text:match('/HideChannelVip:(.*)') then
local UserId = Text:match('/HideChannelVip:(.*)')
if tonumber(UserId) == tonumber(IdUser) then
bot.editMessageText(ChatId,msg_id,"⇜ تم اخفاء امر وضع قناتي","md",true)
else
return bot.answerCallbackQuery(data.id, "• عذراً الامر ليس لك •", true)
end
end
------------------------
if Text and Text:match('(%d+)/sudia') then
local UserId = Text:match('(%d+)/sudia')
if tonumber(data.sender_user_id) == tonumber(UserId) then
doltebank = "🇸🇦"
Redis:set(SILV.."doltebank"..data.sender_user_id,doltebank)
cccall = Redis:get(SILV.."boobb"..data.sender_user_id)
ccctype = Redis:get(SILV.."bbobb"..data.sender_user_id)
shakse = Redis:get(SILV.."shkse"..data.sender_user_id)
if shakse == "طيبة" then
shakseshakse = "طيبة 😇"
else
shakseshakse = "شريرة 😈"
end
msalm = "⇜ وسوينا لك حساب في بنك بوت\n⇜ وشحنالك ٥٠ دولار 💸 هديه\n\n⇜ رقم حسابك ↤ ❲ `"..cccall.."` ❳\n⇜ نوع البطاقة ↤ ❲ "..ccctype.." ❳\n⇜ فلوسك ↤ ❲ 50 ريال 💸 ❳\n⇜ شخصيتك ↤ "..shakseshakse.."\n⇜ دولتك ↤ ❲ 🇸🇦 ❳"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = chsourceNa,url="t.me/"..chsource}, 
},
}
}
edit(ChatId,Msg_id,msalm, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/iraqq') then
local UserId = Text:match('(%d+)/iraqq')
if tonumber(data.sender_user_id) == tonumber(UserId) then
doltebank = "🇮🇶"
Redis:set(SILV.."doltebank"..data.sender_user_id,doltebank)
cccall = Redis:get(SILV.."boobb"..data.sender_user_id)
ccctype = Redis:get(SILV.."bbobb"..data.sender_user_id)
shakse = Redis:get(SILV.."shkse"..data.sender_user_id)
if shakse == "طيبة" then
shakseshakse = "طيبة 😇"
else
shakseshakse = "شريرة 😈"
end
msalm = "⇜ وسوينا لك حساب في بنك بوت\n⇜ وشحنالك ٥٠ دولار 💸 هديه\n\n⇜ رقم حسابك ↤ ❲ `"..cccall.."` ❳\n⇜ نوع البطاقة ↤ ❲ "..ccctype.." ❳\n⇜ فلوسك ↤ ❲ 50 ريال 💸 ❳\n⇜ شخصيتك ↤ "..shakseshakse.."\n⇜ دولتك ↤ ❲ 🇮🇶 ❳"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = chsourceNa,url="t.me/"..chsource}, 
},
}
}
edit(ChatId,Msg_id,msalm, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/yemen') then
local UserId = Text:match('(%d+)/yemen')
if tonumber(data.sender_user_id) == tonumber(UserId) then
doltebank = "🇾🇪"
Redis:set(SILV.."doltebank"..data.sender_user_id,doltebank)
cccall = Redis:get(SILV.."boobb"..data.sender_user_id)
ccctype = Redis:get(SILV.."bbobb"..data.sender_user_id)
shakse = Redis:get(SILV.."shkse"..data.sender_user_id)
if shakse == "طيبة" then
shakseshakse = "طيبة 😇"
else
shakseshakse = "شريرة 😈"
end
msalm = "⇜ وسوينا لك حساب في بنك بوت\n⇜ وشحنالك ٥٠ دولار 💸 هديه\n\n⇜ رقم حسابك ↤ ❲ `"..cccall.."` ❳\n⇜ نوع البطاقة ↤ ❲ "..ccctype.." ❳\n⇜ فلوسك ↤ ❲ 50 ريال 💸 ❳\n⇜ شخصيتك ↤ "..shakseshakse.."\n⇜ دولتك ↤ ❲ 🇾🇪 ❳"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = chsourceNa,url="t.me/"..chsource}, 
},
}
}
edit(ChatId,Msg_id,msalm, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/tunsia') then
local UserId = Text:match('(%d+)/tunsia')
if tonumber(data.sender_user_id) == tonumber(UserId) then
doltebank = "🇹🇳"
Redis:set(SILV.."doltebank"..data.sender_user_id,doltebank)
cccall = Redis:get(SILV.."boobb"..data.sender_user_id)
ccctype = Redis:get(SILV.."bbobb"..data.sender_user_id)
shakse = Redis:get(SILV.."shkse"..data.sender_user_id)
if shakse == "طيبة" then
shakseshakse = "طيبة 😇"
else
shakseshakse = "شريرة 😈"
end
msalm = "⇜ وسوينا لك حساب في بنك بوت\n⇜ وشحنالك ٥٠ دولار 💸 هديه\n\n⇜ رقم حسابك ↤ ❲ `"..cccall.."` ❳\n⇜ نوع البطاقة ↤ ❲ "..ccctype.." ❳\n⇜ فلوسك ↤ ❲ 50 ريال 💸 ❳\n⇜ شخصيتك ↤ "..shakseshakse.."\n⇜ دولتك ↤ ❲ 🇹🇳 ❳"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = chsourceNa,url="t.me/"..chsource}, 
},
}
}
edit(ChatId,Msg_id,msalm, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/qatar') then
local UserId = Text:match('(%d+)/qatar')
if tonumber(data.sender_user_id) == tonumber(UserId) then
doltebank = "🇶🇦"
Redis:set(SILV.."doltebank"..data.sender_user_id,doltebank)
cccall = Redis:get(SILV.."boobb"..data.sender_user_id)
ccctype = Redis:get(SILV.."bbobb"..data.sender_user_id)
shakse = Redis:get(SILV.."shkse"..data.sender_user_id)
if shakse == "طيبة" then
shakseshakse = "طيبة 😇"
else
shakseshakse = "شريرة 😈"
end
msalm = "⇜ وسوينا لك حساب في بنك بوت\n⇜ وشحنالك ٥٠ دولار 💸 هديه\n\n⇜ رقم حسابك ↤ ❲ `"..cccall.."` ❳\n⇜ نوع البطاقة ↤ ❲ "..ccctype.." ❳\n⇜ فلوسك ↤ ❲ 50 ريال 💸 ❳\n⇜ شخصيتك ↤ "..shakseshakse.."\n⇜ دولتك ↤ ❲ 🇶🇦 ❳"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = chsourceNa,url="t.me/"..chsource}, 
},
}
}
edit(ChatId,Msg_id,msalm, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/sudan') then
local UserId = Text:match('(%d+)/sudan')
if tonumber(data.sender_user_id) == tonumber(UserId) then
doltebank = "🇸🇩"
Redis:set(SILV.."doltebank"..data.sender_user_id,doltebank)
cccall = Redis:get(SILV.."boobb"..data.sender_user_id)
ccctype = Redis:get(SILV.."bbobb"..data.sender_user_id)
shakse = Redis:get(SILV.."shkse"..data.sender_user_id)
if shakse == "طيبة" then
shakseshakse = "طيبة 😇"
else
shakseshakse = "شريرة 😈"
end
msalm = "⇜ وسوينا لك حساب في بنك بوت\n⇜ وشحنالك ٥٠ دولار 💸 هديه\n\n⇜ رقم حسابك ↤ ❲ `"..cccall.."` ❳\n⇜ نوع البطاقة ↤ ❲ "..ccctype.." ❳\n⇜ فلوسك ↤ ❲ 50 ريال 💸 ❳\n⇜ شخصيتك ↤ "..shakseshakse.."\n⇜ دولتك ↤ ❲ 🇸🇩 ❳"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = chsourceNa,url="t.me/"..chsource}, 
},
}
}
edit(ChatId,Msg_id,msalm, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/plastin') then
local UserId = Text:match('(%d+)/plastin')
if tonumber(data.sender_user_id) == tonumber(UserId) then
doltebank = "🇵🇸"
Redis:set(SILV.."doltebank"..data.sender_user_id,doltebank)
cccall = Redis:get(SILV.."boobb"..data.sender_user_id)
ccctype = Redis:get(SILV.."bbobb"..data.sender_user_id)
shakse = Redis:get(SILV.."shkse"..data.sender_user_id)
if shakse == "طيبة" then
shakseshakse = "طيبة 😇"
else
shakseshakse = "شريرة 😈"
end
msalm = "⇜ وسوينا لك حساب في بنك بوت\n⇜ وشحنالك ٥٠ دولار 💸 هديه\n\n⇜ رقم حسابك ↤ ❲ `"..cccall.."` ❳\n⇜ نوع البطاقة ↤ ❲ "..ccctype.." ❳\n⇜ فلوسك ↤ ❲ 50 ريال 💸 ❳\n⇜ شخصيتك ↤ "..shakseshakse.."\n⇜ دولتك ↤ ❲ 🇵🇸 ❳"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = chsourceNa,url="t.me/"..chsource}, 
},
}
}
edit(ChatId,Msg_id,msalm, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/moroco') then
local UserId = Text:match('(%d+)/moroco')
if tonumber(data.sender_user_id) == tonumber(UserId) then
doltebank = "🇲🇦"
Redis:set(SILV.."doltebank"..data.sender_user_id,doltebank)
cccall = Redis:get(SILV.."boobb"..data.sender_user_id)
ccctype = Redis:get(SILV.."bbobb"..data.sender_user_id)
shakse = Redis:get(SILV.."shkse"..data.sender_user_id)
if shakse == "طيبة" then
shakseshakse = "طيبة 😇"
else
shakseshakse = "شريرة 😈"
end
msalm = "⇜ وسوينا لك حساب في بنك بوت\n⇜ وشحنالك ٥٠ دولار 💸 هديه\n\n⇜ رقم حسابك ↤ ❲ `"..cccall.."` ❳\n⇜ نوع البطاقة ↤ ❲ "..ccctype.." ❳\n⇜ فلوسك ↤ ❲ 50 ريال 💸 ❳\n⇜ شخصيتك ↤ "..shakseshakse.."\n⇜ دولتك ↤ ❲ 🇲🇦 ❳"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = chsourceNa,url="t.me/"..chsource}, 
},
}
}
edit(ChatId,Msg_id,msalm, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/oman') then
local UserId = Text:match('(%d+)/oman')
if tonumber(data.sender_user_id) == tonumber(UserId) then
doltebank = "🇴🇲"
Redis:set(SILV.."doltebank"..data.sender_user_id,doltebank)
cccall = Redis:get(SILV.."boobb"..data.sender_user_id)
ccctype = Redis:get(SILV.."bbobb"..data.sender_user_id)
shakse = Redis:get(SILV.."shkse"..data.sender_user_id)
if shakse == "طيبة" then
shakseshakse = "طيبة 😇"
else
shakseshakse = "شريرة 😈"
end
msalm = "⇜ وسوينا لك حساب في بنك بوت\n⇜ وشحنالك ٥٠ دولار 💸 هديه\n\n⇜ رقم حسابك ↤ ❲ `"..cccall.."` ❳\n⇜ نوع البطاقة ↤ ❲ "..ccctype.." ❳\n⇜ فلوسك ↤ ❲ 50 ريال 💸 ❳\n⇜ شخصيتك ↤ "..shakseshakse.."\n⇜ دولتك ↤ ❲ 🇴🇲 ❳"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = chsourceNa,url="t.me/"..chsource}, 
},
}
}
edit(ChatId,Msg_id,msalm, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/libya') then
local UserId = Text:match('(%d+)/libya')
if tonumber(data.sender_user_id) == tonumber(UserId) then
doltebank = "🇱🇾"
Redis:set(SILV.."doltebank"..data.sender_user_id,doltebank)
cccall = Redis:get(SILV.."boobb"..data.sender_user_id)
ccctype = Redis:get(SILV.."bbobb"..data.sender_user_id)
shakse = Redis:get(SILV.."shkse"..data.sender_user_id)
if shakse == "طيبة" then
shakseshakse = "طيبة 😇"
else
shakseshakse = "شريرة 😈"
end
msalm = "⇜ وسوينا لك حساب في بنك بوت\n⇜ وشحنالك ٥٠ دولار 💸 هديه\n\n⇜ رقم حسابك ↤ ❲ `"..cccall.."` ❳\n⇜ نوع البطاقة ↤ ❲ "..ccctype.." ❳\n⇜ فلوسك ↤ ❲ 50 ريال 💸 ❳\n⇜ شخصيتك ↤ "..shakseshakse.."\n⇜ دولتك ↤ ❲ 🇱🇾 ❳"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = chsourceNa,url="t.me/"..chsource}, 
},
}
}
edit(ChatId,Msg_id,msalm, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/kuwit') then
local UserId = Text:match('(%d+)/kuwit')
if tonumber(data.sender_user_id) == tonumber(UserId) then
doltebank = "🇰🇼"
Redis:set(SILV.."doltebank"..data.sender_user_id,doltebank)
cccall = Redis:get(SILV.."boobb"..data.sender_user_id)
ccctype = Redis:get(SILV.."bbobb"..data.sender_user_id)
shakse = Redis:get(SILV.."shkse"..data.sender_user_id)
if shakse == "طيبة" then
shakseshakse = "طيبة 😇"
else
shakseshakse = "شريرة 😈"
end
msalm = "⇜ وسوينا لك حساب في بنك بوت\n⇜ وشحنالك ٥٠ دولار 💸 هديه\n\n⇜ رقم حسابك ↤ ❲ `"..cccall.."` ❳\n⇜ نوع البطاقة ↤ ❲ "..ccctype.." ❳\n⇜ فلوسك ↤ ❲ 50 ريال 💸 ❳\n⇜ شخصيتك ↤ "..shakseshakse.."\n⇜ دولتك ↤ ❲ 🇰🇼 ❳"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = chsourceNa,url="t.me/"..chsource}, 
},
}
}
edit(ChatId,Msg_id,msalm, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/lebanon') then
local UserId = Text:match('(%d+)/lebanon')
if tonumber(data.sender_user_id) == tonumber(UserId) then
doltebank = "🇱🇧"
Redis:set(SILV.."doltebank"..data.sender_user_id,doltebank)
cccall = Redis:get(SILV.."boobb"..data.sender_user_id)
ccctype = Redis:get(SILV.."bbobb"..data.sender_user_id)
shakse = Redis:get(SILV.."shkse"..data.sender_user_id)
if shakse == "طيبة" then
shakseshakse = "طيبة 😇"
else
shakseshakse = "شريرة 😈"
end
msalm = "⇜ وسوينا لك حساب في بنك بوت\n⇜ وشحنالك ٥٠ دولار 💸 هديه\n\n⇜ رقم حسابك ↤ ❲ `"..cccall.."` ❳\n⇜ نوع البطاقة ↤ ❲ "..ccctype.." ❳\n⇜ فلوسك ↤ ❲ 50 ريال 💸 ❳\n⇜ شخصيتك ↤ "..shakseshakse.."\n⇜ دولتك ↤ ❲ 🇱🇧 ❳"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = chsourceNa,url="t.me/"..chsource}, 
},
}
}
edit(ChatId,Msg_id,msalm, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/jordan') then
local UserId = Text:match('(%d+)/jordan')
if tonumber(data.sender_user_id) == tonumber(UserId) then
doltebank = "🇯🇴"
Redis:set(SILV.."doltebank"..data.sender_user_id,doltebank)
cccall = Redis:get(SILV.."boobb"..data.sender_user_id)
ccctype = Redis:get(SILV.."bbobb"..data.sender_user_id)
shakse = Redis:get(SILV.."shkse"..data.sender_user_id)
if shakse == "طيبة" then
shakseshakse = "طيبة 😇"
else
shakseshakse = "شريرة 😈"
end
msalm = "⇜ وسوينا لك حساب في بنك بوت\n⇜ وشحنالك ٥٠ دولار 💸 هديه\n\n⇜ رقم حسابك ↤ ❲ `"..cccall.."` ❳\n⇜ نوع البطاقة ↤ ❲ "..ccctype.." ❳\n⇜ فلوسك ↤ ❲ 50 ريال 💸 ❳\n⇜ شخصيتك ↤ "..shakseshakse.."\n⇜ دولتك ↤ ❲ 🇯🇴 ❳"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = chsourceNa,url="t.me/"..chsource}, 
},
}
}
edit(ChatId,Msg_id,msalm, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/bahren') then
local UserId = Text:match('(%d+)/bahren')
if tonumber(data.sender_user_id) == tonumber(UserId) then
doltebank = "🇧🇭"
Redis:set(SILV.."doltebank"..data.sender_user_id,doltebank)
cccall = Redis:get(SILV.."boobb"..data.sender_user_id)
ccctype = Redis:get(SILV.."bbobb"..data.sender_user_id)
shakse = Redis:get(SILV.."shkse"..data.sender_user_id)
if shakse == "طيبة" then
shakseshakse = "طيبة 😇"
else
shakseshakse = "شريرة 😈"
end
msalm = "⇜ وسوينا لك حساب في بنك بوت\n⇜ وشحنالك ٥٠ دولار 💸 هديه\n\n⇜ رقم حسابك ↤ ❲ `"..cccall.."` ❳\n⇜ نوع البطاقة ↤ ❲ "..ccctype.." ❳\n⇜ فلوسك ↤ ❲ 50 ريال 💸 ❳\n⇜ شخصيتك ↤ "..shakseshakse.."\n⇜ دولتك ↤ ❲ 🇧🇭 ❳"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = chsourceNa,url="t.me/"..chsource}, 
},
}
}
edit(ChatId,Msg_id,msalm, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/egypt') then
local UserId = Text:match('(%d+)/egypt')
if tonumber(data.sender_user_id) == tonumber(UserId) then
doltebank = "🇪🇬"
Redis:set(SILV.."doltebank"..data.sender_user_id,doltebank)
cccall = Redis:get(SILV.."boobb"..data.sender_user_id)
ccctype = Redis:get(SILV.."bbobb"..data.sender_user_id)
shakse = Redis:get(SILV.."shkse"..data.sender_user_id)
if shakse == "طيبة" then
shakseshakse = "طيبة 😇"
else
shakseshakse = "شريرة 😈"
end
msalm = "⇜ وسوينا لك حساب في بنك بوت\n⇜ وشحنالك ٥٠ دولار 💸 هديه\n\n⇜ رقم حسابك ↤ ❲ `"..cccall.."` ❳\n⇜ نوع البطاقة ↤ ❲ "..ccctype.." ❳\n⇜ فلوسك ↤ ❲ 50 ريال 💸 ❳\n⇜ شخصيتك ↤ "..shakseshakse.."\n⇜ دولتك ↤ ❲ 🇪🇬 ❳"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = chsourceNa,url="t.me/"..chsource}, 
},
}
}
edit(ChatId,Msg_id,msalm, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/algeria') then
local UserId = Text:match('(%d+)/algeria')
if tonumber(data.sender_user_id) == tonumber(UserId) then
doltebank = "🇩🇿"
Redis:set(SILV.."doltebank"..data.sender_user_id,doltebank)
cccall = Redis:get(SILV.."boobb"..data.sender_user_id)
ccctype = Redis:get(SILV.."bbobb"..data.sender_user_id)
shakse = Redis:get(SILV.."shkse"..data.sender_user_id)
if shakse == "طيبة" then
shakseshakse = "طيبة 😇"
else
shakseshakse = "شريرة 😈"
end
msalm = "⇜ وسوينا لك حساب في بنك بوت\n⇜ وشحنالك ٥٠ دولار 💸 هديه\n\n⇜ رقم حسابك ↤ ❲ `"..cccall.."` ❳\n⇜ نوع البطاقة ↤ ❲ "..ccctype.." ❳\n⇜ فلوسك ↤ ❲ 50 ريال 💸 ❳\n⇜ شخصيتك ↤ "..shakseshakse.."\n⇜ دولتك ↤ ❲ 🇩🇿 ❳"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = chsourceNa,url="t.me/"..chsource}, 
},
}
}
edit(ChatId,Msg_id,msalm, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/emarite') then
local UserId = Text:match('(%d+)/emarite')
if tonumber(data.sender_user_id) == tonumber(UserId) then
doltebank = "🇦🇪"
Redis:set(SILV.."doltebank"..data.sender_user_id,doltebank)
cccall = Redis:get(SILV.."boobb"..data.sender_user_id)
ccctype = Redis:get(SILV.."bbobb"..data.sender_user_id)
shakse = Redis:get(SILV.."shkse"..data.sender_user_id)
if shakse == "طيبة" then
shakseshakse = "طيبة 😇"
else
shakseshakse = "شريرة 😈"
end
msalm = "⇜ وسوينا لك حساب في بنك بوت\n⇜ وشحنالك ٥٠ دولار 💸 هديه\n\n⇜ رقم حسابك ↤ ❲ `"..cccall.."` ❳\n⇜ نوع البطاقة ↤ ❲ "..ccctype.." ❳\n⇜ فلوسك ↤ ❲ 50 ريال 💸 ❳\n⇜ شخصيتك ↤ "..shakseshakse.."\n⇜ دولتك ↤ ❲ 🇦🇪 ❳"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = chsourceNa,url="t.me/"..chsource}, 
},
}
}
edit(ChatId,Msg_id,msalm, 'md', true, false, reply_markup)
end
end
------------------------------------------------------------------------
if Text and Text:match('(%d+)/msalm') then
local UserId = Text:match('(%d+)/msalm')
if tonumber(data.sender_user_id) == tonumber(UserId) then
shakse = "طيبة"
Redis:set(SILV.."shkse"..data.sender_user_id,shakse)
ttshakse = '⇜ اختر دولتك'
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '🇸🇾', data = data.sender_user_id..'/syria'},{text = '🇸🇦', data = data.sender_user_id..'/sudia'},{text = '🇮🇶', data = data.sender_user_id..'/iraqq'},
},{
{text = '🇾🇪', data = data.sender_user_id..'/yemen'},{text = '🇹🇳', data = data.sender_user_id..'/tunsia'},{text = '🇶🇦', data = data.sender_user_id..'/qatar'},
},{
{text = '🇸🇩', data = data.sender_user_id..'/sudan'},{text = '🇵🇸', data = data.sender_user_id..'/plastin'},{text = '🇲🇦', data = data.sender_user_id..'/moroco'},
},{
{text = '🇴🇲', data = data.sender_user_id..'/oman'},{text = '🇱🇾', data = data.sender_user_id..'/libya'},{text = '🇰🇼', data = data.sender_user_id..'/kuwit'},
},{
{text = '🇱🇧', data = data.sender_user_id..'/lebanon'},{text = '🇯🇴', data = data.sender_user_id..'/jordan'},{text = '🇧🇭', data = data.sender_user_id..'/bahren'},
},{
{text = '🇪🇬', data = data.sender_user_id..'/egypt'},{text = '🇩🇿', data = data.sender_user_id..'/algeria'},{text = '🇦🇪', data = data.sender_user_id..'/emarite'},
},
{text = chsourceNa,url="t.me/"..chsource}, 
}
}
edit(ChatId,Msg_id,ttshakse, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/shrer') then
local UserId = Text:match('(%d+)/shrer')
if tonumber(data.sender_user_id) == tonumber(UserId) then
shakse = "شريرة"
Redis:set(SILV.."shkse"..data.sender_user_id,shakse)
ttshakse = '⇜ اختر دولتك '
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '🇸🇾', data = data.sender_user_id..'/syria'},{text = '🇸🇦', data = data.sender_user_id..'/sudia'},{text = '🇮🇶', data = data.sender_user_id..'/iraqq'},
},{
{text = '🇾🇪', data = data.sender_user_id..'/yemen'},{text = '🇹🇳', data = data.sender_user_id..'/tunsia'},{text = '🇶🇦', data = data.sender_user_id..'/qatar'},
},{
{text = '🇸🇩', data = data.sender_user_id..'/sudan'},{text = '🇵🇸', data = data.sender_user_id..'/plastin'},{text = '🇲🇦', data = data.sender_user_id..'/moroco'},
},{
{text = '🇴🇲', data = data.sender_user_id..'/oman'},{text = '🇱🇾', data = data.sender_user_id..'/libya'},{text = '🇰🇼', data = data.sender_user_id..'/kuwit'},
},{
{text = '🇱🇧', data = data.sender_user_id..'/lebanon'},{text = '🇯🇴', data = data.sender_user_id..'/jordan'},{text = '🇧🇭', data = data.sender_user_id..'/bahren'},
},{
{text = '🇪🇬', data = data.sender_user_id..'/egypt'},{text = '🇩🇿', data = data.sender_user_id..'/algeria'},{text = '🇦🇪', data = data.sender_user_id..'/emarite'},
},
{text = chsourceNa,url="t.me/"..chsource}, 
}
}
edit(ChatId,Msg_id,ttshakse, 'md', true, false, reply_markup)
end
end

if Text and Text:match('(%d+)/master') then
local UserId = Text:match('(%d+)/master')
if tonumber(data.sender_user_id) == tonumber(UserId) then
creditcc = math.random(5000000000000000,5999999999999999);
mast = "ماستر"
balas = 50
local ban = bot.getUser(data.sender_user_id)
if ban.first_name then
news = ""..ban.first_name..""
else
news = " لا يوجد"
end
local banid = data.sender_user_id
Redis:set(SILV.."bobna"..data.sender_user_id,news)
Redis:set(SILV.."boob"..data.sender_user_id,balas)
Redis:set(SILV.."boobb"..data.sender_user_id,creditcc)
Redis:set(SILV.."bbobb"..data.sender_user_id,mast)
Redis:set(SILV.."boballname"..creditcc,news)
Redis:set(SILV.."boballbalc"..creditcc,balas)
Redis:set(SILV.."boballcc"..creditcc,creditcc)
Redis:set(SILV.."boballban"..creditcc,mast)
Redis:set(SILV.."boballid"..creditcc,banid)
Redis:sadd(SILV.."booob",data.sender_user_id)
ttshakse = '⇜ اختر شخصيتك في اللعبة'
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'شخصية طيبة 😇', data = data.sender_user_id..'/msalm'},{text = 'شخصية شريرة 😈', data = data.sender_user_id..'/shrer'},
},
{text = chsourceNa,url="t.me/"..chsource}, 
}
}
edit(ChatId,Msg_id,ttshakse, 'md', true, false, reply_markup)
end
end


if Text and Text:match('(%d+)/visaa') then
local UserId = Text:match('(%d+)/visaa')
if tonumber(data.sender_user_id) == tonumber(UserId) then
creditvi = math.random(4000000000000000,4999999999999999);
visssa = "فيزا"
balas = 50
local ban = bot.getUser(data.sender_user_id)
if ban.first_name then
news = ""..ban.first_name..""
else
news = " لا يوجد"
end
local banid = data.sender_user_id
Redis:set(SILV.."bobna"..data.sender_user_id,news)
Redis:set(SILV.."boob"..data.sender_user_id,balas)
Redis:set(SILV.."boobb"..data.sender_user_id,creditvi)
Redis:set(SILV.."bbobb"..data.sender_user_id,visssa)
Redis:set(SILV.."boballname"..creditvi,news)
Redis:set(SILV.."boballbalc"..creditvi,balas)
Redis:set(SILV.."boballcc"..creditvi,creditvi)
Redis:set(SILV.."boballban"..creditvi,visssa)
Redis:set(SILV.."boballid"..creditvi,banid)
Redis:sadd(SILV.."booob",data.sender_user_id)
ttshakse = '⇜ اختر شخصيتك في اللعبة'
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'شخصية طيبة 😇', data = data.sender_user_id..'/msalm'},{text = 'شخصية شريرة 😈', data = data.sender_user_id..'/shrer'},
},
{text = chsourceNa,url="t.me/"..chsource}, 
}
}
edit(ChatId,Msg_id,ttshakse, 'md', true, false, reply_markup)
end
end

if Text and Text:match('(%d+)/express') then
local UserId = Text:match('(%d+)/express')
if tonumber(data.sender_user_id) == tonumber(UserId) then
creditex = math.random(6000000000000000,6999999999999999);
exprs = "اكسبرس"
balas = 50
local ban = bot.getUser(data.sender_user_id)
if ban.first_name then
news = ""..ban.first_name..""
else
news = " لا يوجد"
end
local banid = data.sender_user_id
Redis:set(SILV.."bobna"..data.sender_user_id,news)
Redis:set(SILV.."boob"..data.sender_user_id,balas)
Redis:set(SILV.."boobb"..data.sender_user_id,creditex)
Redis:set(SILV.."bbobb"..data.sender_user_id,exprs)
Redis:set(SILV.."boballname"..creditex,news)
Redis:set(SILV.."boballbalc"..creditex,balas)
Redis:set(SILV.."boballcc"..creditex,creditex)
Redis:set(SILV.."boballban"..creditex,exprs)
Redis:set(SILV.."boballid"..creditex,banid)
Redis:sadd(SILV.."booob",data.sender_user_id)
ttshakse = '⇜ اختر شخصيتك في اللعبة'
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'شخصية طيبة 😇', data = data.sender_user_id..'/msalm'},{text = 'شخصية شريرة 😈', data = data.sender_user_id..'/shrer'},
},
{text = chsourceNa,url="t.me/"..chsource}, 
}
}
edit(ChatId,Msg_id,ttshakse, 'md', true, false, reply_markup)
end
end

if Text and Text:match('(%d+)/sahb') then
local UserId = Text:match('(%d+)/sahb')
if tonumber(data.sender_user_id) == tonumber(UserId) then
cccall = Redis:get(SILV.."tdbelballance"..data.sender_user_id) or 0
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(cccall) then
return edit(ChatId,Msg_id, "⇜ فلوسك ماتكفي","md",true)
end
Redis:setex(SILV.."iioood" .. data.sender_user_id,920, true)
local list = {"1", "2", "3"}
local rand = list[math.random(#list)]
if rand == "1" then -- 1 con
cccallcc = tonumber(ballance) + tonumber(cccall)
Redis:set(SILV.."boob"..data.sender_user_id,cccallcc)
Redis:del(SILV.."tdbelballance"..data.sender_user_id)
local convert_mony = string.format("%.0f",cccall)
local convert_monyy = string.format("%.0f",cccallcc)
msalm = "⌯ مبروك ربحت بالسحب\n\n⇜ المبلغ : "..convert_mony.."\nرصيدك الان : `"..convert_monyy.."`\n✧"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = chsourceNa,url="t.me/"..chsource}, 
},
}
}
return edit(ChatId,Msg_id,msalm, 'md', true, false, reply_markup)
end -- 1 con
if rand == "2" then -- 2 con
Redis:del(SILV.."tdbelballance"..data.sender_user_id)
local convert_mony = string.format("%.0f",cccall)
local convert_monyy = string.format("%.0f",ballance)
msalm = "⌯ حظ اوفر ماربحت شي\n\n⇜ المبلغ : "..convert_mony.."\n⇜ رصيدك الان : `"..convert_monyy.."`\n✧"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = chsourceNa,url="t.me/"..chsource}, 
},
}
}
return edit(ChatId,Msg_id,msalm, 'md', true, false, reply_markup)
end -- 2 con
if rand == "3" then -- 3 con
cccallcc = tonumber(ballance) - tonumber(cccall)
Redis:set(SILV.."boob"..data.sender_user_id,cccallcc)
cccall = Redis:get(SILV.."tdbelballance"..data.sender_user_id)
Redis:del(SILV.."tdbelballance"..data.sender_user_id)
local convert_mony = string.format("%.0f",cccall)
local convert_monyy = string.format("%.0f",cccallcc)
msalm = "⌯ خسرت بالسحب ☹️\n\n⇜ المبلغ : "..convert_mony.."\nرصيدك الان : `"..convert_monyy.."`\n✧"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = chsourceNa,url="t.me/"..chsource}, 
},
}
}
return edit(ChatId,Msg_id,msalm, 'md', true, false, reply_markup)
end -- 3 con 
end
end
if Text and Text:match('(%d+)/4×4') then
local UserId = Text:match('(%d+)/4×4')
if tonumber(data.sender_user_id) == tonumber(UserId) then
local banid = data.sender_user_id
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(10000) then
return edit(ChatId,Msg_id, "⇜ مايمديك تشتري فلوسك ماتكفي","md",true)
end
cccallcc = tonumber(ballance) - 10000
Redis:set(SILV.."boob"..data.sender_user_id,cccallcc)
namefram = Redis:get(SILV.."namefram"..data.sender_user_id)
Redis:sadd(SILV.."farmarname", namefram)
Redis:set(SILV.."sizefram"..data.sender_user_id,50000)
Redis:sadd(SILV.."ownerfram",data.sender_user_id)
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم بناء مزرعتك 🏕\n\n⇜ اسم المزرعة : '..namefram..'\n⇜ قياس المزرعة : 4×4\n⇜ السعر : 10000 دولار 💵\n⇜ رصيدك الان : `'..convert_mony..'` دولار 💵\n✧'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/8×8') then
local UserId = Text:match('(%d+)/8×8')
if tonumber(data.sender_user_id) == tonumber(UserId) then
local banid = data.sender_user_id
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(1000000) then
return edit(ChatId,Msg_id, "⇜ مايمديك تشتري فلوسك ماتكفي","md",true)
end
cccallcc = tonumber(ballance) - 100000
Redis:set(SILV.."boob"..data.sender_user_id,cccallcc)
namefram = Redis:get(SILV.."namefram"..data.sender_user_id)
Redis:sadd(SILV.."farmarname", namefram)
Redis:set(SILV.."sizefram"..data.sender_user_id,100000)
Redis:sadd(SILV.."ownerfram",data.sender_user_id)
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم بناء مزرعتك 🏕\n\n⇜ اسم المزرعة : '..namefram..'\n⇜ قياس المزرعة : 8×8\n⇜ السعر : 100000 دولار 💵\n⇜ رصيدك الان : `'..convert_mony..'` دولار 💵\n✧'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/12×12') then
local UserId = Text:match('(%d+)/12×12')
if tonumber(data.sender_user_id) == tonumber(UserId) then
local banid = data.sender_user_id
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(1000000) then
return edit(ChatId,Msg_id, "⇜ مايمديك تشتري فلوسك ماتكفي","md",true)
end
cccallcc = tonumber(ballance) - 1000000
Redis:set(SILV.."boob"..data.sender_user_id,cccallcc)
namefram = Redis:get(SILV.."namefram"..data.sender_user_id)
Redis:sadd(SILV.."farmarname", namefram)
Redis:set(SILV.."sizefram"..data.sender_user_id,200000)
Redis:sadd(SILV.."ownerfram",data.sender_user_id)
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم بناء مزرعتك 🏕\n\n⇜ اسم المزرعة : '..namefram..'\n⇜ قياس المزرعة : 12×12\n⇜ السعر : 1000000 دولار 💵\n⇜ رصيدك الان : `'..convert_mony..'` دولار 💵\n✧'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/16×16') then
local UserId = Text:match('(%d+)/16×16')
if tonumber(data.sender_user_id) == tonumber(UserId) then
local banid = data.sender_user_id
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(5000000) then
return edit(ChatId,Msg_id, "⇜ مايمديك تشتري فلوسك ماتكفي","md",true)
end
cccallcc = tonumber(ballance) - 5000000
Redis:set(SILV.."boob"..data.sender_user_id,cccallcc)
namefram = Redis:get(SILV.."namefram"..data.sender_user_id)
Redis:sadd(SILV.."farmarname", namefram)
Redis:set(SILV.."sizefram"..data.sender_user_id,300000)
Redis:sadd(SILV.."ownerfram",data.sender_user_id)
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم بناء مزرعتك 🏕\n\n⇜ اسم المزرعة : '..namefram..'\n⇜ قياس المزرعة : 16×16\n⇜ السعر : 5000000 دولار 💵\n⇜ رصيدك الان : `'..convert_mony..'` دولار 💵\n✧'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/32×32') then
local UserId = Text:match('(%d+)/32×32')
if tonumber(data.sender_user_id) == tonumber(UserId) then
local banid = data.sender_user_id
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(10000000) then
return edit(ChatId,Msg_id, "⇜ مايمديك تشتري فلوسك ماتكفي","md",true)
end
cccallcc = tonumber(ballance) - 10000000
Redis:set(SILV.."boob"..data.sender_user_id,cccallcc)
namefram = Redis:get(SILV.."namefram"..data.sender_user_id)
Redis:sadd(SILV.."farmarname", namefram)
Redis:set(SILV.."sizefram"..data.sender_user_id,400000)
Redis:sadd(SILV.."ownerfram",data.sender_user_id)
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم بناء مزرعتك 🏕\n\n⇜ اسم المزرعة : '..namefram..'\n⇜ قياس المزرعة : 32×32\n⇜ السعر : 10000000 دولار 💵\n⇜ رصيدك الان : `'..convert_mony..'` دولار 💵\n✧'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
--------------------------------------------------------------------------------------------------------------
if Text and Text:match('(%d+)/luisyes') then
local UserId = Text:match('(%d+)/luisyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(39000) then
return edit(ChatId,Msg_id, "⇜ مايمديك تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(SILV.."mrkzplayer".."1"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز هجوم\n⇜ ابحث عن لاعب اخر\n✧","md",true)
end
cccallcc = tonumber(ballance) - 39000
Redis:set(SILV.."boob"..data.sender_user_id,cccallcc)
nameplayer = "اليس سواريز"
energyplayer = "83"
mrkzplayer = "مهاجم"
cityplayer = "🇺🇦 اوكرانيا"
Redis:set(SILV.."nameplayer".."1"..data.sender_user_id,nameplayer)
Redis:set(SILV.."energyplayer".."1"..data.sender_user_id,energyplayer)
Redis:set(SILV.."mrkzplayer".."1"..data.sender_user_id,mrkzplayer)
Redis:set(SILV.."cityplayer".."1"..data.sender_user_id,cityplayer)
Redis:set(SILV.."priceplayer".."1"..data.sender_user_id,39000)
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : بوت سواريز\n⇜ مركزه : مهاجم\n⇜ طاقة اللاعب : 83\n⇜ الجنسية : اوكرانيا 🇺🇦\n⇜ السعر : 39000 دولار 💵\n⇜ رصيدك الان : '..convert_mony..' دولار 💵\n✧'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/luisno') then
local UserId = Text:match('(%d+)/luisno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب بوت سواريز ", 'md', true)
end
end
if Text and Text:match('(%d+)/danyes') then
local UserId = Text:match('(%d+)/danyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(50000) then
return edit(ChatId,Msg_id, "⇜ مايمديك تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(SILV.."mrkzplayer".."4"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز دفاع\n⇜ ابحث عن لاعب اخر\n✧","md",true)
end
cccallcc = tonumber(ballance) - 50000
Redis:set(SILV.."boob"..data.sender_user_id,cccallcc)
nameplayer = "داني الفيش"
energyplayer = "83"
mrkzplayer = "مدافع"
cityplayer = "البرازيل 🇧🇷"
Redis:set(SILV.."nameplayer".."4"..data.sender_user_id,nameplayer)
Redis:set(SILV.."energyplayer".."4"..data.sender_user_id,energyplayer)
Redis:set(SILV.."mrkzplayer".."4"..data.sender_user_id,mrkzplayer)
Redis:set(SILV.."cityplayer".."4"..data.sender_user_id,cityplayer)
Redis:set(SILV.."priceplayer".."4"..data.sender_user_id,50000)
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : داني الفيش\n⇜ مركزه : مدافع\n⇜ طاقة اللاعب : 83\n⇜ الجنسية : البرازيل 🇧🇷\n⇜ السعر : 50000 دولار 💵\n⇜ رصيدك الان : '..convert_mony..' دولار 💵\n✧'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/danno') then
local UserId = Text:match('(%d+)/danno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب داني الفيش", 'md', true)
end
end
if Text and Text:match('(%d+)/fdnyes') then
local UserId = Text:match('(%d+)/fdnyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(70000) then
return edit(ChatId,Msg_id, "⇜ مايمديك تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(SILV.."mrkzplayer".."3"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز وسط\n⇜ ابحث عن لاعب اخر\n✧","md",true)
end
cccallcc = tonumber(ballance) - 70000
Redis:set(SILV.."boob"..data.sender_user_id,cccallcc)
nameplayer = "فيل فودن"
energyplayer = "87"
mrkzplayer = "وسط"
cityplayer = "إنجلترا 🏴󠁧󠁢󠁥󠁮󠁧󠁿 "
Redis:set(SILV.."nameplayer".."3"..data.sender_user_id,nameplayer)
Redis:set(SILV.."energyplayer".."3"..data.sender_user_id,energyplayer)
Redis:set(SILV.."mrkzplayer".."3"..data.sender_user_id,mrkzplayer)
Redis:set(SILV.."cityplayer".."3"..data.sender_user_id,cityplayer)
Redis:set(SILV.."priceplayer".."3"..data.sender_user_id,70000)
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : فيل فودن\n⇜ مركزه : وسط\n⇜ طاقة اللاعب : 87\n⇜ الجنسية : إنجلترا 🏴󠁧󠁢󠁥󠁮󠁧󠁿  \n⇜ السعر : 70000 دولار 💵\n⇜ رصيدك الان : '..convert_mony..' دولار 💵\n✧'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/fdnno') then
local UserId = Text:match('(%d+)/fdnno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب داني الفيش", 'md', true)
end
end
if Text and Text:match('(%d+)/rafyes') then
local UserId = Text:match('(%d+)/rafyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(40000) then
return edit(ChatId,Msg_id, "⇜ مايمديك تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(SILV.."mrkzplayer".."4"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز دفاع\n⇜ ابحث عن لاعب اخر\n✧","md",true)
end
cccallcc = tonumber(ballance) - 40000
Redis:set(SILV.."boob"..data.sender_user_id,cccallcc)
nameplayer = "رافيل فاران"
energyplayer = "84"
mrkzplayer = "مدافع"
cityplayer = "فرنسا 🇫🇷 "
Redis:set(SILV.."nameplayer".."4"..data.sender_user_id,nameplayer)
Redis:set(SILV.."energyplayer".."4"..data.sender_user_id,energyplayer)
Redis:set(SILV.."mrkzplayer".."4"..data.sender_user_id,mrkzplayer)
Redis:set(SILV.."cityplayer".."4"..data.sender_user_id,cityplayer)
Redis:set(SILV.."priceplayer".."4"..data.sender_user_id,40000)
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : رافيل فاران\n⇜ مركزه : وسط\n⇜ طاقة اللاعب : 84\n⇜ الجنسية : فرنسا 🇫🇷 \n⇜ السعر : 40000 دولار 💵\n⇜ رصيدك الان : '..convert_mony..' دولار 💵\n✧'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/rafno') then
local UserId = Text:match('(%d+)/rafno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب رافيل فاران", 'md', true)
end
end
if Text and Text:match('(%d+)/Kuanyes') then
local UserId = Text:match('(%d+)/Kuanyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(20000) then
return edit(ChatId,Msg_id, "⇜ مايمديك تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(SILV.."mrkzplayer".."3"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز وسط\n⇜ ابحث عن لاعب اخر\n✧","md",true)
end
cccallcc = tonumber(ballance) - 20000
Redis:set(SILV.."boob"..data.sender_user_id,cccallcc)
nameplayer = "خوان ماتا"
energyplayer = "81"
mrkzplayer = "وسط"
cityplayer = "إسبانيا 🇪🇸 "
Redis:set(SILV.."nameplayer".."3"..data.sender_user_id,nameplayer)
Redis:set(SILV.."energyplayer".."3"..data.sender_user_id,energyplayer)
Redis:set(SILV.."mrkzplayer".."3"..data.sender_user_id,mrkzplayer)
Redis:set(SILV.."cityplayer".."3"..data.sender_user_id,cityplayer)
Redis:set(SILV.."priceplayer".."3"..data.sender_user_id,20000)
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : خوان ماتا\n⇜ مركزه : وسط\n⇜ طاقة اللاعب : 81\n⇜ الجنسية : إسبانيا 🇪🇸 \n⇜ السعر : 20000 دولار 💵\n⇜ رصيدك الان : '..convert_mony..' دولار 💵\n✧'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/kuanno') then
local UserId = Text:match('(%d+)/kuanno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب خوان ماتا", 'md', true)
end
end
if Text and Text:match('(%d+)/hariyes') then
local UserId = Text:match('(%d+)/hariyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(15000) then
return edit(ChatId,Msg_id, "⇜ مايمديك تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(SILV.."mrkzplayer".."4"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز دفاع\n⇜ ابحث عن لاعب اخر\n✧","md",true)
end
cccallcc = tonumber(ballance) - 15000
Redis:set(SILV.."boob"..data.sender_user_id,cccallcc)
nameplayer = "هاري ماجواير"
energyplayer = "80"
mrkzplayer = "مدافع"
cityplayer = "إنجلترا 🏴󠁧󠁢󠁥󠁮󠁧󠁿 "
Redis:set(SILV.."nameplayer".."4"..data.sender_user_id,nameplayer)
Redis:set(SILV.."energyplayer".."4"..data.sender_user_id,energyplayer)
Redis:set(SILV.."mrkzplayer".."4"..data.sender_user_id,mrkzplayer)
Redis:set(SILV.."cityplayer".."4"..data.sender_user_id,cityplayer)
Redis:set(SILV.."priceplayer".."4"..data.sender_user_id,15000)
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : هاري ماجواير\n⇜ مركزه : مدافع\n⇜ طاقة اللاعب : 80\n⇜ الجنسية : إنجلترا 🏴󠁧󠁢󠁥󠁮󠁧󠁿 \n⇜ السعر : 15000 دولار 💵\n⇜ رصيدك الان : '..convert_mony..' دولار 💵\n✧'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/harino') then
local UserId = Text:match('(%d+)/harino')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب هاري ماجواير", 'md', true)
end
end
if Text and Text:match('(%d+)/romoyes') then
local UserId = Text:match('(%d+)/romoyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(100000) then
return edit(ChatId,Msg_id, "⇜ مايمديك تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(SILV.."mrkzplayer".."1"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز هجوم\n⇜ ابحث عن لاعب اخر\n✧","md",true)
end
cccallcc = tonumber(ballance) - 100000
Redis:set(SILV.."boob"..data.sender_user_id,cccallcc)
nameplayer = "روميلو لوكاكو"
energyplayer = "91"
mrkzplayer = "مهاجم"
cityplayer = "بلجيكا 🇧🇪 "
Redis:set(SILV.."nameplayer".."1"..data.sender_user_id,nameplayer)
Redis:set(SILV.."energyplayer".."1"..data.sender_user_id,energyplayer)
Redis:set(SILV.."mrkzplayer".."1"..data.sender_user_id,mrkzplayer)
Redis:set(SILV.."cityplayer".."1"..data.sender_user_id,cityplayer)
Redis:set(SILV.."priceplayer".."1"..data.sender_user_id,100000)
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : روميلو لوكاكو\n⇜ مركزه : مهاجم\n⇜ طاقة اللاعب : 91\n⇜ الجنسية : بلجيكا 🇧🇪 \n⇜ السعر : 100000 دولار 💵\n⇜ رصيدك الان : '..convert_mony..' دولار 💵\n✧'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/romono') then
local UserId = Text:match('(%d+)/romono')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب روميلو لوكاكو", 'md', true)
end
end
if Text and Text:match('(%d+)/tiagoyes') then
local UserId = Text:match('(%d+)/tiagoyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(20000) then
return edit(ChatId,Msg_id, "⇜ مايمديك تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(SILV.."mrkzplayer".."4"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز دفاع\n⇜ ابحث عن لاعب اخر\n✧","md",true)
end
cccallcc = tonumber(ballance) - 20000
Redis:set(SILV.."boob"..data.sender_user_id,cccallcc)
nameplayer = "تياجو سيلفا"
energyplayer = "81"
mrkzplayer = "مدافع"
cityplayer = "البرازيل 🇧🇷 "
Redis:set(SILV.."nameplayer".."4"..data.sender_user_id,nameplayer)
Redis:set(SILV.."energyplayer".."4"..data.sender_user_id,energyplayer)
Redis:set(SILV.."mrkzplayer".."4"..data.sender_user_id,mrkzplayer)
Redis:set(SILV.."cityplayer".."4"..data.sender_user_id,cityplayer)
Redis:set(SILV.."priceplayer".."4"..data.sender_user_id,20000)
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : تياجو سيلفا\n⇜ مركزه : دفاع\n⇜ طاقة اللاعب : 81\n⇜ الجنسية : البرازيل 🇧🇷 \n⇜ السعر : 20000 دولار 💵\n⇜ رصيدك الان : '..convert_mony..' دولار 💵\n✧'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/tiagono') then
local UserId = Text:match('(%d+)/tiagono')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب تياجو سيلفا", 'md', true)
end
end
if Text and Text:match('(%d+)/gerardyes') then
local UserId = Text:match('(%d+)/gerardyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(30000) then
return edit(ChatId,Msg_id, "⇜ مايمديك تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(SILV.."mrkzplayer".."4"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز دفاع\n⇜ ابحث عن لاعب اخر\n✧","md",true)
end
cccallcc = tonumber(ballance) - 30000
Redis:set(SILV.."boob"..data.sender_user_id,cccallcc)
nameplayer = "جيرارد بيكيه"
energyplayer = "83"
mrkzplayer = "مدافع"
cityplayer = "إسبانيا 🇪🇸 "
Redis:set(SILV.."nameplayer".."4"..data.sender_user_id,nameplayer)
Redis:set(SILV.."energyplayer".."4"..data.sender_user_id,energyplayer)
Redis:set(SILV.."mrkzplayer".."4"..data.sender_user_id,mrkzplayer)
Redis:set(SILV.."cityplayer".."4"..data.sender_user_id,cityplayer)
Redis:set(SILV.."priceplayer".."4"..data.sender_user_id,30000)
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : جيرارد بيكيه\n⇜ مركزه : مدافع\n⇜ طاقة اللاعب : 83\n⇜ الجنسية : إسبانيا 🇪🇸 \n⇜ السعر : 30000 دولار 💵\n⇜ رصيدك الان : '..convert_mony..' دولار 💵\n✧'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/gerardno') then
local UserId = Text:match('(%d+)/gerardno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب جيرارد بيكه", 'md', true)
end
end
if Text and Text:match('(%d+)/tyryes') then
local UserId = Text:match('(%d+)/tyryes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(110000) then
return edit(ChatId,Msg_id, "⇜ مايمديك تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(SILV.."mrkzplayer".."5"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك حارس\n⇜ ابحث عن لاعب اخر\n✧","md",true)
end
cccallcc = tonumber(ballance) - 110000
Redis:set(SILV.."boob"..data.sender_user_id,cccallcc)
nameplayer = "تير شتيجن"
energyplayer = "91"
mrkzplayer = "حارس"
cityplayer = "ألمانيا 🇩🇪 "
Redis:set(SILV.."nameplayer".."5"..data.sender_user_id,nameplayer)
Redis:set(SILV.."energyplayer".."5"..data.sender_user_id,energyplayer)
Redis:set(SILV.."mrkzplayer".."5"..data.sender_user_id,mrkzplayer)
Redis:set(SILV.."cityplayer".."5"..data.sender_user_id,cityplayer)
Redis:set(SILV.."priceplayer".."5"..data.sender_user_id,110000)
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : تير شتيجن\n⇜ مركزه : حارس\n⇜ طاقة اللاعب : 91\n⇜ الجنسية : ألمانيا 🇩🇪 \n⇜ السعر : 110000 دولار 💵\n⇜ رصيدك الان : '..convert_mony..' دولار 💵\n✧'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/tyrno') then
local UserId = Text:match('(%d+)/tyrno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب تير شتيجن", 'md', true)
end
end
if Text and Text:match('(%d+)/osmanyes') then
local UserId = Text:match('(%d+)/osmanyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(45000) then
return edit(ChatId,Msg_id, "⇜ مايمديك تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(SILV.."mrkzplayer".."2"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز جناح\n⇜ ابحث عن لاعب اخر\n✧","md",true)
end
cccallcc = tonumber(ballance) - 45000
Redis:set(SILV.."boob"..data.sender_user_id,cccallcc)
nameplayer = "عثمان ديمبلي"
energyplayer = "84"
mrkzplayer = "جناح"
cityplayer = "فرنسا 🇫🇷 "
Redis:set(SILV.."nameplayer".."2"..data.sender_user_id,nameplayer)
Redis:set(SILV.."energyplayer".."2"..data.sender_user_id,energyplayer)
Redis:set(SILV.."mrkzplayer".."2"..data.sender_user_id,mrkzplayer)
Redis:set(SILV.."cityplayer".."2"..data.sender_user_id,cityplayer)
Redis:set(SILV.."priceplayer".."2"..data.sender_user_id,45000)
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : عثمان ديمبلي\n⇜ مركزه : جناح\n⇜ طاقة اللاعب : 84\n⇜ الجنسية : فرنسا 🇫🇷 \n⇜ السعر : 45000 دولار 💵\n⇜ رصيدك الان : '..convert_mony..' دولار 💵\n✧'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/osmanno') then
local UserId = Text:match('(%d+)/osmanno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب عثمان ديمبلي", 'md', true)
end
end
if Text and Text:match('(%d+)/rodrigoyes') then
local UserId = Text:match('(%d+)/rodrigoyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(78000) then
return edit(ChatId,Msg_id, "⇜ مايمديك تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(SILV.."mrkzplayer".."2"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز جناح\n⇜ ابحث عن لاعب اخر\n✧","md",true)
end
cccallcc = tonumber(ballance) - 78000
Redis:set(SILV.."boob"..data.sender_user_id,cccallcc)
nameplayer = "رودريغو"
energyplayer = "87"
mrkzplayer = "جناح"
cityplayer = "البرازيل 🇧🇷 "
Redis:set(SILV.."nameplayer".."2"..data.sender_user_id,nameplayer)
Redis:set(SILV.."energyplayer".."2"..data.sender_user_id,energyplayer)
Redis:set(SILV.."mrkzplayer".."2"..data.sender_user_id,mrkzplayer)
Redis:set(SILV.."cityplayer".."2"..data.sender_user_id,cityplayer)
Redis:set(SILV.."priceplayer".."2"..data.sender_user_id,78000)
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : رودريغو\n⇜ مركزه : جناح\n⇜ طاقة اللاعب : 87\n⇜ الجنسية : البرازيل 🇧🇷\n⇜ السعر : 78000 دولار 💵\n⇜ رصيدك الان : '..convert_mony..' دولار 💵\n✧'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/rodrigono') then
local UserId = Text:match('(%d+)/rodrigono')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب رودريغو", 'md', true)
end
end
if Text and Text:match('(%d+)/milyes') then
local UserId = Text:match('(%d+)/milyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(65000) then
return edit(ChatId,Msg_id, "⇜ مايمديك تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(SILV.."mrkzplayer".."4"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز دفاع\n⇜ ابحث عن لاعب اخر\n✧","md",true)
end
cccallcc = tonumber(ballance) - 65000
Redis:set(SILV.."boob"..data.sender_user_id,cccallcc)
nameplayer = "ميليتاو"
energyplayer = "87"
mrkzplayer = "مدافع"
cityplayer = "البرازيل 🇧🇷 "
Redis:set(SILV.."nameplayer".."4"..data.sender_user_id,nameplayer)
Redis:set(SILV.."energyplayer".."4"..data.sender_user_id,energyplayer)
Redis:set(SILV.."mrkzplayer".."4"..data.sender_user_id,mrkzplayer)
Redis:set(SILV.."cityplayer".."4"..data.sender_user_id,cityplayer)
Redis:set(SILV.."priceplayer".."4"..data.sender_user_id,65000)
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : ميليتاو\n⇜ مركزه : مدافع\n⇜ طاقة اللاعب : 87\n⇜ الجنسية : البرازيل 🇧🇷\n⇜ السعر : 65000 دولار 💵\n⇜ رصيدك الان : '..convert_mony..' دولار 💵\n✧'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/milno') then
local UserId = Text:match('(%d+)/milno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب ميليتاو", 'md', true)
end
end
if Text and Text:match('(%d+)/albayes') then
local UserId = Text:match('(%d+)/albayes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(73000) then
return edit(ChatId,Msg_id, "⇜ مايمديك تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(SILV.."mrkzplayer".."4"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز دفاع\n⇜ ابحث عن لاعب اخر\n✧","md",true)
end
cccallcc = tonumber(ballance) - 73000
Redis:set(SILV.."boob"..data.sender_user_id,cccallcc)
nameplayer = "الابا"
energyplayer = "87"
mrkzplayer = "مدافع"
cityplayer = "النمسا 🇦🇹 "
Redis:set(SILV.."nameplayer".."4"..data.sender_user_id,nameplayer)
Redis:set(SILV.."energyplayer".."4"..data.sender_user_id,energyplayer)
Redis:set(SILV.."mrkzplayer".."4"..data.sender_user_id,mrkzplayer)
Redis:set(SILV.."cityplayer".."4"..data.sender_user_id,cityplayer)
Redis:set(SILV.."priceplayer".."4"..data.sender_user_id,73000)
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : الابا\n⇜ مركزه : مدافع\n⇜ طاقة اللاعب : 87\n⇜ الجنسية : النمسا 🇦🇹 \n⇜ السعر : 73000 دولار 💵\n⇜ رصيدك الان : '..convert_mony..' دولار 💵\n✧'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/albano') then
local UserId = Text:match('(%d+)/albano')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب الابا", 'md', true)
end
end
if Text and Text:match('(%d+)/fenesyes') then
local UserId = Text:match('(%d+)/fenesyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(180000) then
return edit(ChatId,Msg_id, "⇜ مايمديك تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(SILV.."mrkzplayer".."2"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز جناح\n⇜ ابحث عن لاعب اخر\n✧","md",true)
end
cccallcc = tonumber(ballance) - 180000
Redis:set(SILV.."boob"..data.sender_user_id,cccallcc)
nameplayer = "فينيسيوس"
energyplayer = "94"
mrkzplayer = "جناح"
cityplayer = "البرازيل 🇧🇷 "
Redis:set(SILV.."nameplayer".."2"..data.sender_user_id,nameplayer)
Redis:set(SILV.."energyplayer".."2"..data.sender_user_id,energyplayer)
Redis:set(SILV.."mrkzplayer".."2"..data.sender_user_id,mrkzplayer)
Redis:set(SILV.."cityplayer".."2"..data.sender_user_id,cityplayer)
Redis:set(SILV.."priceplayer".."2"..data.sender_user_id,180000)
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : فينيسيوس \n⇜ مركزه : جناح\n⇜ طاقة اللاعب : 94\n⇜ الجنسية : البرازيل 🇧🇷 \n⇜ السعر : 180000 دولار 💵\n⇜ رصيدك الان : '..convert_mony..' دولار 💵\n✧'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/fenesno') then
local UserId = Text:match('(%d+)/fenesno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب فينيسيوس ", 'md', true)
end
end
if Text and Text:match('(%d+)/demayes') then
local UserId = Text:match('(%d+)/demayes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(55000) then
return edit(ChatId,Msg_id, "⇜ مايمديك تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(SILV.."mrkzplayer".."2"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز جناح\n⇜ ابحث عن لاعب اخر\n✧","md",true)
end
cccallcc = tonumber(ballance) - 55000
Redis:set(SILV.."boob"..data.sender_user_id,cccallcc)
nameplayer = "دي ماريا"
energyplayer = "85"
mrkzplayer = "جناح"
cityplayer = "الأرجنتين 🇦🇷 "
Redis:set(SILV.."nameplayer".."2"..data.sender_user_id,nameplayer)
Redis:set(SILV.."energyplayer".."2"..data.sender_user_id,energyplayer)
Redis:set(SILV.."mrkzplayer".."2"..data.sender_user_id,mrkzplayer)
Redis:set(SILV.."cityplayer".."2"..data.sender_user_id,cityplayer)
Redis:set(SILV.."priceplayer".."2"..data.sender_user_id,55000)
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : دي ماريا \n⇜ مركزه : جناح\n⇜ طاقة اللاعب : 85\n⇜ الجنسية : الأرجنتين 🇦🇷 \n⇜ السعر : 55000 دولار 💵\n⇜ رصيدك الان : '..convert_mony..' دولار 💵\n✧'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/demano') then
local UserId = Text:match('(%d+)/demano')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب دي ماريا ", 'md', true)
end
end
if Text and Text:match('(%d+)/danilyes') then
local UserId = Text:match('(%d+)/danilyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(20000) then
return edit(ChatId,Msg_id, "⇜ مايمديك تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(SILV.."mrkzplayer".."4"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز دفاع\n⇜ ابحث عن لاعب اخر\n✧","md",true)
end
cccallcc = tonumber(ballance) - 20000
Redis:set(SILV.."boob"..data.sender_user_id,cccallcc)
nameplayer = "دانيلو"
energyplayer = "84"
mrkzplayer = "مدافع"
cityplayer = "البرازيل 🇧🇷 "
Redis:set(SILV.."nameplayer".."4"..data.sender_user_id,nameplayer)
Redis:set(SILV.."energyplayer".."4"..data.sender_user_id,energyplayer)
Redis:set(SILV.."mrkzplayer".."4"..data.sender_user_id,mrkzplayer)
Redis:set(SILV.."cityplayer".."4"..data.sender_user_id,cityplayer)
Redis:set(SILV.."priceplayer".."4"..data.sender_user_id,20000)
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : دانيلو \n⇜ مركزه : مدافع\n⇜ طاقة اللاعب : 82\n⇜ الجنسية : البرازيل 🇧🇷 \n⇜ السعر : 20000 دولار 💵\n⇜ رصيدك الان : '..convert_mony..' دولار 💵\n✧'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/danilno') then
local UserId = Text:match('(%d+)/danilno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب دانيلو ", 'md', true)
end
end
if Text and Text:match('(%d+)/daneleyes') then
local UserId = Text:match('(%d+)/daneleyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(38000) then
return edit(ChatId,Msg_id, "⇜ مايمديك تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(SILV.."mrkzplayer".."4"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز دفاع\n⇜ ابحث عن لاعب اخر\n✧","md",true)
end
cccallcc = tonumber(ballance) - 38000
Redis:set(SILV.."boob"..data.sender_user_id,cccallcc)
nameplayer = "دانييلي"
energyplayer = "84"
mrkzplayer = "مدافع"
cityplayer = "إيطاليا 🇮🇹 "
Redis:set(SILV.."nameplayer".."4"..data.sender_user_id,nameplayer)
Redis:set(SILV.."energyplayer".."4"..data.sender_user_id,energyplayer)
Redis:set(SILV.."mrkzplayer".."4"..data.sender_user_id,mrkzplayer)
Redis:set(SILV.."cityplayer".."4"..data.sender_user_id,cityplayer)
Redis:set(SILV.."priceplayer".."4"..data.sender_user_id,38000)
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : دانييلي \n⇜ مركزه : مدافع\n⇜ طاقة اللاعب : 84\n⇜ الجنسية : إيطاليا 🇮🇹 \n⇜ السعر : 38000 دولار 💵\n⇜ رصيدك الان : '..convert_mony..' دولار 💵\n✧'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/daneleno') then
local UserId = Text:match('(%d+)/daneleno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب دانييلي ", 'md', true)
end
end
if Text and Text:match('(%d+)/ibrahyes') then
local UserId = Text:match('(%d+)/ibrahyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(55000) then
return edit(ChatId,Msg_id, "⇜ مايمديك تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(SILV.."mrkzplayer".."1"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز هجوم\n⇜ ابحث عن لاعب اخر\n✧","md",true)
end
cccallcc = tonumber(ballance) - 55000
Redis:set(SILV.."boob"..data.sender_user_id,cccallcc)
nameplayer = "إبراهيموفيتش"
energyplayer = "85"
mrkzplayer = "مهاجم"
cityplayer = "السويد 🇸🇪 "
Redis:set(SILV.."nameplayer".."1"..data.sender_user_id,nameplayer)
Redis:set(SILV.."energyplayer".."1"..data.sender_user_id,energyplayer)
Redis:set(SILV.."mrkzplayer".."1"..data.sender_user_id,mrkzplayer)
Redis:set(SILV.."cityplayer".."1"..data.sender_user_id,cityplayer)
Redis:set(SILV.."priceplayer".."1"..data.sender_user_id,55000)
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : إبراهيموفيتش \n⇜ مركزه : مهاجم\n⇜ طاقة اللاعب : 85\n⇜ الجنسية : السويد 🇸🇪 \n⇜ السعر : 55000 دولار 💵\n⇜ رصيدك الان : '..convert_mony..' دولار 💵\n✧'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/ibrahno') then
local UserId = Text:match('(%d+)/ibrahno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب إبراهيموفيتش", 'md', true)
end
end
if Text and Text:match('(%d+)/donaryes') then
local UserId = Text:match('(%d+)/donaryes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(99000) then
return edit(ChatId,Msg_id, "⇜ مايمديك تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(SILV.."mrkzplayer".."5"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك حارس\n⇜ ابحث عن لاعب اخر\n✧","md",true)
end
cccallcc = tonumber(ballance) - 99000
Redis:set(SILV.."boob"..data.sender_user_id,cccallcc)
nameplayer = "دوناروما"
energyplayer = "89"
mrkzplayer = "حارس"
cityplayer = "إيطاليا 🇮🇹 "
Redis:set(SILV.."nameplayer".."5"..data.sender_user_id,nameplayer)
Redis:set(SILV.."energyplayer".."5"..data.sender_user_id,energyplayer)
Redis:set(SILV.."mrkzplayer".."5"..data.sender_user_id,mrkzplayer)
Redis:set(SILV.."cityplayer".."5"..data.sender_user_id,cityplayer)
Redis:set(SILV.."priceplayer".."5"..data.sender_user_id,99000)
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : دوناروما \n⇜ مركزه : حارس\n⇜ طاقة اللاعب : 89\n⇜ الجنسية : إيطاليا 🇮🇹 \n⇜ السعر : 99000 دولار 💵\n⇜ رصيدك الان : '..convert_mony..' دولار 💵\n✧'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/donarno') then
local UserId = Text:match('(%d+)/donarno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب دوناروما ", 'md', true)
end
end
if Text and Text:match('(%d+)/ashrfyes') then
local UserId = Text:match('(%d+)/ashrfyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(55000) then
return edit(ChatId,Msg_id, "⇜ مايمديك تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(SILV.."mrkzplayer".."4"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز دفاع\n⇜ ابحث عن لاعب اخر\n✧","md",true)
end
cccallcc = tonumber(ballance) - 55000
Redis:set(SILV.."boob"..data.sender_user_id,cccallcc)
nameplayer = "اشرف حكيمي"
energyplayer = "85"
mrkzplayer = "مدافع"
cityplayer = "المغرب 🇲🇦 "
Redis:set(SILV.."nameplayer".."4"..data.sender_user_id,nameplayer)
Redis:set(SILV.."energyplayer".."4"..data.sender_user_id,energyplayer)
Redis:set(SILV.."mrkzplayer".."4"..data.sender_user_id,mrkzplayer)
Redis:set(SILV.."cityplayer".."4"..data.sender_user_id,cityplayer)
Redis:set(SILV.."priceplayer".."4"..data.sender_user_id,55000)
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : اشرف حكيمي \n⇜ مركزه : مدافع\n⇜ طاقة اللاعب : 85\n⇜ الجنسية : المغرب 🇲🇦 \n⇜ السعر : 55000 دولار 💵\n⇜ رصيدك الان : '..convert_mony..' دولار 💵\n✧'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/ashrfno') then
local UserId = Text:match('(%d+)/ashrfno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب اشرف حكيمي ", 'md', true)
end
end
if Text and Text:match('(%d+)/idenyes') then
local UserId = Text:match('(%d+)/idenyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(59000) then
return edit(ChatId,Msg_id, "⇜ مايمديك تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(SILV.."mrkzplayer".."2"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز جناح\n⇜ ابحث عن لاعب اخر\n✧","md",true)
end
cccallcc = tonumber(ballance) - 59000
Redis:set(SILV.."boob"..data.sender_user_id,cccallcc)
nameplayer = "ايدن ازارد"
energyplayer = "86"
mrkzplayer = "جناح"
cityplayer = "بلجيكا 🇧🇪 "
Redis:set(SILV.."nameplayer".."2"..data.sender_user_id,nameplayer)
Redis:set(SILV.."energyplayer".."2"..data.sender_user_id,energyplayer)
Redis:set(SILV.."mrkzplayer".."2"..data.sender_user_id,mrkzplayer)
Redis:set(SILV.."cityplayer".."2"..data.sender_user_id,cityplayer)
Redis:set(SILV.."priceplayer".."2"..data.sender_user_id,59000)
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : ايدن ازارد \n⇜ مركزه : جناح\n⇜ طاقة اللاعب : 86\n⇜ الجنسية : بلجيكا 🇧🇪 \n⇜ السعر : 59000 دولار 💵\n⇜ رصيدك الان : '..convert_mony..' دولار 💵\n✧'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/idenno') then
local UserId = Text:match('(%d+)/idenno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب ايدن ازارد ", 'md', true)
end
end
if Text and Text:match('(%d+)/sergyes') then
local UserId = Text:match('(%d+)/sergyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(170000) then
return edit(ChatId,Msg_id, "⇜ مايمديك تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(SILV.."mrkzplayer".."4"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز دفاع\n⇜ ابحث عن لاعب اخر\n✧","md",true)
end
cccallcc = tonumber(ballance) - 170000
Redis:set(SILV.."boob"..data.sender_user_id,cccallcc)
nameplayer = "سيرجو راموس"
energyplayer = "93"
mrkzplayer = "مدافع"
cityplayer = "اسبانيا 🇪🇸 "
Redis:set(SILV.."nameplayer".."4"..data.sender_user_id,nameplayer)
Redis:set(SILV.."energyplayer".."4"..data.sender_user_id,energyplayer)
Redis:set(SILV.."mrkzplayer".."4"..data.sender_user_id,mrkzplayer)
Redis:set(SILV.."cityplayer".."4"..data.sender_user_id,cityplayer)
Redis:set(SILV.."priceplayer".."4"..data.sender_user_id,170000)
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : ايدن ازارد \n⇜ مركزه : مدافع\n⇜ طاقة اللاعب : 93\n⇜ الجنسية : اسبانيا 🇪🇸 \n⇜ السعر : 170000 دولار 💵\n⇜ رصيدك الان : '..convert_mony..' دولار 💵\n✧'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/sergno') then
local UserId = Text:match('(%d+)/sergno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب سيرجيو راموس ", 'md', true)
end
end
if Text and Text:match('(%d+)/fermyes') then
local UserId = Text:match('(%d+)/fermyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(60000) then
return edit(ChatId,Msg_id, "⇜ مايمديك تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(SILV.."mrkzplayer".."1"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز هجوم\n⇜ ابحث عن لاعب اخر\n✧","md",true)
end
cccallcc = tonumber(ballance) - 60000
Redis:set(SILV.."boob"..data.sender_user_id,cccallcc)
nameplayer = "فرمينو"
energyplayer = "86"
mrkzplayer = "مهاجم"
cityplayer = "البرازيل 🇧🇷 "
Redis:set(SILV.."nameplayer".."1"..data.sender_user_id,nameplayer)
Redis:set(SILV.."energyplayer".."1"..data.sender_user_id,energyplayer)
Redis:set(SILV.."mrkzplayer".."1"..data.sender_user_id,mrkzplayer)
Redis:set(SILV.."cityplayer".."1"..data.sender_user_id,cityplayer)
Redis:set(SILV.."priceplayer".."1"..data.sender_user_id,60000)
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : فرمينو \n⇜ مركزه : مهاجم\n⇜ طاقة اللاعب : 86\n⇜ الجنسية : البرازيل 🇧🇷 \n⇜ السعر : 60000 دولار 💵\n⇜ رصيدك الان : '..convert_mony..' دولار 💵\n✧'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/fermno') then
local UserId = Text:match('(%d+)/fermno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب فرمينو ", 'md', true)
end
end
if Text and Text:match('(%d+)/jackyes') then
local UserId = Text:match('(%d+)/jackyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(19000) then
return edit(ChatId,Msg_id, "⇜ مايمديك تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(SILV.."mrkzplayer".."1"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز هجوم\n⇜ ابحث عن لاعب اخر\n✧","md",true)
end
cccallcc = tonumber(ballance) - 19000
Redis:set(SILV.."boob"..data.sender_user_id,cccallcc)
nameplayer = "جاك كلارك"
energyplayer = "81"
mrkzplayer = "مهاجم"
cityplayer = "إنجلترا 🏴󠁧󠁢󠁥󠁮󠁧󠁿 "
Redis:set(SILV.."nameplayer".."1"..data.sender_user_id,nameplayer)
Redis:set(SILV.."energyplayer".."1"..data.sender_user_id,energyplayer)
Redis:set(SILV.."mrkzplayer".."1"..data.sender_user_id,mrkzplayer)
Redis:set(SILV.."cityplayer".."1"..data.sender_user_id,cityplayer)
Redis:set(SILV.."priceplayer".."1"..data.sender_user_id,19000)
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : جاك كلارك \n⇜ مركزه : مهاجم\n⇜ طاقة اللاعب : 81\n⇜ الجنسية : إنجلترا 🏴󠁧󠁢󠁥󠁮󠁧󠁿 \n⇜ السعر : 19000 دولار 💵\n⇜ رصيدك الان : '..convert_mony..' دولار 💵\n✧'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/jackno') then
local UserId = Text:match('(%d+)/jackno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب جاك كلارك ", 'md', true)
end
end
if Text and Text:match('(%d+)/ansloyes') then
local UserId = Text:match('(%d+)/ansloyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(53000) then
return edit(ChatId,Msg_id, "⇜ مايمديك تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(SILV.."mrkzplayer".."1"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز هجوم\n⇜ ابحث عن لاعب اخر\n✧","md",true)
end
cccallcc = tonumber(ballance) - 53000
Redis:set(SILV.."boob"..data.sender_user_id,cccallcc)
nameplayer = "انسلو فاتي"
energyplayer = "84"
mrkzplayer = "مهاجم"
cityplayer = "اسبانيا 🇪🇸 "
Redis:set(SILV.."nameplayer".."1"..data.sender_user_id,nameplayer)
Redis:set(SILV.."energyplayer".."1"..data.sender_user_id,energyplayer)
Redis:set(SILV.."mrkzplayer".."1"..data.sender_user_id,mrkzplayer)
Redis:set(SILV.."cityplayer".."1"..data.sender_user_id,cityplayer)
Redis:set(SILV.."priceplayer".."1"..data.sender_user_id,53000)
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : انسلو فاتي \n⇜ مركزه : مهاجم\n⇜ طاقة اللاعب : 84\n⇜ الجنسية : اسبانيا 🇪🇸 \n⇜ السعر : 53000 دولار 💵\n⇜ رصيدك الان : '..convert_mony..' دولار 💵\n✧'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/anslono') then
local UserId = Text:match('(%d+)/anslono')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب انسلو فاتي ", 'md', true)
end
end
if Text and Text:match('(%d+)/toresyes') then
local UserId = Text:match('(%d+)/toresyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(41000) then
return edit(ChatId,Msg_id, "⇜ مايمديك تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(SILV.."mrkzplayer".."1"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز هجوم\n⇜ ابحث عن لاعب اخر\n✧","md",true)
end
cccallcc = tonumber(ballance) - 41000
Redis:set(SILV.."boob"..data.sender_user_id,cccallcc)
nameplayer = "توريس"
energyplayer = "84"
mrkzplayer = "مهاجم"
cityplayer = "اسبانيا 🇪🇸 "
Redis:set(SILV.."nameplayer".."1"..data.sender_user_id,nameplayer)
Redis:set(SILV.."energyplayer".."1"..data.sender_user_id,energyplayer)
Redis:set(SILV.."mrkzplayer".."1"..data.sender_user_id,mrkzplayer)
Redis:set(SILV.."cityplayer".."1"..data.sender_user_id,cityplayer)
Redis:set(SILV.."priceplayer".."1"..data.sender_user_id,41000)
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : توريس \n⇜ مركزه : مهاجم\n⇜ طاقة اللاعب : 84\n⇜ الجنسية : اسبانيا 🇪🇸 \n⇜ السعر : 41000 دولار 💵\n⇜ رصيدك الان : '..convert_mony..' دولار 💵\n✧'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/toresno') then
local UserId = Text:match('(%d+)/toresno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب توريس ", 'md', true)
end
end
if Text and Text:match('(%d+)/muleryes') then
local UserId = Text:match('(%d+)/muleryes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(80000) then
return edit(ChatId,Msg_id, "⇜ مايمديك تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(SILV.."mrkzplayer".."3"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز وسط\n⇜ ابحث عن لاعب اخر\n✧","md",true)
end
cccallcc = tonumber(ballance) - 80000
Redis:set(SILV.."boob"..data.sender_user_id,cccallcc)
nameplayer = "توماس مولر"
energyplayer = "87"
mrkzplayer = "وسط"
cityplayer = "ألمانيا 🇩🇪"
Redis:set(SILV.."nameplayer".."3"..data.sender_user_id,nameplayer)
Redis:set(SILV.."energyplayer".."3"..data.sender_user_id,energyplayer)
Redis:set(SILV.."mrkzplayer".."3"..data.sender_user_id,mrkzplayer)
Redis:set(SILV.."cityplayer".."3"..data.sender_user_id,cityplayer)
Redis:set(SILV.."priceplayer".."3"..data.sender_user_id,41000)
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : توماس مولر \n⇜ مركزه : وسط\n⇜ طاقة اللاعب : 87\n⇜ الجنسية : ألمانيا 🇩🇪 \n⇜ السعر : 41000 دولار 💵\n⇜ رصيدك الان : '..convert_mony..' دولار 💵\n✧'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/mulerno') then
local UserId = Text:match('(%d+)/mulerno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب توماس مولر ", 'md', true)
end
end
if Text and Text:match('(%d+)/brunoyes') then
local UserId = Text:match('(%d+)/brunoyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(74000) then
return edit(ChatId,Msg_id, "⇜ مايمديك تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(SILV.."mrkzplayer".."3"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز وسط\n⇜ ابحث عن لاعب اخر\n✧","md",true)
end
cccallcc = tonumber(ballance) - 74000
Redis:set(SILV.."boob"..data.sender_user_id,cccallcc)
nameplayer = "برونو فيرنانديز"
energyplayer = "86"
mrkzplayer = "وسط"
cityplayer = "البرتغال 🇵🇹"
Redis:set(SILV.."nameplayer".."3"..data.sender_user_id,nameplayer)
Redis:set(SILV.."energyplayer".."3"..data.sender_user_id,energyplayer)
Redis:set(SILV.."mrkzplayer".."3"..data.sender_user_id,mrkzplayer)
Redis:set(SILV.."cityplayer".."3"..data.sender_user_id,cityplayer)
Redis:set(SILV.."priceplayer".."3"..data.sender_user_id,74000)
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : برونو فيرنانديز \n⇜ مركزه : وسط\n⇜ طاقة اللاعب : 87\n⇜ الجنسية : البرتغال 🇵🇹 \n⇜ السعر : 74000 دولار 💵\n⇜ رصيدك الان : '..convert_mony..' دولار 💵\n✧'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/brunono') then
local UserId = Text:match('(%d+)/brunono')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب برونو فيرنانديز", 'md', true)
end
end
if Text and Text:match('(%d+)/paulyes') then
local UserId = Text:match('(%d+)/paulyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(78000) then
return edit(ChatId,Msg_id, "⇜ مايمديك تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(SILV.."mrkzplayer".."3"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز وسط\n⇜ ابحث عن لاعب اخر\n✧","md",true)
end
cccallcc = tonumber(ballance) - 78000
Redis:set(SILV.."boob"..data.sender_user_id,cccallcc)
nameplayer = "بول بوجبا"
energyplayer = "88"
mrkzplayer = "وسط"
cityplayer = "فرنسا 🇫🇷 "
Redis:set(SILV.."nameplayer".."3"..data.sender_user_id,nameplayer)
Redis:set(SILV.."energyplayer".."3"..data.sender_user_id,energyplayer)
Redis:set(SILV.."mrkzplayer".."3"..data.sender_user_id,mrkzplayer)
Redis:set(SILV.."cityplayer".."3"..data.sender_user_id,cityplayer)
Redis:set(SILV.."priceplayer".."3"..data.sender_user_id,78000)
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : بول بوجبا \n⇜ مركزه : وسط\n⇜ طاقة اللاعب : 87\n⇜ الجنسية : فرنسا 🇫🇷 \n⇜ السعر : 78000 دولار 💵\n⇜ رصيدك الان : '..convert_mony..' دولار 💵\n✧'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/paulno') then
local UserId = Text:match('(%d+)/paulno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب بول بوجبا", 'md', true)
end
end
if Text and Text:match('(%d+)/modricyes') then
local UserId = Text:match('(%d+)/modricyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(90000) then
return edit(ChatId,Msg_id, "⇜ مايمديك تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(SILV.."mrkzplayer".."3"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز وسط\n⇜ ابحث عن لاعب اخر\n✧","md",true)
end
cccallcc = tonumber(ballance) - 90000
Redis:set(SILV.."boob"..data.sender_user_id,cccallcc)
nameplayer = "لوكا مودريتش"
energyplayer = "90"
mrkzplayer = "وسط"
cityplayer = "كرواتيا 🇭🇷 "
Redis:set(SILV.."nameplayer".."3"..data.sender_user_id,nameplayer)
Redis:set(SILV.."energyplayer".."3"..data.sender_user_id,energyplayer)
Redis:set(SILV.."mrkzplayer".."3"..data.sender_user_id,mrkzplayer)
Redis:set(SILV.."cityplayer".."3"..data.sender_user_id,cityplayer)
Redis:set(SILV.."priceplayer".."3"..data.sender_user_id,90000)
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : لوكا مودريتش \n⇜ مركزه : وسط\n⇜ طاقة اللاعب : 90\n⇜ الجنسية : كرواتيا 🇭🇷 \n⇜ السعر : 90000 دولار 💵\n⇜ رصيدك الان : '..convert_mony..' دولار 💵\n✧'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/modricno') then
local UserId = Text:match('(%d+)/modricno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب لوكا مودريتش", 'md', true)
end
end
if Text and Text:match('(%d+)/iscoyes') then
local UserId = Text:match('(%d+)/iscoyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(41000) then
return edit(ChatId,Msg_id, "⇜ مايمديك تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(SILV.."mrkzplayer".."3"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز وسط\n⇜ ابحث عن لاعب اخر\n✧","md",true)
end
cccallcc = tonumber(ballance) - 41000
Redis:set(SILV.."boob"..data.sender_user_id,cccallcc)
nameplayer = "إيسكو"
energyplayer = "84"
mrkzplayer = "وسط"
cityplayer = "اسبانيا 🇪🇸 "
Redis:set(SILV.."nameplayer".."3"..data.sender_user_id,nameplayer)
Redis:set(SILV.."energyplayer".."3"..data.sender_user_id,energyplayer)
Redis:set(SILV.."mrkzplayer".."3"..data.sender_user_id,mrkzplayer)
Redis:set(SILV.."cityplayer".."3"..data.sender_user_id,cityplayer)
Redis:set(SILV.."priceplayer".."3"..data.sender_user_id,41000)
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : إيسكو \n⇜ مركزه : وسط\n⇜ طاقة اللاعب : 84\n⇜ الجنسية : اسبانيا 🇪🇸 \n⇜ السعر : 41000 دولار 💵\n⇜ رصيدك الان : '..convert_mony..' دولار 💵\n✧'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/iscono') then
local UserId = Text:match('(%d+)/iscono')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب إيسكو ", 'md', true)
end
end
if Text and Text:match('(%d+)/fabinyes') then
local UserId = Text:match('(%d+)/fabinyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(20000) then
return edit(ChatId,Msg_id, "⇜ مايمديك تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(SILV.."mrkzplayer".."3"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز وسط\n⇜ ابحث عن لاعب اخر\n✧","md",true)
end
cccallcc = tonumber(ballance) - 20000
Redis:set(SILV.."boob"..data.sender_user_id,cccallcc)
nameplayer = "فابينهو"
energyplayer = "81"
mrkzplayer = "وسط"
cityplayer = "البرازيل 🇧🇷  "
Redis:set(SILV.."nameplayer".."3"..data.sender_user_id,nameplayer)
Redis:set(SILV.."energyplayer".."3"..data.sender_user_id,energyplayer)
Redis:set(SILV.."mrkzplayer".."3"..data.sender_user_id,mrkzplayer)
Redis:set(SILV.."cityplayer".."3"..data.sender_user_id,cityplayer)
Redis:set(SILV.."priceplayer".."3"..data.sender_user_id,20000)
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : فابينهو \n⇜ مركزه : وسط\n⇜ طاقة اللاعب : 81\n⇜ الجنسية : البرازيل 🇧🇷 \n⇜ السعر : 20000 دولار 💵\n⇜ رصيدك الان : '..convert_mony..' دولار 💵\n✧'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/fabinno') then
local UserId = Text:match('(%d+)/fabinno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب فابينهو ", 'md', true)
end
end
if Text and Text:match('(%d+)/hinsonyes') then
local UserId = Text:match('(%d+)/hinsonyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(70000) then
return edit(ChatId,Msg_id, "⇜ مايمديك تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(SILV.."mrkzplayer".."3"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز وسط\n⇜ ابحث عن لاعب اخر\n✧","md",true)
end
cccallcc = tonumber(ballance) - 70000
Redis:set(SILV.."boob"..data.sender_user_id,cccallcc)
nameplayer = "هيندرسون"
energyplayer = "86"
mrkzplayer = "وسط"
cityplayer = "إنجلترا 🏴󠁧󠁢󠁥󠁮󠁧󠁿  "
Redis:set(SILV.."nameplayer".."3"..data.sender_user_id,nameplayer)
Redis:set(SILV.."energyplayer".."3"..data.sender_user_id,energyplayer)
Redis:set(SILV.."mrkzplayer".."3"..data.sender_user_id,mrkzplayer)
Redis:set(SILV.."cityplayer".."3"..data.sender_user_id,cityplayer)
Redis:set(SILV.."priceplayer".."3"..data.sender_user_id,70000)
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : هيندرسون \n⇜ مركزه : وسط\n⇜ طاقة اللاعب : 86\n⇜ الجنسية : إنجلترا 🏴󠁧󠁢󠁥󠁮󠁧󠁿 \n⇜ السعر : 70000 دولار 💵\n⇜ رصيدك الان : '..convert_mony..' دولار 💵\n✧'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/hinsonyno') then
local UserId = Text:match('(%d+)/hinsonyno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب هيندرسون", 'md', true)
end
end
if Text and Text:match('(%d+)/janyes') then
local UserId = Text:match('(%d+)/janyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(80000) then
return edit(ChatId,Msg_id, "⇜ مايمديك تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(SILV.."mrkzplayer".."5"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك حارس\n⇜ ابحث عن لاعب اخر\n✧","md",true)
end
cccallcc = tonumber(ballance) - 80000
Redis:set(SILV.."boob"..data.sender_user_id,cccallcc)
nameplayer = "جان اوبلاك"
energyplayer = "88"
mrkzplayer = "حارس"
cityplayer = "رومانيا 🇹🇩  "
Redis:set(SILV.."nameplayer".."5"..data.sender_user_id,nameplayer)
Redis:set(SILV.."energyplayer".."5"..data.sender_user_id,energyplayer)
Redis:set(SILV.."mrkzplayer".."5"..data.sender_user_id,mrkzplayer)
Redis:set(SILV.."cityplayer".."5"..data.sender_user_id,cityplayer)
Redis:set(SILV.."priceplayer".."5"..data.sender_user_id,80000)
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : جان اوبلاك \n⇜ مركزه : حارس\n⇜ طاقة اللاعب : 88\n⇜ الجنسية : رومانيا 🇹🇩 \n⇜ السعر : 80000 دولار 💵\n⇜ رصيدك الان : '..convert_mony..' دولار 💵\n✧'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/janno') then
local UserId = Text:match('(%d+)/janno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب جان اوبلاك ", 'md', true)
end
end
if Text and Text:match('(%d+)/kayloryes') then
local UserId = Text:match('(%d+)/kayloryes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(70000) then
return edit(ChatId,Msg_id, "⇜ مايمديك تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(SILV.."mrkzplayer".."5"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك حارس\n⇜ ابحث عن لاعب اخر\n✧","md",true)
end
cccallcc = tonumber(ballance) - 70000
Redis:set(SILV.."boob"..data.sender_user_id,cccallcc)
nameplayer = "كيلور نافاس"
energyplayer = "87"
mrkzplayer = "حارس"
cityplayer = "كوستا ريكا🇨🇷"
Redis:set(SILV.."nameplayer".."5"..data.sender_user_id,nameplayer)
Redis:set(SILV.."energyplayer".."5"..data.sender_user_id,energyplayer)
Redis:set(SILV.."mrkzplayer".."5"..data.sender_user_id,mrkzplayer)
Redis:set(SILV.."cityplayer".."5"..data.sender_user_id,cityplayer)
Redis:set(SILV.."priceplayer".."5"..data.sender_user_id,70000)
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : كيلور نافاس \n⇜ مركزه : حارس\n⇜ طاقة اللاعب : 87\n⇜ الجنسية : كوستا ريكا🇨🇷 \n⇜ السعر : 70000 دولار 💵\n⇜ رصيدك الان : '..convert_mony..' دولار 💵\n✧'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/kaylorno') then
local UserId = Text:match('(%d+)/kaylorno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب كيلور نافاس ", 'md', true)
end
end
if Text and Text:match('(%d+)/sommeryes') then
local UserId = Text:match('(%d+)/sommeryes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(70000) then
return edit(ChatId,Msg_id, "⇜ مايمديك تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(SILV.."mrkzplayer".."5"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك حارس\n⇜ ابحث عن لاعب اخر\n✧","md",true)
end
cccallcc = tonumber(ballance) - 70000
Redis:set(SILV.."boob"..data.sender_user_id,cccallcc)
nameplayer = "يان سومر"
energyplayer = "87"
mrkzplayer = "حارس"
cityplayer = "سويسرا 🇨🇭"
Redis:set(SILV.."nameplayer".."5"..data.sender_user_id,nameplayer)
Redis:set(SILV.."energyplayer".."5"..data.sender_user_id,energyplayer)
Redis:set(SILV.."mrkzplayer".."5"..data.sender_user_id,mrkzplayer)
Redis:set(SILV.."cityplayer".."5"..data.sender_user_id,cityplayer)
Redis:set(SILV.."priceplayer".."5"..data.sender_user_id,70000)
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : يان سومر \n⇜ مركزه : حارس\n⇜ طاقة اللاعب : 87\n⇜ الجنسية : سويسرا 🇨🇭 \n⇜ السعر : 70000 دولار 💵\n⇜ رصيدك الان : '..convert_mony..' دولار 💵\n✧'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/sommerno') then
local UserId = Text:match('(%d+)/sommerno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب يان سومر ", 'md', true)
end
end
if Text and Text:match('(%d+)/brendyes') then
local UserId = Text:match('(%d+)/brendyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(52000) then
return edit(ChatId,Msg_id, "⇜ مايمديك تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(SILV.."mrkzplayer".."5"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك حارس\n⇜ ابحث عن لاعب اخر\n✧","md",true)
end
cccallcc = tonumber(ballance) - 52000
Redis:set(SILV.."boob"..data.sender_user_id,cccallcc)
nameplayer = "بيرند لينو"
energyplayer = "85"
mrkzplayer = "حارس"
cityplayer = "المانيا🇩🇪"
Redis:set(SILV.."nameplayer".."5"..data.sender_user_id,nameplayer)
Redis:set(SILV.."energyplayer".."5"..data.sender_user_id,energyplayer)
Redis:set(SILV.."mrkzplayer".."5"..data.sender_user_id,mrkzplayer)
Redis:set(SILV.."cityplayer".."5"..data.sender_user_id,cityplayer)
Redis:set(SILV.."priceplayer".."5"..data.sender_user_id,52000)
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : بريند لينو \n⇜ مركزه : حارس\n⇜ طاقة اللاعب : 85\n⇜ الجنسية : المانيا🇩🇪 \n⇜ السعر : 52000 دولار 💵\n⇜ رصيدك الان : '..convert_mony..' دولار 💵\n✧'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/brendno') then
local UserId = Text:match('(%d+)/brendnp')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب بريند لينو ", 'md', true)
end
end
if Text and Text:match('(%d+)/mendyyes') then
local UserId = Text:match('(%d+)/mendyyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(80000) then
return edit(ChatId,Msg_id, "⇜ مايمديك تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(SILV.."mrkzplayer".."5"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك حارس\n⇜ ابحث عن لاعب اخر\n✧","md",true)
end
cccallcc = tonumber(ballance) - 80000
Redis:set(SILV.."boob"..data.sender_user_id,cccallcc)
nameplayer = "ميندي"
energyplayer = "88"
mrkzplayer = "حارس"
cityplayer = "غانا 🇬🇭"
Redis:set(SILV.."nameplayer".."5"..data.sender_user_id,nameplayer)
Redis:set(SILV.."energyplayer".."5"..data.sender_user_id,energyplayer)
Redis:set(SILV.."mrkzplayer".."5"..data.sender_user_id,mrkzplayer)
Redis:set(SILV.."cityplayer".."5"..data.sender_user_id,cityplayer)
Redis:set(SILV.."priceplayer".."5"..data.sender_user_id,80000)
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : ميندي \n⇜ مركزه : حارس\n⇜ طاقة اللاعب : 88\n⇜ الجنسية : غانا 🇬🇭 \n⇜ السعر : 80000 دولار 💵\n⇜ رصيدك الان : '..convert_mony..' دولار 💵\n✧'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/mendyno') then
local UserId = Text:match('(%d+)/mendyno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب ميندي ", 'md', true)
end
end
if Text and Text:match('(%d+)/onanayes') then
local UserId = Text:match('(%d+)/onanayes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(20000) then
return edit(ChatId,Msg_id, "⇜ مايمديك تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(SILV.."mrkzplayer".."5"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك حارس\n⇜ ابحث عن لاعب اخر\n✧","md",true)
end
cccallcc = tonumber(ballance) - 20000
Redis:set(SILV.."boob"..data.sender_user_id,cccallcc)
nameplayer = "اندريه اونانا"
energyplayer = "83"
mrkzplayer = "حارس"
cityplayer = "غانا 🇬🇭"
Redis:set(SILV.."nameplayer".."5"..data.sender_user_id,nameplayer)
Redis:set(SILV.."energyplayer".."5"..data.sender_user_id,energyplayer)
Redis:set(SILV.."mrkzplayer".."5"..data.sender_user_id,mrkzplayer)
Redis:set(SILV.."cityplayer".."5"..data.sender_user_id,cityplayer)
Redis:set(SILV.."priceplayer".."5"..data.sender_user_id,20000)
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : اندريه اونانا \n⇜ مركزه : حارس\n⇜ طاقة اللاعب : 82\n⇜ الجنسية : غانا 🇬🇭 \n⇜ السعر : 20000 دولار 💵\n⇜ رصيدك الان : '..convert_mony..' دولار 💵\n✧'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/onanano') then
local UserId = Text:match('(%d+)/onanano')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب اندريه اونانا ", 'md', true)
end
end
if Text and Text:match('(%d+)/royyes') then
local UserId = Text:match('(%d+)/royyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(40000) then
return edit(ChatId,Msg_id, "⇜ مايمديك تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(SILV.."mrkzplayer".."5"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك حارس\n⇜ ابحث عن لاعب اخر\n✧","md",true)
end
cccallcc = tonumber(ballance) - 40000
Redis:set(SILV.."boob"..data.sender_user_id,cccallcc)
nameplayer = "روي باتريكو"
energyplayer = "84"
mrkzplayer = "حارس"
cityplayer = "البرتغال 🇵🇹 "
Redis:set(SILV.."nameplayer".."5"..data.sender_user_id,nameplayer)
Redis:set(SILV.."energyplayer".."5"..data.sender_user_id,energyplayer)
Redis:set(SILV.."mrkzplayer".."5"..data.sender_user_id,mrkzplayer)
Redis:set(SILV.."cityplayer".."5"..data.sender_user_id,cityplayer)
Redis:set(SILV.."priceplayer".."5"..data.sender_user_id,40000)
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : روي باتريكو \n⇜ مركزه : حارس\n⇜ طاقة اللاعب : 84\n⇜ الجنسية : البرتغال 🇵🇹 \n⇜ السعر : 40000 دولار 💵\n⇜ رصيدك الان : '..convert_mony..' دولار 💵\n✧'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/royno') then
local UserId = Text:match('(%d+)/royno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب روي باتريكو ", 'md', true)
end
end
if Text and Text:match('(%d+)/kasperyes') then
local UserId = Text:match('(%d+)/kasperyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(40000) then
return edit(ChatId,Msg_id, "⇜ مايمديك تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(SILV.."mrkzplayer".."5"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك حارس\n⇜ ابحث عن لاعب اخر\n✧","md",true)
end
cccallcc = tonumber(ballance) - 40000
Redis:set(SILV.."boob"..data.sender_user_id,cccallcc)
nameplayer = "كاسبر"
energyplayer = "84"
mrkzplayer = "حارس"
cityplayer = "الدنمارك🇩🇰"
Redis:set(SILV.."nameplayer".."5"..data.sender_user_id,nameplayer)
Redis:set(SILV.."energyplayer".."5"..data.sender_user_id,energyplayer)
Redis:set(SILV.."mrkzplayer".."5"..data.sender_user_id,mrkzplayer)
Redis:set(SILV.."cityplayer".."5"..data.sender_user_id,cityplayer)
Redis:set(SILV.."priceplayer".."5"..data.sender_user_id,40000)
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : كاسبر \n⇜ مركزه : حارس\n⇜ طاقة اللاعب : 84\n⇜ الجنسية : الدنمارك🇩🇰 \n⇜ السعر : 40000 دولار 💵\n⇜ رصيدك الان : '..convert_mony..' دولار 💵\n✧'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/kasperno') then
local UserId = Text:match('(%d+)/kasperno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب روي كاسبر ", 'md', true)
end
end
if Text and Text:match('(%d+)/geayes') then
local UserId = Text:match('(%d+)/geayes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(80000) then
return edit(ChatId,Msg_id, "⇜ مايمديك تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(SILV.."mrkzplayer".."5"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك حارس\n⇜ ابحث عن لاعب اخر\n✧","md",true)
end
cccallcc = tonumber(ballance) - 80000
Redis:set(SILV.."boob"..data.sender_user_id,cccallcc)
nameplayer = "دافيد"
energyplayer = "88"
mrkzplayer = "حارس"
cityplayer = "اسبانيا 🇪🇸"
Redis:set(SILV.."nameplayer".."5"..data.sender_user_id,nameplayer)
Redis:set(SILV.."energyplayer".."5"..data.sender_user_id,energyplayer)
Redis:set(SILV.."mrkzplayer".."5"..data.sender_user_id,mrkzplayer)
Redis:set(SILV.."cityplayer".."5"..data.sender_user_id,cityplayer)
Redis:set(SILV.."priceplayer".."5"..data.sender_user_id,80000)
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : دافيد \n⇜ مركزه : حارس\n⇜ طاقة اللاعب : 84\n⇜ الجنسية : اسبانيا 🇪🇸 \n⇜ السعر : 80000 دولار 💵\n⇜ رصيدك الان : '..convert_mony..' دولار 💵\n✧'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/geano') then
local UserId = Text:match('(%d+)/geano')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب دافيد ", 'md', true)
end
end
if Text and Text:match('(%d+)/felixyes') then
local UserId = Text:match('(%d+)/felixyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(20000) then
return edit(ChatId,Msg_id, "⇜ مايمديك تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(SILV.."mrkzplayer".."1"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز هجوم\n⇜ ابحث عن لاعب اخر\n✧","md",true)
end
cccallcc = tonumber(ballance) - 20000
Redis:set(SILV.."boob"..data.sender_user_id,cccallcc)
nameplayer = "جواو فليكس"
energyplayer = "82"
mrkzplayer = "مهاجم"
cityplayer = "البرتغال 🇵🇹"
Redis:set(SILV.."nameplayer".."1"..data.sender_user_id,nameplayer)
Redis:set(SILV.."energyplayer".."1"..data.sender_user_id,energyplayer)
Redis:set(SILV.."mrkzplayer".."1"..data.sender_user_id,mrkzplayer)
Redis:set(SILV.."cityplayer".."1"..data.sender_user_id,cityplayer)
Redis:set(SILV.."priceplayer".."1"..data.sender_user_id,20000)
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : جواو فليكس \n⇜ مركزه : مهاجم\n⇜ طاقة اللاعب : 82\n⇜ الجنسية : البرتغال 🇵🇹 \n⇜ السعر : 20000 دولار 💵\n⇜ رصيدك الان : '..convert_mony..' دولار 💵\n✧'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/felixno') then
local UserId = Text:match('(%d+)/felixno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب جواو فليكس ", 'md', true)
end
end
if Text and Text:match('(%d+)/salahyes') then
local UserId = Text:match('(%d+)/salahyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(100000) then
return edit(ChatId,Msg_id, "⇜ مايمديك تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(SILV.."mrkzplayer".."2"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز جناح\n⇜ ابحث عن لاعب اخر\n✧","md",true)
end
cccallcc = tonumber(ballance) - 100000
Redis:set(SILV.."boob"..data.sender_user_id,cccallcc)
nameplayer = "محمد صلاح"
energyplayer = "91"
mrkzplayer = "جناح"
cityplayer = "مصر 🇪🇬 "
Redis:set(SILV.."nameplayer".."2"..data.sender_user_id,nameplayer)
Redis:set(SILV.."energyplayer".."2"..data.sender_user_id,energyplayer)
Redis:set(SILV.."mrkzplayer".."2"..data.sender_user_id,mrkzplayer)
Redis:set(SILV.."cityplayer".."2"..data.sender_user_id,cityplayer)
Redis:set(SILV.."priceplayer".."2"..data.sender_user_id,100000)
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : محمد صلاح\n⇜ مركزه : جناح\n⇜ طاقة اللاعب : 91\n⇜ الجنسية : مصر 🇪🇬 \n⇜ السعر : 100000 دولار 💵\n⇜ رصيدك الان : '..convert_mony..' دولار 💵\n✧'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/salahno') then
local UserId = Text:match('(%d+)/salahno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب محمد صلاح", 'md', true)
end
end
if Text and Text:match('(%d+)/neymaryes') then
local UserId = Text:match('(%d+)/neymaryes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(100000) then
return edit(ChatId,Msg_id, "⇜ مايمديك تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(SILV.."mrkzplayer".."2"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز جناح\n⇜ ابحث عن لاعب اخر\n✧","md",true)
end
cccallcc = tonumber(ballance) - 100000
Redis:set(SILV.."boob"..data.sender_user_id,cccallcc)
nameplayer = "نيمار"
energyplayer = "91"
mrkzplayer = "جناح"
cityplayer = "البرازيل🇧🇷 "
Redis:set(SILV.."nameplayer".."2"..data.sender_user_id,nameplayer)
Redis:set(SILV.."energyplayer".."2"..data.sender_user_id,energyplayer)
Redis:set(SILV.."mrkzplayer".."2"..data.sender_user_id,mrkzplayer)
Redis:set(SILV.."cityplayer".."2"..data.sender_user_id,cityplayer)
Redis:set(SILV.."priceplayer".."2"..data.sender_user_id,100000)
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : نيمار\n⇜ مركزه : جناح\n⇜ طاقة اللاعب : 91\n⇜ الجنسية : البرازيل🇧🇷 \n⇜ السعر : 100000 دولار 💵\n⇜ رصيدك الان : '..convert_mony..' دولار 💵\n✧'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/neymarno') then
local UserId = Text:match('(%d+)/neymarno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب نيمار", 'md', true)
end
end
if Text and Text:match('(%d+)/sadioyes') then
local UserId = Text:match('(%d+)/sadioyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(90000) then
return edit(ChatId,Msg_id, "⇜ مايمديك تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(SILV.."mrkzplayer".."2"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز جناح\n⇜ ابحث عن لاعب اخر\n✧","md",true)
end
cccallcc = tonumber(ballance) - 90000
Redis:set(SILV.."boob"..data.sender_user_id,cccallcc)
nameplayer = "ساديو ماني"
energyplayer = "90"
mrkzplayer = "جناح"
cityplayer = "السنغال 🇸🇳"
Redis:set(SILV.."nameplayer".."2"..data.sender_user_id,nameplayer)
Redis:set(SILV.."energyplayer".."2"..data.sender_user_id,energyplayer)
Redis:set(SILV.."mrkzplayer".."2"..data.sender_user_id,mrkzplayer)
Redis:set(SILV.."cityplayer".."2"..data.sender_user_id,cityplayer)
Redis:set(SILV.."priceplayer".."2"..data.sender_user_id,90000)
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : نيمار\n⇜ مركزه : جناح\n⇜ طاقة اللاعب : 90\n⇜ الجنسية : السنغال 🇸🇳 \n⇜ السعر : 90000 دولار 💵\n⇜ رصيدك الان : '..convert_mony..' دولار 💵\n✧'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/sadiono') then
local UserId = Text:match('(%d+)/sadiono')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب ساديو ماني", 'md', true)
end
end
if Text and Text:match('(%d+)/rehimyes') then
local UserId = Text:match('(%d+)/rehimyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(80000) then
return edit(ChatId,Msg_id, "⇜ مايمديك تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(SILV.."mrkzplayer".."2"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز جناح\n⇜ ابحث عن لاعب اخر\n✧","md",true)
end
cccallcc = tonumber(ballance) - 80000
Redis:set(SILV.."boob"..data.sender_user_id,cccallcc)
nameplayer = "رحيم ستيرلينغ"
energyplayer = "88"
mrkzplayer = "جناح"
cityplayer = "إنجلترا 🏴󠁧󠁢󠁥󠁮󠁧󠁿"
Redis:set(SILV.."nameplayer".."2"..data.sender_user_id,nameplayer)
Redis:set(SILV.."energyplayer".."2"..data.sender_user_id,energyplayer)
Redis:set(SILV.."mrkzplayer".."2"..data.sender_user_id,mrkzplayer)
Redis:set(SILV.."cityplayer".."2"..data.sender_user_id,cityplayer)
Redis:set(SILV.."priceplayer".."2"..data.sender_user_id,80000)
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : رحيم ستيرلينغ\n⇜ مركزه : جناح\n⇜ طاقة اللاعب : 88\n⇜ الجنسية : إنجلترا 🏴󠁧󠁢󠁥󠁮󠁧󠁿 \n⇜ السعر : 80000 دولار 💵\n⇜ رصيدك الان : '..convert_mony..' دولار 💵\n✧'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/rehimno') then
local UserId = Text:match('(%d+)/rehimno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب رحيم ستيرلين", 'md', true)
end
end
if Text and Text:match('(%d+)/sanchoyes') then
local UserId = Text:match('(%d+)/sanchoyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(80000) then
return edit(ChatId,Msg_id, "⇜ مايمديك تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(SILV.."mrkzplayer".."2"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز جناح\n⇜ ابحث عن لاعب اخر\n✧","md",true)
end
cccallcc = tonumber(ballance) - 80000
Redis:set(SILV.."boob"..data.sender_user_id,cccallcc)
nameplayer = "يادون سانشو"
energyplayer = "88"
mrkzplayer = "جناح"
cityplayer = "إنجلترا 🏴󠁧󠁢󠁥󠁮󠁧󠁿"
Redis:set(SILV.."nameplayer".."2"..data.sender_user_id,nameplayer)
Redis:set(SILV.."energyplayer".."2"..data.sender_user_id,energyplayer)
Redis:set(SILV.."mrkzplayer".."2"..data.sender_user_id,mrkzplayer)
Redis:set(SILV.."cityplayer".."2"..data.sender_user_id,cityplayer)
Redis:set(SILV.."priceplayer".."2"..data.sender_user_id,80000)
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : يادون سانشو\n⇜ مركزه : جناح\n⇜ طاقة اللاعب : 88\n⇜ الجنسية : إنجلترا 🏴󠁧󠁢󠁥󠁮󠁧󠁿 \n⇜ السعر : 80000 دولار 💵\n⇜ رصيدك الان : '..convert_mony..' دولار 💵\n✧'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/sanchono') then
local UserId = Text:match('(%d+)/sanchono')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب يادون سانشو", 'md', true)
end
end
if Text and Text:match('(%d+)/sonyes') then
local UserId = Text:match('(%d+)/sonyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(80000) then
return edit(ChatId,Msg_id, "⇜ مايمديك تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(SILV.."mrkzplayer".."2"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز جناح\n⇜ ابحث عن لاعب اخر\n✧","md",true)
end
cccallcc = tonumber(ballance) - 80000
Redis:set(SILV.."boob"..data.sender_user_id,cccallcc)
nameplayer = "سون"
energyplayer = "88"
mrkzplayer = "جناح"
cityplayer = "كوريه الجنوبيه 🇰🇷"
Redis:set(SILV.."nameplayer".."2"..data.sender_user_id,nameplayer)
Redis:set(SILV.."energyplayer".."2"..data.sender_user_id,energyplayer)
Redis:set(SILV.."mrkzplayer".."2"..data.sender_user_id,mrkzplayer)
Redis:set(SILV.."cityplayer".."2"..data.sender_user_id,cityplayer)
Redis:set(SILV.."priceplayer".."2"..data.sender_user_id,80000)
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : يادون سانشو\n⇜ مركزه : جناح\n⇜ طاقة اللاعب : 88\n⇜ الجنسية : إنجلترا 🏴󠁧󠁢󠁥󠁮󠁧󠁿 \n⇜ السعر : 80000 دولار 💵\n⇜ رصيدك الان : '..convert_mony..' دولار 💵\n✧'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/sonno') then
local UserId = Text:match('(%d+)/sonno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب سون", 'md', true)
end
end

if Text and Text:match('(%d+)/realm') then
local UserId = Text:match('(%d+)/realm')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(200000) then
return edit(ChatId,Msg_id, "⇜ مايمديك تشتري فلوسك ماتكفي","md",true)
end
cccallcc = tonumber(ballance) - 200000
Redis:set(SILV.."boob"..data.sender_user_id,cccallcc)
lkbnade = Redis:get(SILV.."lkbnade"..data.sender_user_id)
Redis:sadd(SILV.."lkbnadesadd", lkbnade)
namenade = "ريال مدريد"
Redis:set(SILV.."namenade"..data.sender_user_id,namenade)
Redis:set(SILV.."nokatnade"..data.sender_user_id,0)
Redis:sadd(SILV.."ownernade",data.sender_user_id)
Redis:set(SILV.."energynade"..data.sender_user_id,50)
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم انشاء النادي ⚽️\n\n⇜ اسم النادي : ريال مدريد\n⇜ لقب النادي : '..lkbnade..'\n⇜ السعر : 200000 دولار 💵\n⇜ رصيدك الان : `'..convert_mony..'` دولار 💵\n\n⇜ اكتب ( `ناديي` ) لمعلومات اكثر \n✧'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/barca') then
local UserId = Text:match('(%d+)/barca')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(150000) then
return edit(ChatId,Msg_id, "⇜ مايمديك تشتري فلوسك ماتكفي","md",true)
end
cccallcc = tonumber(ballance) - 150000
Redis:set(SILV.."boob"..data.sender_user_id,cccallcc)
lkbnade = Redis:get(SILV.."lkbnade"..data.sender_user_id)
Redis:sadd(SILV.."lkbnadesadd", lkbnade)
namenade = "برشلونة"
Redis:set(SILV.."namenade"..data.sender_user_id,namenade)
Redis:set(SILV.."nokatnade"..data.sender_user_id,0)
Redis:sadd(SILV.."ownernade",data.sender_user_id)
Redis:set(SILV.."energynade"..data.sender_user_id,45)
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم انشاء النادي ⚽️\n\n⇜ اسم النادي : برشلونة\n⇜ لقب النادي : '..lkbnade..'\n⇜ السعر : 150000 دولار 💵\n⇜ رصيدك الان : `'..convert_mony..'` دولار 💵\n\n⇜ اكتب ( `ناديي` ) لمعلومات اكثر \n✧'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/chels') then
local UserId = Text:match('(%d+)/chels')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(90000) then
return edit(ChatId,Msg_id, "⇜ مايمديك تشتري فلوسك ماتكفي","md",true)
end
cccallcc = tonumber(ballance) - 90000
Redis:set(SILV.."boob"..data.sender_user_id,cccallcc)
lkbnade = Redis:get(SILV.."lkbnade"..data.sender_user_id)
Redis:sadd(SILV.."lkbnadesadd", lkbnade)
namenade = "تشيلسي"
Redis:set(SILV.."namenade"..data.sender_user_id,namenade)
Redis:set(SILV.."nokatnade"..data.sender_user_id,0)
Redis:sadd(SILV.."ownernade",data.sender_user_id)
Redis:set(SILV.."energynade"..data.sender_user_id,40)
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم انشاء النادي ⚽️\n\n⇜ اسم النادي : تشيلسي\n⇜ لقب النادي : '..lkbnade..'\n⇜ السعر : 90000 دولار 💵\n⇜ رصيدك الان : `'..convert_mony..'` دولار 💵\n\n⇜ اكتب ( `ناديي` ) لمعلومات اكثر \n✧'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/manun') then
local UserId = Text:match('(%d+)/manun')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(70000) then
return edit(ChatId,Msg_id, "⇜ مايمديك تشتري فلوسك ماتكفي","md",true)
end
cccallcc = tonumber(ballance) - 70000
Redis:set(SILV.."boob"..data.sender_user_id,cccallcc)
lkbnade = Redis:get(SILV.."lkbnade"..data.sender_user_id)
Redis:sadd(SILV.."lkbnadesadd", lkbnade)
namenade = "مانشستر يونايتد"
Redis:set(SILV.."namenade"..data.sender_user_id,namenade)
Redis:set(SILV.."nokatnade"..data.sender_user_id,0)
Redis:sadd(SILV.."ownernade",data.sender_user_id)
Redis:set(SILV.."energynade"..data.sender_user_id,35)
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم انشاء النادي ⚽️\n\n⇜ اسم النادي : مانشستر يونايتد\n⇜ لقب النادي : '..lkbnade..'\n⇜ السعر : 70000 دولار 💵\n⇜ رصيدك الان : `'..convert_mony..'` دولار 💵\n\n⇜ اكتب ( `ناديي` ) لمعلومات اكثر \n✧'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/livb') then
local UserId = Text:match('(%d+)/livb')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(120000) then
return edit(ChatId,Msg_id, "⇜ مايمديك تشتري فلوسك ماتكفي","md",true)
end
cccallcc = tonumber(ballance) - 120000
Redis:set(SILV.."boob"..data.sender_user_id,cccallcc)
lkbnade = Redis:get(SILV.."lkbnade"..data.sender_user_id)
Redis:sadd(SILV.."lkbnadesadd", lkbnade)
namenade = "ليفربول"
Redis:set(SILV.."namenade"..data.sender_user_id,namenade)
Redis:set(SILV.."nokatnade"..data.sender_user_id,0)
Redis:sadd(SILV.."ownernade",data.sender_user_id)
Redis:set(SILV.."energynade"..data.sender_user_id,30)
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم انشاء النادي ⚽️\n\n⇜ اسم النادي : ليفربول\n⇜ لقب النادي : '..lkbnade..'\n⇜ السعر : 120000 دولار 💵\n⇜ رصيدك الان : `'..convert_mony..'` دولار 💵\n\n⇜ اكتب ( `ناديي` ) لمعلومات اكثر \n✧'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/intmi') then
local UserId = Text:match('(%d+)/intmi')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(30000) then
return edit(ChatId,Msg_id, "⇜ مايمديك تشتري فلوسك ماتكفي","md",true)
end
cccallcc = tonumber(ballance) - 30000
Redis:set(SILV.."boob"..data.sender_user_id,cccallcc)
lkbnade = Redis:get(SILV.."lkbnade"..data.sender_user_id)
Redis:sadd(SILV.."lkbnadesadd", lkbnade)
namenade = "انتر ميلان"
Redis:set(SILV.."namenade"..data.sender_user_id,namenade)
Redis:set(SILV.."nokatnade"..data.sender_user_id,0)
Redis:sadd(SILV.."ownernade",data.sender_user_id)
Redis:set(SILV.."energynade"..data.sender_user_id,25)
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم انشاء النادي ⚽️\n\n⇜ اسم النادي : انتر ميلان\n⇜ لقب النادي : '..lkbnade..'\n⇜ السعر : 30000 دولار 💵\n⇜ رصيدك الان : `'..convert_mony..'` دولار 💵\n\n⇜ اكتب ( `ناديي` ) لمعلومات اكثر \n✧'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/manci') then
local UserId = Text:match('(%d+)/manci')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(100000) then
return edit(ChatId,Msg_id, "⇜ مايمديك تشتري فلوسك ماتكفي","md",true)
end
cccallcc = tonumber(ballance) - 100000
Redis:set(SILV.."boob"..data.sender_user_id,cccallcc)
lkbnade = Redis:get(SILV.."lkbnade"..data.sender_user_id)
Redis:sadd(SILV.."lkbnadesadd", lkbnade)
namenade = "مانشستر سيتي"
Redis:set(SILV.."namenade"..data.sender_user_id,namenade)
Redis:set(SILV.."nokatnade"..data.sender_user_id,0)
Redis:sadd(SILV.."ownernade",data.sender_user_id)
Redis:set(SILV.."energynade"..data.sender_user_id,20)
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم انشاء النادي ⚽️\n\n⇜ اسم النادي : مانشستر سيتي\n⇜ لقب النادي : '..lkbnade..'\n⇜ السعر : 100000 دولار 💵\n⇜ رصيدك الان : `'..convert_mony..'` دولار 💵\n\n⇜ اكتب ( `ناديي` ) لمعلومات اكثر \n✧'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/juvin') then
local UserId = Text:match('(%d+)/juvin')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(40000) then
return edit(ChatId,Msg_id, "⇜ مايمديك تشتري فلوسك ماتكفي","md",true)
end
cccallcc = tonumber(ballance) - 40000
Redis:set(SILV.."boob"..data.sender_user_id,cccallcc)
lkbnade = Redis:get(SILV.."lkbnade"..data.sender_user_id)
Redis:sadd(SILV.."lkbnadesadd", lkbnade)
namenade = "يوفنتوس"
Redis:set(SILV.."namenade"..data.sender_user_id,namenade)
Redis:set(SILV.."nokatnade"..data.sender_user_id,0)
Redis:sadd(SILV.."ownernade",data.sender_user_id)
Redis:set(SILV.."energynade"..data.sender_user_id,15)
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم انشاء النادي ⚽️\n\n⇜ اسم النادي : يوفنتوس\n⇜ لقب النادي : '..lkbnade..'\n⇜ السعر : 40000 دولار 💵\n⇜ رصيدك الان : `'..convert_mony..'` دولار 💵\n\n⇜ اكتب ( `ناديي` ) لمعلومات اكثر \n✧'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/arsi') then
local UserId = Text:match('(%d+)/arsi')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(20000) then
return edit(ChatId,Msg_id, "⇜ مايمديك تشتري فلوسك ماتكفي","md",true)
end
cccallcc = tonumber(ballance) - 20000
Redis:set(SILV.."boob"..data.sender_user_id,cccallcc)
lkbnade = Redis:get(SILV.."lkbnade"..data.sender_user_id)
Redis:sadd(SILV.."lkbnadesadd", lkbnade)
namenade = "ارسنال"
Redis:set(SILV.."namenade"..data.sender_user_id,namenade)
Redis:set(SILV.."nokatnade"..data.sender_user_id,0)
Redis:sadd(SILV.."ownernade",data.sender_user_id)
Redis:set(SILV.."energynade"..data.sender_user_id,10)
ballance = Redis:get(SILV.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم انشاء النادي ⚽️\n\n⇜ اسم النادي : ارسنال\n⇜ لقب النادي : '..lkbnade..'\n⇜ السعر : 20000 دولار 💵\n⇜ رصيدك الان : `'..convert_mony..'` دولار 💵\n\n⇜ اكتب ( `ناديي` ) لمعلومات اكثر \n✧'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('/Mahibes(%d+)') then
local GetMahibes = Text:match('/Mahibes(%d+)') 
local NumMahibes = math.random(1,6)
local UserInfo = bot.getUser(IdUser)
local Teext = '- ['..UserInfo.first_name..'](tg://user?id='..IdUser..')'
if tonumber(GetMahibes) == tonumber(NumMahibes) then
Redis:incrby(SILV.."Mero:Num:Add:Games"..ChatId..IdUser, 1)  
MahibesText = Teext..'\n⇜ الف مبروك حظك حلو اليوم\n⇜ فزت وطلعت المحيبس باليد رقم ( '..NumMahibes..' )'
else
MahibesText = Teext..'\n⇜ للاسف لقد خسرت المحيبس باليد رقم ( '..NumMahibes..' )\n⇜ جرب حضك مرة اخرى'
end
return edit(ChatId,Msg_id,MahibesText, 'md', true, false, reply_markup)
end
if Text and Text:match('(%d+)/joinhzer') then
local UserId = Text:match('(%d+)/joinhzer')
if Redis:get(SILV.."hazrlock"..ChatId) == UserId then
if Redis:sismember(SILV.."listhzerid"..ChatId, IdUser) then
return bot.answerCallbackQuery(data.id, "⇜ لقد انضممت الى اللعبة مسبقاً ", true)
end
if tonumber(Redis:get(SILV.."hazrmalek"..ChatId)) == IdUser then
return bot.answerCallbackQuery(data.id, "⇜ انتا مالك اللعبة حاليا", true)
end
Redis:sadd(SILV.."listhzerid"..ChatId, IdUser)
local nameuser = bot.getUser(IdUser)
if nameuser.first_name then
nameuser = "["..nameuser.first_name.."](tg://user?id="..nameuser.id..")"
else
nameuser = 'لا يوجد اسم'
end
send(ChatId,Msg_id,"\n⇜ انضم "..nameuser.." الى اللعبة \n✧","md",true)
end
end
if Text and Text:match('(%d+):kk:(%d+)/delreb:(%d+)') then
local UserId = {string.match(Text,"^(%d+):kk:(%d+)/delreb:(%d+)$")}
if tonumber(IdUser) == tonumber(UserId[3]) then
gt = "-100"..UserId[2]
bot.deleteMessages(gt,{[1]= UserId[1]})
edit(tonumber(UserId[3]),Msg_id,'⇜ تم مسح الرسالة من القروب', 'md', true)
end
end

if Text and Text:match('(.*):socl:(.*)') then
local UserId = {string.match(Text,"^(.*):socl:(.*)$")}
if Redis:get(SILV.."soundidche"..ChatId..IdUser) == UserId[1] then
link = "https://soundcloud.com/"..UserId[2]
title = UserId[1]
local sel = "SELVER-DEV"
os.execute("wget -O imgsu.jpg "..link.."")
local thusu= './imgsu.jpg'
local nameuser = bot.getUser(IdUser)
if nameuser.first_name then
nameuser = "["..nameuser.first_name.."](tg://user?id="..nameuser.id..")"
else
nameuser = 'لا يوجد اسم'
end
os.execute("yt-dlp "..link.." --max-filesize 25M -o '"..title..".mp3'")
local titfile = io.open("./"..title..".mp3","r")
if titfile then
bot.sendAudio(ChatId,Msg_id,'./'..title..'.mp3',"- من قبل : "..nameuser.." ","md",nil,title,sel,thusu)
bot.deleteMessages(ChatId,{[1]= Msg_id})
sleep(2)
os.remove(""..title..".mp3")
os.remove("imgsu.jpg")
Redis:del(SILV.."soundidche"..ChatId..IdUser)
else
Redis:del(SILV.."soundidche"..ChatId..IdUser)
return edit(ChatId,Msg_id,'\n⇜ لا استطيع تحميل اكثر من 25 ميغا',"md",true)
end
else
bot.answerCallbackQuery(data.id, "⇜ الامر ليس لك", true)
end
end

if Text and Text:match('(.*):yout:(.*)') then
local UserId = {string.match(Text,"^(.*):yout:(.*)$")}
if Redis:get(SILV.."youtidche"..ChatId..IdUser) == UserId[1] then
link = "https://youtu.be/"..UserId[2]
title = UserId[1]
local nameuser = bot.getUser(IdUser)
if nameuser.first_name then
nameuser = "["..nameuser.first_name.."](tg://user?id="..nameuser.id..")"
else
nameuser = 'لا يوجد اسم'
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'تحميل صوت', data = title..'sound/'..UserId[2]}, {text = 'تحميل فيديو', data = title..'video/'..UserId[2]}, 
},
{
{text = chsourceNa, url = "t.me/"..chsource},
},
}
}

local txx = "⇜ اختار نوع التحميل الي تريده \n ["..title.."](http://youtu.be/"..UserId[2]..")\n\n|  𝐯𝐢𝐝𝐞𝐨 |  𝐦𝐩3 |"
bot.editMessageText(ChatId,Msg_id,txx, 'md', true, false, reply_markup)
else
bot.answerCallbackQuery(data.id, "⇜ الامر ليس لك", true)
end
end

if Text and Text:match('(.*)sound/(.*)') then
local UserId = {string.match(Text,"^(.*)sound/(.*)$")}
if Redis:get(SILV.."youtidche"..ChatId..IdUser) == UserId[1] then
link = "https://youtu.be/"..UserId[2]
title = UserId[1]
local se = http.request("https://dev-mohamamd.pantheonsite.io/youtubesh.php?search="..URL.escape(link))
local jsonyou = JSON.decode(se)
local timess = jsonyou.results[1].time
local musi = jsonyou.results[1].up
local phow = jsonyou.results[1].photo
local nameuser = bot.getUser(IdUser)
if nameuser.first_name then
nameuser = "["..timess.."](tg://user?id="..nameuser.id..")"
else
nameuser = 'لا يوجد اسم'
end
os.execute("wget -O image.jpg "..phow.."")
local thumb= './image.jpg'
os.execute("yt-dlp "..link.." --max-filesize 25M -f 251 -o '"..title..".mp3'")
local yosfile = io.open("./"..title..".mp3","r")
if yosfile then
bot.sendAudio(ChatId,Msg_id,'./'..title..'.mp3',"["..title.."](t.me/PST3B) - "..nameuser.."","md",nil,title,musi,thumb)
bot.deleteMessages(ChatId,{[1]= Msg_id})
sleep(2)
os.remove(""..title..".mp3")
os.remove("image.jpg")
Redis:del(SILV.."youtidche"..ChatId..IdUser)
Redis:del(SILV.."musiiy"..ChatId..IdUser)
else
Redis:del(SILV.."youtidche"..ChatId..IdUser)
Redis:del(SILV.."musiiy"..ChatId..IdUser)
return edit(ChatId,Msg_id,'\n⇜ لا استطيع تحميل اكثر من 25 ميغا',"md",true)
end
else
bot.answerCallbackQuery(data.id, "⇜ الامر ليس لك", true)
end
end
if Text and Text:match('(.*)video/(.*)') then
local UserId = {string.match(Text,"^(.*)video/(.*)$")}
if Redis:get(SILV.."youtidche"..ChatId..IdUser) == UserId[1] then
link = "https://youtu.be/"..UserId[2]
title = UserId[1]
local nameuser = bot.getUser(IdUser)
if nameuser.first_name then
nameuser = "["..nameuser.first_name.."](tg://user?id="..nameuser.id..")"
else
nameuser = 'لا يوجد اسم'
end
os.execute("yt-dlp "..link.." --max-filesize 50M -f 18 -o '"..title..".mp4'")
local yovfile = io.open("./"..title..".mp4","r")
if yovfile then
bot.sendVideo(ChatId,Msg_id,'./'..title..'.mp4',"["..title.."](t.me/PST3B)","md")
bot.deleteMessages(ChatId,{[1]= Msg_id})
sleep(2)
os.remove(""..title..".mp4")
Redis:del(SILV.."youtidche"..ChatId..IdUser)
else
Redis:del(SILV.."youtidche"..ChatId..IdUser)
return edit(ChatId,Msg_id,'\n⇜ لا استطيع تحميل اكثر من 50 ميغا',"md",true)
end
else
bot.answerCallbackQuery(data.id, "⇜ الامر ليس لك", true)
end
end

if Text == '/akabmute' then
local kk_id = Redis:get(SILV.."kk_Akab"..ChatId)
if Redis:sismember(SILV..'members_Ahkamm'..ChatId,IdUser) then
Redis:sadd(SILV.."SilentGroup:Group"..ChatId,kk_id) 
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = 'الغاء كتم', data = 'unakabmute'},},}}
local TextHelp = Reply_Status(kk_id,"⇜ تم كتمه في القروب لعدم تنفيذه العقاب").Reply
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
else
https.request("https://api.telegram.org/bot"..Token..'/answerCallbackQuery?callback_query_id='..data.id..'&text='..URL.escape('هذا الامر للمشاركين في لعبة العقاب')..'&show_alert=true')
end
end
if Text == '/unakabmute' then
local kk_id = Redis:get(SILV.."kk_Akab"..ChatId)
if Redis:sismember(SILV..'members_Ahkamm'..ChatId,IdUser) then
Redis:srem(SILV.."SilentGroup:Group"..ChatId,kk_id) 
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = chsourceNa, url = 't.me/'..chsource},},}}
local TextHelp = Reply_Status(kk_id,"⇜ تم كتمه في القروب").Reply
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
else
https.request("https://api.telegram.org/bot"..Token..'/answerCallbackQuery?callback_query_id='..data.id..'&text='..URL.escape('هذا الامر للمشاركين في لعبة العقاب')..'&show_alert=true')
end
end

if Text == '/ahkmute' then
local ff_id = Redis:get(SILV.."ff_Ahkam"..ChatId)
local kk_id = Redis:get(SILV.."kk_Ahkam"..ChatId)
if tonumber(IdUser) == tonumber(ff_id) then
Redis:sadd(SILV.."SilentGroup:Group"..ChatId,kk_id) 
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = 'الغاء كتم', data = 'unahkmute'},},}}
local TextHelp = Reply_Status(kk_id,"⇜ تم كتمه في القروب لعدم تنفيذه الاحكام").Reply
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
else
https.request("https://api.telegram.org/bot"..Token..'/answerCallbackQuery?callback_query_id='..data.id..'&text='..URL.escape('هذا الامر للمشاركين في لعبة الاحكام')..'&show_alert=true')
end
end
if Text == '/unahkmute' then
local ff_id = Redis:get(SILV.."ff_Ahkam"..ChatId)
local kk_id = Redis:get(SILV.."kk_Ahkam"..ChatId)
if tonumber(IdUser) == tonumber(ff_id) then
Redis:srem(SILV.."SilentGroup:Group"..ChatId,kk_id) 
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = 'اعادة الكتم', data = '/ahkmute'},},}}
local TextHelp = Reply_Status(kk_id,"⇜ تم كتمه في القروب").Reply
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
else
https.request("https://api.telegram.org/bot"..Token..'/answerCallbackQuery?callback_query_id='..data.id..'&text='..URL.escape('هذا الامر للمشاركين في لعبة الاحكام')..'&show_alert=true')
end
end

if Text == '/ahkkmute' then
local ff_id = Redis:get(SILV.."ff_Ahkkam"..ChatId)
local kk_id = Redis:get(SILV.."kk_Ahkkam"..ChatId)
if tonumber(IdUser) == tonumber(ff_id) then
Redis:sadd(SILV.."SilentGroup:Group"..ChatId,kk_id) 
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = 'الغاء كتم', data = 'unahkkmute'},},}}
local TextHelp = Reply_Status(kk_id,"⇜ تم كتمه في القروب لعدم تنفذه الاحكام").Reply
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
else
https.request("https://api.telegram.org/bot"..Token..'/answerCallbackQuery?callback_query_id='..data.id..'&text='..URL.escape('هذا الامر للفائز بلعبة الاحكام')..'&show_alert=true')
end
end
if Text == '/unahkkmute' then
local ff_id = Redis:get(SILV.."ff_Ahkkam"..ChatId)
local kk_id = Redis:get(SILV.."kk_Ahkkam"..ChatId)
if tonumber(IdUser) == tonumber(ff_id) then
Redis:srem(SILV.."SilentGroup:Group"..ChatId,kk_id) 
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = 'اعادة الكتم', data = '/ahkkmute'},},}}
local TextHelp = Reply_Status(kk_id,"⇜ تم الغاء كتمه في القروب").Reply
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
else
https.request("https://api.telegram.org/bot"..Token..'/answerCallbackQuery?callback_query_id='..data.id..'&text='..URL.escape('هذا الامر للفائز بلعبة الاحكام')..'&show_alert=true')
end
end

if Text == '/koomute' then
local kk_id = Redis:get(SILV.."kk_koorsi"..ChatId)
if Redis:sismember(SILV..'List_Koorsi'..ChatId,IdUser) then
Redis:sadd(SILV.."SilentGroup:Group"..ChatId,kk_id) 
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = 'الغاء كتم', data = 'unkoomute'},},}}
local TextHelp = Reply_Status(kk_id,"✧┊تم كتمه في المجمـوعـة لعـدم جوابـه اسئلـة كرسـي الاعتـراف").Reply
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
else
https.request("https://api.telegram.org/bot"..Token..'/answerCallbackQuery?callback_query_id='..data.id..'&text='..URL.escape('✧┊هـذا الامـر للفائـز بلعبـة الكـرسي')..'&show_alert=true')
end
end
if Text == '/unkoomute' then
local kk_id = Redis:get(SILV.."kk_koorsi"..ChatId)
if Redis:sismember(SILV..'List_Koorsi'..ChatId,IdUser) then
Redis:srem(SILV.."SilentGroup:Group"..ChatId,kk_id) 
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = '✧ اعـادة الكتـم ✧', data = '/koomute'},},}}
local TextHelp = Reply_Status(kk_id,"✧┊تم الغـاء كتمـه في المجمـوعـة").Reply
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
else
https.request("https://api.telegram.org/bot"..Token..'/answerCallbackQuery?callback_query_id='..data.id..'&text='..URL.escape('✧┊هـذا الامـر للفائـز بلعبـة الكـرسي')..'&show_alert=true')
end
end

if Text == '/soomute' then
local ff_id = Redis:get(SILV.."ff_saraha"..ChatId)
local kk_id = Redis:get(SILV.."kk_saraha"..ChatId)
if tonumber(IdUser) == tonumber(ff_id) then
Redis:sadd(SILV.."SilentGroup:Group"..ChatId,kk_id) 
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = 'الغاء كتم', data = 'unsoomute'},},}}
local TextHelp = Reply_Status(kk_id,"✧┊تم كتمه في المجمـوعـة لعـدم جوابـه اسئلـة لعبـة الصـراحه").Reply
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
else
https.request("https://api.telegram.org/bot"..Token..'/answerCallbackQuery?callback_query_id='..data.id..'&text='..URL.escape('✧┊هـذا الامـر للفائـز بلعبـة الصراحـه')..'&show_alert=true')
end
end
if Text == '/unsoomute' then
local ff_id = Redis:get(SILV.."ff_saraha"..ChatId)
local kk_id = Redis:get(SILV.."kk_saraha"..ChatId)
if tonumber(IdUser) == tonumber(ff_id) then
Redis:srem(SILV.."SilentGroup:Group"..ChatId,kk_id) 
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = '✧ اعـادة الكتـم ✧', data = '/soomute'},},}}
local TextHelp = Reply_Status(kk_id,"✧┊تم الغـاء كتمـه في المجمـوعـة").Reply
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
else
https.request("https://api.telegram.org/bot"..Token..'/answerCallbackQuery?callback_query_id='..data.id..'&text='..URL.escape('✧┊هـذا الامـر للفائـز بلعبـة الصراحـه')..'&show_alert=true')
end
end

if Text == '/akmute' then
local ff_id = Redis:get(SILV.."ff_Ahkam"..ChatId)
local kk_id = Redis:get(SILV.."kk_Ahkam"..ChatId)
if tonumber(IdUser) == tonumber(ff_id) then
Redis:sadd(SILV.."SilentGroup:Group"..ChatId,kk_id) 
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = 'الغاء كتم', data = 'unakmute'},},}}
local TextHelp = Reply_Status(kk_id,"✧┊تم كتمه في المجمـوعـة لعـدم تنفيـذه الاحكام").Reply
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
else
https.request("https://api.telegram.org/bot"..Token..'/answerCallbackQuery?callback_query_id='..data.id..'&text='..URL.escape('✧┊هـذا الامـر للفائـز بلعبـة احكـام')..'&show_alert=true')
end
end
if Text == '/unakmute' then
local ff_id = Redis:get(SILV.."ff_Ahkam"..ChatId)
local kk_id = Redis:get(SILV.."kk_Ahkam"..ChatId)
if tonumber(IdUser) == tonumber(ff_id) then
Redis:srem(SILV.."SilentGroup:Group"..ChatId,kk_id) 
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = '˹𓌗 قنـاة السـورس 𓌗.', url = 't.me/z_zzz8'},},}}
local TextHelp = Reply_Status(kk_id,"✧┊تم الغـاء كتمـه في المجمـوعـة").Reply
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
else
https.request("https://api.telegram.org/bot"..Token..'/answerCallbackQuery?callback_query_id='..data.id..'&text='..URL.escape('✧┊هـذا الامـر للفائـز بلعبـة احكـام')..'&show_alert=true')
end
end

if Text == '/Aktmooh' then
if not Redis:sismember(SILV..'List_Aktooh'..ChatId,IdUser) then 
Redis:sadd(SILV..'List_Aktooh'..ChatId,IdUser)
Redis:setex(SILV.."Witting_StartGameAk"..ChatId,1400,true)
local list = Redis:smembers(SILV..'List_Aktooh'..ChatId) 
if #list == 2 then
for k,v in pairs(list) do
if k == 1 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).id
name1 = '- ['..FlterBio(Nname)..'](tg://user?id='..Uname..')'
end
if k == 2 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).id
name2 = '- ['..FlterBio(Nname)..'](tg://user?id='..Uname..')'
end
if k == #list then
local message = '*✧┊عـدد المصـوتين ⇜*'..#list..' \n*✧┊اسمـاء المصـوتين ⇩\n'..name1..'*\n'..name2
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = '✧ اضغط لـ التصـويت ✧', data = '/Aktmooh'},},}}
edit(ChatId,Msg_id,message, 'md', true, false, reply_markup)
end
end
elseif #list == 3 then
for k,v in pairs(list) do
if k == 1 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).id
name1 = '- ['..FlterBio(Nname)..'](tg://user?id='..Uname..')'
end
if k == 2 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).id
name2 = '- ['..FlterBio(Nname)..'](tg://user?id='..Uname..')'
end
if k == 3 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).id
name3 = '- ['..FlterBio(Nname)..'](tg://user?id='..Uname..')'
end
if k == #list then
local Ak_Tm = Redis:get(SILV.."Ak_Tmooh"..ChatId)
local ban = bot.getUser(Ak_Tm)
local AkName = '['..ban.first_name..'](tg://user?id='..ban.id..')' or 'لا يوجد اسم'
local message = '*✧┊عـدد المصـوتين ⇜*'..#list..' \n*✧┊اسمـاء المصـوتين ⇩*\n'..name1..'\n'..name2..'\n'..name3..'\n\n*✧┊المستخـدم* '..AkName..'\n*✧┊تم كتمـه .. بنجـاح ✓*'
Redis:sadd(SILV.."SilentGroup:Group"..ChatId,Ak_Tm) 
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = '✧ الغـاء الـ كتـم ✧', data = '/Unaktmooh'},},}}
edit(ChatId,Msg_id,message, 'md', true, false, reply_markup)
end
end
end
else
return bot.answerCallbackQuery(data.id, "✧┊انت مصـوت مسبقـاً .. على الشخص", true)
end
end
---------------------- Dev SILVER ----------------------
if Text == '/Unaktmooh' and Redis:get(SILV.."Witting_StartGameAk"..ChatId) then
local raeaktooh = Redis:get(SILV.."raeaktooh"..ChatId)
if tonumber(IdUser) == tonumber(raeaktooh) then
local list = Redis:smembers(SILV..'List_Aktooh'..ChatId) 
local Ak_Tm = Redis:get(SILV.."Ak_Tmooh"..ChatId)
local ban = bot.getUser(Ak_Tm)
local AkName = '['..ban.first_name..'](tg://user?id='..ban.id..')' or 'لا يوجد اسم'
local zelzzal = '*✧┊المستخـدم* '..AkName..'\n*✧┊تم الغـاء كتمـه .. بنجـاح ✓*'
Redis:srem(SILV.."SilentGroup:Group"..ChatId,Ak_Tm)
Redis:srem(SILV..'List_Aktooh'..ChatId,UserName) 
Redis:del(SILV..'raeaktooh'..ChatId) 
Redis:del(SILV..'List_Aktooh'..ChatId) 
Redis:del(SILV.."Witting_StartGameAk"..ChatId)
Redis:del(SILV.."Start_Aktmooh"..ChatId)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = '˹𓌗 قنـاة البـوت 𓌗.', url = 't.me/'..chsource..''},},}}
edit(ChatId,Msg_id,zelzzal, 'md', true, false, reply_markup)
else
return bot.answerCallbackQuery(data.id, "✧┊عـذراً .. الامـر ليـس لـك", true)
end
end
---------------------- Dev SILVER ----------------------
if Text == '/joineahkam' then
if not Redis:sismember(SILV..'List_Ahkkam'..ChatId,IdUser) then 
Redis:sadd(SILV..'List_Ahkkam'..ChatId,IdUser)
Redis:setex(SILV.."Witting_StartGameeh"..ChatId,1400,true)
local list = Redis:smembers(SILV..'List_Ahkkam'..ChatId) 
if #list == 2 then
local UserInfo = bot.getUser(IdUser)
local Teext = '- ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..IdUser..')'
local zzllzz = '*✧┊عـدد اللاعبيـن ⇜*'..#list..' \n*✧┊لقـد انضـم للعبـة احكـام ⇩*\n'..Teext
for k,v in pairs(list) do
if k == 1 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id = "t.me/"..Uname
name1 = FlterBio(Nname)
end
if k == 2 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id1 = "t.me/"..Uname
name2 = FlterBio(Nname)
end
if k == #list then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = name1, url = id},},
{{text = name2, url = id1},},
{{text = '✧ اضغط للانضمام الى اللعبه ✧', data = '/joineahkam'},},}}
edit(ChatId,Msg_id,zzllzz, 'md', true, false, reply_markup)
end
end
elseif #list == 3 then
local UserInfo = bot.getUser(IdUser)
local Teext = '- ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..IdUser..')'
local message = '*✧┊عـدد اللاعبيـن ⇜*'..#list..' \n*✧┊لقـد انضـم للعبـة احكـام ⇩*\n'..Teext
for k,v in pairs(list) do
if k == 1 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id = "t.me/"..Uname
name1 = FlterBio(Nname)
end
if k == 2 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id1 = "t.me/"..Uname
name2 = FlterBio(Nname)
end
if k == 3 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id2 = "t.me/"..Uname
name3 = FlterBio(Nname)
end
if k == #list then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = name1, url = id},},
{{text = name2, url = id1},},
{{text = name3, url = id2},},
{{text = '✧ اضغط للانضمام الى اللعبه ✧', data = '/joineahkam'},},
{{text = '✧ او اضغط لبدء اللعبه ✧', data = '/startahkam'},},}}
edit(ChatId,Msg_id,message, 'md', true, false, reply_markup)
end
end
elseif #list == 4 then
local UserInfo = bot.getUser(IdUser)
local Teext = '- ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..IdUser..')'
local message = '*✧┊عـدد اللاعبيـن ⇜*'..#list..' \n*✧┊لقـد انضـم للعبـة احكـام ⇩*\n'..Teext
for k,v in pairs(list) do
if k == 1 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id = "t.me/"..Uname
name1 = FlterBio(Nname)
end
if k == 2 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id1 = "t.me/"..Uname
name2 = FlterBio(Nname)
end
if k == 3 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id2 = "t.me/"..Uname
name3 = FlterBio(Nname)
end
if k == 4 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id3 = "t.me/"..Uname
name4 = FlterBio(Nname)
end
if k == #list then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = name1, url = id},},
{{text = name2, url = id1},},
{{text = name3, url = id2},},
{{text = name4, url = id3},},
{{text = '✧ اضغط للانضمام الى اللعبه ✧', data = '/joineahkam'},},
{{text = '✧ او اضغط لبدء اللعبه ✧', data = '/startahkam'},},}}
edit(ChatId,Msg_id,message, 'md', true, false, reply_markup)
end
end
elseif #list == 5 then
local UserInfo = bot.getUser(IdUser)
local Teext = '- ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..IdUser..')'
local message = '*✧┊عـدد اللاعبيـن ⇜*'..#list..' \n*✧┊لقـد انضـم للعبـة احكـام ⇩*\n'..Teext
for k,v in pairs(list) do
if k == 1 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id = "t.me/"..Uname
name1 = FlterBio(Nname)
end
if k == 2 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id1 = "t.me/"..Uname
name2 = FlterBio(Nname)
end
if k == 3 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id2 = "t.me/"..Uname
name3 = FlterBio(Nname)
end
if k == 4 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id3 = "t.me/"..Uname
name4 = FlterBio(Nname)
end
if k == 5 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id4 = "t.me/"..Uname
name5 = FlterBio(Nname)
end
if k == #list then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = name1, url = id},},
{{text = name2, url = id1},},
{{text = name3, url = id2},},
{{text = name4, url = id3},},
{{text = name5, url = id4},},
{{text = '✧ اضغط للانضمام الى اللعبه ✧', data = '/joineahkam'},},
{{text = '✧ او اضغط لبدء اللعبه ✧', data = '/startahkam'},},}}
edit(ChatId,Msg_id,message, 'md', true, false, reply_markup)
end
end
elseif #list == 6 then
local UserInfo = bot.getUser(IdUser)
local Teext = '- ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..IdUser..')'
local message = '*✧┊عـدد اللاعبيـن ⇜*'..#list..' \n*✧┊لقـد انضـم للعبـة احكـام ⇩*\n'..Teext
for k,v in pairs(list) do
if k == 1 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id = "t.me/"..Uname
name1 = FlterBio(Nname)
end
if k == 2 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id1 = "t.me/"..Uname
name2 = FlterBio(Nname)
end
if k == 3 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id2 = "t.me/"..Uname
name3 = FlterBio(Nname)
end
if k == 4 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id3 = "t.me/"..Uname
name4 = FlterBio(Nname)
end
if k == 5 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id4 = "t.me/"..Uname
name5 = FlterBio(Nname)
end
if k == 6 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id5 = "t.me/"..Uname
name6 = FlterBio(Nname)
end
if k == #list then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = name1, url = id},},
{{text = name2, url = id1},},
{{text = name3, url = id2},},
{{text = name4, url = id3},},
{{text = name5, url = id4},},
{{text = name6, url = id5},},
{{text = '✧ اضغط للانضمام الى اللعبه ✧', data = '/joineahkam'},},
{{text = '✧ او اضغط لبدء اللعبه ✧', data = '/startahkam'},},}}
edit(ChatId,Msg_id,message, 'md', true, false, reply_markup)
end
end
elseif #list == 7 then
local UserInfo = bot.getUser(IdUser)
local Teext = '- ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..IdUser..')'
local message = '*✧┊عـدد اللاعبيـن ⇜*'..#list..' \n*✧┊لقـد انضـم للعبـة احكـام ⇩*\n'..Teext
for k,v in pairs(list) do
if k == 1 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id = "t.me/"..Uname
name1 = FlterBio(Nname)
end
if k == 2 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id1 = "t.me/"..Uname
name2 = FlterBio(Nname)
end
if k == 3 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id2 = "t.me/"..Uname
name3 = FlterBio(Nname)
end
if k == 4 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id3 = "t.me/"..Uname
name4 = FlterBio(Nname)
end
if k == 5 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id4 = "t.me/"..Uname
name5 = FlterBio(Nname)
end
if k == 6 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id5 = "t.me/"..Uname
name6 = FlterBio(Nname)
end
if k == 7 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id6 = "t.me/"..Uname
name7 = FlterBio(Nname)
end
if k == #list then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = name1, url = id},},
{{text = name2, url = id1},},
{{text = name3, url = id2},},
{{text = name4, url = id3},},
{{text = name5, url = id4},},
{{text = name6, url = id5},},
{{text = name7, url = id6},},
{{text = '✧ اضغط للانضمام الى اللعبه ✧', data = '/joineahkam'},},
{{text = '✧ الان اضغط لبدء اللعبه ✧', data = '/startahkam'},},}}
edit(ChatId,Msg_id,message, 'md', true, false, reply_markup)
end
end
elseif #list == 8 then
local UserInfo = bot.getUser(IdUser)
local Teext = '- ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..IdUser..')'
local message = '*✧┊عـدد اللاعبيـن ⇜*'..#list..' \n*✧┊لقـد انضـم للعبـة احكـام ⇩*\n'..Teext
for k,v in pairs(list) do
if k == 1 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id = "t.me/"..Uname
name1 = FlterBio(Nname)
end
if k == 2 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id1 = "t.me/"..Uname
name2 = FlterBio(Nname)
end
if k == 3 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id2 = "t.me/"..Uname
name3 = FlterBio(Nname)
end
if k == 4 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id3 = "t.me/"..Uname
name4 = FlterBio(Nname)
end
if k == 5 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id4 = "t.me/"..Uname
name5 = FlterBio(Nname)
end
if k == 6 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id5 = "t.me/"..Uname
name6 = FlterBio(Nname)
end
if k == 7 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id6 = "t.me/"..Uname
name7 = FlterBio(Nname)
end
if k == 8 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id7 = "t.me/"..Uname
name8 = FlterBio(Nname)
end
if k == #list then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = name1, url = id},},
{{text = name2, url = id1},},
{{text = name3, url = id2},},
{{text = name4, url = id3},},
{{text = name5, url = id4},},
{{text = name6, url = id5},},
{{text = name7, url = id6},},
{{text = name8, url = id7},},
{{text = '✧ اضغط للانضمام الى اللعبه ✧', data = '/joineahkam'},},
{{text = '✧ الان اضغط لبدء اللعبه ✧', data = '/startahkam'},},}}
edit(ChatId,Msg_id,message, 'md', true, false, reply_markup)
end
end
elseif #list == 9 then
local UserInfo = bot.getUser(IdUser)
local Teext = '- ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..IdUser..')'
local message = '*✧┊عـدد اللاعبيـن ⇜*'..#list..' \n*✧┊لقـد انضـم للعبـة احكـام ⇩*\n'..Teext
for k,v in pairs(list) do
if k == 1 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id = "t.me/"..Uname
name1 = FlterBio(Nname)
end
if k == 2 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id1 = "t.me/"..Uname
name2 = FlterBio(Nname)
end
if k == 3 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id2 = "t.me/"..Uname
name3 = FlterBio(Nname)
end
if k == 4 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id3 = "t.me/"..Uname
name4 = FlterBio(Nname)
end
if k == 5 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id4 = "t.me/"..Uname
name5 = FlterBio(Nname)
end
if k == 6 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id5 = "t.me/"..Uname
name6 = FlterBio(Nname)
end
if k == 7 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id6 = "t.me/"..Uname
name7 = FlterBio(Nname)
end
if k == 8 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id7 = "t.me/"..Uname
name8 = FlterBio(Nname)
end
if k == 9 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id8 = "t.me/"..Uname
name9 = FlterBio(Nname)
end
if k == #list then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = name1, url = id},},
{{text = name2, url = id1},},
{{text = name3, url = id2},},
{{text = name4, url = id3},},
{{text = name5, url = id4},},
{{text = name6, url = id5},},
{{text = name7, url = id6},},
{{text = name8, url = id7},},
{{text = name9, url = id8},},
{{text = '✧ اضغط للانضمام الى اللعبه ✧', data = '/joineahkam'},},
{{text = '✧ الان اضغط لبدء اللعبه ✧', data = '/startahkam'},},}}
edit(ChatId,Msg_id,message, 'md', true, false, reply_markup)
end
end
elseif #list == 10 then
local message = '*✧┊لقـد وصـل اللاعبيـن للحـد الاقصـى\n✧┊المشتـركيـن الـ10 فـي لعبـة احكـام هـم :*' 
for k,v in pairs(list) do
if k == 1 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id = "t.me/"..Uname
name1 = FlterBio(Nname)
end
if k == 2 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id1 = "t.me/"..Uname
name2 = FlterBio(Nname)
end
if k == 3 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id2 = "t.me/"..Uname
name3 = FlterBio(Nname)
end
if k == 4 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id3 = "t.me/"..Uname
name4 = FlterBio(Nname)
end
if k == 5 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id4 = "t.me/"..Uname
name5 = FlterBio(Nname)
end
if k == 6 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id5 = "t.me/"..Uname
name6 = FlterBio(Nname)
end
if k == 7 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id6 = "t.me/"..Uname
name7 = FlterBio(Nname)
end
if k == 8 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id7 = "t.me/"..Uname
name8 = FlterBio(Nname)
end
if k == 9 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id8 = "t.me/"..Uname
name9 = FlterBio(Nname)
end
if k == 10 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id9 = "t.me/"..Uname
name10 = FlterBio(Nname)
end
if k == #list then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = name1, url = id},},
{{text = name2, url = id1},},
{{text = name3, url = id2},},
{{text = name4, url = id3},},
{{text = name5, url = id4},},
{{text = name6, url = id5},},
{{text = name7, url = id6},},
{{text = name8, url = id7},},
{{text = name9, url = id8},},
{{text = name10, url = id9},},
{{text = '✧ الان اضغط لبدء اللعبه ✧', data = '/startahkam'},},}}
return edit(ChatId,Msg_id,message, 'md', true, false, reply_markup)
end
end
end
else
return bot.answerCallbackQuery(data.id, "✧┊انت منضـم مسبقـاً .. الـى اللعبـه", true)
end
end
---------------------- Dev SILVER ----------------------
if Text == '/startahkam' and Redis:get(SILV.."Witting_StartGameeh"..ChatId) then
local rarahkam = Redis:get(SILV.."raeahkkam"..ChatId)
if tonumber(IdUser) == tonumber(rarahkam) then
local list = Redis:smembers(SILV..'List_Ahkkam'..ChatId) 
local UserName = list[math.random(#list)]
local UserId_Info = bot.getUser(UserName)
if UserId_Info.username and UserId_Info.username ~= "" then
ls = '['..UserId_Info.first_name..'](tg://user?id='..UserName..')'
else
ls = '['..UserId_Info.first_name..'](tg://user?id='..UserName..')'
end
Redis:set(SILV.."kk_Ahkkam"..ChatId,UserId_Info.id)
Redis:srem(SILV..'List_Ahkkam'..ChatId,UserName) 
local liiist = Redis:smembers(SILV..'List_Ahkkam'..ChatId) 
local User2Name = liiist[math.random(#liiist)]
local UserId2_Info = bot.getUser(User2Name)
if UserId2_Info.username and UserId2_Info.username ~= "" then
Hs = '['..UserId2_Info.first_name..'](tg://user?id='..User2Name..')'
else
Hs = '['..UserId2_Info.first_name..'](tg://user?id='..User2Name..')'
end
Redis:set(SILV.."ff_Ahkkam"..ChatId,UserId2_Info.id)
local GetLike = Redis:incrby(SILV.."Num:Add:Ahkam"..ChatId..UserId2_Info.id, 5) 
Redis:hset(SILV..':GroupUserCountAhkam:'..ChatId,UserId2_Info.id,GetLike)
local UserrInfo = bot.getUser(User2Name) 
if UserrInfo.first_name then
NameLUser = UserrInfo.first_name
else
NameLUser = UserrInfo.first_name
end
NameLUser = NameLUser
NameLUser = NameLUser:gsub("]","")
NameLUser = NameLUser:gsub("[[]","")
Redis:hset(SILV..':GroupAhkamNameUser:'..ChatId,UserrInfo.id,NameLUser)
Redis:del(SILV..'raeahkkam'..ChatId) 
Redis:del(SILV..'List_Ahkkam'..ChatId) 
Redis:del(SILV.."Witting_StartGameeh"..ChatId)
Redis:del(SILV.."Start_Ahkkam"..ChatId)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = '✧ كتـم الخـاسر ✧', data = '/ahkkmute'},},}}
return edit(ChatId,Msg_id,'*⚖┊تم إختيار الشخـص ⇜* '..ls..'\n*👩🏻‍⚖┊ليتـم الحكـم عليـه من قبـل ⇜* '..Hs..'\n\n*🎁┊وتم اضـافـة 5 نقـاط للحـاكـم\n⛓┊تستطيـع كتم المتهـم اذ لم ينفـذ الحكـم*', 'md', true, false, reply_markup)
else
return bot.answerCallbackQuery(data.id, "✧┊الامـر للي بـدأ اللعبـه ...", true)
end
end
---------------------- Dev SILVER ----------------------
if Text == '/Koorsy' then
if not Redis:sismember(SILV..'List_Koorsi'..ChatId,IdUser) then 
Redis:sadd(SILV..'List_Koorsi'..ChatId,IdUser)
Redis:setex(SILV.."Witting_StartGameek"..ChatId,1400,true)
local list = Redis:smembers(SILV..'List_Koorsi'..ChatId) 
if #list == 2 then
local UserInfo = bot.getUser(IdUser)
local Teext = '- ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..IdUser..')'
local zzllzz = '*✧┊عـدد اللاعبيـن ⇜*'..#list..' \n*✧┊لقـد انضـم للعبـة كرسـي ⇩*\n'..Teext
for k,v in pairs(list) do
if k == 1 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id = "t.me/"..Uname
name1 = FlterBio(Nname)
end
if k == 2 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id1 = "t.me/"..Uname
name2 = FlterBio(Nname)
end
if k == #list then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = name1, url = id},},
{{text = name2, url = id1},},
{{text = '✧ اضغط للانضمام الى اللعبه ✧', data = '/Koorsy'},},}}
edit(ChatId,Msg_id,zzllzz, 'md', true, false, reply_markup)
end
end
elseif #list == 3 then
local UserInfo = bot.getUser(IdUser)
local Teext = '- ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..IdUser..')'
local message = '*✧┊عـدد اللاعبيـن ⇜*'..#list..' \n*✧┊لقـد انضـم للعبـة كرسـي ⇩*\n'..Teext
for k,v in pairs(list) do
if k == 1 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id = "t.me/"..Uname
name1 = FlterBio(Nname)
end
if k == 2 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id1 = "t.me/"..Uname
name2 = FlterBio(Nname)
end
if k == 3 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id2 = "t.me/"..Uname
name3 = FlterBio(Nname)
end
if k == #list then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = name1, url = id},},
{{text = name2, url = id1},},
{{text = name3, url = id2},},
{{text = '✧ اضغط للانضمام الى اللعبه ✧', data = '/Koorsy'},},
{{text = '✧ او اضغط لبدء اللعبه ✧', data = '/startkoorsi'},},}}
edit(ChatId,Msg_id,message, 'md', true, false, reply_markup)
end
end
elseif #list == 4 then
local UserInfo = bot.getUser(IdUser)
local Teext = '- ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..IdUser..')'
local message = '*✧┊عـدد اللاعبيـن ⇜*'..#list..' \n*✧┊لقـد انضـم للعبـة كرسـي ⇩*\n'..Teext
for k,v in pairs(list) do
if k == 1 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id = "t.me/"..Uname
name1 = FlterBio(Nname)
end
if k == 2 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id1 = "t.me/"..Uname
name2 = FlterBio(Nname)
end
if k == 3 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id2 = "t.me/"..Uname
name3 = FlterBio(Nname)
end
if k == 4 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id3 = "t.me/"..Uname
name4 = FlterBio(Nname)
end
if k == #list then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = name1, url = id},},
{{text = name2, url = id1},},
{{text = name3, url = id2},},
{{text = name4, url = id3},},
{{text = '✧ اضغط للانضمام الى اللعبه ✧', data = '/Koorsy'},},
{{text = '✧ او اضغط لبدء اللعبه ✧', data = '/startkoorsi'},},}}
edit(ChatId,Msg_id,message, 'md', true, false, reply_markup)
end
end
elseif #list == 5 then
local UserInfo = bot.getUser(IdUser)
local Teext = '- ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..IdUser..')'
local message = '*✧┊عـدد اللاعبيـن ⇜*'..#list..' \n*✧┊لقـد انضـم للعبـة كرسـي ⇩*\n'..Teext
for k,v in pairs(list) do
if k == 1 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id = "t.me/"..Uname
name1 = FlterBio(Nname)
end
if k == 2 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id1 = "t.me/"..Uname
name2 = FlterBio(Nname)
end
if k == 3 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id2 = "t.me/"..Uname
name3 = FlterBio(Nname)
end
if k == 4 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id3 = "t.me/"..Uname
name4 = FlterBio(Nname)
end
if k == 5 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id4 = "t.me/"..Uname
name5 = FlterBio(Nname)
end
if k == #list then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = name1, url = id},},
{{text = name2, url = id1},},
{{text = name3, url = id2},},
{{text = name4, url = id3},},
{{text = name5, url = id4},},
{{text = '✧ اضغط للانضمام الى اللعبه ✧', data = '/Koorsy'},},
{{text = '✧ او اضغط لبدء اللعبه ✧', data = '/startkoorsi'},},}}
edit(ChatId,Msg_id,message, 'md', true, false, reply_markup)
end
end
elseif #list == 6 then
local UserInfo = bot.getUser(IdUser)
local Teext = '- ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..IdUser..')'
local message = '*✧┊عـدد اللاعبيـن ⇜*'..#list..' \n*✧┊لقـد انضـم للعبـة كرسـي ⇩*\n'..Teext
for k,v in pairs(list) do
if k == 1 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id = "t.me/"..Uname
name1 = FlterBio(Nname)
end
if k == 2 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id1 = "t.me/"..Uname
name2 = FlterBio(Nname)
end
if k == 3 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id2 = "t.me/"..Uname
name3 = FlterBio(Nname)
end
if k == 4 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id3 = "t.me/"..Uname
name4 = FlterBio(Nname)
end
if k == 5 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id4 = "t.me/"..Uname
name5 = FlterBio(Nname)
end
if k == 6 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id5 = "t.me/"..Uname
name6 = FlterBio(Nname)
end
if k == #list then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = name1, url = id},},
{{text = name2, url = id1},},
{{text = name3, url = id2},},
{{text = name4, url = id3},},
{{text = name5, url = id4},},
{{text = name6, url = id5},},
{{text = '✧ اضغط للانضمام الى اللعبه ✧', data = '/Koorsy'},},
{{text = '✧ او اضغط لبدء اللعبه ✧', data = '/startkoorsi'},},}}
edit(ChatId,Msg_id,message, 'md', true, false, reply_markup)
end
end
elseif #list == 7 then
local UserInfo = bot.getUser(IdUser)
local Teext = '- ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..IdUser..')'
local message = '*✧┊عـدد اللاعبيـن ⇜*'..#list..' \n*✧┊لقـد انضـم للعبـة كرسـي ⇩*\n'..Teext
for k,v in pairs(list) do
if k == 1 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id = "t.me/"..Uname
name1 = FlterBio(Nname)
end
if k == 2 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id1 = "t.me/"..Uname
name2 = FlterBio(Nname)
end
if k == 3 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id2 = "t.me/"..Uname
name3 = FlterBio(Nname)
end
if k == 4 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id3 = "t.me/"..Uname
name4 = FlterBio(Nname)
end
if k == 5 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id4 = "t.me/"..Uname
name5 = FlterBio(Nname)
end
if k == 6 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id5 = "t.me/"..Uname
name6 = FlterBio(Nname)
end
if k == 7 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id6 = "t.me/"..Uname
name7 = FlterBio(Nname)
end
if k == #list then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = name1, url = id},},
{{text = name2, url = id1},},
{{text = name3, url = id2},},
{{text = name4, url = id3},},
{{text = name5, url = id4},},
{{text = name6, url = id5},},
{{text = name7, url = id6},},
{{text = '✧ اضغط للانضمام الى اللعبه ✧', data = '/Koorsy'},},
{{text = '✧ الان اضغط لبدء اللعبه ✧', data = '/startkoorsi'},},}}
edit(ChatId,Msg_id,message, 'md', true, false, reply_markup)
end
end
elseif #list == 8 then
local UserInfo = bot.getUser(IdUser)
local Teext = '- ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..IdUser..')'
local message = '*✧┊عـدد اللاعبيـن ⇜*'..#list..' \n*✧┊لقـد انضـم للعبـة كرسـي ⇩*\n'..Teext
for k,v in pairs(list) do
if k == 1 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id = "t.me/"..Uname
name1 = FlterBio(Nname)
end
if k == 2 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id1 = "t.me/"..Uname
name2 = FlterBio(Nname)
end
if k == 3 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id2 = "t.me/"..Uname
name3 = FlterBio(Nname)
end
if k == 4 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id3 = "t.me/"..Uname
name4 = FlterBio(Nname)
end
if k == 5 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id4 = "t.me/"..Uname
name5 = FlterBio(Nname)
end
if k == 6 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id5 = "t.me/"..Uname
name6 = FlterBio(Nname)
end
if k == 7 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id6 = "t.me/"..Uname
name7 = FlterBio(Nname)
end
if k == 8 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id7 = "t.me/"..Uname
name8 = FlterBio(Nname)
end
if k == #list then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = name1, url = id},},
{{text = name2, url = id1},},
{{text = name3, url = id2},},
{{text = name4, url = id3},},
{{text = name5, url = id4},},
{{text = name6, url = id5},},
{{text = name7, url = id6},},
{{text = name8, url = id7},},
{{text = '✧ اضغط للانضمام الى اللعبه ✧', data = '/Koorsy'},},
{{text = '✧ الان اضغط لبدء اللعبه ✧', data = '/startkoorsi'},},}}
edit(ChatId,Msg_id,message, 'md', true, false, reply_markup)
end
end
elseif #list == 9 then
local UserInfo = bot.getUser(IdUser)
local Teext = '- ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..IdUser..')'
local message = '*✧┊عـدد اللاعبيـن ⇜*'..#list..' \n*✧┊لقـد انضـم للعبـة كرسـي ⇩*\n'..Teext
for k,v in pairs(list) do
if k == 1 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id = "t.me/"..Uname
name1 = FlterBio(Nname)
end
if k == 2 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id1 = "t.me/"..Uname
name2 = FlterBio(Nname)
end
if k == 3 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id2 = "t.me/"..Uname
name3 = FlterBio(Nname)
end
if k == 4 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id3 = "t.me/"..Uname
name4 = FlterBio(Nname)
end
if k == 5 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id4 = "t.me/"..Uname
name5 = FlterBio(Nname)
end
if k == 6 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id5 = "t.me/"..Uname
name6 = FlterBio(Nname)
end
if k == 7 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id6 = "t.me/"..Uname
name7 = FlterBio(Nname)
end
if k == 8 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id7 = "t.me/"..Uname
name8 = FlterBio(Nname)
end
if k == 9 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id8 = "t.me/"..Uname
name9 = FlterBio(Nname)
end
if k == #list then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = name1, url = id},},
{{text = name2, url = id1},},
{{text = name3, url = id2},},
{{text = name4, url = id3},},
{{text = name5, url = id4},},
{{text = name6, url = id5},},
{{text = name7, url = id6},},
{{text = name8, url = id7},},
{{text = name9, url = id8},},
{{text = '✧ اضغط للانضمام الى اللعبه ✧', data = '/Koorsy'},},
{{text = '✧ الان اضغط لبدء اللعبه ✧', data = '/startkoorsi'},},}}
edit(ChatId,Msg_id,message, 'md', true, false, reply_markup)
end
end
elseif #list == 10 then
local message = '*✧┊لقـد وصـل اللاعبيـن للحـد الاقصـى\n✧┊المشتـركيـن الـ10 فـي لعبـة كرسـي هـم :*' 
for k,v in pairs(list) do
if k == 1 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id = "t.me/"..Uname
name1 = FlterBio(Nname)
end
if k == 2 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id1 = "t.me/"..Uname
name2 = FlterBio(Nname)
end
if k == 3 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id2 = "t.me/"..Uname
name3 = FlterBio(Nname)
end
if k == 4 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id3 = "t.me/"..Uname
name4 = FlterBio(Nname)
end
if k == 5 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id4 = "t.me/"..Uname
name5 = FlterBio(Nname)
end
if k == 6 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id5 = "t.me/"..Uname
name6 = FlterBio(Nname)
end
if k == 7 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id6 = "t.me/"..Uname
name7 = FlterBio(Nname)
end
if k == 8 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id7 = "t.me/"..Uname
name8 = FlterBio(Nname)
end
if k == 9 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id8 = "t.me/"..Uname
name9 = FlterBio(Nname)
end
if k == 10 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id9 = "t.me/"..Uname
name10 = FlterBio(Nname)
end
if k == #list then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = name1, url = id},},
{{text = name2, url = id1},},
{{text = name3, url = id2},},
{{text = name4, url = id3},},
{{text = name5, url = id4},},
{{text = name6, url = id5},},
{{text = name7, url = id6},},
{{text = name8, url = id7},},
{{text = name9, url = id8},},
{{text = name10, url = id9},},
{{text = '✧ الان اضغط لبدء اللعبه ✧', data = '/startkoorsi'},},}}
return edit(ChatId,Msg_id,message, 'md', true, false, reply_markup)
end
end
end
else
return bot.answerCallbackQuery(data.id, "✧┊انت منضـم مسبقـاً .. الـى اللعبـه", true)
end
end
---------------------- Dev ----------------------
if Text == '/startkoorsi' and Redis:get(SILV.."Witting_StartGameek"..ChatId) then
local rarahkam = Redis:get(SILV.."raekoorsi"..ChatId)
if tonumber(IdUser) == tonumber(rarahkam) then
local list = Redis:smembers(SILV..'List_Koorsi'..ChatId) 
local UserName = list[math.random(#list)]
local UserId_Info = bot.getUser(UserName)
local tskoorsi = math.random(1,9999999999999)
local testkoorsi = math.random(1,9999999999999)
Redis:set(SILV.."koorsi:"..testkoorsi.."chat_id", ChatId)
Redis:set(SILV.."koorsi:"..testkoorsi.."to", UserId_Info.id)
Redis:set(SILV.."koorsi:"..testkoorsi.."msg_id",Msg_id)
if UserId_Info.username and UserId_Info.username ~= "" then
ls = '['..UserId_Info.first_name..'](tg://user?id='..UserName..')'
else
ls = '['..UserId_Info.first_name..'](tg://user?id='..UserName..')'
end
Redis:set(SILV.."kk_koorsi"..ChatId,UserId_Info.id)
Redis:srem(SILV..'List_Koorsi'..ChatId,UserName) 
Redis:del(SILV..'raekoorsi'..ChatId) 
Redis:del(SILV..'List_Koorsi'..ChatId) 
Redis:del(SILV.."Witting_StartGameek"..ChatId)
Redis:del(SILV.."Start_Koorsi"..ChatId)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '✧ إضغـط لارسـال السـؤال 📬✧', url = 't.me/'..UserBot..'?start=koorsi'..testkoorsi..''}, 
},
}
}
return edit(ChatId,Msg_id,"*✧┊تـم اختيـار ⇜(*  "..ls.."  *) لـ كرسـي الاعتـراف 🪑*\n*✧┊وتـم اختيـار بقية اللاعبين كـ فائزين\n✧┊لديكـم فقـط 10 اسئلـه لـ طرحهـا على الخـاسـر*", 'md', true, false, reply_markup)
else
return bot.answerCallbackQuery(data.id, "✧┊الامـر للي بـدأ اللعبـه ...", true)
end
end
---------------------- صراحه ----------------------
if Text == '/Sarraha' then
if not Redis:sismember(SILV..'List_Saraha'..ChatId,IdUser) then 
Redis:sadd(SILV..'List_Saraha'..ChatId,IdUser)
Redis:setex(SILV.."Witting_StartGameS"..ChatId,1400,true)
local list = Redis:smembers(SILV..'List_Saraha'..ChatId) 
if #list == 2 then
local UserInfo = bot.getUser(IdUser)
local Teext = '- ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..IdUser..')'
local zzllzz = '*✧┊عـدد اللاعبيـن ⇜*'..#list..' \n*✧┊لقـد انضـم للعبـة كرسـي ⇩*\n'..Teext
for k,v in pairs(list) do
if k == 1 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id = "t.me/"..Uname
name1 = FlterBio(Nname)
end
if k == 2 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id1 = "t.me/"..Uname
name2 = FlterBio(Nname)
end
if k == #list then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = name1, url = id},},
{{text = name2, url = id1},},
{{text = '✧ اضغط للانضمام الى اللعبه ✧', data = '/Sarraha'},},}}
edit(ChatId,Msg_id,zzllzz, 'md', true, false, reply_markup)
end
end
elseif #list == 3 then
local UserInfo = bot.getUser(IdUser)
local Teext = '- ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..IdUser..')'
local message = '*✧┊عـدد اللاعبيـن ⇜*'..#list..' \n*✧┊لقـد انضـم للعبـة كرسـي ⇩*\n'..Teext
for k,v in pairs(list) do
if k == 1 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id = "t.me/"..Uname
name1 = FlterBio(Nname)
end
if k == 2 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id1 = "t.me/"..Uname
name2 = FlterBio(Nname)
end
if k == 3 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id2 = "t.me/"..Uname
name3 = FlterBio(Nname)
end
if k == #list then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = name1, url = id},},
{{text = name2, url = id1},},
{{text = name3, url = id2},},
{{text = '✧ اضغط للانضمام الى اللعبه ✧', data = '/Sarraha'},},
{{text = '✧ او اضغط لبدء اللعبه ✧', data = '/startsaraha'},},}}
edit(ChatId,Msg_id,message, 'md', true, false, reply_markup)
end
end
elseif #list == 4 then
local UserInfo = bot.getUser(IdUser)
local Teext = '- ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..IdUser..')'
local message = '*✧┊عـدد اللاعبيـن ⇜*'..#list..' \n*✧┊لقـد انضـم للعبـة كرسـي ⇩*\n'..Teext
for k,v in pairs(list) do
if k == 1 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id = "t.me/"..Uname
name1 = FlterBio(Nname)
end
if k == 2 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id1 = "t.me/"..Uname
name2 = FlterBio(Nname)
end
if k == 3 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id2 = "t.me/"..Uname
name3 = FlterBio(Nname)
end
if k == 4 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id3 = "t.me/"..Uname
name4 = FlterBio(Nname)
end
if k == #list then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = name1, url = id},},
{{text = name2, url = id1},},
{{text = name3, url = id2},},
{{text = name4, url = id3},},
{{text = '✧ اضغط للانضمام الى اللعبه ✧', data = '/Sarraha'},},
{{text = '✧ او اضغط لبدء اللعبه ✧', data = '/startsaraha'},},}}
edit(ChatId,Msg_id,message, 'md', true, false, reply_markup)
end
end
elseif #list == 5 then
local UserInfo = bot.getUser(IdUser)
local Teext = '- ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..IdUser..')'
local message = '*✧┊عـدد اللاعبيـن ⇜*'..#list..' \n*✧┊لقـد انضـم للعبـة كرسـي ⇩*\n'..Teext
for k,v in pairs(list) do
if k == 1 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id = "t.me/"..Uname
name1 = FlterBio(Nname)
end
if k == 2 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id1 = "t.me/"..Uname
name2 = FlterBio(Nname)
end
if k == 3 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id2 = "t.me/"..Uname
name3 = FlterBio(Nname)
end
if k == 4 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id3 = "t.me/"..Uname
name4 = FlterBio(Nname)
end
if k == 5 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id4 = "t.me/"..Uname
name5 = FlterBio(Nname)
end
if k == #list then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = name1, url = id},},
{{text = name2, url = id1},},
{{text = name3, url = id2},},
{{text = name4, url = id3},},
{{text = name5, url = id4},},
{{text = '✧ اضغط للانضمام الى اللعبه ✧', data = '/Sarraha'},},
{{text = '✧ او اضغط لبدء اللعبه ✧', data = '/startsaraha'},},}}
edit(ChatId,Msg_id,message, 'md', true, false, reply_markup)
end
end
elseif #list == 6 then
local UserInfo = bot.getUser(IdUser)
local Teext = '- ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..IdUser..')'
local message = '*✧┊عـدد اللاعبيـن ⇜*'..#list..' \n*✧┊لقـد انضـم للعبـة كرسـي ⇩*\n'..Teext
for k,v in pairs(list) do
if k == 1 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id = "t.me/"..Uname
name1 = FlterBio(Nname)
end
if k == 2 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id1 = "t.me/"..Uname
name2 = FlterBio(Nname)
end
if k == 3 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id2 = "t.me/"..Uname
name3 = FlterBio(Nname)
end
if k == 4 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id3 = "t.me/"..Uname
name4 = FlterBio(Nname)
end
if k == 5 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id4 = "t.me/"..Uname
name5 = FlterBio(Nname)
end
if k == 6 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id5 = "t.me/"..Uname
name6 = FlterBio(Nname)
end
if k == #list then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = name1, url = id},},
{{text = name2, url = id1},},
{{text = name3, url = id2},},
{{text = name4, url = id3},},
{{text = name5, url = id4},},
{{text = name6, url = id5},},
{{text = '✧ اضغط للانضمام الى اللعبه ✧', data = '/Sarraha'},},
{{text = '✧ او اضغط لبدء اللعبه ✧', data = '/startsaraha'},},}}
edit(ChatId,Msg_id,message, 'md', true, false, reply_markup)
end
end
elseif #list == 7 then
local UserInfo = bot.getUser(IdUser)
local Teext = '- ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..IdUser..')'
local message = '*✧┊عـدد اللاعبيـن ⇜*'..#list..' \n*✧┊لقـد انضـم للعبـة كرسـي ⇩*\n'..Teext
for k,v in pairs(list) do
if k == 1 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id = "t.me/"..Uname
name1 = FlterBio(Nname)
end
if k == 2 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id1 = "t.me/"..Uname
name2 = FlterBio(Nname)
end
if k == 3 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id2 = "t.me/"..Uname
name3 = FlterBio(Nname)
end
if k == 4 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id3 = "t.me/"..Uname
name4 = FlterBio(Nname)
end
if k == 5 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id4 = "t.me/"..Uname
name5 = FlterBio(Nname)
end
if k == 6 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id5 = "t.me/"..Uname
name6 = FlterBio(Nname)
end
if k == 7 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id6 = "t.me/"..Uname
name7 = FlterBio(Nname)
end
if k == #list then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = name1, url = id},},
{{text = name2, url = id1},},
{{text = name3, url = id2},},
{{text = name4, url = id3},},
{{text = name5, url = id4},},
{{text = name6, url = id5},},
{{text = name7, url = id6},},
{{text = '✧ اضغط للانضمام الى اللعبه ✧', data = '/Sarraha'},},
{{text = '✧ الان اضغط لبدء اللعبه ✧', data = '/startsaraha'},},}}
edit(ChatId,Msg_id,message, 'md', true, false, reply_markup)
end
end
elseif #list == 8 then
local UserInfo = bot.getUser(IdUser)
local Teext = '- ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..IdUser..')'
local message = '*✧┊عـدد اللاعبيـن ⇜*'..#list..' \n*✧┊لقـد انضـم للعبـة كرسـي ⇩*\n'..Teext
for k,v in pairs(list) do
if k == 1 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id = "t.me/"..Uname
name1 = FlterBio(Nname)
end
if k == 2 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id1 = "t.me/"..Uname
name2 = FlterBio(Nname)
end
if k == 3 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id2 = "t.me/"..Uname
name3 = FlterBio(Nname)
end
if k == 4 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id3 = "t.me/"..Uname
name4 = FlterBio(Nname)
end
if k == 5 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id4 = "t.me/"..Uname
name5 = FlterBio(Nname)
end
if k == 6 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id5 = "t.me/"..Uname
name6 = FlterBio(Nname)
end
if k == 7 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id6 = "t.me/"..Uname
name7 = FlterBio(Nname)
end
if k == 8 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id7 = "t.me/"..Uname
name8 = FlterBio(Nname)
end
if k == #list then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = name1, url = id},},
{{text = name2, url = id1},},
{{text = name3, url = id2},},
{{text = name4, url = id3},},
{{text = name5, url = id4},},
{{text = name6, url = id5},},
{{text = name7, url = id6},},
{{text = name8, url = id7},},
{{text = '✧ اضغط للانضمام الى اللعبه ✧', data = '/Sarraha'},},
{{text = '✧ الان اضغط لبدء اللعبه ✧', data = '/startsaraha'},},}}
edit(ChatId,Msg_id,message, 'md', true, false, reply_markup)
end
end
elseif #list == 9 then
local UserInfo = bot.getUser(IdUser)
local Teext = '- ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..IdUser..')'
local message = '*✧┊عـدد اللاعبيـن ⇜*'..#list..' \n*✧┊لقـد انضـم للعبـة كرسـي ⇩*\n'..Teext
for k,v in pairs(list) do
if k == 1 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id = "t.me/"..Uname
name1 = FlterBio(Nname)
end
if k == 2 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id1 = "t.me/"..Uname
name2 = FlterBio(Nname)
end
if k == 3 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id2 = "t.me/"..Uname
name3 = FlterBio(Nname)
end
if k == 4 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id3 = "t.me/"..Uname
name4 = FlterBio(Nname)
end
if k == 5 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id4 = "t.me/"..Uname
name5 = FlterBio(Nname)
end
if k == 6 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id5 = "t.me/"..Uname
name6 = FlterBio(Nname)
end
if k == 7 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id6 = "t.me/"..Uname
name7 = FlterBio(Nname)
end
if k == 8 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id7 = "t.me/"..Uname
name8 = FlterBio(Nname)
end
if k == 9 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id8 = "t.me/"..Uname
name9 = FlterBio(Nname)
end
if k == #list then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = name1, url = id},},
{{text = name2, url = id1},},
{{text = name3, url = id2},},
{{text = name4, url = id3},},
{{text = name5, url = id4},},
{{text = name6, url = id5},},
{{text = name7, url = id6},},
{{text = name8, url = id7},},
{{text = name9, url = id8},},
{{text = '✧ اضغط للانضمام الى اللعبه ✧', data = '/Sarraha'},},
{{text = '✧ الان اضغط لبدء اللعبه ✧', data = '/startsaraha'},},}}
edit(ChatId,Msg_id,message, 'md', true, false, reply_markup)
end
end
elseif #list == 10 then
local message = '*✧┊لقـد وصـل اللاعبيـن للحـد الاقصـى\n✧┊المشتـركيـن الـ10 فـي لعبـة كرسـي هـم :*' 
for k,v in pairs(list) do
if k == 1 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id = "t.me/"..Uname
name1 = FlterBio(Nname)
end
if k == 2 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id1 = "t.me/"..Uname
name2 = FlterBio(Nname)
end
if k == 3 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id2 = "t.me/"..Uname
name3 = FlterBio(Nname)
end
if k == 4 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id3 = "t.me/"..Uname
name4 = FlterBio(Nname)
end
if k == 5 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id4 = "t.me/"..Uname
name5 = FlterBio(Nname)
end
if k == 6 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id5 = "t.me/"..Uname
name6 = FlterBio(Nname)
end
if k == 7 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id6 = "t.me/"..Uname
name7 = FlterBio(Nname)
end
if k == 8 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id7 = "t.me/"..Uname
name8 = FlterBio(Nname)
end
if k == 9 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id8 = "t.me/"..Uname
name9 = FlterBio(Nname)
end
if k == 10 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id9 = "t.me/"..Uname
name10 = FlterBio(Nname)
end
if k == #list then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = name1, url = id},},
{{text = name2, url = id1},},
{{text = name3, url = id2},},
{{text = name4, url = id3},},
{{text = name5, url = id4},},
{{text = name6, url = id5},},
{{text = name7, url = id6},},
{{text = name8, url = id7},},
{{text = name9, url = id8},},
{{text = name10, url = id9},},
{{text = '✧ الان اضغط لبدء اللعبه ✧', data = '/startsaraha'},},}}
return edit(ChatId,Msg_id,message, 'md', true, false, reply_markup)
end
end
end
else
return bot.answerCallbackQuery(data.id, "✧┊انت منضـم مسبقـاً .. الـى اللعبـه", true)
end
end
---------------------- صراحه ----------------------
if Text == '/startsaraha' and Redis:get(SILV.."Witting_StartGameS"..ChatId) then
local rarahkam = Redis:get(SILV.."raesaraha"..ChatId)
if tonumber(IdUser) == tonumber(rarahkam) then
local list = Redis:smembers(SILV..'List_Saraha'..ChatId) 
local UserName = list[math.random(#list)]
local UserId_Info = bot.getUser(UserName)
local testsaraha = math.random(1,9999999999999)
Redis:set(SILV.."saraha:"..testsaraha.."chat_id", ChatId)
Redis:set(SILV.."saraha:"..testsaraha.."to", UserId_Info.id)
Redis:set(SILV.."saraha:"..testsaraha.."msg_id",Msg_id)
if UserId_Info.username and UserId_Info.username ~= "" then
ls = '['..UserId_Info.first_name..'](tg://user?id='..UserName..')'
else
ls = '['..UserId_Info.first_name..'](tg://user?id='..UserName..')'
end
Redis:set(SILV.."kk_saraha"..ChatId,UserId_Info.id)
Redis:srem(SILV..'List_Saraha'..ChatId,UserName) 
local liiiist = Redis:smembers(SILV..'List_Saraha'..ChatId) 
local User2Name = liiiist[math.random(#liiiist)]
local UserId2_Info = bot.getUser(User2Name)
Redis:incrby(SILV..'Num:Add:Games'..ChatId..UserId2_Info.id,5)
Redis:set(SILV.."ff_saraha"..ChatId,UserId2_Info.id)
Redis:del(SILV..'raesaraha'..ChatId) 
Redis:del(SILV..'List_Saraha'..ChatId) 
Redis:del(SILV.."Witting_StartGameS"..ChatId)
Redis:del(SILV.."Start_Saraha"..ChatId)
local liiist = Redis:sismember(SILV..'List_Saraha'..ChatId,IdUser)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '✧ إضغـط لارسـال السـؤال 📬✧', url = 't.me/'..UserBot..'?start=saraha'..testsaraha..'from_id'..UserId2_Info.id}, 
},
}
}
return edit(ChatId,Msg_id,"*✧┊صارحني بسـرية تامـه 🤔⁉️*\n\n*✧┊تـم اختيـار ⇜(*  "..ls.."  *) \n✧┊وتـم اختيـار الفـائـز واخفـائـه 🥷\n✧┊لدى الفائـز فقـط ⇜ 5 اسئلـه*", 'md', true, false, reply_markup)
else
return bot.answerCallbackQuery(data.id, "✧┊الامـر للي بـدأ اللعبـه ...", true)
end
end

if Text and Text:match('/Akab(.*)') then
local UserId = Text:match('/Akab(.*)')
if Redis:sismember(SILV..'List_Ahkamm'..ChatId,IdUser) then
return bot.answerCallbackQuery(data.id, "✧┊انت منضـم مسبقـاً .. الـى اللعبـه", true)
end
bot.answerCallbackQuery(data.id, "✧ تم ضفتك للعبـة ⛓ ✓", true)
Redis:sadd(SILV..'List_Ahkamm'..ChatId,IdUser)
Redis:sadd(SILV..'members_Ahkamm'..ChatId,IdUser)
Redis:setex(SILV.."Witting_StartGamehh"..ChatId,1400,true)
end
if Text and Text:match('/Ahkam(.*)') then
local UserId = Text:match('/Ahkam(.*)')
if Redis:sismember(SILV..'List_Ahkam'..ChatId,IdUser) then
return bot.answerCallbackQuery(data.id, "✧┊انت منضـم مسبقـاً .. الـى اللعبـه", true)
end
bot.answerCallbackQuery(data.id, "✧ تم ضفتك للعبـة 👩🏻‍⚖⚖ ✓", true)
Redis:sadd(SILV..'List_Ahkam'..ChatId,IdUser)
Redis:setex(SILV.."Witting_StartGameh"..ChatId,1400,true)
end
if Text and Text:match('/Korsy(.*)') then
local UserId = Text:match('/Korsy(.*)')
if Redis:sismember(SILV..'List_Korsi'..ChatId,IdUser) then
return bot.answerCallbackQuery(data.id, "✧┊انت منضـم مسبقـاً .. الـى اللعبـه", true)
end
bot.answerCallbackQuery(data.id, "✧ تم ضفتك للعبـة ⛓ ✓", true)
Redis:sadd(SILV..'List_Korsi'..ChatId,IdUser)
Redis:setex(SILV.."Witting_StartGamek"..ChatId,1400,true)
end
if Text and Text:match('/Sarahy(.*)') then
local UserId = Text:match('/Sarahy(.*)')
if Redis:sismember(SILV..'List_Saraha'..ChatId,IdUser) then
return bot.answerCallbackQuery(data.id, "✧┊انت منضـم مسبقـاً .. الـى اللعبـه", true)
end
bot.answerCallbackQuery(data.id, "✧ تم ضفتك للعبـة ⛓ ✓", true)
Redis:sadd(SILV..'List_Saraha'..ChatId,IdUser)
Redis:setex(SILV.."Witting_StartGameS"..ChatId,1400,true)
end

if Text and Text:match('(%d+)/startttahkam') and Redis:get(SILV.."Witting_StartGameh"..ChatId) then
local UserId = Text:match('(%d+)/startttahkam')
local rarahkam = Redis:get(SILV.."raeahkam"..ChatId)
if tonumber(IdUser) ~= tonumber(rarahkam) then
return bot.answerCallbackQuery(data.id, "✧┊الامـر للي بـدأ اللعبـه ...", true)
else
local list = Redis:smembers(SILV..'List_Ahkam'..ChatId) 
local UserName = list[math.random(#list)]
local UserId_Info = bot.getUser(UserName)
if UserId_Info.username and UserId_Info.username ~= "" then
ls = '['..UserId_Info.first_name..'](tg://user?id='..UserName..')'
else
ls = '['..UserId_Info.first_name..'](tg://user?id='..UserName..')'
end
Redis:set(SILV.."kk_Ahkam"..ChatId,UserId_Info.id)
Redis:srem(SILV..'List_Ahkam'..ChatId,UserId_Info.id) 
local User2Name = list[math.random(#list)]
local UserId2_Info = bot.getUser(User2Name)
if UserId2_Info.username and UserId2_Info.username ~= "" then
Hs = '['..UserId2_Info.first_name..'](tg://user?id='..User2Name..')'
else
Hs = '['..UserId2_Info.first_name..'](tg://user?id='..User2Name..')'
end
Redis:set(SILV.."ff_Ahkam"..ChatId,UserId2_Info.id)
Redis:incrby(SILV..'Num:Add:Ahkam'..ChatId..UserId2_Info.id,5)
Redis:del(SILV..'raeahkam'..ChatId) 
Redis:del(SILV..'List_Ahkam'..ChatId) 
Redis:del(SILV.."Witting_StartGameh"..ChatId)
Redis:del(SILV.."Start_Ahkam"..ChatId)
local SILV = '*⚖┊تم إختيار الشخـص ⇜* '..ls..'\n*👩🏻‍⚖┊ليتـم الحكـم عليـه من قبـل ⇜* '..Hs..'\n\n*🎁┊وتم اضـافـة 5 نقـاط للحـاكـم*'
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '˹𓌗 قنـاة البـوت 𓌗.',url='http://t.me/'..chsource..''}},
}
local msg_idd = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/editMessageText?chat_id='..data.id..'&text='..URL.escape(SILV)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
end

if Text and Text:match('(%d+)/help1') then
local UserId = Text:match('(%d+)/help1')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '› 𝟭 ‹', data = IdUser..'/help1'}, {text = '𝟮', data = IdUser..'/help2'}, {text = '𝟯', data = IdUser..'/help3'},
},
{
{text = ' اليوتيوب ', data = IdUser..'/help4'},
},
{
{text = ' الالعاب ', data = IdUser..'/help5'}, {text = ' التسليه ', data = IdUser..'/help6'}, 
},
{
{text = 'التالي', data = IdUser..'/help2'}, {text = 'القائمه الرئيسية', data = IdUser..'/helpall'},
},
}
}
local TextHelp = [[
⤶ *أوَامِرُ الإِدَارَةِ*

❬ *اوامر الرفع والتنزيل* ❭

⌯ رفع ↣ ↢ تنزيل مشرف
⌯ رفع ↣ ↢ تنزيل مالك اساسي
⌯ رفع ↣ ↢ تنزيل مالك
⌯ رفع ↣ ↢ تنزيل المنشئ الاساسي
⌯ رفع ↣ ↢ تنزيل المنشئ
⌯ رفع ↣ ↢ تنزيل مدير عام
⌯ رفع ↣ ↢ تنزيل مدير
⌯ رفع ↣ ↢ تنزيل ادمن
⌯ رفع ↣ ↢ تنزيل مميز
⌯ تنزيل الكل  ↢ بالرد  ↢ لتنزيل الشخص من جميع رتبه
⌯ تنزيل الكل  ↢ بدون رد  ↢ لتنزيل كل رتب المجموعة

❬ *اْوَاْمٌـرِ اْلِمٌسَحِ* ❭

⌯ مسح المالكيين
⌯ مسح المدراء
⌯ مسح الادمنيه
⌯ مسح المميزين
⌯ مسح المحظورين
⌯ مسح المكتومين
⌯ مسح قائمة المنع
⌯ مسح الرتب
⌯ مسح الردود
⌯ مسح رد انلاين
⌯ مسح الاوامر
⌯ مسح الاوامر المضافه
⌯ مسح + العدد
⌯ مسح بالرد
⌯ مسح الترحيب
⌯ مسح القوانين
⌯ مسح الرابط

❬ *اٌوَاٌمٌـرُ اْلُطٌرَدِ اٌلُحَظُرِ اْلُكُـتْمِ* ❭

⌯ حظر ↢ ❬ بالرد،بالمعرف،بالايدي ❭
⌯ طرد ↢ ❬ بالرد،بالمعرف،بالايدي ❭
⌯ كتم ↢ ❬ بالرد،بالمعرف،بالايدي ❭
⌯ تقيد ↢ ❬ بالرد،بالمعرف،بالايدي ❭
⌯ تقيد ↢ ❬ بالرد،بالمعرف،بالايدي ❭
⌯ تقيد + العدد + ❬ اسبوع،يوم،ساعه ❭ ↢ تقييد 5 يوم
⌯ الغاء الحظر ↢ ❬ بالرد،بالمعرف،بالايدي ❭
⌯ الغاء الكتم ↢ ❬ بالرد،بالمعرف،بالايدي ❭
⌯ الغاء التقييد ↢ ❬ بالرد،بالمعرف،بالايدي ❭
⌯ رفع القيود ↢ لحذف الكتم,الحظر,التقييد
⌯ منع بالرد
⌯ منع بالرد على قيف او ستيكر
⌯ الغاء منع الكلمة
⌯ طرد المحذوفين
⌯ طرد البوتات
⌯ كشف البوتات

❬ اوامر النطق ❭

⌯ انطق + الكلمة


❬ *اًَوَِاٰمِرٌ اًَخَِرٌىٌّ* ❭

⌯ ايدي
⌯ الرابط
⌯ انشاء رابط
⌯ انشاء رابط خاص
⌯ ترند ,متفاعلين
⌯ تصفير الترند
⌯ بايو
⌯ افتاري
⌯ بايو عشوائي
⌯ نقل ملكية
⌯ افتار + باليوزر او الرد
⌯ صوره
]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/help2') then
local UserId = Text:match('(%d+)/help2')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '𝟭', data = IdUser..'/help1'}, {text = '› 𝟮 ‹', data = IdUser..'/help2'}, {text = '𝟯', data = IdUser..'/help3'},
},
{
{text = ' اليوتيوب ', data = IdUser..'/help4'},
},
{
{text = ' الالعاب ', data = IdUser..'/help5'}, {text = ' التسليه ', data = IdUser..'/help6'}, 
},
{
{text = 'التالي', data = IdUser..'/help3'}, {text = 'السابق', data = IdUser..'/help1'},
},
{
{text = 'القائمه الرئيسية', data = IdUser..'/helpall'},
},
}
}
local TextHelp = [[
⤶ *اَلْوَضْعُ اٍوَامِـرُ *

⌯ ضع لقب + القب بالرد
⌯ وضع ترحيب
⌯ ضع الشعار + تعين عدد الكتم
⌯ وضع قوانين
⌯ تغيير رتبه
⌯ تغيير امر
⌯ ضع رابط
⌯ ضع صوره
⌯ ضع وصف
⌯ وضع الرتب
⌯ وضع قناتي
⌯ تعيين عدد الاحروف + العدد

❬ *أَوَّامِرُ رُؤْيَةِ الْإِعْدَادَاتِ* ❭

⌯ المطورين
⌯ المالكيين الاساسيين
⌯ المالكيين 
⌯ الادمنيه
⌯ المدراء
⌯ المشرفين
⌯ المميزين
⌯ القوانين
⌯ قائمه المنع
⌯ المكتومين
⌯ المطور 
⌯ معلوماتي 
⌯ الاعدادت
⌯ المجموعه
⌯ كشف الرتب بالعدد
⌯ الساعه
⌯ التاريخ
⌯ صلاحياتي
⌯ لقبي
⌯ صلاحياته + بالرد


❬ *أَوَّامِرُ تَـاڪْ وَ مـَـنـْشَـْنْ* ❭

⌯ تفعيل ↣ ↢ تعطيل تاك التلقائي
⌯ تفعيل ↣ ↢ تعطيل تاك
⌯ تاك عام ,@all +كلمه
⌯ منشن ايموجي
⌯ تاك الكل ,منشن للكل
⌯ تاك 
⌯ ناديهم

❬ *أٌشِـتٌـرَاِكَ اَلَاِجّبِاِرَيّ مّجِمّوَعّة* ❭
⇜ يخص المالك

⌯ تفعيل الاشتراك الاجباري مجموعه
⌯ تعطيل الاشتراك الاجباري مجموعه


❬ *أَوَّامِرُ تَنْظِيفِ* ❭

⌯ مسح الفويسات ,البصمات
⌯ مسح الصوتيات
⌯ مسح الصور
⌯ مسح القيفات ,المتحركات
⌯ مسح الملصقات
⌯ مسح الميديا ,الوسائط
]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/help3') then
local UserId = Text:match('(%d+)/help3')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '𝟭', data = IdUser..'/help1'}, {text = '𝟮', data = IdUser..'/help2'}, {text = '› 𝟯 ‹', data = IdUser..'/help3'},
},
{
{text = ' اليوتيوب ', data = IdUser..'/help4'},
},
{
{text = ' الالعاب ', data = IdUser..'/help5'}, {text = ' التسليه ', data = IdUser..'/help6'}, 
},
{
{text = 'التالي', data = IdUser..'/help4'}, {text = 'السابق', data = IdUser..'/help2'},
},
{
{text = 'القائمه الرئيسية', data = IdUser..'/helpall'},
},
}
}
local TextHelp = [[
⤶ *أُوَامِرُ القَفْلِ وَالتَعْطِيلِ*

❬ *اْوَاْمٌـرِ اْلِرٌدِوْدِ* ❭

⌯ الردود ↢ تشوف كل الردود المضافه
⌯ اضف رد ↢ عشان تضيف رد
⌯ اضف رد انلاين ↢ عشان تضيف رد انلاين
⌯ اضف رد متعدد ↢ تضيف رد متعدد
⌯ مسح رد ↢ عشان تمسح الرد
⌯ مسح رد انلاين ↢ تمسح رد انلاين
⌯ مسح رد من متعدد ↢ تمسح رد متعدد
⌯ مسح الردود ↢ تمسح كل الردود
⌯ مسح الردود الانلاين ↢ تمسح كل ردود انلاين
⌯ مسح الردود المتعدده ↢ تمسح كل ردود متعدد
⌯ الرد + كلمة الرد

⤶ *اَوَامِرُ الـقٌفٌلِ والـفُتٍحِ*
⤶ ❬ بالطرد بالكتم بالتقييد ❭

⌯ قفل ↣ ↢ فتح  الاباحي
⌯ قفل ↣ ↢ فتح  الاباحي 2    
⌯ قفل ↣ ↢ فتح  التعديل  
⌯ قفل ↣ ↢ فتح  الفويسات 
⌯ قفل ↣ ↢ فتح  الوسائط
⌯ قفل ↣ ↢ فتح  الفيديو 
⌯ قفل ↣ ↢ فتح  الـصــور 
⌯ قفل ↣ ↢ فتح  الملصقات 
⌯ قفل ↣ ↢ فتح  الدخول 
⌯ قفل ↣ ↢ فتح  الفارسية
⌯ قفل ↣ ↢ فتح الانقليزيه
⌯ قفل ↣ ↢ فتح السيلفي
⌯ قفل ↣ ↢ فتح  الملفات  
⌯ قفل ↣ ↢ فتح  المتحركات 
⌯ قفل ↣ ↢ فتح  تعديل الميديا
⌯ قفل ↣ ↢ فتح  الدردشه
⌯ قفل ↣ ↢ فتح  الماركدوان
⌯ قفل ↣ ↢ فتح  الروابط  
⌯ قفل ↣ ↢ فتح  البوتات 
⌯ قفل ↣ ↢ فتح   التاك
⌯ قفل ↣ ↢ فتح  اليوزرات 
⌯ قفل ↣ ↢ فتح  الاشعارات 
⌯ قفل ↣ ↢ فتح  التكرار 
⌯ قفل ↣ ↢ فتح الكلايش
⌯ قفل ↣ ↢ فتح  التوجيه 
⌯ قفل ↣ ↢ فتح  الانلاين 
⌯ قفل ↣ ↢ فتح  الجهات
⌯ قفل ↣ ↢ فتح  الاغاني
⌯ قفل ↣ ↢ فتح  السب
⌯ قفل ↣ ↢ فتح  الاضافه
⌯ قفل ↣ ↢ فتح  الصوت
⌯ قفل ↣ ↢ فتح  الــكـــل 
⌯ قفل ↣ ↢ فتح  القنوات 

❬ *اَوَامِرُ التَفْعِيْلِ وَالتَعْطِيْلِ* ❭

⌯ تفعيل ↣ ↢ تعطيل الحماية
⌯ تفعيل ↣ ↢ تعطيل الاذكار
⌯ تفعيل ↣ ↢ تعطيل تاك التلقائي
⌯ تفعيل ↣ ↢ تعطيل الترحيب 
⌯ تفعيل ↣ ↢ تعطيل الردود 
⌯ تفعيل ↣ ↢ تعطيل الايدي
⌯ تفعيل ↣ ↢ تعطيل الرابط
⌯ تفعيل ↣ ↢ تعطيل اطردني
⌯ تفعيل ↣ ↢ تعطيل المنشن
⌯ تفعيل ↣ ↢ تعطيل الصيغ 
⌯ تفعيل ↣ ↢ تعطيل التحقق 
⌯ تفعيل ↣ ↢ تعطيل ردود المطور 
⌯ تفعيل ↣ ↢ تعطيل التحذير 
⌯ تفعيل ↣ ↢ تعطيل البايو 
⌯ تفعيل ↣ ↢ تعطيل انطقي
⌯ تفعيل ↣ ↢ تعطيل الرفع
⌯ تفعيل ↣ ↢ تعطيل الايدي
⌯ تفعيل ↣ ↢ تعطيل الطرد
⌯ تفعيل ↣ ↢ تعطيل الحظر
⌯ تفعيل ↣ ↢ تعطيل البنك
⌯ تفعيل ↣ ↢ تعطيل التحميل
⌯ تفعيل ↣ ↢ تعطيل الحظر
⌯ تفعيل ↣ ↢ تعطيل المنشن
⌯ تفعيل ↣ ↢ تعطيل الايدي بالصوره
⌯ تفعيل ↣ ↢ تعطيل ردود المطور
⌯ تفعيل ↣ ↢ تعطيل الالعاب
⌯ تفعيل ↣ ↢ تعطيل انطق
⌯ تفعيل ↣ ↢ تعطيل صورتي
⌯ تفعيل ↣ ↢ تعطيل  اسمي
⌯ تفعيل ↣ ↢ تعطيل  منشن
⌯ تفعيل ↣ ↢ تعطيل  الابراج
⌯ تفعيل ↣ ↢ تعطيل  البايو
⌯ تفعيل ↣ ↢ تعطيل  الاقتباسات
⌯ تفعيل ↣ ↢ تعطيل  الصوتيات
⌯ تفعيل ↣ ↢ تعطيل  ايدي العضو
⌯ تفعيل ↣ ↢ تعطيل نداء المالك
⌯ تفعيل ↣ ↢ تعطيل المسح التلقائي
⌯ تفعيل ↣ ↢ تعطيل ردود الاعضاء
⌯ تفعيل ↣ ↢ تعطيل البلاغات
⌯ تفعيل ↣ ↢ تعطيل التوديع
⌯ تفعيل ↣ ↢ تعطيل انذار
⌯ تفعيل ↣ ↢ تعطيل القفل التلقائي
]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/help4') then
local UserId = Text:match('(%d+)/help4')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '𝟭', data = IdUser..'/help1'}, {text = '𝟮', data = IdUser..'/help2'}, {text = '𝟯', data = IdUser..'/help3'},
},
{
{text = '› اليوتيوب ‹', data = IdUser..'/help4'},
},
{
{text = ' الالعاب ', data = IdUser..'/help5'}, {text = ' التسليه ', data = IdUser..'/help6'}, 
},
{
{text = 'التالي', data = IdUser..'/help5'}, {text = 'السابق', data = IdUser..'/help3'},
},
{
{text = 'القائمه الرئيسية', data = IdUser..'/helpall'},
},
}
}
local TextHelp = [[
⤶ *اليوتيوب ♬ *

تفعيل اليوتيوب 
تعطيل اليوتيوب

❇ البـحث ↓

بحث + اسم الاغنية
بحث + اسم فيديو

يوت + اسم الاغنية

الساوند كلاود ♬ (صيانة)

تفعيل الساوند 
تعطيل الساوند 

ساوند اسم الاغنية
رابط ساوند الرابط

تيكتوك - فيسبوك ♬ 

تفعيل السوشل
تعطيل السوشل

تيك + رابط المقطع
فيس + رابط المقطع

]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/help5') then
local UserId = Text:match('(%d+)/help5')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '𝟭', data = IdUser..'/help1'}, {text = '𝟮', data = IdUser..'/help2'}, {text = '𝟯', data = IdUser..'/help3'},
},
{
{text = ' اليوتيوب ', data = IdUser..'/help4'},
},
{
{text = '› الالعاب ‹', data = IdUser..'/help5'}, {text = ' التسليه ', data = IdUser..'/help6'}, 
},
{
{text = 'التالي', data = IdUser..'/help6'}, {text = 'السابق', data = IdUser..'/help4'},
},
{
{text = 'القائمه الرئيسية', data = IdUser..'/helpall'},
},
}
}
local TextHelp = [[
⤶ *أَلْعَابُ الْبُوتِ 🕷️ *

⌯ البنك
⌯ كرسي
⌯ جدول
⌯ حزر
⌯ صور
⌯ عقاب
⌯ احكام
⌯ مشاهير
⌯ حيوانات
⌯ زوم
⌯ المختلف
⌯ امثله 
⌯ العكس
⌯ حزوره 
⌯ معاني 
⌯ بات 
⌯ خمن 
⌯ ترتيب 
⌯ سمايلات
⌯ اسئله 
⌯ اسالني
⌯ لغز
⌯ الروليت
⌯ رياضيات 
⌯ انكليزي
⌯ اعلام 
⌯ جمل 
⌯ عواصم
⌯ كلمات 
⌯ الحظ 
⌯ حظي 
⌯ عربي 
⌯ دين
⌯ تفكيك
⌯ حجره
⌯ نمله
━━━━━━━━━━━
⌯ نقاطي  ↢ لعرض عدد نقاطك
⌯ بيع نقاطي + العدد
]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/help6') then
local UserId = Text:match('(%d+)/help6')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '𝟭', data = IdUser..'/help1'}, {text = '𝟮', data = IdUser..'/help2'}, {text = '𝟯', data = IdUser..'/help3'},
},
{
{text = ' اليوتيوب ', data = IdUser..'/help4'},
},
{
{text = ' الالعاب ', data = IdUser..'/help5'}, {text = '› التسليه ‹', data = IdUser..'/help6'}, 
},
{
{text = 'التالي', data = IdUser..'/help1'}, {text = 'القائمه الرئيسية', data = IdUser..'/helpall'},
},
}
}
local TextHelp = [[
⤶ *بــوت تَـــسْلِيــة 🌟🎉*

🍰 ⌯ رفع ↣ ↢ تنزيل كيكه
🍯 ⌯ رفع ↣ ↢ تنزيل عسل
💩 ⌯ رفع ↣ ↢ تنزيل زق
🦓 ⌯ رفع ↣ ↢ تنزيل حمار
🐄 ⌯ رفع ↣ ↢ تنزيل بقره
🐩 ⌯ رفع ↣ ↢ تنزيل كلب
🐒 ⌯ رفع ↣ ↢ تنزيل قرد
🐐 ⌯ رفع ↣ ↢ تنزيل تيس
🐓 ⌯ رفع ↣ ↢ تنزيل دجاجه
🧱 ⌯ رفع ↣ ↢ تنزيل هطف
🐏 ⌯ رفع ↣ ↢ تنزيل خاروف
❤️ ⌯ رفع لقلبي ↣ ↢ تنزيل من قلبي

⌯ قائمة الكيك
⌯ قائمة العسل
⌯ قائمة الزق
⌯ قائمة الحمير
⌯ قائمة البقر
⌯ قائمة الكلاب
⌯ قائمة القرود
⌯ قائمة التيس
⌯ قائمة الدجاج
⌯ قائمة الهطوف
⌯ قائمة الخرفان

                                        ╼╾

⌯ اضف ردي
⌯ اضف تاك
⌯ غنيلي 
⌯ ميمز 
⌯ ثنائي 
⌯ نبذه
⌯ شعر
⌯ قرأن
⌯ الوقت 
⌯ الساعه 
⌯ التاريخ
⌯ ستوري 
⌯ لوكيت
⌯ ريمكس
⌯ عبارات
⌯ تحدي
⌯ اقتباس
⌯ اقتباسات
⌯ موسيقى 
⌯ اقتباسات
⌯ هيدرات 
⌯ جداريات 
⌯ شخصيتي 
⌯ ايدت 
⌯ ايدت انمي
⌯ مسلسل - فلم
⌯ اكتموه - بالرد
⌯ شبيهي - شبيهتي
                                        ╼╾
⌯ معنى اسم + الاسم
⌯ همسه - اهمس بالرد
⌯ احسب العمر
⌯ زخرفه - زخرفه + اسم
⌯ نسبه الحب ↣ ↢ الكره
⌯ نسبه الذكاء ↣ ↢ الغباء
⌯ نسبه الرجوله ↣ ↢ الانوثه
⌯ برج + اسم برجك - صورتي
⌯ قيفات بنات ، عيال ، كيبوب
⌯ قيفات قطط ، كوكسال ، انمي
⌯ افتارات بنات ، عيال ، كيبوب
⌯ افتارات رسم ، انمي ، سنمائيه
⌯ افتارات كيبوب ، لاعبين ، فكتوري
]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/helpp6') then
local UserId = Text:match('(%d+)/helpp6')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'البنك', data = IdUser..'/helpts'}, {text = 'زواج', data = IdUser..'/helptz'},
},
{
{text = 'الالعاب المتطورة', data = IdUser..'/gamesmtor'}, 
},
{
{text = 'القائمه الرئيسية', data = IdUser..'/helpall'},
},
}
}
local TextHelp = [[
⤶ *أَلْعَابُ الْبُوتِ 🕷️ *

⌯ البنك
⌯ كرسي
⌯ جدول
⌯ حزر
⌯ صور
⌯ عقاب
⌯ احكام
⌯ مشاهير
⌯ حيوانات
⌯ زوم
⌯ المختلف
⌯ امثله 
⌯ العكس
⌯ حزوره 
⌯ معاني 
⌯ بات 
⌯ خمن 
⌯ ترتيب 
⌯ سمايلات
⌯ اسئله 
⌯ اسالني
⌯ لغز
⌯ الروليت
⌯ رياضيات 
⌯ انكليزي
⌯ اعلام 
⌯ جمل 
⌯ عواصم
⌯ كلمات 
⌯ الحظ 
⌯ حظي 
⌯ عربي 
⌯ دين
⌯ تفكيك
⌯ حجره
⌯ نمله
•• •• •• •• •• ••
⌯ نقاطي  ↢ لعرض عدد نقاطك
⌯ بيع نقاطي + العدد
]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/helpall') then
local UserId = Text:match('(%d+)/helpall')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '𝟭', data = IdUser..'/help1'}, {text = '𝟮', data = IdUser..'/help2'},{text = '𝟯', data = IdUser..'/help3'},
},
{
{text = ' اليوتيوب ', data = IdUser..'/help4'},
},
{
{text = ' الالعاب ', data = IdUser..'/help5'},{text = ' التسليه ', data = IdUser..'/help6'}, 
},
{
{text = 'اوامر القفل', data = IdUser..'/NoNextSeting'}, {text = 'اوامر التعطيل', data = IdUser..'/listallAddorrem'}, 
},
}
}
local TextHelp = [[
*⤶  َأَهْلِينَ فِيـكَ بَـآوَآمِرَ الـبُـوتْ*

⌯ 𝟭 ┇ أوَامِرُ الإِدَارَةِ
⌯ 𝟮 ┇ أُوَامِرُ الإِعْدَادَاتِ
⌯ 𝟯 ┇ أُوَامِرُ القَفْلِ وَالتَعْطِيلِ

]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/helpsudo') and data.Developers then
local UserId = Text:match('(%d+)/helpsudo')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'القائمه الرئيسية', data = IdUser..'/helpall'},
},
}
}
local TextHelp = [[
⌯ رفع - تنزيل ↣ ↢ مطور اساسي
⌯ المطورين الاساسيين
⌯ مسح المطورين الاساسيين
⌯ رفع - تنزيل ↣ ↢ MY
⌯ المطورين الثانويين  
⌯ مسح المطورين الثانويين
⌯ رفع - تنزيل ↣ ↢ مطور
⌯ المطورين ↣ ↢ مسح المطورين
⌯ تغيير المطور الاساسي
━━━━━━━━━━━
⌯ معلومات القروب + الايدي
⌯ حظر قروب + الايدي
⌯ غادر + الايدي
⌯ اسم بوتك + غادر بالقروب
⌯ تفعيل - تعطيل ↣ ↢ الاشتراك الاجباري
⌯ الاشتراك الاجباري
⌯ تغيير الاشتراك الاجباري
⌯ تعيين عدد الاعضاء + العدد
━━━━━━━━━━━
⌯ حظر عام ↣ ↢ الغاء حظر عام 
⌯ قائمه العام ↣ ↢ مسح قائمه العام
⌯ كتم عام ↣ ↢ الغاء كتم عام
⌯ المكتومين عام
⌯ مسح المكتومين عام
⌯ رفع القيود عام + المعرف 
━━━━━━━━━━━
⌯ تغيير - مسح ↣ ↢ اسم البوت
⌯ ضع صوره للترحيب 
⌯ الاحصائيات
⌯ ذيع + ايدي القروب بالرد
⌯ اذاعه ↣ ↢ اذاعه خاص
⌯ اذاعه بالتوجيه ↣ ↢ اذاعه بالتثبيت
⌯ اذاعه خاص بالتوجيه
━━━━━━━━━━━
⌯ تفعيل - تعطيل ↣ ↢ جلب النسخ تلقائي
⌯ جلب النسخه الاحتياطيه
⌯ رفع النسخه الاحتياطيه بالرد
⌯ جلب نسخه الردود 
⌯ رفع نسخه الردود بالرد
⌯ جلب نسخه الردود العامه
⌯ رفع نسخه الردود العامه بالرد
⌯ اشتراك البوت
⌯ معلومات التنصيب
━━━━━━━━━━━
⌯ تعيين - مسح ↣ ↢ الايدي عام
⌯ اضف - مسح ↣ ↢ رد عام
⌯ اضف - مسح ↣ ↢ رد عام متعدد
⌯ اضف - مسح ↣ ↢ رد مميز عام
⌯ اضف - مسح ↣ ↢ رد انلاين عام
⌯ ضع - مسح ↣ ↢ الترحيب عام 
⌯ ضع - مسح ↣ ↢ كليشه المطور 
⌯ الردود العامه ↣ ↢ مسح الردود العامه
⌯ اضف - مسح ↣ ↢ صوت عام
⌯ الصوتيات عام
⌯ مسح الصوتيات عام
⌯ تغيير رمز السورس
⌯ منع عام ↣ ↢ الغاء منع عام
⌯ قائمه المنع عام
⌯ مسح قائمه المنع عام
⌯ تفعيل - تعطيل ↣ ↢ ردود البوت عام
⌯ تفعيل - تعطيل ↣ ↢ البنك عام
━━━━━━━━━━━
⌯ اضف - مسح ↣ ↢ سؤال
⌯ الاسئله المضافه
⌯ مسح الاسئله المضافه
⌯ اضف - مسح ↣ ↢ لغز 
⌯ الالغاز ↣ ↢ مسح الالغاز
⌯ اضف - مسح ↣ ↢ سؤال كت 
⌯ اسئله كت
⌯ اضف اسئله كت
⌯ مسح اسئله كت
⌯ اضف - مسح ↣ ↢ سؤال - جمل
⌯ مسح الجمل
━━━━━━━━━━━
⌯ تفعيل - تعطيل ↓
⌯ البوت الخدمي - المغادرة - الاذاعه
⌯ التواصل - الاحصائيات
⌯ ملف ↣ ↢ اسم الملف
━━━━━━━━━━━
⌯ مسح جميع الملفات 
⌯ المتجر ↣ ↢ الملفات
⌯ تحديث ↣ ↢ تحديث السورس
━━━━━━━━━━━
⌯ رفع - تنزيل ↣ ↢ مالك اساسي
⌯ المالكين الاساسيين
⌯ مسح المالكين الاساسيين 
⌯ رفع - تنزيل ↣ ↢ مالك 
⌯ المالكين ↣ ↢ مسح المالكين
⌯ تنزيل جميع الرتب
⌯ تغيير كليشه المالك ( اذا كان حساب المالك محذوف يمكنك وضع يوزر جديد )
⌯ مسح كليشه المالك 
]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/helpts') then
local UserId = Text:match('(%d+)/helpts')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'رجوع', data = IdUser..'/helpp6'},
},
}
}
local TextHelp = [[
⤶ *أَوَامِرُ اَلْبَنكْ 💸💳*

⌯ انشاء حساب بنكي  ↢ تسوي حساب وتقدر تحول فلوس مع مزايا ثانيه

⌯ مسح حساب بنكي  ↢ تلغي حسابك البنكي

⌯ تحويل ↢ تطلب رقم حساب الشخص وتحول له فلوس

⌯ حسابي  ↢ يطلع لك رقم حسابك عشان تعطيه للشخص اللي بيحول لك

⌯ فلوسي ↢ يعلمك كم فلوسك

⌯ راتب ↢ يعطيك راتب كل ١٠ دقائق

⌯ بخشيش ↢ يعطيك بخشيش كل ١٠ دقايق

⌯ زرف ↢ تزرف فلوس اشخاص كل ١٠ دقايق

⌯ استثمار ↢ تستثمر بالمبلغ اللي تبيه مع نسبة ربح مضمونه من ١٪؜ الى ١٥٪؜

⌯ حظ ↢ تلعبها بأي مبلغ ياتدبله ياتخسره انت وحظك

⌯ مضاربه ↢ تضارب بأي مبلغ تبيه والنسبة من ٩٠٪؜ الى -٩٠٪؜ انت وحظك

⌯ هجوم ↢ تهجم عالخصم مع زيادة نسبة كل هجوم

⌯ كنز ↢ يعطيك كنز بسعر مختلف انتا وحظك

⌯ مراهنه ↢ تحط مبلغ وتراهن عليه

⌯ توب الفلوس ↢ يطلع توب اكثر ناس معهم فلوس بكل القروبات

⌯ توب الحراميه ↢ يطلع لك اكثر ناس زرفوا

⌯ زواج  ↢ تكتبه بالرد على رسالة شخص مع المهر ويزوجك

⌯ زواجي  ↢ يطلع وثيقة زواجك اذا متزوج

⌯ طلاق ↢ يطلقك اذا متزوج

⌯ خلع  ↢ يخلع زوجك ويرجع له المهر

⌯ زواجات ↢ يطلع اغلى ٣٠ زواجات

⌯ ترتيبي ↢ يطلع ترتيبك باللعبة

⌯ المعرض ↢ يمديك تشتري سيارات وعقارات وكثير اشياء

⌯ ممتلكاتي ↢ يطلع لك مشترياتك من المعرض

⌯ تبرع ↢ تتبرع الى افقر اللاعبين

⌯ انشاء شركه ↢ تنشئ شركتك وتضيف اصدقائك

⌯ بناء مزرعه ↢ تبني مزرعتك وتزرع وتحصد خضار

✜ اوامر لعبه الكره

⌯ انشاء نادي + الاسم ↢ تسوي نادي وتقدر تلعب مباريات مع 

⌯ توب نوادي ↢ يطلع لك توب 10 نادي

⌯ اصحابك مسح ناديي ↢ تمسح 

⌯ ناديك ناديي ↢ يطلع لك اسم ناديك ومعلومات 

⌯ عنه تدريب ↢ يعطيك طاقه كل 20 

⌯ دقيقة مباره وديه ↢ تلعب مباره وديه مع نادي في فوز

⌯ خساره او تعادل؜ مباره ↢ بالرد تلعب مع شخص مباره في فوز ، تعادل او خساره الاقوى راح 

⌯ يفوز شراء لاعب ↢ تشتري لاعب لناديك⌯ بيع لاعب ↢ تبيع لاعب من 

⌯ ناديك تغيير لقب النادي ↢ يغير لقب 

⌯ ناديك توب النوادي ↢ اعلى 10 نوادي باللعبة
]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/helptz') then
local UserId = Text:match('(%d+)/helptz')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'رجوع', data = IdUser..'/helpp6'},
},
}
}
local TextHelp = [[
⤶ *أُوَامِرُ اَلْـــزَّواجْ 💍💒💕*

⌯ زواج  ↢ تكتبه بالرد على رسالة شخص مع المهر ويزوجك

⌯ زواجي  ↢ يطلع وثيقة زواجك اذا متزوج

⌯ طلاق ↢ يطلقك اذا متزوج

⌯ خلع  ↢ يخلع زوجك ويرجع له المهر

⌯ زواجات ↢ يطلع اغلى الزواجات بالقروب

⌯ تتزوجيني - بالرد

⌯ زوجتي ↣ ↢ زوجي

⌯ زوجني ↣ ↢ زوجيني

⌯ انت طالق ↢ بالرد

⌯ طلقني 
]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/almardes') then
local UserId = Text:match('(%d+)/almardes')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'المعرض', data = UserId..'/almardes'},
},
{
{text = 'المزارع', data = UserId..'/almazras'},  {text = 'النوادي', data = UserId..'/nawadyss'},
},
{
{text = 'الشركات', data = UserId..'/copmaha'},
},
}
}
local TextHelp = [[
⌯ أهلا بك في المعرض 🏎️🏛️
- يتوفر لدينا حالياً :

⇠ `سيارات`  🚗
⇠ `طيارات`  ✈️
⇠ `عقارات`  🏘
⇠ `مجوهرات`  💎

- اضغط للنسخ

✧
]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
end

if Text and Text:match('(%d+)/almazras') then
local UserId = Text:match('(%d+)/almazras')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'المعرض', data = UserId..'/almardes'},
},
{
{text = 'المزارع', data = UserId..'/almazras'},  {text = 'النوادي', data = UserId..'/nawadyss'},
},
{
{text = 'الشركات', data = UserId..'/copmaha'},
},
}
}
local TextHelp = [[
⌯ أهلا بك في المزرعة! 🌾

⌯ بناء مزرعه + اسم  ↢ تبني مزرعتك وتزرع وتحصد خضار

⌯ مسح مزرعه ↢ تلغي مزرعتك

⌯ مزرعتي ↢ يطلع لك مزروعاتك مع وقت متبقي لى حصد

⌯ حصد + اسم ↢ تقدر تحصد مزروعاتك

⇜ المزروعات وأسعارها 💰:

- بطاطا: 75 دولار 💵
- بندورة: 100 دولار 💵
- خس: 125 دولار 💵
- خيار: 150 دولار 💵
- جزر: 175 دولار 💵
- فليفلة: 200 دولار 💵
- فريز: 300 دولار 💵
- ذرة: 400 دولار 💵
- ثوم: 500 دولار 💵
- فطر: 800 دولار 💵
- شجرة تفاح: 1000 دولار 💵
- شجرة عنب: 1250 دولار 💵
- شجرة زيتون: 1500 دولار 💵
- شجرة موز: 2000 دولار 💵
- شجرة مانجا: 3000 دولار 💵

⇜ مثال عن طريقة الزراعة:

- زراعة بطاطا 10
- زراعة شجرة موز 15

]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/nawadyss') then
local UserId = Text:match('(%d+)/nawadyss')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'المعرض', data = UserId..'/almardes'},
},
{
{text = 'المزارع', data = UserId..'/almazras'},  {text = 'النوادي', data = UserId..'/nawadyss'},
},
{
{text = 'الشركات', data = UserId..'/copmaha'},
},
}
}
local TextHelp = [[
☆ أوامر لعبة الكرة ⚽️

⌯ انشاء نادي + الاسم ↢  تقوم بإنشاء نادي وتتمكن من لعب المباريات مع أصدقائك

⌯ مسح ناديي ↢  تقوم بمسح ناديك

⌯ ناديي ↢  يعرض لك اسم ناديك ومعلومات عنه

⌯ تدريب ↢  يمنحك طاقة كل 20 دقيقة

⌯ مباراة ودية ↢  تلعب مباراة ودية مع نادٍ وتحقق الفوز، الخسارة أو التعادل

⌯ مباراة ↢  بالرد تلعب مباراة مع شخص آخر وتحقق الفوز، التعادل أو الخسارة الفريق الأقوى سيفوز

⌯ شراء لاعب ↢  تقوم بشراء لاعب لناديك

⌯ بيع لاعب ↢  تقوم ببيع لاعب من ناديك

⌯ تغيير لقب النادي ↢  يتم تغيير لقب ناديك

⌯ توب النوادي ↢  يعرض أعلى 10 نوادٍ في اللعبة

]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/copmaha') then
local UserId = Text:match('(%d+)/copmaha')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'المعرض', data = UserId..'/almardes'},
},
{
{text = 'المزارع', data = UserId..'/almazras'},  {text = 'النوادي', data = UserId..'/nawadyss'},
},
{
{text = 'الشركات', data = UserId..'/copmaha'},
},
}
}
local TextHelp = [[
☆ أوامر الشركات 🥤

⌯ انشاء شركه + الاسم ↢  تقوم بإنشاء شركه وتتمكن من اضافه الموظفين

⌯ شركتي ↢ يعرض لك عدد اعضاء شركتك و فلوسك

⌯ كشف شركه + اسم شركه ↢  تقوم بي عرض عدد اعضاء شركه و فلوس

⌯ توظيف ↢ تضيف موظف لى شركتك

⌯ طرد الموظف ↢ تطرد الموظف من شركتك

⌯ استقاله ↢ استقاله من الشركه

]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/company_yes/(%d+)') then
local Data = {Text:match('(%d+)/company_yes/(%d+)')}
if tonumber(Data[1]) ~= tonumber(UserId) then
return bot.answerCallbackQuery(data.id, "الطلب ليس لك", true)
end
if tonumber(UserId) == tonumber(Data[1]) then
if Redis:get(SILV.."company_request:"..Data[1]) then
local Cname = Redis:get(SILV.."companys_name:"..Data[2])
Redis:sadd(SILV.."company:mem:"..Cname, UserId)
Redis:sadd(SILV.."in_company:", UserId)
Redis:set(SILV.."in_company:name:"..UserId, Cname)
local mem_tag = "["..bot.getUser(UserId).first_name.."](tg://user?id="..UserId..")"
bot.sendText(Data[2],0, "اللاعب "..mem_tag.." وافق على الانضمام الى شركتك","md",true)
edit(ChatId,Msg_id,"تم قبول الطلب بنجاح ✅", 'md',false)
else
edit(ChatId,Msg_id,"انتهى الطلب للاسف", 'md',false)
end
end
end
if Text and Text:match('(%d+)/company_no/(%d+)') then
local UserId = {Text:match('(%d+)/company_no/(%d+)')}
if tonumber(UserId[1]) ~= tonumber(UserId) then
return bot.answerCallbackQuery(data.id, "الطلب ليس لك", true)
else
Redis:del(SILV.."company_request:"..UserId[1])
local mem_tag = "["..bot.getUser(UserId).first_name.."](tg://user?id="..UserId..")"
bot.sendText(Data[2],0, "اللاعب "..mem_tag.." رفض العمل في شركتك","md",true)
return bot.editMessageText(chat_id,msg_id,"تم رفض الطلب بنجاح", 'md', false)
end
end
if Text and Text:match('(%d+)/lock_link') then
local UserId = Text:match('(%d+)/lock_link')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:Link"..ChatId,"del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل الروابط").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_spam') then
local UserId = Text:match('(%d+)/lock_spam')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:Spam"..ChatId,"del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل الكلايش").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_keypord') then
local UserId = Text:match('(%d+)/lock_keypord')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:Keyboard"..ChatId,"del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل الكيبورد").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_voice') then
local UserId = Text:match('(%d+)/lock_voice')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:vico"..ChatId,"del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل الاغاني").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_gif') then
local UserId = Text:match('(%d+)/lock_gif')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:Animation"..ChatId,"del")
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل المتحركات").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_files') then
local UserId = Text:match('(%d+)/lock_files')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:Document"..ChatId,"del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل الملفات").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_text') then
local UserId = Text:match('(%d+)/lock_text')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:text"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل الشات").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_video') then
local UserId = Text:match('(%d+)/lock_video')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:Video"..ChatId,"del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل الفيديو").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_photo') then
local UserId = Text:match('(%d+)/lock_photo')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:Photo"..ChatId,"del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل الصور").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_username') then
local UserId = Text:match('(%d+)/lock_username')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:User:Name"..ChatId,"del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل المعرفات").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_tags') then
local UserId = Text:match('(%d+)/lock_tags')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:hashtak"..ChatId,"del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل التاك").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_bots') then
local UserId = Text:match('(%d+)/lock_bots')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:Bot:kick"..ChatId,"del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل البوتات").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_fwd') then
local UserId = Text:match('(%d+)/lock_fwd')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:forward"..ChatId,"del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل التوجيه").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_audio') then
local UserId = Text:match('(%d+)/lock_audio')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:Audio"..ChatId,"del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل الصوت").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_stikear') then
local UserId = Text:match('(%d+)/lock_stikear')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:Sticker"..ChatId,"del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل الملصقات").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_phone') then
local UserId = Text:match('(%d+)/lock_phone')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:Contact"..ChatId,"del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل الجهات").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_joine') then
local UserId = Text:match('(%d+)/lock_joine')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:Join"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل الدخول").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_addmem') then
local UserId = Text:match('(%d+)/lock_addmem')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:AddMempar"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل الاضافه").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_videonote') then
local UserId = Text:match('(%d+)/lock_videonote')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:Unsupported"..ChatId,"del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل بصمة الفيديو").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_pin') then
local UserId = Text:match('(%d+)/lock_pin')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:lockpin"..ChatId,(bot.getChatPinnedMessage(ChatId).id or true)) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل التثبيت").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_tgservir') then
local UserId = Text:match('(%d+)/lock_tgservir')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:tagservr"..ChatId,true)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل الاشعارات").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_markdaun') then
local UserId = Text:match('(%d+)/lock_markdaun')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:Markdaun"..ChatId,"del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل الماركدون").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_edits') and data.Originators then
local UserId = Text:match('(%d+)/lock_edits')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:edit"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل التعديل").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_games') then
local UserId = Text:match('(%d+)/lock_games')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:geam"..ChatId,"del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل الالعاب").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_flood') then
local UserId = Text:match('(%d+)/lock_flood')
if tonumber(IdUser) == tonumber(UserId) then
Redis:hset(SILV.."Mero:Spam:Group:User"..ChatId ,"Spam:User","del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل التكرار").Lock, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/lock_linkkid') then
local UserId = Text:match('(%d+)/lock_linkkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:Link"..ChatId,"ked")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل الروابط").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_spamkid') then
local UserId = Text:match('(%d+)/lock_spamkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:Spam"..ChatId,"ked")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل الكلايش").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_keypordkid') then
local UserId = Text:match('(%d+)/lock_keypordkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:Keyboard"..ChatId,"ked")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل الكيبورد").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_voicekid') then
local UserId = Text:match('(%d+)/lock_voicekid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:vico"..ChatId,"ked")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل الاغاني").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_gifkid') then
local UserId = Text:match('(%d+)/lock_gifkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:Animation"..ChatId,"ked")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل المتحركات").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_fileskid') then
local UserId = Text:match('(%d+)/lock_fileskid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:Document"..ChatId,"ked")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل الملفات").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_videokid') then
local UserId = Text:match('(%d+)/lock_videokid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:Video"..ChatId,"ked")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل الفيديو").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_photokid') then
local UserId = Text:match('(%d+)/lock_photokid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:Photo"..ChatId,"ked")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل الصور").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_usernamekid') then
local UserId = Text:match('(%d+)/lock_usernamekid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:User:Name"..ChatId,"ked")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل المعرفات").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_tagskid') then
local UserId = Text:match('(%d+)/lock_tagskid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:hashtak"..ChatId,"ked")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل التاك").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_fwdkid') then
local UserId = Text:match('(%d+)/lock_fwdkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:forward"..ChatId,"ked")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل التوجيه").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_audiokid') then
local UserId = Text:match('(%d+)/lock_audiokid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:Audio"..ChatId,"ked")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل الصوت").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_stikearkid') then
local UserId = Text:match('(%d+)/lock_stikearkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:Sticker"..ChatId,"ked")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل الملصقات").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_phonekid') then
local UserId = Text:match('(%d+)/lock_phonekid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:Contact"..ChatId,"ked")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل الجهات").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_videonotekid') then
local UserId = Text:match('(%d+)/lock_videonotekid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:Unsupported"..ChatId,"ked")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل بصمة الفيديو").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_markdaunkid') then
local UserId = Text:match('(%d+)/lock_markdaunkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:Markdaun"..ChatId,"ked")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل الماركدون").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_gameskid') then
local UserId = Text:match('(%d+)/lock_gameskid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:geam"..ChatId,"ked")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل الالعاب").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_floodkid') then
local UserId = Text:match('(%d+)/lock_floodkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:hset(SILV.."Mero:Spam:Group:User"..ChatId ,"Spam:User","keed")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل التكرار").lockKid, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/lock_linkktm') then
local UserId = Text:match('(%d+)/lock_linkktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:Link"..ChatId,"ktm")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل الروابط").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_spamktm') then
local UserId = Text:match('(%d+)/lock_spamktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:Spam"..ChatId,"ktm")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل الكلايش").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_keypordktm') then
local UserId = Text:match('(%d+)/lock_keypordktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:Keyboard"..ChatId,"ktm")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل الكيبورد").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_voicektm') then
local UserId = Text:match('(%d+)/lock_voicektm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:vico"..ChatId,"ktm")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل الاغاني").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_gifktm') then
local UserId = Text:match('(%d+)/lock_gifktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:Animation"..ChatId,"ktm")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل المتحركات").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_filesktm') then
local UserId = Text:match('(%d+)/lock_filesktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:Document"..ChatId,"ktm")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل الملفات").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_videoktm') then
local UserId = Text:match('(%d+)/lock_videoktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:Video"..ChatId,"ktm")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل الفيديو").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_photoktm') then
local UserId = Text:match('(%d+)/lock_photoktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:Photo"..ChatId,"ktm")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل الصور").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_usernamektm') then
local UserId = Text:match('(%d+)/lock_usernamektm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:User:Name"..ChatId,"ktm")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل المعرفات").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_tagsktm') then
local UserId = Text:match('(%d+)/lock_tagsktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:hashtak"..ChatId,"ktm")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل التاك").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_fwdktm') then
local UserId = Text:match('(%d+)/lock_fwdktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:forward"..ChatId,"ktm")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل التوجيه").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_audioktm') then
local UserId = Text:match('(%d+)/lock_audioktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:Audio"..ChatId,"ktm")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل الصوت").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_stikearktm') then
local UserId = Text:match('(%d+)/lock_stikearktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:Sticker"..ChatId,"ktm")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل الملصقات").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_phonektm') then
local UserId = Text:match('(%d+)/lock_phonektm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:Contact"..ChatId,"ktm")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل الجهات").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_videonotektm') then
local UserId = Text:match('(%d+)/lock_videonotektm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:Unsupported"..ChatId,"ktm")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل بصمة الفيديو").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_markdaunktm') then
local UserId = Text:match('(%d+)/lock_markdaunktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:Markdaun"..ChatId,"ktm")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل الماركدون").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_gamesktm') then
local UserId = Text:match('(%d+)/lock_gamesktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:geam"..ChatId,"ktm")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل الالعاب").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_floodktm') then
local UserId = Text:match('(%d+)/lock_floodktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:hset(SILV.."Mero:Spam:Group:User"..ChatId ,"Spam:User","mute")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل التكرار").lockKtm, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/lock_linkkick') then
local UserId = Text:match('(%d+)/lock_linkkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:Link"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل الروابط").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_spamkick') then
local UserId = Text:match('(%d+)/lock_spamkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:Spam"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل الكلايش").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_keypordkick') then
local UserId = Text:match('(%d+)/lock_keypordkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:Keyboard"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل الكيبورد").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_voicekick') then
local UserId = Text:match('(%d+)/lock_voicekick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:vico"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل الاغاني").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_gifkick') then
local UserId = Text:match('(%d+)/lock_gifkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:Animation"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل المتحركات").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_fileskick') then
local UserId = Text:match('(%d+)/lock_fileskick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:Document"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل الملفات").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_videokick') then
local UserId = Text:match('(%d+)/lock_videokick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:Video"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل الفيديو").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_photokick') then
local UserId = Text:match('(%d+)/lock_photokick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:Photo"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل الصور").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_usernamekick') then
local UserId = Text:match('(%d+)/lock_usernamekick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:User:Name"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل المعرفات").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_tagskick') then
local UserId = Text:match('(%d+)/lock_tagskick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:hashtak"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل التاك").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_fwdkick') then
local UserId = Text:match('(%d+)/lock_fwdkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:forward"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل التوجيه").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_audiokick') then
local UserId = Text:match('(%d+)/lock_audiokick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:Audio"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل الصوت").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_stikearkick') then
local UserId = Text:match('(%d+)/lock_stikearkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:Sticker"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل الملصقات").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_phonekick') then
local UserId = Text:match('(%d+)/lock_phonekick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:Contact"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل الجهات").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_videonotekick') then
local UserId = Text:match('(%d+)/lock_videonotekick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:Unsupported"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل بصمة الفيديو").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_markdaunkick') then
local UserId = Text:match('(%d+)/lock_markdaunkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:Markdaun"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل الماركدون").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_gameskick') then
local UserId = Text:match('(%d+)/lock_gameskick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:geam"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل الالعاب").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_floodkick') then
local UserId = Text:match('(%d+)/lock_floodkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:hset(SILV.."Mero:Spam:Group:User"..ChatId ,"Spam:User","kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل التكرار").lockKick, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/unmute_link') then
local UserId = Text:match('(%d+)/unmute_link')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(SILV.."Mero:Status:Link"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم تعطيل الرابط").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_welcome') then
local UserId = Text:match('(%d+)/unmute_welcome')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(SILV.."Mero:Status:Welcome"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم تعطيل الترحيب").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_Id') then
local UserId = Text:match('(%d+)/unmute_Id')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(SILV.."Mero:Status:Id"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم تعطيل الايدي").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_IdPhoto') then
local UserId = Text:match('(%d+)/unmute_IdPhoto')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(SILV.."Mero:Status:IdPhoto"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم تعطيل الايدي بالصوره").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_ryple') then
local UserId = Text:match('(%d+)/unmute_ryple')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(SILV.."Mero:Status:Reply"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم تعطيل الردود").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_ryplesudo') then
local UserId = Text:match('(%d+)/unmute_ryplesudo')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(SILV.."Mero:Status:ReplySudo"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم تعطيل الردود عام").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_setadmib') then
local UserId = Text:match('(%d+)/unmute_setadmib')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(SILV.."Mero:Status:SetId"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم تعطيل الرفع").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_kickmembars') then
local UserId = Text:match('(%d+)/unmute_kickmembars')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(SILV.."Mero:Status:BanId"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم تعطيل ( الطرد - الحظر)").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_games') then
local UserId = Text:match('(%d+)/unmute_games')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(SILV.."Mero:Status:Games"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم تعطيل الالعاب").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_kickme') then
local UserId = Text:match('(%d+)/unmute_kickme')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(SILV.."Mero:Status:KickMe"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم تعطيل اطردني").unLock, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/mute_link') then
local UserId = Text:match('(%d+)/mute_link')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Status:Link"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم تفعيل الرابط").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_welcome') then
local UserId = Text:match('(%d+)/mute_welcome')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Status:Welcome"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم تفعيل الترحيب").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_Id') then
local UserId = Text:match('(%d+)/mute_Id')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Status:Id"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم تفعيل الايدي").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_IdPhoto') then
local UserId = Text:match('(%d+)/mute_IdPhoto')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Status:IdPhoto"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم تفعيل الايدي بالصوره").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_ryple') then
local UserId = Text:match('(%d+)/mute_ryple')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Status:Reply"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم تفعيل الردود").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_ryplesudo') then
local UserId = Text:match('(%d+)/mute_ryplesudo')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Status:ReplySudo"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم تفعيل الردود عام").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_setadmib') then
local UserId = Text:match('(%d+)/mute_setadmib')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Status:SetId"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم تفعيل الرفع").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_kickmembars') then
local UserId = Text:match('(%d+)/mute_kickmembars')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Status:BanId"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم تفعيل ( الطرد - الحظر )").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_games') then
local UserId = Text:match('(%d+)/mute_games')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Status:Games"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم تفعيل الالعاب").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_kickme') then
local UserId = Text:match('(%d+)/mute_kickme')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Status:KickMe"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم تفعيل اطردني").unLock, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/addAdmins@(.*)') then
local UserId = {Text:match('(%d+)/addAdmins@(.*)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
local Info_Members = bot.getSupergroupMembers(UserId[2], "Administrators", "*", 0, 200)
local List_Members = Info_Members.members
x = 0
y = 0
for k, v in pairs(List_Members) do
if Info_Members.members[k].bot_info == nil then
if Info_Members.members[k].status.luatele == "chatMemberStatusCreator" then
Redis:sadd(SILV.."Mero:TheBasicsQ:Group"..UserId[2],v.member_id.user_id) 
x = x + 1
else
Redis:sadd(SILV.."Mero:Addictive:Group"..UserId[2],v.member_id.user_id) 
y = y + 1
end
end
end
bot.answerCallbackQuery(data.id, "⇜ تم رفع ("..y..") ادمنية \n⇜ وتم رفع المالك ", true)
end
end
if Text and Text:match('(%d+)/LockAllGroup@(.*)') then
local UserId = {Text:match('(%d+)/LockAllGroup@(.*)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
Redis:set(SILV.."Mero:Lock:tagservrbot"..UserId[2],true)   
list ={"Lock:Bot:kick","Lock:User:Name","Lock:hashtak","Lock:Cmd","Lock:Link","Lock:forward","Lock:Keyboard","Lock:geam","Lock:Photo","Lock:Animation","Lock:Video","Lock:Audio","Lock:vico","Lock:Sticker","Lock:Document","Lock:Unsupported","Lock:Markdaun","Lock:Contact","Lock:Spam"}
for i,lock in pairs(list) do 
Redis:set(SILV..'Mero:'..lock..UserId[2],"del")    
end
bot.answerCallbackQuery(data.id, "⇜ تم قفل جميع الاوامر ", true)
end
end
if Text and Text:match('/leftgroup@(.*)') then
local UserId = Text:match('/leftgroup@(.*)')
bot.answerCallbackQuery(data.id, "⇜ تم مغادره البوت من القروب", true)
bot.leaveChat(UserId)
end
if Text and Text:match('(%d+)/trtep@(.*)') then
local UserId = {Text:match('(%d+)/trtep@(.*)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
Redis:set(SILV.."Mero:Get:Reides:Commands:Group"..UserId[2]..":"..'تعط','تعطيل الايدي بالصوره')
Redis:set(SILV.."Mero:Get:Reides:Commands:Group"..UserId[2]..":"..'تفع','تفعيل الايدي بالصوره')
Redis:set(SILV.."Mero:Get:Reides:Commands:Group"..UserId[2]..":"..'ا','ايدي')
Redis:set(SILV.."Mero:Get:Reides:Commands:Group"..UserId[2]..":"..'م','رفع مميز')
Redis:set(SILV.."Mero:Get:Reides:Commands:Group"..UserId[2]..":"..'اد', 'رفع ادمن')
Redis:set(SILV.."Mero:Get:Reides:Commands:Group"..UserId[2]..":"..'مد','رفع مدير')
Redis:set(SILV.."Mero:Get:Reides:Commands:Group"..UserId[2]..":"..'منش', 'رفع منشئ')
Redis:set(SILV.."Mero:Get:Reides:Commands:Group"..UserId[2]..":"..'اس', 'رفع منشئ اساسي')
Redis:set(SILV.."Mero:Get:Reides:Commands:Group"..UserId[2]..":"..'مط','رفع M')
Redis:set(SILV.."Mero:Get:Reides:Commands:Group"..UserId[2]..":"..'تن','تنزيل الكل')
Redis:set(SILV.."Mero:Get:Reides:Commands:Group"..UserId[2]..":"..'را','الرابط')
Redis:set(SILV.."Mero:Get:Reides:Commands:Group"..UserId[2]..":"..'رر','الردود')
Redis:set(SILV.."Mero:Get:Reides:Commands:Group"..UserId[2]..":"..'،،','مسح المكتومين')
Redis:set(SILV.."Mero:Get:Reides:Commands:Group"..UserId[2]..":"..'رد','اضف رد')
Redis:set(SILV.."Mero:Get:Reides:Commands:Group"..UserId[2]..":"..'غ','غنيلي')
Redis:set(SILV.."Mero:Get:Reides:Commands:Group"..UserId[2]..":"..'رس','رسائلي')
Redis:set(SILV.."Mero:Get:Reides:Commands:Group"..UserId[2]..":"..'ثانوي','رفع مطور ثانوي')
Redis:set(SILV.."Mero:Get:Reides:Commands:Group"..UserId[2]..":"..'مس','مسح تعديلاتي')
Redis:set(SILV.."Mero:Get:Reides:Commands:Group"..UserId[2]..":"..'ن','نقاطي')
Redis:set(SILV.."Mero:Get:Reides:Commands:Group"..UserId[2]..":"..'س','اسالني')
Redis:set(SILV.."Mero:Get:Reides:Commands:Group"..UserId[2]..":"..'ل','لغز')
Redis:set(SILV.."Mero:Get:Reides:Commands:Group"..UserId[2]..":"..'مع','معاني')
Redis:set(SILV.."Mero:Get:Reides:Commands:Group"..UserId[2]..":"..'ح','حزوره')
Redis:set(SILV.."Mero:Get:Reides:Commands:Group"..UserId[2]..":"..'رف','رفع القيود')
Redis:set(SILV.."Mero:Get:Reides:Commands:Group"..UserId[2]..":"..'الغ','الغاء حظر')
Redis:set(SILV.."Mero:Get:Reides:Commands:Group"..UserId[2]..":"..'ث','تثبيت')
Redis:set(SILV.."Mero:Get:Reides:Commands:Group"..UserId[2]..":"..'ك','كشف')
Redis:set(SILV.."Mero:Get:Reides:Commands:Group"..UserId[2]..":"..'تت','تاك')
Redis:set(SILV.."Mero:Get:Reides:Commands:Group"..UserId[2]..":"..'تك','تاك للكل')
Redis:set(SILV.."Mero:Get:Reides:Commands:Group"..UserId[2]..":"..'تغ','تغيير الايدي')
Redis:set(SILV.."Mero:Get:Reides:Commands:Group"..UserId[2]..":"..'تنز','تنزيل جميع الرتب')
Redis:set(SILV.."Mero:Get:Reides:Commands:Group"..UserId[2]..":"..'قق','قفل الاشعارات')
Redis:set(SILV.."Mero:Get:Reides:Commands:Group"..UserId[2]..":"..'فف','فتح الاشعارات')
Redis:set(SILV.."Mero:Get:Reides:Commands:Group"..UserId[2]..":"..'مر','مسح رد')
Redis:set(SILV.."Mero:Get:Reides:Commands:Group"..UserId[2]..":"..'امر','اضف امر')
Redis:set(SILV.."Mero:Get:Reides:Commands:Group"..UserId[2]..":"..'ش','شعر')
Redis:set(SILV.."Mero:Get:Reides:Commands:Group"..UserId[2]..":"..'غغ','اغنيه')
bot.answerCallbackQuery(data.id, "⇜ تم ترتيب الاوامر ", true)
end
end
if Text and Text:match('(%d+)/groupNumseteng//(%d+)') then
local UserId = {Text:match('(%d+)/groupNumseteng//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
return GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id)
end
end
if Text and Text:match('(%d+)/rankup//(%d+)') then
local UserId = {Text:match('(%d+)/rankup//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
return editrtp(ChatId,UserId[1],Msg_id,UserId[2])
end
end
if Text and Text:match('(%d+)/sting//(%d+)') then
local UserId = {Text:match('(%d+)/sting//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
return muteUser(ChatId,UserId[1],Msg_id,UserId[2])
end
end
if Text and Text:match('(%d+)/groupNum1//(%d+)') then
local UserId = {Text:match('(%d+)/groupNum1//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if tonumber(GetAdminsNum(ChatId,UserId[2]).change_info) == 1 then
bot.answerCallbackQuery(data.id, "⌯ تم تعطيل صلاحيه تغيير المعلومات", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,'لا',nil,nil,nil,nil,nil)
local response = https.request("https://api.telegram.org/bot" .. Token .. "/promoteChatMember?chat_id=" .. ChatId .. "&user_id=" .. UserId[2] .. "&&can_manage_voice_chats="..GetAdminsNum(ChatId,UserId[2]).calls.."&can_change_info=0&can_delete_messages="..GetAdminsNum(ChatId,UserId[2]).delete_messages.."&can_invite_users="..GetAdminsNum(ChatId,UserId[2]).invite_users.."&can_restrict_members="..GetAdminsNum(ChatId,UserId[2]).restrict_members.."&can_pin_messages="..GetAdminsNum(ChatId,UserId[2]).pin_messages.."&can_promote_members="..GetAdminsNum(ChatId,UserId[2]).promote.."")
else
bot.answerCallbackQuery(data.id, "⌯ تم تفعيل صلاحيه تغيير المعلومات", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,'نعم',nil,nil,nil,nil,nil,nil)
local response = https.request("https://api.telegram.org/bot" .. Token .. "/promoteChatMember?chat_id=" .. ChatId .. "&user_id=" .. UserId[2] .. "&&can_manage_voice_chats="..GetAdminsNum(ChatId,UserId[2]).calls.."&can_change_info=1&can_delete_messages="..GetAdminsNum(ChatId,UserId[2]).delete_messages.."&can_invite_users="..GetAdminsNum(ChatId,UserId[2]).invite_users.."&can_restrict_members="..GetAdminsNum(ChatId,UserId[2]).restrict_members.."&can_pin_messages="..GetAdminsNum(ChatId,UserId[2]).pin_messages.."&can_promote_members="..GetAdminsNum(ChatId,UserId[2]).promote.."")
print(response)
end
end
end
if Text and Text:match('(%d+)/groupNum2//(%d+)') then
local UserId = {Text:match('(%d+)/groupNum2//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if tonumber(GetAdminsNum(ChatId,UserId[2]).pin_messages) == 1 then
bot.answerCallbackQuery(data.id, "⌯ تم تعطيل صلاحيه التثبيت", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,'لا',nil,nil,nil,nil,nil)
local response = https.request("https://api.telegram.org/bot" .. Token .. "/promoteChatMember?chat_id=" .. ChatId .. "&user_id=" .. UserId[2] .. "&&can_manage_voice_chats="..GetAdminsNum(ChatId,UserId[2]).calls.."&can_change_info="..GetAdminsNum(ChatId,UserId[2]).change_info.."&can_delete_messages="..GetAdminsNum(ChatId,UserId[2]).delete_messages.."&can_invite_users="..GetAdminsNum(ChatId,UserId[2]).invite_users.."&can_restrict_members="..GetAdminsNum(ChatId,UserId[2]).restrict_members.."&can_pin_messages=0&can_promote_members="..GetAdminsNum(ChatId,UserId[2]).promote.."")
print(response)
else
bot.answerCallbackQuery(data.id, "⌯ تم تفعيل صلاحيه التثبيت", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,'نعم',nil,nil,nil,nil,nil)
local response = https.request("https://api.telegram.org/bot" .. Token .. "/promoteChatMember?chat_id=" .. ChatId .. "&user_id=" .. UserId[2] .. "&&can_manage_voice_chats="..GetAdminsNum(ChatId,UserId[2]).calls.."&can_change_info="..GetAdminsNum(ChatId,UserId[2]).change_info.."&can_delete_messages="..GetAdminsNum(ChatId,UserId[2]).delete_messages.."&can_invite_users="..GetAdminsNum(ChatId,UserId[2]).invite_users.."&can_restrict_members="..GetAdminsNum(ChatId,UserId[2]).restrict_members.."&can_pin_messages=1&can_promote_members="..GetAdminsNum(ChatId,UserId[2]).promote.."")
print(response)
end
end
end
if Text and Text:match('(%d+)/groupNum3//(%d+)') then
local UserId = {Text:match('(%d+)/groupNum3//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if tonumber(GetAdminsNum(ChatId,UserId[2]).restrict_members) == 1 then
bot.answerCallbackQuery(data.id, "⌯ تم تعطيل صلاحيه الحظر", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,'لا',nil,nil,nil,nil)
local response = https.request("https://api.telegram.org/bot" .. Token .. "/promoteChatMember?chat_id=" .. ChatId .. "&user_id=" .. UserId[2] .. "&&can_manage_voice_chats="..GetAdminsNum(ChatId,UserId[2]).calls.."&can_change_info="..GetAdminsNum(ChatId,UserId[2]).change_info.."&can_delete_messages="..GetAdminsNum(ChatId,UserId[2]).delete_messages.."&can_invite_users="..GetAdminsNum(ChatId,UserId[2]).invite_users.."&can_restrict_members=0&can_pin_messages="..GetAdminsNum(ChatId,UserId[2]).pin_messages.."&can_promote_members="..GetAdminsNum(ChatId,UserId[2]).promote.."")
print(response)
else
bot.answerCallbackQuery(data.id, "⌯ تم تفعيل صلاحيه الحظر", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,'نعم',nil,nil,nil,nil)
local response = https.request("https://api.telegram.org/bot" .. Token .. "/promoteChatMember?chat_id=" .. ChatId .. "&user_id=" .. UserId[2] .. "&&can_manage_voice_chats="..GetAdminsNum(ChatId,UserId[2]).calls.."&can_change_info="..GetAdminsNum(ChatId,UserId[2]).change_info.."..&can_delete_messages="..GetAdminsNum(ChatId,UserId[2]).delete_messages.."&can_invite_users="..GetAdminsNum(ChatId,UserId[2]).invite_users.."&can_restrict_members=1&can_pin_messages="..GetAdminsNum(ChatId,UserId[2]).pin_messages.."&can_promote_members="..GetAdminsNum(ChatId,UserId[2]).promote.."")
print(response)
end
end
end
if Text and Text:match('(%d+)/groupNum4//(%d+)') then
local UserId = {Text:match('(%d+)/groupNum4//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if tonumber(GetAdminsNum(ChatId,UserId[2]).invite_users) == 1 then
bot.answerCallbackQuery(data.id, "⌯ تم تعطيل صلاحيه دعوه المستخدمين", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,nil,'لا',nil,nil,nil)
local response = https.request("https://api.telegram.org/bot" .. Token .. "/promoteChatMember?chat_id=" .. ChatId .. "&user_id=" .. UserId[2] .. "&&can_manage_voice_chats="..GetAdminsNum(ChatId,UserId[2]).calls.."&can_change_info="..GetAdminsNum(ChatId,UserId[2]).change_info.."&can_delete_messages="..GetAdminsNum(ChatId,UserId[2]).delete_messages.."&can_invite_users=0&can_restrict_members="..GetAdminsNum(ChatId,UserId[2]).restrict_members.."&can_pin_messages="..GetAdminsNum(ChatId,UserId[2]).pin_messages.."&can_promote_members="..GetAdminsNum(ChatId,UserId[2]).promote.."")
print(response)
else
bot.answerCallbackQuery(data.id, "⌯ تم تفعيل صلاحيه دعوه المستخدمين", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,nil,'نعم',nil,nil,nil)
local response = https.request("https://api.telegram.org/bot" .. Token .. "/promoteChatMember?chat_id=" .. ChatId .. "&user_id=" .. UserId[2] .. "&&can_manage_voice_chats="..GetAdminsNum(ChatId,UserId[2]).calls.."&can_change_info="..GetAdminsNum(ChatId,UserId[2]).change_info.."&can_delete_messages="..GetAdminsNum(ChatId,UserId[2]).delete_messages.."&can_invite_users=1&can_restrict_members="..GetAdminsNum(ChatId,UserId[2]).restrict_members.."&can_pin_messages="..GetAdminsNum(ChatId,UserId[2]).pin_messages.."&can_promote_members="..GetAdminsNum(ChatId,UserId[2]).promote.."")
print(response)
end
end
end
if Text and Text:match('(%d+)/groupNum5//(%d+)') then
local UserId = {Text:match('(%d+)/groupNum5//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if tonumber(GetAdminsNum(ChatId,UserId[2]).delete_messages) == 1 then
bot.answerCallbackQuery(data.id, "⌯ تم تعطيل صلاحيه مسح الرسائل", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,nil,nil,'لا',nil,nil)
local response = https.request("https://api.telegram.org/bot" .. Token .. "/promoteChatMember?chat_id=" .. ChatId .. "&user_id=" .. UserId[2] .. "&&can_manage_voice_chats="..GetAdminsNum(ChatId,UserId[2]).calls.."&can_change_info="..GetAdminsNum(ChatId,UserId[2]).change_info.."&can_delete_messages=0&can_invite_users="..GetAdminsNum(ChatId,UserId[2]).invite_users.."&can_restrict_members="..GetAdminsNum(ChatId,UserId[2]).restrict_members.."&can_pin_messages="..GetAdminsNum(ChatId,UserId[2]).pin_messages.."&can_promote_members="..GetAdminsNum(ChatId,UserId[2]).promote.."")
print(response)
else
bot.answerCallbackQuery(data.id, "⌯ تم تفعيل صلاحيه مسح الرسائل", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,nil,nil,'نعم',nil,nil)
local response = https.request("https://api.telegram.org/bot" .. Token .. "/promoteChatMember?chat_id=" .. ChatId .. "&user_id=" .. UserId[2] .. "&&can_manage_voice_chats="..GetAdminsNum(ChatId,UserId[2]).calls.."&can_change_info="..GetAdminsNum(ChatId,UserId[2]).change_info.."&can_delete_messages=1&can_invite_users="..GetAdminsNum(ChatId,UserId[2]).invite_users.."&can_restrict_members="..GetAdminsNum(ChatId,UserId[2]).restrict_members.."&can_pin_messages="..GetAdminsNum(ChatId,UserId[2]).pin_messages.."&can_promote_members="..GetAdminsNum(ChatId,UserId[2]).promote.."")
print(response)
end
end
end
if Text and Text:match('(%d+)/groupNum6//(%d+)') then
local UserId = {Text:match('(%d+)/groupNum6//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if tonumber(GetAdminsNum(ChatId,UserId[2]).promote) == 1 then
bot.answerCallbackQuery(data.id, "⌯ تم تعطيل صلاحيه اضافه مشرفين", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,nil,nil,nil,'لا',nil)
local response = https.request("https://api.telegram.org/bot" .. Token .. "/promoteChatMember?chat_id=" .. ChatId .. "&user_id=" .. UserId[2] .. "&&can_manage_voice_chats="..GetAdminsNum(ChatId,UserId[2]).calls.."&can_change_info="..GetAdminsNum(ChatId,UserId[2]).change_info.."&can_delete_messages="..GetAdminsNum(ChatId,UserId[2]).delete_messages.."&can_invite_users="..GetAdminsNum(ChatId,UserId[2]).invite_users.."&can_restrict_members="..GetAdminsNum(ChatId,UserId[2]).restrict_members.."&can_pin_messages="..GetAdminsNum(ChatId,UserId[2]).pin_messages.."&can_promote_members=0")
print(response)
else
bot.answerCallbackQuery(data.id, "⌯ تم تفعيل صلاحيه اضافه مشرفين", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,nil,nil,nil,'نعم',nil)
local response = https.request("https://api.telegram.org/bot" .. Token .. "/promoteChatMember?chat_id=" .. ChatId .. "&user_id=" .. UserId[2] .. "&&can_manage_voice_chats="..GetAdminsNum(ChatId,UserId[2]).calls.."&can_change_info="..GetAdminsNum(ChatId,UserId[2]).change_info.."&can_delete_messages="..GetAdminsNum(ChatId,UserId[2]).delete_messages.."&can_invite_users="..GetAdminsNum(ChatId,UserId[2]).invite_users.."&can_restrict_members="..GetAdminsNum(ChatId,UserId[2]).restrict_members.."&can_pin_messages="..GetAdminsNum(ChatId,UserId[2]).pin_messages.."&can_promote_members=1")
print(response)
end
end
end
if Text and Text:match('(%d+)/groupNum7//(%d+)') then
local UserId = {Text:match('(%d+)/groupNum7//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if tonumber(GetAdminsNum(ChatId,UserId[2]).calls) == 1 then
bot.answerCallbackQuery(data.id, "⌯ تم تعطيل صلاحيه ادارة اتصالات", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,nil,nil,nil,nil,'لا')
local response = https.request("https://api.telegram.org/bot" .. Token .. "/promoteChatMember?chat_id=" .. ChatId .. "&user_id=" .. UserId[2] .. "&&can_manage_voice_chats=0&can_change_info="..GetAdminsNum(ChatId,UserId[2]).change_info.."&can_delete_messages="..GetAdminsNum(ChatId,UserId[2]).delete_messages.."&can_invite_users="..GetAdminsNum(ChatId,UserId[2]).invite_users.."&can_restrict_members="..GetAdminsNum(ChatId,UserId[2]).restrict_members.."&can_pin_messages="..GetAdminsNum(ChatId,UserId[2]).pin_messages.."&can_promote_members="..GetAdminsNum(ChatId,UserId[2]).promote.."")
print(response)
else
bot.answerCallbackQuery(data.id, "⌯ تم تفعيل صلاحيه ادارة اتصالات", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,nil,nil,nil,nil,'نعم')
local response = https.request("https://api.telegram.org/bot" .. Token .. "/promoteChatMember?chat_id=" .. ChatId .. "&user_id=" .. UserId[2] .. "&&can_manage_voice_chats=1&can_change_info="..GetAdminsNum(ChatId,UserId[2]).change_info.."&can_delete_messages="..GetAdminsNum(ChatId,UserId[2]).delete_messages.."&can_invite_users="..GetAdminsNum(ChatId,UserId[2]).invite_users.."&can_restrict_members="..GetAdminsNum(ChatId,UserId[2]).restrict_members.."&can_pin_messages="..GetAdminsNum(ChatId,UserId[2]).pin_messages.."&can_promote_members="..GetAdminsNum(ChatId,UserId[2]).promote.."")
print(response)
end
end
end
if Text and Text:match('(%d+)/web') then
local UserId = Text:match('(%d+)/web')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).web == true then
bot.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, false, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
else
bot.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, true, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
elseif Text and Text:match('(%d+)/info') then
local UserId = Text:match('(%d+)/info')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).info == true then
bot.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, false, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
else
bot.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, true, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
elseif Text and Text:match('(%d+)/invite') then
local UserId = Text:match('(%d+)/invite')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).invite == true then
bot.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, false, Getpermissions(ChatId).pin)
else
bot.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, true, Getpermissions(ChatId).pin)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
elseif Text and Text:match('(%d+)/pin') then
local UserId = Text:match('(%d+)/pin')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).pin == true then
bot.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, false)
else
bot.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, true)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
elseif Text and Text:match('(%d+)/media') then
local UserId = Text:match('(%d+)/media')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).media == true then
bot.setChatPermissions(ChatId, Getpermissions(ChatId).messges, false, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
else
bot.setChatPermissions(ChatId, Getpermissions(ChatId).messges, true, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
elseif Text and Text:match('(%d+)/messges') then
local UserId = Text:match('(%d+)/messges')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).messges == true then
bot.setChatPermissions(ChatId, false, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
else
bot.setChatPermissions(ChatId, true, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
elseif Text and Text:match('(%d+)/other') then
local UserId = Text:match('(%d+)/other')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).other == true then
bot.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, false, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
else
bot.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, true, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
elseif Text and Text:match('(%d+)/polls') then
local UserId = Text:match('(%d+)/polls')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).polls == true then
bot.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, false, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
else
bot.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, true, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
end
if Text and Text:match('(%d+)/listallAddorrem') then
local UserId = Text:match('(%d+)/listallAddorrem')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'تعطيل الرابط', data = IdUser..'/'.. 'unmute_link'},{text = 'تفعيل الرابط', data = IdUser..'/'.. 'mute_link'},
},
{
{text = 'تعطيل الترحيب', data = IdUser..'/'.. 'unmute_welcome'},{text = 'تفعيل الترحيب', data = IdUser..'/'.. 'mute_welcome'},
},
{
{text = 'تعطيل الايدي', data = IdUser..'/'.. 'unmute_Id'},{text = 'تفعيل الايدي', data = IdUser..'/'.. 'mute_Id'},
},
{
{text = 'تعطيل الايدي بالصوره', data = IdUser..'/'.. 'unmute_IdPhoto'},{text = 'تفعيل الايدي بالصوره', data = IdUser..'/'.. 'mute_IdPhoto'},
},
{
{text = 'تعطيل الردود', data = IdUser..'/'.. 'unmute_ryple'},{text = 'تفعيل الردود', data = IdUser..'/'.. 'mute_ryple'},
},
{
{text = 'تعطيل الردود العامه', data = IdUser..'/'.. 'unmute_ryplesudo'},{text = 'تفعيل الردود العامه', data = IdUser..'/'.. 'mute_ryplesudo'},
},
{
{text = 'تعطيل الرفع', data = IdUser..'/'.. 'unmute_setadmib'},{text = 'تفعيل الرفع', data = IdUser..'/'.. 'mute_setadmib'},
},
{
{text = 'تعطيل الطرد', data = IdUser..'/'.. 'unmute_kickmembars'},{text = 'تفعيل الطرد', data = IdUser..'/'.. 'mute_kickmembars'},
},
{
{text = 'تعطيل الالعاب', data = IdUser..'/'.. 'unmute_games'},{text = 'تفعيل الالعاب', data = IdUser..'/'.. 'mute_games'},
},
{
{text = 'تعطيل اطردني', data = IdUser..'/'.. 'unmute_kickme'},{text = 'تفعيل اطردني', data = IdUser..'/'.. 'mute_kickme'},
},
{
{text = 'تعطيل التسليه', data = IdUser..'/'.. 'unmute_thshesh'},{text = 'تفعيل التسليه', data = IdUser..'/'.. 'mute_thshesh'},
},
{
{text = 'تعطيل الحظر المحدود', data = IdUser..'/'.. 'unmute_kicknum'},{text = 'تفعيل الحظر المحدود', data = IdUser..'/'.. 'mute_kicknum'},
},
{
{text = 'تعطيل الصيغ', data = IdUser..'/'.. 'unmute_seck'},{text = 'تفعيل الصيغ', data = IdUser..'/'.. 'mute_seck'},
},
{
{text = 'تعطيل غنيلي', data = IdUser..'/'.. 'unmute_knile'},{text = 'تفعيل غنيلي', data = IdUser..'/'.. 'mute_knile'},
},
{
{text = 'تعطيل الابراح', data = IdUser..'/'.. 'unmute_brj'},{text = 'تفعيل الابراج', data = IdUser..'/'.. 'mute_brj'},
},
{
{text = 'تعطيل الصوتيات', data = IdUser..'/'.. 'unmute_audio'},{text = 'تفعيل الصوتيات', data = IdUser..'/'.. 'mute_audio'},
},
{
{text = 'تعطيل الصوتيات العامه', data = IdUser..'/'.. 'unmute_audioall'},{text = 'تفعيل الصوتيات العامه', data = IdUser..'/'.. 'mute_audioall'},
},
{
{text = 'تعطيل تاك عام', data = IdUser..'/'.. 'unmute_takall'},{text = 'تفعيل تاك عام', data = IdUser..'/'.. 'mute_takall'},
},
{
{text = 'تعطيل التنبيه', data = IdUser..'/'.. 'unmute_namemy'},{text = 'تفعيل التنبيه', data = IdUser..'/'.. 'mute_namemy'},
},
{
{text = 'القائمة الرئيسية', data = IdUser..'/helpall'},
},
{
{text = '- اخفاء الامر ', data ='/delAmr'}
},
}
}
return edit(ChatId,Msg_id,'⇜ اوامر التفعيل والتعطيل ', 'md', false, false, reply_markup)
end
end
if Text and Text:match('(%d+)/NextSeting') then
local UserId = Text:match('(%d+)/NextSeting')
if tonumber(IdUser) == tonumber(UserId) then
local Text = "\n⇜ اعدادات القروب ".."\n⇜ نعم تعني - مقفل".."\n⇜ لا تعني - مفتوح\n✧"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = GetSetieng(ChatId).lock_fwd, data =IdUser..'/'.. 'Status_fwd'},{text = 'التوجبه : ', data =IdUser..'/'.. 'Status_fwd'},
{text = GetSetieng(ChatId).lock_muse, data =IdUser..'/'.. 'Status_audio'},{text = 'الصوت : ', data =IdUser..'/'.. 'Status_audio'},
},
{
{text = GetSetieng(ChatId).lock_ste, data =IdUser..'/'.. 'Status_stikear'},{text = 'الملصقات : ', data =IdUser..'/'.. 'Status_stikear'},
{text = GetSetieng(ChatId).lock_phon, data =IdUser..'/'.. 'Status_phone'},{text = 'الجهات : ', data =IdUser..'/'.. 'Status_phone'},
},
{
{text = GetSetieng(ChatId).lock_join, data =IdUser..'/'.. 'Status_joine'},{text = 'الدخول : ', data =IdUser..'/'.. 'Status_joine'},
{text = GetSetieng(ChatId).lock_add, data =IdUser..'/'.. 'Status_addmem'},{text = 'الاضافه : ', data =IdUser..'/'.. 'Status_addmem'},
},
{
{text = GetSetieng(ChatId).lock_self, data =IdUser..'/'.. 'Status_videonote'},{text = 'بصمه فيديو : ', data =IdUser..'/'.. 'Status_videonote'},
{text = GetSetieng(ChatId).lock_pin, data =IdUser..'/'.. 'Status_pin'},{text = 'التثبيت : ', data =IdUser..'/'.. 'Status_pin'},
},
{
{text = GetSetieng(ChatId).lock_tagservr, data =IdUser..'/'.. 'Status_tgservir'},{text = 'الاشعارات : ', data =IdUser..'/'.. 'Status_tgservir'},
{text = GetSetieng(ChatId).lock_mark, data =IdUser..'/'.. 'Status_markdaun'},{text = 'الماركدون : ', data =IdUser..'/'.. 'Status_markdaun'},
},
{
{text = GetSetieng(ChatId).lock_edit, data =IdUser..'/'.. 'Status_edits'},{text = 'التعديل : ', data =IdUser..'/'.. 'Status_edits'},
{text = GetSetieng(ChatId).lock_geam, data =IdUser..'/'.. 'Status_games'},{text = 'الالعاب : ', data =IdUser..'/'.. 'Status_games'},
},
{
{text = GetSetieng(ChatId).flood, data =IdUser..'/'.. 'Status_flood'},{text = 'التكرار : ', data =IdUser..'/'.. 'Status_flood'},
},
{
{text = '- الرجوع .. ', data =IdUser..'/'.. 'NoNextSeting'}
},
{
{text = 'القائمة الرئيسية', data = IdUser..'/helpall'},
},
{
{text = '- اخفاء الامر ', data ='/delAmr'}
},
}
}
edit(ChatId,Msg_id,Text, 'md', false, false, reply_markup)
end
end
if Text and Text:match('(%d+)/NoNextSeting') then
local UserId = Text:match('(%d+)/NoNextSeting')
if tonumber(IdUser) == tonumber(UserId) then
local Text = "\n⇜ اعدادات القروب ".."\n⇜ نعم تعني - مقفل".."\n⇜ لا تعني - مفتوح\n✧"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = GetSetieng(ChatId).lock_links, data =IdUser..'/'.. 'Status_link'},{text = 'الروابط : ', data =IdUser..'/'.. 'Status_link'},
{text = GetSetieng(ChatId).lock_spam, data =IdUser..'/'.. 'Status_spam'},{text = 'الكلايش : ', data =IdUser..'/'.. 'Status_spam'},
},
{
{text = GetSetieng(ChatId).lock_inlin, data =IdUser..'/'.. 'Status_keypord'},{text = 'الكيبورد : ', data =IdUser..'/'.. 'Status_keypord'},
{text = GetSetieng(ChatId).lock_vico, data =IdUser..'/'.. 'Status_voice'},{text = 'الاغاني : ', data =IdUser..'/'.. 'Status_voice'},
},
{
{text = GetSetieng(ChatId).lock_gif, data =IdUser..'/'.. 'Status_gif'},{text = 'المتحركه : ', data =IdUser..'/'.. 'Status_gif'},
{text = GetSetieng(ChatId).lock_file, data =IdUser..'/'.. 'Status_files'},{text = 'الملفات : ', data =IdUser..'/'.. 'Status_files'},
},
{
{text = GetSetieng(ChatId).lock_text, data =IdUser..'/'.. 'Status_text'},{text = 'الشات : ', data =IdUser..'/'.. 'Status_text'},
{text = GetSetieng(ChatId).lock_ved, data =IdUser..'/'.. 'Status_video'},{text = 'الفيديو : ', data =IdUser..'/'.. 'Status_video'},
},
{
{text = GetSetieng(ChatId).lock_photo, data =IdUser..'/'.. 'Status_photo'},{text = 'الصور : ', data =IdUser..'/'.. 'Status_photo'},
{text = GetSetieng(ChatId).lock_user, data =IdUser..'/'.. 'Status_username'},{text = 'المعرفات : ', data =IdUser..'/'.. 'Status_username'},
},
{
{text = GetSetieng(ChatId).lock_hash, data =IdUser..'/'.. 'Status_tags'},{text = 'التاك : ', data =IdUser..'/'.. 'Status_tags'},
{text = GetSetieng(ChatId).lock_bots, data =IdUser..'/'.. 'Status_bots'},{text = 'البوتات : ', data =IdUser..'/'.. 'Status_bots'},
},
{
{text = GetSetieng(ChatId).farsia, data =IdUser..'/'.. 'Status_farsia'},{text = 'الفارسيه : ', data =IdUser..'/'.. 'Status_farsia'},
{text = GetSetieng(ChatId).tphlesh, data =IdUser..'/'.. 'Status_tphlesh'},{text = 'الحمايه : ', data =IdUser..'/'.. 'Status_tphlesh'},
},
{
{text = GetSetieng(ChatId).alphsar, data =IdUser..'/'.. 'Status_alphsar'},{text = 'السب : ', data =IdUser..'/'.. 'Status_alphsar'},
},
{
{text = '- التالي .. ', data =IdUser..'/'.. 'NextSeting'}
},
{
{text = 'القائمة الرئيسية', data = IdUser..'/helpall'},
},
{
{text = '- اخفاء الامر ', data ='/delAmr'}
},
}
}
edit(ChatId,Msg_id,Text, 'md', false, false, reply_markup)
end
end  
if Text and Text:match('/delAmr') then
local UserId = Text:match('/delAmr')
if data.Managers then
return bot.deleteMessages(ChatId,{[1]= Msg_id})
end
end

if Text and Text:match('/gamesmtor') then
local UserId = Text:match('/gamesmtor')
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text="♟ شطرنج ♟",url='https://t.me/T4TTTTBOT?game=chess'}},
{{text="لعبة فلابي بيرد 🐥",url='https://t.me/awesomebot?game=FlappyBird'},{text="تحداني فالرياضيات 🔢",url='https://t.me/gamebot?game=MathBattle'}},
{{text="تحداني في ❌⭕️",url='t.me/XO_AABOT?start3836619'},{text="سباق الدراجات 🏍",url='https://t.me/gamee?game=MotoFX'}},
{{text="سباق سيارات 🏎",url='https://t.me/gamee?game=F1Racer'},{text="متشابه 👾",url='https://t.me/gamee?game=DiamondRows'}},
{{text="كرة قدم ⚽",url='https://t.me/gamee?game=FootballStar'}},
{{text="دومنا🥇",url='https://vipgames.com/play/?affiliateId=wpDom/#/games/domino/lobby'},{text="❕ليدو",url='https://vipgames.com/play/?affiliateId=wpVG#/games/ludo/lobby'}},
{{text="ورق🤹‍♂",url='https://t.me/gamee?game=Hexonix'},{text="Hexonix❌",url='https://t.me/gamee?game=Hexonix'}},
{{text="MotoFx🏍️",url='https://t.me/gamee?game=MotoFx'}},
{{text="لعبة 2048 🎰",url='https://t.me/awesomebot?game=g2048'},{text="Squares🏁",url='https://t.me/gamee?game=Squares'}},
{{text="Atomic 1▶️",url='https://t.me/gamee?game=AtomicDrop1'},{text="Corsairs",url='https://t.me/gamebot?game=Corsairs'}},
{{text="LumberJack",url='https://t.me/gamebot?game=LumberJack'}},
{{text="LittlePlane",url='https://t.me/gamee?game=LittlePlane'},{text="RollerDisco",url='https://t.me/gamee?game=RollerDisco'}},
{{text="🦖 Dragon Game 🦖",url='https://t.me/T4TTTTBOT?game=dragon'},{text="🐍 3D Snake Game 🐍",url='https://t.me/T4TTTTBOT?game=snake'}},
{{text="🔵 Color Game 🔴",url='https://t.me/T4TTTTBOT?game=color'}},
{{text="🚀 Rocket Game 🚀",url='https://t.me/T4TTTTBOT?game=rocket'},{text="🏹 Arrow Game 🏹",url='https://t.me/T4TTTTBOT?game=arrow'}},
{{text = 'رجوع', data = IdUser..'/helpp6'},},
}
}
edit(ChatId,Msg_id,'⇜ قائمة الالعاب المتطورة ',"md", true, false, reply_markup)
end

if Text and Text:match('(%d+)/Status_link') then
local UserId = Text:match('(%d+)/Status_link')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الروابط', data =UserId..'/'.. 'lock_link'},{text = 'قفل الروابط بالكتم', data =UserId..'/'.. 'lock_linkktm'},
},
{
{text = 'قفل الروابط بالطرد', data =UserId..'/'.. 'lock_linkkick'},{text = 'قفل الروابط بالتقييد', data =UserId..'/'.. 'lock_linkkid'},
},
{
{text = 'فتح الروابط', data =UserId..'/'.. 'unlock_link'},
},
{
{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"⇜ اختار نوع القفل :", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_farsia') then
local UserId = Text:match('(%d+)/Status_farsia')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الفارسيه', data =UserId..'/'.. 'lock_Status_farsia'},
},
{
{text = 'فتح الفارسيه', data =UserId..'/'.. 'unlock_Status_farsia'},
},
{
{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"⇜ اختار نوع القفل :", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_tphlesh') then
local UserId = Text:match('(%d+)/Status_tphlesh')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الحمايه', data =UserId..'/'.. 'lock_Status_tphlesh'},
},
{
{text = 'فتح الحمايه', data =UserId..'/'.. 'unlock_Status_tphlesh'},
},
{
{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"⇜ اختار نوع القفل :", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_alphsar') then
local UserId = Text:match('(%d+)/Status_alphsar')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل السب', data =UserId..'/'.. 'lock_Status_alphsar'},
},
{
{text = 'فتح السب', data =UserId..'/'.. 'unlock_Status_alphsar'},
},
{
{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"⇜ اختار نوع القفل :", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_spam') then
local UserId = Text:match('(%d+)/Status_spam')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الكلايش', data =UserId..'/'.. 'lock_spam'},{text = 'قفل الكلايش بالكتم', data =UserId..'/'.. 'lock_spamktm'},
},
{
{text = 'قفل الكلايش بالطرد', data =UserId..'/'.. 'lock_spamkick'},{text = 'قفل الكلايش بالتقييد', data =UserId..'/'.. 'lock_spamid'},
},
{
{text = 'فتح الكلايش', data =UserId..'/'.. 'unlock_spam'},
},
{
{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"⇜ اختار نوع القفل :", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_keypord') then
local UserId = Text:match('(%d+)/Status_keypord')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الكيبورد', data =UserId..'/'.. 'lock_keypord'},{text = 'قفل الكيبورد بالكتم', data =UserId..'/'.. 'lock_keypordktm'},
},
{
{text = 'قفل الكيبورد بالطرد', data =UserId..'/'.. 'lock_keypordkick'},{text = 'قفل الكيبورد بالتقييد', data =UserId..'/'.. 'lock_keypordkid'},
},
{
{text = 'فتح الكيبورد', data =UserId..'/'.. 'unlock_keypord'},
},
{
{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"⇜ اختار نوع القفل :", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_voice') then
local UserId = Text:match('(%d+)/Status_voice')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الاغاني', data =UserId..'/'.. 'lock_voice'},{text = 'قفل الاغاني بالكتم', data =UserId..'/'.. 'lock_voicektm'},
},
{
{text = 'قفل الاغاني بالطرد', data =UserId..'/'.. 'lock_voicekick'},{text = 'قفل الاغاني بالتقييد', data =UserId..'/'.. 'lock_voicekid'},
},
{
{text = 'فتح الاغاني', data =UserId..'/'.. 'unlock_voice'},
},
{
{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"⇜ اختار نوع القفل :", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_gif') then
local UserId = Text:match('(%d+)/Status_gif')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل المتحركه', data =UserId..'/'.. 'lock_gif'},{text = 'قفل المتحركه بالكتم', data =UserId..'/'.. 'lock_gifktm'},
},
{
{text = 'قفل المتحركه بالطرد', data =UserId..'/'.. 'lock_gifkick'},{text = 'قفل المتحركه بالتقييد', data =UserId..'/'.. 'lock_gifkid'},
},
{
{text = 'فتح المتحركه', data =UserId..'/'.. 'unlock_gif'},
},
{
{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"⇜ اختار نوع القفل :", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_files') then
local UserId = Text:match('(%d+)/Status_files')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الملفات', data =UserId..'/'.. 'lock_files'},{text = 'قفل الملفات بالكتم', data =UserId..'/'.. 'lock_filesktm'},
},
{
{text = 'قفل الملفات بالطرد', data =UserId..'/'.. 'lock_fileskick'},{text = 'قفل الملفات بالتقييد', data =UserId..'/'.. 'lock_fileskid'},
},
{
{text = 'فتح الملفات', data =UserId..'/'.. 'unlock_files'},
},
{
{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"⇜ اختار نوع القفل :", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_text') then
local UserId = Text:match('(%d+)/Status_text')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الشات', data =UserId..'/'.. 'lock_text'},
},
{
{text = 'فتح الشات', data =UserId..'/'.. 'unlock_text'},
},
{
{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"⇜ اختار نوع القفل :", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_video') then
local UserId = Text:match('(%d+)/Status_video')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الفيديو', data =UserId..'/'.. 'lock_video'},{text = 'قفل الفيديو بالكتم', data =UserId..'/'.. 'lock_videoktm'},
},
{
{text = 'قفل الفيديو بالطرد', data =UserId..'/'.. 'lock_videokick'},{text = 'قفل الفيديو بالتقييد', data =UserId..'/'.. 'lock_videokid'},
},
{
{text = 'فتح الفيديو', data =UserId..'/'.. 'unlock_video'},
},
{
{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"⇜ اختار نوع القفل :", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_photo') then
local UserId = Text:match('(%d+)/Status_photo')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الصور', data =UserId..'/'.. 'lock_photo'},{text = 'قفل الصور بالكتم', data =UserId..'/'.. 'lock_photoktm'},
},
{
{text = 'قفل الصور بالطرد', data =UserId..'/'.. 'lock_photokick'},{text = 'قفل الصور بالتقييد', data =UserId..'/'.. 'lock_photokid'},
},
{
{text = 'فتح الصور', data =UserId..'/'.. 'unlock_photo'},
},
{
{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"⇜ اختار نوع القفل :", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_username') then
local UserId = Text:match('(%d+)/Status_username')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل المعرفات', data =UserId..'/'.. 'lock_username'},{text = 'قفل المعرفات بالكتم', data =UserId..'/'.. 'lock_usernamektm'},
},
{
{text = 'قفل المعرفات بالطرد', data =UserId..'/'.. 'lock_usernamekick'},{text = 'قفل المعرفات بالتقييد', data =UserId..'/'.. 'lock_usernamekid'},
},
{
{text = 'فتح المعرفات', data =UserId..'/'.. 'unlock_username'},
},
{
{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"⇜ اختار نوع القفل :", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_tags') then
local UserId = Text:match('(%d+)/Status_tags')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل التاك', data =UserId..'/'.. 'lock_tags'},{text = 'قفل التاك بالكتم', data =UserId..'/'.. 'lock_tagsktm'},
},
{
{text = 'قفل التاك بالطرد', data =UserId..'/'.. 'lock_tagskick'},{text = 'قفل التاك بالتقييد', data =UserId..'/'.. 'lock_tagskid'},
},
{
{text = 'فتح التاك', data =UserId..'/'.. 'unlock_tags'},
},
{
{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"⇜ اختار نوع القفل :", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_bots') then
local UserId = Text:match('(%d+)/Status_bots')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل البوتات', data =UserId..'/'.. 'lock_bots'},{text = 'قفل البوتات بالطرد', data =UserId..'/'.. 'lock_botskick'},
},
{
{text = 'فتح البوتات', data =UserId..'/'.. 'unlock_bots'},
},
{
{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"⇜ اختار نوع القفل :", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_fwd') then
local UserId = Text:match('(%d+)/Status_fwd')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل التوجيه', data =UserId..'/'.. 'lock_fwd'},{text = 'قفل التوجيه بالكتم', data =UserId..'/'.. 'lock_fwdktm'},
},
{
{text = 'قفل التوجيه بالطرد', data =UserId..'/'.. 'lock_fwdkick'},{text = 'قفل التوجيه بالتقييد', data =UserId..'/'.. 'lock_fwdkid'},
},
{
{text = 'فتح التوجيه', data =UserId..'/'.. 'unlock_link'},
},
{
{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"⇜ اختار نوع القفل :", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_audio') then
local UserId = Text:match('(%d+)/Status_audio')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الصوت', data =UserId..'/'.. 'lock_audio'},{text = 'قفل الصوت بالكتم', data =UserId..'/'.. 'lock_audioktm'},
},
{
{text = 'قفل الصوت بالطرد', data =UserId..'/'.. 'lock_audiokick'},{text = 'قفل الصوت بالتقييد', data =UserId..'/'.. 'lock_audiokid'},
},
{
{text = 'فتح الصوت', data =UserId..'/'.. 'unlock_audio'},
},
{
{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"⇜ اختار نوع القفل :", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_stikear') then
local UserId = Text:match('(%d+)/Status_stikear')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الملصقات', data =UserId..'/'.. 'lock_stikear'},{text = 'قفل الملصقات بالكتم', data =UserId..'/'.. 'lock_stikearktm'},
},
{
{text = 'قفل الملصقات بالطرد', data =UserId..'/'.. 'lock_stikearkick'},{text = 'قفل الملصقات بالتقييد', data =UserId..'/'.. 'lock_stikearkid'},
},
{
{text = 'فتح الملصقات', data =UserId..'/'.. 'unlock_stikear'},
},
{
{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"⇜ اختار نوع القفل :", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_phone') then
local UserId = Text:match('(%d+)/Status_phone')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الجهات', data =UserId..'/'.. 'lock_phone'},{text = 'قفل الجهات بالكتم', data =UserId..'/'.. 'lock_phonektm'},
},
{
{text = 'قفل الجهات بالطرد', data =UserId..'/'.. 'lock_phonekick'},{text = 'قفل الجهات بالتقييد', data =UserId..'/'.. 'lock_phonekid'},
},
{
{text = 'فتح الجهات', data =UserId..'/'.. 'unlock_phone'},
},
{
{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"⇜ اختار نوع القفل :", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_joine') then
local UserId = Text:match('(%d+)/Status_joine')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الدخول', data =UserId..'/'.. 'lock_joine'},
},
{
{text = 'فتح الدخول', data =UserId..'/'.. 'unlock_joine'},
},
{
{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"⇜ اختار نوع القفل :", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_addmem') then
local UserId = Text:match('(%d+)/Status_addmem')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الاضافه', data =UserId..'/'.. 'lock_addmem'},
},
{
{text = 'فتح الاضافه', data =UserId..'/'.. 'unlock_addmem'},
},
{
{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"⇜ اختار نوع القفل :", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_videonote') then
local UserId = Text:match('(%d+)/Status_videonote')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل السيلفي', data =UserId..'/'.. 'lock_videonote'},{text = 'قفل السيلفي بالكتم', data =UserId..'/'.. 'lock_videonotektm'},
},
{
{text = 'قفل السيلفي بالطرد', data =UserId..'/'.. 'lock_videonotekick'},{text = 'قفل السيلفي بالتقييد', data =UserId..'/'.. 'lock_videonotekid'},
},
{
{text = 'فتح السيلفي', data =UserId..'/'.. 'unlock_videonote'},
},
{
{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"⇜ اختار نوع القفل :", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_pin') then
local UserId = Text:match('(%d+)/Status_pin')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل التثبيت', data =UserId..'/'.. 'lock_pin'},
},
{
{text = 'فتح التثبيت', data =UserId..'/'.. 'unlock_pin'},
},
{
{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"⇜ اختار نوع القفل :", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_tgservir') then
local UserId = Text:match('(%d+)/Status_tgservir')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الاشعارات', data =UserId..'/'.. 'lock_tgservir'},
},
{
{text = 'فتح الاشعارات', data =UserId..'/'.. 'unlock_tgservir'},
},
{
{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"⇜ اختار نوع القفل :", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_markdaun') then
local UserId = Text:match('(%d+)/Status_markdaun')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الماركداون', data =UserId..'/'.. 'lock_markdaun'},{text = 'قفل الماركداون بالكتم', data =UserId..'/'.. 'lock_markdaunktm'},
},
{
{text = 'قفل الماركداون بالطرد', data =UserId..'/'.. 'lock_markdaunkick'},{text = 'قفل الماركداون بالتقييد', data =UserId..'/'.. 'lock_markdaunkid'},
},
{
{text = 'فتح الماركداون', data =UserId..'/'.. 'unlock_markdaun'},
},
{
{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"⇜ اختار نوع القفل :", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_edits') then
local UserId = Text:match('(%d+)/Status_edits')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل التعديل', data =UserId..'/'.. 'lock_edits'},
},
{
{text = 'فتح التعديل', data =UserId..'/'.. 'unlock_edits'},
},
{
{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"⇜ اختار نوع القفل :", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_games') then
local UserId = Text:match('(%d+)/Status_games')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الالعاب', data =UserId..'/'.. 'lock_games'},{text = 'قفل الالعاب بالكتم', data =UserId..'/'.. 'lock_gamesktm'},
},
{
{text = 'قفل الالعاب بالطرد', data =UserId..'/'.. 'lock_gameskick'},{text = 'قفل الالعاب بالتقييد', data =UserId..'/'.. 'lock_gameskid'},
},
{
{text = 'فتح الالعاب', data =UserId..'/'.. 'unlock_games'},
},
{
{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"⇜ اختار نوع القفل :", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_flood') then
local UserId = Text:match('(%d+)/Status_flood')
if tonumber(IdUser) == tonumber(UserId) then

local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل التكرار', data =UserId..'/'.. 'lock_flood'},{text = 'قفل التكرار بالكتم', data =UserId..'/'.. 'lock_floodktm'},
},
{
{text = 'قفل التكرار بالطرد', data =UserId..'/'.. 'lock_floodkick'},{text = 'قفل التكرار بالتقييد', data =UserId..'/'.. 'lock_floodkid'},
},
{
{text = 'فتح التكرار', data =UserId..'/'.. 'unlock_flood'},
},
{
{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"⇜ اختار نوع القفل :", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_link') then
local UserId = Text:match('(%d+)/unlock_link')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(SILV.."Mero:Lock:Link"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم فتح الروابط").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_Status_farsia') then
local UserId = Text:match('(%d+)/unlock_Status_farsia')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(SILV.."Mero:Lock:farsia"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم فتح الفارسيه").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_Status_tphlesh') then
local UserId = Text:match('(%d+)/unlock_Status_tphlesh')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(SILV.."Mero:Lock:tphlesh"..ChatId)  
Redis:del(SILV.."Mero:Status:IdPhoto"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم فتح الحمايه").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_Status_alphsar') then
local UserId = Text:match('(%d+)/unlock_Status_alphsar')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(SILV.."Mero:Lock:phshar"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم فتح السب").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_Status_farsia') then
local UserId = Text:match('(%d+)/lock_Status_farsia')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:farsia"..ChatId,true)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل الفارسيه").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_Status_tphlesh') and data.Managers then
local UserId = Text:match('(%d+)/lock_Status_tphlesh')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:tphlesh"..ChatId,true)
Redis:set(SILV.."Mero:Status:IdPhoto"..ChatId,true)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل الحمايه").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_Status_alphsar') then
local UserId = Text:match('(%d+)/lock_Status_alphsar')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(SILV.."Mero:Lock:phshar"..ChatId,true)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم قفل السب").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_spam') then
local UserId = Text:match('(%d+)/unlock_spam')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(SILV.."Mero:Lock:Spam"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم فتح الكلايش").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_keypord') then
local UserId = Text:match('(%d+)/unlock_keypord')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(SILV.."Mero:Lock:Keyboard"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم فتح الكيبورد").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_voice') then
local UserId = Text:match('(%d+)/unlock_voice')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(SILV.."Mero:Lock:vico"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم فتح الاغاني").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_gif') then
local UserId = Text:match('(%d+)/unlock_gif')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(SILV.."Mero:Lock:Animation"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم فتح المتحركات").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_files') then
local UserId = Text:match('(%d+)/unlock_files')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(SILV.."Mero:Lock:Document"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم فتح الملفات").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_text') then
local UserId = Text:match('(%d+)/unlock_text')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(SILV.."Mero:Lock:text"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم فتح الشات").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_video') then
local UserId = Text:match('(%d+)/unlock_video')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(SILV.."Mero:Lock:Video"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم فتح الفيديو").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_photo') then
local UserId = Text:match('(%d+)/unlock_photo')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(SILV.."Mero:Lock:Photo"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم فتح الصور").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_username') then
local UserId = Text:match('(%d+)/unlock_username')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(SILV.."Mero:Lock:User:Name"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم فتح المعرفات").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_tags') then
local UserId = Text:match('(%d+)/unlock_tags')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(SILV.."Mero:Lock:hashtak"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم فتح التاك").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_bots') then
local UserId = Text:match('(%d+)/unlock_bots')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(SILV.."Mero:Lock:Bot:kick"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم فتح البوتات").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_fwd') then
local UserId = Text:match('(%d+)/unlock_fwd')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(SILV.."Mero:Lock:forward"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم فتح التوجيه").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_audio') then
local UserId = Text:match('(%d+)/unlock_audio')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(SILV.."Mero:Lock:Audio"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم فتح الصوت").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_stikear') then
local UserId = Text:match('(%d+)/unlock_stikear')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(SILV.."Mero:Lock:Sticker"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم فتح الملصقات").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_phone') then
local UserId = Text:match('(%d+)/unlock_phone')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(SILV.."Mero:Lock:Contact"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم فتح الجهات").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_joine') then
local UserId = Text:match('(%d+)/unlock_joine')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(SILV.."Mero:Lock:Join"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم فتح الدخول").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_addmem') then
local UserId = Text:match('(%d+)/unlock_addmem')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(SILV.."Mero:Lock:AddMempar"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم فتح الاضافه").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_videonote') then
local UserId = Text:match('(%d+)/unlock_videonote')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(SILV.."Mero:Lock:Unsupported"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم فتح بصمه الفيديو").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_pin') then
local UserId = Text:match('(%d+)/unlock_pin')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(SILV.."Mero:lockpin"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم فتح التثبيت").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_tgservir') then
local UserId = Text:match('(%d+)/unlock_tgservir')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(SILV.."Mero:Lock:tagservr"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم فتح الاشعارات").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_markdaun') then
local UserId = Text:match('(%d+)/unlock_markdaun')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(SILV.."Mero:Lock:Markdaun"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم فتح الماركدون").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_edits') then
local UserId = Text:match('(%d+)/unlock_edits')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(SILV.."Mero:Lock:edit"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم فتح التعديل").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_games') then
local UserId = Text:match('(%d+)/unlock_games')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(SILV.."Mero:Lock:geam"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم فتح الالعاب").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_flood') then
local UserId = Text:match('(%d+)/unlock_flood')
if tonumber(IdUser) == tonumber(UserId) then
Redis:hdel(SILV.."Mero:Spam:Group:User"..ChatId ,"Spam:User")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"⇜ تم فتح التكرار").unLock, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/backbio') then
local UserId = Text:match('(%d+)/backbio')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'شباب', data = IdUser..'/bioold'},{text = 'بنات', data = IdUser..'/biobnt'},
},
}
}
return edit(ChatId,Msg_id,"اختر نوع البايو", 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/bioold') then
local UserId = Text:match('(%d+)/bioold')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'بايو آخر', data = UserId..'/bioold'},
},
{
{text = 'رجوع', data = UserId..'/backbio'},
},
}
}
local list = {
"ابتليت بحُب ابتسامَته وعيُونه.",
"انتَ فكره رائعه وضعها الربُ في عقلي.",
"اتأمل صورتك وتطيب الدنيا في عيني.",
"ماذا لو اخَترتكَ موِسيقتي.",
"مبسّمك يأخذ من الليّل نُوره.",
"يا ضمادَ جُروحِي و أطيّب أشخاصي.",
"كلما أتبعُ قلبي يدُلني إليك.",
"كُل شيء بجوارك جميل جدًا.‍",
"صُباح الخير يامُلهميِ وشخصيِ الأول.",
"ليتنَي آكثر الناظرينَ اليكِ.",
"حتى الخيال فيّك جبر خاطَر.",
"عنْ ألف نِعمة أنا وقلبي مكتفّين فيك . .",
"﮼سأحاول ، أقـنـاع نَـفسـي بـآن ڪُل شـيء ڪان مُـجرد حلم🥀!",
"حاولت أن لا انظر اليك ، لڪن عيناي تمردت 🖤👁️",
"لا تهمل وردتكَ ، حتى لا يُسقيها غيرك🔥🖤",
"أخبࢪتـك ذات ليلـه أنك ستمـل وتتغيـࢪ ، فأنڪࢪت، 🖤",
"اللهُم إجعل لي نصيب في كل شيء أحببته.",
"ربي .. إني اعوذ بك من طول التمني ، و حرمان الوصول ♥️",
"رسالة واحدة منهُ تعادل سحابة سعادة  🎻🖤",
"العالم الذي نسير إليه، مُختلف تمامًا عن العالم الذي يجول بداخلنا .🤍✨",
"تكاد تنزلق من أطراف قلبي، ولأول مرة أشعر بأني سئمت من الاحتفاظ بك",
"أُعَمّم رَسائلي، وأعنيك أنتَ.",
"لا أجيد إكمال نصف الأشياء، إمَّا أن تأتيني بأكملها، أو لتذهب بجميعها.",
"لم تحملي على كتفك إلا شعرك من أين أتى هذا العِبء؟",
"كأن الحياة تأتي من جِهتك🖤.",
"فمن وثق بالله أغناه ومن توكل عليه كفاه.",
"في فمه حديث متكسر ، يجرح اطراف صوته .",
"ظننتها عابرة ، لكنها ظلت في داخلي الى الأبد .",
"چنت احسك اهل مو واحد غريب .",
"الرجولـۿ صعبـۿ جـداً على شـخص كُل فِكرۿ النـساء ..",
"تشوفني انحني بس من اشد قيطان الحذاء",
"هدوئي ليس تكبراً انما طبع أمتاز بهِ .",
"التظاهر باللاشيء ، شيء عظيم ،🧡💧",
"ٰاغلقو الابواب علموهمَ احترام الفرص .",
"وأن كان بُعدك كـ بُعد نجمة سأحبّك .",
"حيلي ؏ حيلك لو شفت التعب صابك🤍🤍!",
"انتِ حكاية يستَحيل الانتِهَاء مِنهَا .",
"ﺂﺂنـٰـٓﺂﺂ ولـِبـِٓلـﯝک ـﺂصحٓـٰﺂﺂب ㋡!!   ᴖ‌ ℡",
"ﭑنا ﺣﻟﻣﮧﭑً ࢦࢦجميع ، لاڰنې ࢦآ ﭑحلم ب ﭑﺣﮧډ :",
"ثكيلكم قيطان بحذائي ما اشده",
"راسي ع السمة ورجلي بالارض",
"ليس الاعمى لا يرى بل انتم لستم موجودين",
"َانتَ للأبـد ،انتَ اللـي مابعـدك احّـد .",
"سأكون هُنا من أجلك حتى النهاية .",
"‏أندارلك من كل درب وعيونك تضيعني .",
"ومازلتُ أقع أكثر في حُبك يوميًا .",
"-’ ﺂݪحيـٱة ڝعبـۿۃ ݪڪـڼ ݪيـښټ ﻣښٺحـيݪۿۂ   𖤍ْ.",
"أبتسمِ ولو بلغ الحزن بحراً .",
"لسَست ﭑعمـَئ ولكن لاَيُهمنْيَ مـﭑ يَحدثْ ♥️",
"• ﭑڪتفائي بنفسي حاجـهہ عـضيـٰمهہ .👼🏻💗",
"قۆي وﺟميݪ ۆبڕيئ  🚶‍♀ᝰ",
"سيٰئ جـٰداً ﻻ اطيٰق وﻻ اطـﺂﺂق ",
"هَو مخِتلف ، و ﭑنا ﭑحبٰ ﭑخِتلافهَ 🫶🏻🥹♥.",
"عليًِ هوَ طريقُ الحقِ، فَ من أراد الحقَ فلَ يتبعَه🫂🤎.",
"في بعض الاحيان يجب عليك ان تخسرهم حتى تجد نفسك",
"كم بكينا لاننا لم نبلغ شمساً ولاقمراً ، ثم وضع الله مجرةً باكملها بين ايدينا",
"الإنسان المتاح للجميع مُقرف.",
"مالاترضاه لنفسك لاتؤذي به غيرك",
"ضَجيج العائله هو هدوء القلب",
"الليل شبعني سفر وآنه بمكاني",
"الغلط الجَان بعلاقتنا .. عِلاقتنا",
"انتِ البحر وانا المُبحر بكِ و الغريق.",
"النوم فرصة للانسان كَي يرتاح من نفسه",
"تَخيل ان تؤذي شخصاً كان هدفه الوحيد ان يجعلك سعيدا",
"لا اُفيدَ ولا اعتذِر ولا اُبادر ولا انتظِر .",
"فَإِنِّي إِذا ضَاقَتْ عَلَيَّ مشَاعِرِي ، ‏كَتَمْتُ ٱلهَوَى لكَنَّ دَمْعِيٌّ تَكَلَّمَا",
"لن يدومَ الهمُّ يا حلوَ المُحيّا ، ‏لن يظلّ الحزنُ في عينيكَ يحيا",
"ولو أني أحمد الله دهراً ، ‏ما وفيته جزءاً من النعم",
"هذهِ العيون الساحراتُ أريدُها فأنا العليلُ وكُحْلها تِرياقي",
"فلا يغريني مدح ولا يسقطني انتقاد جميعهم اراء وانا القرار",
"اقاتلُ كلّ جبارِ عنيدِ و يقتلني الفراقُ بلا قتْال",
"وكيفَ أمحوكَ من أوراقِ ذاكرَتي و أنتَ في القلبِ مثلَ النقشِ في الحجرِ.",
"اقاتلً لمن اهوُاه ومن اهَواه يقتًلنيٍ",
"فَيَ اُلهًادئيٓنَ اشياء لاَ تهٍداَ",
"يكادً حسنًك أنً يغًوي ملائكةًً فمًا بالك بابن الطيًن والماءٍ",
"‏‏أَنَّ الزَمانَ الَّذي مازالَ يُضحِكُنا ، ‏أُنساً بِقُربِهِمُ قَد عادَ يُبكينا",
"ومِن جَاهلٍ بي وهوَ يَجهَلُ جَهلَهُ ويَجهَلُ عِلمي أنَّهُ بي جاهِلُ"
}
local bioold = list[math.random(#list)]
return edit(ChatId,Msg_id,"["..bioold.."]", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/biobnt') then
local UserId = Text:match('(%d+)/biobnt')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'بايو آخر', data = UserId..'/biobnt'},
},
{
{text = 'رجوع', data = UserId..'/backbio'},
},
}
}
local list = {
"ابتليت بحُب ابتسامَته وعيُونه.",
"انتَ فكره رائعه وضعها الربُ في عقلي.",
"اتأمل صورتك وتطيب الدنيا في عيني.",
"ماذا لو اخَترتكَ موِسيقتي.",
"مبسّمك يأخذ من الليّل نُوره.",
"يا ضمادَ جُروحِي و أطيّب أشخاصي.",
"كلما أتبعُ قلبي يدُلني إليك.",
"كُل شيء بجوارك جميل جدًا.‍",
"صُباح الخير يامُلهميِ وشخصيِ الأول.",
"ليتنَي آكثر الناظرينَ اليكِ.",
"حتى الخيال فيّك جبر خاطَر.",
"عنْ ألف نِعمة أنا وقلبي مكتفّين فيك . .",
"﮼سأحاول ، أقـنـاع نَـفسـي بـآن ڪُل شـيء ڪان مُـجرد حلم🥀!",
"حاولت أن لا انظر اليك ، لڪن عيناي تمردت 🖤👁️",
"لا تهمل وردتكَ ، حتى لا يُسقيها غيرك🔥🖤",
"أخبࢪتـك ذات ليلـه أنك ستمـل وتتغيـࢪ ، فأنڪࢪت، 🖤",
"اللهُم إجعل لي نصيب في كل شيء أحببته.",
"ربي .. إني اعوذ بك من طول التمني ، و حرمان الوصول ♥️",
"رسالة واحدة منهُ تعادل سحابة سعادة  🎻🖤",
"العالم الذي نسير إليه، مُختلف تمامًا عن العالم الذي يجول بداخلنا .🤍✨",
"تكاد تنزلق من أطراف قلبي، ولأول مرة أشعر بأني سئمت من الاحتفاظ بك",
"أُعَمّم رَسائلي، وأعنيك أنتَ.",
"لا أجيد إكمال نصف الأشياء، إمَّا أن تأتيني بأكملها، أو لتذهب بجميعها.",
"لم تحملي على كتفك إلا شعرك من أين أتى هذا العِبء؟",
"كأن الحياة تأتي من جِهتك🖤.",
"فمن وثق بالله أغناه ومن توكل عليه كفاه.",
"في فمه حديث متكسر ، يجرح اطراف صوته .",
"ظننتها عابرة ، لكنها ظلت في داخلي الى الأبد .",
"هوَ مُخْتْلف وَأنا اُحبُ اختِلافه .",
"عش الحياه لنفسك ليس لأحد آخر ♡",
"وردة نادرة مهما عصفت بـها الأيام لاتذبل🤍",
"ݛقٖـيـقٖـٰهہ ة آڼۨـٰﭑ ڪۨہ فـٰرﭑاشـٰهۃ طـٰﭑئرهۃ  💘،",
"•تددري بغغـيبتـڪڪ ششنوو صصـار ؟",
"• ע زلـت تـඋـاول ولازلـت ﭑنتضر 🧸.💗🔗",
"مُمنفردة عن ﭑلعالم ، مُختلفةة لا ﭑشبه آحد ،✨🎧 ء !",
"مهۿما ﺂنترکڪت ـَﺂيـۧدي آِنيـِــٰﮧمـَٓو بحۧـَﺂﭼـ‌ٰه ـَﺂحـ‌ٰد 🙂🚶‍♀",
"ע ﺂﺂقـِٓبل بالهز‌يمهہ وأنّ ڪٓدتُ ﺂﺂسقُـ࣮ٓط",
"هـادئه ڪِٰ ساعاتِ الليـل المتأخرهۃٓه 彡",
"﮼ﭑﻧﭑﭑ ﺳيئهـٰۃ ﯛﻣحد يـٰستـٰاهـٰل ﻟـٰطـٰفي  𖤍 #~",
"ﭰويھﮧ وﻣمخيفه ڪضحڪه صداﻣم في ــألمحڪمه 🔥🙂",
"- ‏خسـارة البعـض ، مڪسب لصحتـكك النفـسـيـہۦة☹️✨",
"• ‏୪ ټـَرآﭰـبنـِﯤ ۏإنټ ﺂبټعدټ ﺂِﻧﹷٰـٰا ‏୪ اټأﺛﺮ",
"آذآ مكدڕت آسنَدک ـآطيَح ويآک ✨!",
"- خخلاص ءنا ! مو مهمم ععد ءححد ♡",
"ينتقدوني وبدقه 370HD يقلدوني",
"ﭑنـٰآ لسټ مـﻼڪـٰاً ﭑﻧﭑ ڜيطۃٓﭑنهْہ ۛ بضمـۑْڔ ، 👸🏻💗","⁞ ݥاِخِذۿُ خـۧﺂوۿ ععَـۧليَكم ᴖ‌💗",
"ﻣڪټفيه ﺑﺣـاﻟـي ﯢﻣـاﻟي ٲﺣد ، 🖤🌈",
"ﺎﻧﻧﭑ الجمـٰيـٰلهۃ ۉهـٰن ﺑﻘﭑيـٰﭑ ﺟﺟﻣﭑلي -💘.",
"وهِيٓ هآي ﭑلمآيلوحَكك لآزم يشٓمر ععليكك🖤",
"- ــِلا ، يعلِݥوڹ  ݥآبداخݪيِ ، ويتحدثوڹ  عني ،",
"مـٰثل بـٓﯛشـِنڪـِٓي ڪلـڪـٰم تـٰرجفون منـٰي ᴖ‌ ℡",
"قلدني ، لڪن بطريقهۂ جيده !",
"ﻧﻘـٰﭑﭑشـٰي ڪلمـٓتيـٰن ﭑٱلثالثـٰهۃ بـٰﻟﯛڪك ، ♡☻ ،",
"⊱#ۧﺂٌنـ‌ٰـيٌَ بـ‌ٰزَۧﻭ୭ديٌَ ﺂٌٰرتـۖـ‌ٰفـَع ݥـٰحـۖـ‌ٰد يۧـعـَـُلينـۧي",
"- ﻵ ﺗـۤحـﭑﯛل ﺗﯛﺻلي ﺂنـﺂ ﯛ ﺂلقـمهۂ ربـع ،!🤤💚",
"عليًِ هوَ طريقُ الحقِ، فَ من أراد الحقَ فلَ يتبعَه🫂🤎.",
"في بعض الاحيان يجب عليك ان تخسرهم حتى تجد نفسك",
"كم بكينا لاننا لم نبلغ شمساً ولاقمراً ، ثم وضع الله مجرةً باكملها بين ايدينا",
"الإنسان المتاح للجميع مُقرف.",
"مالاترضاه لنفسك لاتؤذي به غيرك",
"ضَجيج العائله هو هدوء القلب",
"الليل شبعني سفر وآنه بمكاني",
"الغلط الجَان بعلاقتنا .. عِلاقتنا",
"انتِ البحر وانا المُبحر بكِ و الغريق.",
"النوم فرصة للانسان كَي يرتاح من نفسه",
"تَخيل ان تؤذي شخصاً كان هدفه الوحيد ان يجعلك سعيدا",
"لا اُفيدَ ولا اعتذِر ولا اُبادر ولا انتظِر .",
"فَإِنِّي إِذا ضَاقَتْ عَلَيَّ مشَاعِرِي ، ‏كَتَمْتُ ٱلهَوَى لكَنَّ دَمْعِيٌّ تَكَلَّمَا",
"لن يدومَ الهمُّ يا حلوَ المُحيّا ، ‏لن يظلّ الحزنُ في عينيكَ يحيا",
"ولو أني أحمد الله دهراً ، ‏ما وفيته جزءاً من النعم",
"هذهِ العيون الساحراتُ أريدُها فأنا العليلُ وكُحْلها تِرياقي",
"فلا يغريني مدح ولا يسقطني انتقاد جميعهم اراء وانا القرار",
"اقاتلُ كلّ جبارِ عنيدِ و يقتلني الفراقُ بلا قتْال",
"وكيفَ أمحوكَ من أوراقِ ذاكرَتي و أنتَ في القلبِ مثلَ النقشِ في الحجرِ.",
"اقاتلً لمن اهوُاه ومن اهَواه يقتًلنيٍ",
"فَيَ اُلهًادئيٓنَ اشياء لاَ تهٍداَ",
"يكادً حسنًك أنً يغًوي ملائكةًً فمًا بالك بابن الطيًن والماءٍ",
"‏‏أَنَّ الزَمانَ الَّذي مازالَ يُضحِكُنا ، ‏أُنساً بِقُربِهِمُ قَد عادَ يُبكينا",
"ومِن جَاهلٍ بي وهوَ يَجهَلُ جَهلَهُ ويَجهَلُ عِلمي أنَّهُ بي جاهِلُ"
}
local biobnt = list[math.random(#list)]
return edit(ChatId,Msg_id,"["..biobnt.."]", 'md', true, false, reply_markup)
end
end

------------ SELVER Zacrfa
if Text and Text:match('(%d+)/ZhrAde') then
local UserId = Text:match('(%d+)/ZhrAde')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '𝙀𝙉𝙂 ▴ زخࢪفھـۃ انجليزي', data = IdUser..'/Zhrfaen'},
},
{
{text = 'AR ▴ زخࢪفھـۃ عربي', data = IdUser..'/Zhrfaar'},
}
}
}
 bot.editMessageText(ChatId,Msg_id, '⇜ اختر نوع الزخرفه \n زخࢪفھـۃ انجليزي \n زخࢪفھـۃ عربي', 'md', true, false, reply_markup)
end
end 

if Text and Text:match('(%d+)/selvrmoz') then
local UserId = Text:match('(%d+)/selvrmoz')
if tonumber(IdUser) == tonumber(UserId) then
local stext = "𖣨 ، ෴ ، 𖡺  ، 𖣐 ، ✜ ، ✘ ، 𖡻 ، - ༄ ، ༺༻ ، ༽༼ ،  ╰☆╮،  - ɵ̷̥̥᷄ˬɵ̷̥̥᷅ ، ‏⠉̮⃝ ، ࿇࿆ ، ꔚ، ま ، ☓ ، {𓆉 . 𓃠 .𓅿 . 𓃠 . 𓃒 . 𓅰 . 𓃱 . 𓅓 . 𐂃  . ꕥ  . ⌘ . ♾ .꙰  .  . ᤑ .  ﾂ .____✧ ,✫ ,✯, ✮ ,✭ ,✰, ✬ ,✧, ✤, ❅ , 𒀭,✵ , ✶ , ✷ , ✸ , ✹ ,⧫, . 𐂂 }-〘 𖢐 ، 𒍦 ، 𒍧 ، 𖢣 ، 𝁫 ، 𒍭 ، 𝁅 ، 𝁴 ، 𒍮 ، 𝁵 ، 𝀄 ، 𓏶 ، 𓏧 ، 𓏷 ، 𓏯 ، 𓏴 ، 𓏳 ، 𓏬 ، 𓏦 ، 𓏵 ، 𓏱 ، ᳱ ، ᯼ ، 𐃕 ، ᯥ ، ᯤ ، ᯾ ، ᳶ ، ᯌ ، ᢆ ، ᥦ ، ᨙ ، ᨚ  ، ᨔ  ، ⏢ ، ⍨ ، ⍃ ، ⏃ ، ⍦ ، ⏕ ، ⏤ ، ⏁ ، ⏂ ، ⏆ ، ⌳ ، ࿅ ، ࿕ ، ࿇ ، ᚙ ، ࿊ ، ࿈ ، ྿ ، ࿂ ، ࿑ ،  ᛥ ، ࿄ ، 𐀁 ، 𐀪 ، 𐀔 ، 𐀴 ، 𐀤 ، 𐀦 ، 𐀂 ، 𐀣 ، 𐀢 ، 𐀶 ، 𐀷 ، 𐂭 ، 𐂦 ، 𐂐 ، 𐂅 ، 𐂡 ، 𐂢 ، 𐂠 ، 𐂓 ، 𐂑 ، 𐃸 ، 𐃶 ، 𐂴 ، 𐃭 ، 𐃳 ، 𐃣 ، 𐂰 ، 𐃟 ، 𐃐 ، 𐃙 ، 𐃀 ، 𐇮 ، 𐇹 ، 𐇲 ، 𐇩 ، 𐇪 ، 𐇶 ، 𐇻 ، 𐇡 ، 𐇸 ، 𐇣 ، 𐇤 ، 𐎅 ، 𐏍 ، 𐎃 ، 𐏒 ، 𐎄 ، 𐏕 〙. \n———————×——————— \n ╔ ╗. 𓌹  𓌺 .〝  〞. ‹ ›  .「  」. ‌‏𓂄‏ ‌‌‏𓂁  〖 〗. 《》 .  < > . « »  . ﹄﹃  \n———————×——————— \n ₁ ₂ ₃ ₄ ₅ ₆ ₇ ₈ ₉ ₀\n𝟏 𝟐 𝟑 𝟒 𝟓 𝟔 𝟕 𝟖 𝟗 𝟎\n\n𝟭 𝟮 𝟯 𝟰 𝟱 𝟲 𝟳 𝟴 𝟵 𝟬\n\n①②③④⑤⑥⑦⑧⑨⓪\n———————×———————\n 𝟶 𝟷 𝟸 𝟹 𝟺 𝟻 𝟼 𝟽 𝟾  𝟿\n\n 𝟙  𝟚  𝟛  𝟜  𝟝  𝟞  𝟟  𝟠 𝟡\n\n 𝟬 𝟭  𝟮  𝟯  𝟰  𝟱   𝟲  𝟳  𝟴  𝟵\n\n 𝟎  𝟏  𝟐  𝟑  𝟒   𝟓   𝟔  𝟕   𝟖   𝟗\n\n０ １ ２ ３ ４ ５ ６ ７８９ \n ₁ ₂ ₃ ₄ ₅ ₆ ₇ ₈ ₉ ₀ \n 𝟏 𝟐 𝟑 𝟒 𝟓 𝟔 𝟕 𝟖 𝟗 𝟎/n 𝟭 𝟮 𝟯 𝟰 𝟱 𝟲 𝟳 𝟴 𝟵 𝟬 \n ①②③④⑤⑥⑦⑧⑨⓪ \n ❶❷❸❹❺❻❼❽❾⓿ \n⓫⓬⓭⓮⓯⓰⓱⓲⓳⓴ \n———————×——————— \n  𝟶 𝟷 𝟸 𝟹 𝟺 𝟻 𝟼 𝟽 𝟾  𝟿 \n 𝟘 𝟙  𝟚  𝟛  𝟜  𝟝  𝟞  𝟟  𝟠 𝟡 \n 𝟬 𝟭  𝟮  𝟯  𝟰  𝟱   𝟲  𝟳  𝟴  𝟵  \n 𝟎  𝟏  𝟐  𝟑  𝟒   𝟓   𝟔  𝟕   𝟖   𝟗 \n ０ １ ２ ３ ４ ５ ６ ７８９ \n———————×——————— \n ﷼ ﷻ ﷽ ✞ ッ ッ 彡 Ω ۞ ۩ ✟ 『  』۝ Ξ 道 凸 父 个 ¤ 品 〠 ๛ 𖤍 ᶠᶸᶜᵏᵧₒᵤ ࿐ ⍆ ⍅ ⇭ ༒   𖠃 𖠅 𖠆 𖠊 𖡒 𖡗 𖣩 ꧁ ꧂  〰 𖥓 𖥏 𖥎 𖥌 𖥋 𖥊 𖥈 𖥅 𖥃 𖥂 𖥀 𖤼 𖤹 𖤸 𖤷 𖤶 𖤭 𖤫 𖤪 𖤨 𖤧 𖤥 𖤤 𖤣 𖤢 𖤡 𖤟 𖤞 𖤝 𖤜 𖤛 𖤚 𖤘 𖤙 𖤗 𖤕 𖤓 𖤒 𖤐 ဏ ࿘ ࿗ ࿖ ࿕ ࿑ ࿌ ࿋ ࿊ ࿉ ࿈ ࿇ ࿅ ࿄ ࿃ ࿂ ༼ ༽ ༺ ༻ ༗ ༖ ༕ ⏝ ⏜ ⏎ ၄ ߷ ܛ ׀ 𖠀 𖠁 𖠂 𖠅 𖠆 𖠇 𖠈 𖠉 𖠍 𖠎 𖠏 𖠐 𖠑 𖠒 𖠓 𖠔 𖠕 𖠖 𖠗 𖠘 𖠙 𖠚 𖠛 𖠜 𖠝 𖠞 𖠟 𖠠 𖠡 𖠢 𖠣 𖠤 𖠥 𖠦 𖠧 𖠨 𖠩 𖠪 𖠫 𖠬 𖠭 𖠮 𖠯 𖠰 𖠱 𖠲 𖠳 𖠴 𖠵 𖠶 𖠷 𖠸 𖠹 𖠺 𖠻 𖠼 𖠽 𖠾 𖠿 𖡀 𖡁 𖡂 𖡃 𖡄 𖡅 𖡆 𖡇 𖡈 𖡉 𖡊 𖡋 𖡌 𖡍 𖡎 𖡏 𖡐 𖡑 𖡒 𖡓 𖡔 𖡕 𖡖 𖡗 𖡘 𖡙 𖡚 𖡛 𖡜 𖡝 𖡞 𖡟 𖡠 𖡡 𖡢 𖡣 𖡤 𖡥 𖡦 𖡧 𖡨 𖡩 𖡪 𖡫 𖡬 𖡭 𖡮 𖡯 𖡰 𖡱 𖡲 𖡳 𖡴 𖡵 𖡶 𖡷 𖡸 𖡹 𖡺 𖡻 𖡼 𖡽 𖡾 𖡿 𖢀 𖢁 𖢂 𖢃 𖢄 𖢅 𖢆 𖢇 𖢈 𖢉 𖢊 𖢋 𖢌 𖢍 𖢎 𖢏 𖢐 𖢑 𖢒 𖢓 𖢔 𖢕 𖢖 𖢗 𖢘 𖢙 𖢚 𖢛 𖢜 𖢝 𖢞 𖢟 𖢠 𖢡 𖢢 𖢣 𖢤 𖢥 𖢦 𖢧 𖢨 𖢩 𖢪 𖢫 𖢬 𖢭 𖢮 𖢯 𖢰 𖢱 𖢲 𖢳 𖢴 𖢵 𖢶 𖢷 𖢸 𖢹 𖢺 𖢻 𖢼 𖢽 𖢾 𖢿 𖣀 𖣁 𖣂 𖣃 𖣄 𖣅 𖣆 𖣇 𖣈 𖣉 𖣊 𖣋 𖣌 𖣍 𖣎 𖣏 𖣐 𖣑 𖣒 𖣓 𖣔 𖣕 𖣖 𖣗 𖣘 𖣙 𖣚 𖣛 𖣜 𖣝 𖣞 𖣟 𖣠 𖣡 𖣢 𖣣 𖣤 𖣥 𖣦 𖣧 𖣨 𖣩 𖣪 𖣫 𖣬 𖣭 𖣮 𖣯 𖣰 𖣱 𖣲 𖣳 𖣴 𖣵 𖣶 𖣷 𖣸 𖣹 𖣺 𖣻 𖣼 𖣽 𖣾 𖣿 \n———————×———————\n ≔ ≕ ≖ ≗ ≘ ≙ ≚ ≛ ≜ ≝ ≞ ≟ ≠ ≡ ≢ ≣ ≨ ≩ ≬ ≭ \n ≮ ≯ ≰ ≱ ≲ ≳ ≴ ≵ ≶ ≷ ≸ ≹ ≽ ≾ ≿ ⊀ ⊁ ⊃ ⊂ ⊄ \n ⊅ ⊆ ⊇ ⊈ ⊊ ⊋ ⊌ ⊍ ⊎ ⊏ ⊐ ⊑ ⊒ ⊓ ⊔ ⊕ ⊖ ⊗ ⊘ ⊚ \n ⊛ ⊜ ⊝ ⊞ ⊟ ⊠ ⊡ ⊢ ⊣ ⊤ ⊥ ⊦ ⊧ ⊨ ⊩ ⋒ ⋓ ⋔ ⋕ \n ⋖⋗ ⋘ ⋙ ⋚ ⋛ ⋜ ⋭ ⋫ ⋬ ⋪ ⋩ ⋨ ⋧ ⋣ ⋢ ⌂ ⌠ ⌡ ║ ╽ ╿ ☀ ☁ ☂ ☃ ☄ ★ ☆ ☇ ☈ ☉ ☊ ☋ ☌ ☍☎ ☐ ☑ ☒ ☓ ☚ ☛ ☜ ☝ ☟ ☠ ☡ ☢ ☣ ☤☧ ☪ ☫ ☬ ☭ ♃ ☮ ☯ ☰ ☱ ☲ ☳ ☴ ☵ ☶☷ ☸ ☹ ☺ ☻ ☼ ☽ ☾ ☿ ♀ ♁ ♂ ♃ ♄ ♅ ♆ ♇ ♈ ♉ ♊ ♋ ♌ ♍ ♎ ♏ ♐ ♑ ♒ ♓ ♔ ♕ ♖ ♗ ♘ ♙ ♚ ♛ ♜ ♝ ♞ ♟ ♠ ♡ ♢ ♣ ♤ ♥ ♦ ♧ ♨ ♩ ✁ ✂ ✃ ✄ ✆ ✇ ✈ ✉ ✌ ✍ ✎ ✏ ✐ ✑ ✒ ✓ ✔ ✕ ✖ ✗ ✘ ✙ ✚ ✛ ✜ ✣ ✤ ✥ ✧ ✩ ✪ ✬ ❀ ✿ ✾ ✽ ✼ ✻ ✺ ✹ ✸ ✷ ✶ ✵ ✴ ✳ ✲ ✱ ✰ ✯ ✮ ✭ ❁ ❂ ❃ ❄ ❅ ❆ ❇ ❈ ❉ ❊ ❋ ❍ ❏ ❐ ❑ ❒ ❖ ❛ ❜ ❝ ❞ \n ❡ ❢ ❣ ❤ ❥ ❦ ❧ ➳ ➴ ➵ ➶ ➷ ➸ ➹ ➺ \n ➻ ➼ ➽ ➾ ➙ ➚ ➘ ➟ ➠ ➣ ➢ ➤ ➥ "
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = chsourceNa,url="t.me/"..chsource},
},
}
}
 bot.editMessageText(ChatId,Msg_id, stext, 'md', true, false, reply_markup)
end
end 
----------------زخرفه
if Text and Text:match('(%d+)/Zhrfaar') then
local UserId = Text:match('(%d+)/Zhrfaar')
if tonumber(IdUser) == tonumber(UserId) then
Redis:setex(SILV..":ZhrfNow:ar"..UserId,500,true)
bot.editMessageText(ChatId,Msg_id,"⇜ ارسل الاسم بالعربي", 'md', false)
end
elseif Text and Text:match('(%d+)/Zhrfinlin') then
local UserId = Text:match('(%d+)/Zhrfinlin')
if tonumber(IdUser) == tonumber(UserId) then
Redis:setex(SILV..":Zhrfinlin:en"..UserId,500,true)
bot.editMessageText(ChatId,Msg_id,"⇜ ارسل الاسم بالانكليزي", 'md', false)
end
elseif Text and Text:match('(%d+)/Zhrfaen') then
local UserId = Text:match('(%d+)/Zhrfaen')
if tonumber(IdUser) == tonumber(UserId) then
Redis:setex(SILV..":ZhrfNow:en"..UserId,500,true)
bot.editMessageText(ChatId,Msg_id,"⇜ ارسل الاسم بالانكليزي", 'md', false)
end
end

if Text and Text:match('(%d+)/NQ_bna1') then
local UserId = Text:match('(%d+)/NQ_bna1')
if tonumber(IdUser) == tonumber(UserId) then
local DCBAN = Redis:get(SILV..ChatId..IdUser.."zkrf:text")
DCBAN = DCBAN:gsub('A','a') DCBAN = DCBAN:gsub('S','s') DCBAN = DCBAN:gsub('D','d') DCBAN = DCBAN:gsub('F','f') DCBAN = DCBAN:gsub('G','g') DCBAN = DCBAN:gsub('H','h') DCBAN = DCBAN:gsub('J','j') DCBAN = DCBAN:gsub('K','k') DCBAN = DCBAN:gsub('L','l') DCBAN = DCBAN:gsub('Q','q') DCBAN = DCBAN:gsub('W','w') DCBAN = DCBAN:gsub('E','e' ) DCBAN = DCBAN:gsub('R','r' ) DCBAN = DCBAN:gsub('T','t' ) DCBAN = DCBAN:gsub('Y','y' ) DCBAN = DCBAN:gsub('U','u' ) DCBAN = DCBAN:gsub('I','i' ) DCBAN = DCBAN:gsub('O','o' ) DCBAN = DCBAN:gsub('P','p' ) DCBAN = DCBAN:gsub('Z','z' ) DCBAN = DCBAN:gsub('X','x' ) DCBAN = DCBAN:gsub('C','c' ) DCBAN = DCBAN:gsub('V','v' ) DCBAN = DCBAN:gsub('B','b' ) DCBAN = DCBAN:gsub('N','n' ) DCBAN = DCBAN:gsub('M','m')
local Q_bna1 = DCBAN:gsub('a','ᥲ️' ) Q_bna1 = Q_bna1:gsub('b','Ⴆ' ) Q_bna1 = Q_bna1:gsub('c','ᥴ' ) Q_bna1 = Q_bna1:gsub('d','ძ' ) Q_bna1 = Q_bna1:gsub('e','ᥱ' ) Q_bna1 = Q_bna1:gsub('f','f' ) Q_bna1 = Q_bna1:gsub('g','ᧁ' ) Q_bna1 = Q_bna1:gsub('h','Ꮒ' ) Q_bna1 = Q_bna1:gsub('i','Ꭵ' ) Q_bna1 = Q_bna1:gsub('j','᧒' ) Q_bna1 = Q_bna1:gsub('k','𝚔' ) Q_bna1 = Q_bna1:gsub('l','ᗩ' ) Q_bna1 = Q_bna1:gsub('m',' ꧑' ) Q_bna1 = Q_bna1:gsub('n','ꪀ' ) Q_bna1 = Q_bna1:gsub('o','ρ' ) Q_bna1 = Q_bna1:gsub('p','ρ' ) Q_bna1 = Q_bna1:gsub('q','ǫ' ) Q_bna1 = Q_bna1:gsub('r','ℛ' ) Q_bna1 = Q_bna1:gsub('s','᥉' ) Q_bna1 = Q_bna1:gsub('t','ƚ' ) Q_bna1 = Q_bna1:gsub('u','ᥙ' ) Q_bna1 = Q_bna1:gsub('v','᥎' ) Q_bna1 = Q_bna1:gsub('w','ꪝ' ) Q_bna1 = Q_bna1:gsub('x','᥊' ) Q_bna1 = Q_bna1:gsub('y','ꪗ' ) Q_bna1 = Q_bna1:gsub('z','ᤁ')
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text= '✨💗' , data = Q_bna1..'/zarfs'},
},
{
{text= '🧸♥' , data = Q_bna1..'/zakrag'},
},
}
}
edit(ChatId, Msg_id, "⇜ لـقـد اخـترت   \n▷ `"..Q_bna1.."`", "md",true,false,reply_markup)
end
end
----------
if Text and Text:match('(%d+)/N2') then
local UserId = Text:match('(%d+)/N2')
if tonumber(IdUser) == tonumber(UserId) then
local DCBAN = Redis:get(SILV..ChatId..IdUser.."zkrf:text")
DCBAN = DCBAN:gsub('A','a') DCBAN = DCBAN:gsub('S','s') DCBAN = DCBAN:gsub('D','d') DCBAN = DCBAN:gsub('F','f') DCBAN = DCBAN:gsub('G','g') DCBAN = DCBAN:gsub('H','h') DCBAN = DCBAN:gsub('J','j') DCBAN = DCBAN:gsub('K','k') DCBAN = DCBAN:gsub('L','l') DCBAN = DCBAN:gsub('Q','q') DCBAN = DCBAN:gsub('W','w') DCBAN = DCBAN:gsub('E','e' ) DCBAN = DCBAN:gsub('R','r' ) DCBAN = DCBAN:gsub('T','t' ) DCBAN = DCBAN:gsub('Y','y' ) DCBAN = DCBAN:gsub('U','u' ) DCBAN = DCBAN:gsub('I','i' ) DCBAN = DCBAN:gsub('O','o' ) DCBAN = DCBAN:gsub('P','p' ) DCBAN = DCBAN:gsub('Z','z' ) DCBAN = DCBAN:gsub('X','x' ) DCBAN = DCBAN:gsub('C','c' ) DCBAN = DCBAN:gsub('V','v' ) DCBAN = DCBAN:gsub('B','b' ) DCBAN = DCBAN:gsub('N','n' ) DCBAN = DCBAN:gsub('M','m')
local Q_bna2 = DCBAN:gsub('a','ᴀ' ) Q_bna2 = Q_bna2:gsub('b','ʙ' ) Q_bna2 = Q_bna2:gsub('c','ᴄ' ) Q_bna2 = Q_bna2:gsub('d','ᴅ' ) Q_bna2 = Q_bna2:gsub('e','ᴇ' ) Q_bna2 = Q_bna2:gsub('f','ғ' ) Q_bna2 = Q_bna2:gsub('g','ɢ' ) Q_bna2 = Q_bna2:gsub('h','ʜ' ) Q_bna2 = Q_bna2:gsub('i','ɪ' ) Q_bna2 = Q_bna2:gsub('j','ᴊ' ) Q_bna2 = Q_bna2:gsub('k','ᴋ' ) Q_bna2 = Q_bna2:gsub('l','ʟ' ) Q_bna2 = Q_bna2:gsub('m','ᴍ' ) Q_bna2 = Q_bna2:gsub('n','ɴ' ) Q_bna2 = Q_bna2:gsub('o','ᴏ' ) Q_bna2 = Q_bna2:gsub('p','ᴘ' ) Q_bna2 = Q_bna2:gsub('q','ǫ' ) Q_bna2 = Q_bna2:gsub('r','ʀ' ) Q_bna2 = Q_bna2:gsub('s','s' ) Q_bna2 = Q_bna2:gsub('t','ᴛ' ) Q_bna2 = Q_bna2:gsub('u','ᴜ' ) Q_bna2 = Q_bna2:gsub('v','ᴠ' ) Q_bna2 = Q_bna2:gsub('w','ᴡ' ) Q_bna2 = Q_bna2:gsub('x','x' ) Q_bna2 = Q_bna2:gsub('y','ʏ' ) Q_bna2 = Q_bna2:gsub('z','ᴢ')
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text= '✨💗' , data = Q_bna2..'/zarfs'},
},
{
{text= '🧸♥' , data = Q_bna2..'/zakrag'},
},
}
}
edit(ChatId, Msg_id, "⇜لـقـد اخـترت   \n▷ `"..Q_bna2.."`", "md",true,false,reply_markup)
end
end
----------
if Text and Text:match('(%d+)/N3') then
local UserId = Text:match('(%d+)/N3')
if tonumber(IdUser) == tonumber(UserId) then
local DCBAN = Redis:get(SILV..ChatId..IdUser.."zkrf:text")
DCBAN = DCBAN:gsub('A','a') DCBAN = DCBAN:gsub('S','s') DCBAN = DCBAN:gsub('D','d') DCBAN = DCBAN:gsub('F','f') DCBAN = DCBAN:gsub('G','g') DCBAN = DCBAN:gsub('H','h') DCBAN = DCBAN:gsub('J','j') DCBAN = DCBAN:gsub('K','k') DCBAN = DCBAN:gsub('L','l') DCBAN = DCBAN:gsub('Q','q') DCBAN = DCBAN:gsub('W','w') DCBAN = DCBAN:gsub('E','e' ) DCBAN = DCBAN:gsub('R','r' ) DCBAN = DCBAN:gsub('T','t' ) DCBAN = DCBAN:gsub('Y','y' ) DCBAN = DCBAN:gsub('U','u' ) DCBAN = DCBAN:gsub('I','i' ) DCBAN = DCBAN:gsub('O','o' ) DCBAN = DCBAN:gsub('P','p' ) DCBAN = DCBAN:gsub('Z','z' ) DCBAN = DCBAN:gsub('X','x' ) DCBAN = DCBAN:gsub('C','c' ) DCBAN = DCBAN:gsub('V','v' ) DCBAN = DCBAN:gsub('B','b' ) DCBAN = DCBAN:gsub('N','n' ) DCBAN = DCBAN:gsub('M','m')
local Q_bna3 = DCBAN:gsub('a','Ａ' ) Q_bna3 = Q_bna3:gsub('b','Ｂ' ) Q_bna3 = Q_bna3:gsub('c','Ｃ' ) Q_bna3 = Q_bna3:gsub('d','Ｄ' ) Q_bna3 = Q_bna3:gsub('e','Ｅ' ) Q_bna3 = Q_bna3:gsub('f','Ｆ' ) Q_bna3 = Q_bna3:gsub('g','Ｇ' ) Q_bna3 = Q_bna3:gsub('h','Ｈ' ) Q_bna3 = Q_bna3:gsub('i','Ｉ' ) Q_bna3 = Q_bna3:gsub('j','Ｊ' ) Q_bna3 = Q_bna3:gsub('k','Ｋ' ) Q_bna3 = Q_bna3:gsub('l','Ｌ' ) Q_bna3 = Q_bna3:gsub('m','Ｍ' ) Q_bna3 = Q_bna3:gsub('n','Ｎ' ) Q_bna3 = Q_bna3:gsub('o','Ｏ' ) Q_bna3 = Q_bna3:gsub('p','Ｐ' ) Q_bna3 = Q_bna3:gsub('q','Ｑ' ) Q_bna3 = Q_bna3:gsub('r','Ｒ' ) Q_bna3 = Q_bna3:gsub('s','Ｓ' ) Q_bna3 = Q_bna3:gsub('t','Ｔ' ) Q_bna3 = Q_bna3:gsub('u','Ｕ' ) Q_bna3 = Q_bna3:gsub('v','Ｖ' ) Q_bna3 = Q_bna3:gsub('w','Ｗ' ) Q_bna3 = Q_bna3:gsub('x','Ｘ' ) Q_bna3 = Q_bna3:gsub('y','Ｙ' ) Q_bna3 = Q_bna3:gsub('z','Ｚ')
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text= '✨💗' , data = Q_bna3..'/zarfs'},
},
{
{text= '🧸♥' , data = Q_bna3..'/zakrag'},
},
}
}
edit(ChatId, Msg_id, "⇜ لـقـد اخـترت   \n▷ `"..Q_bna3.."`", "md",true,false,reply_markup)
end
end
----------
if Text and Text:match('(%d+)/N4') then
local UserId = Text:match('(%d+)/N4')
if tonumber(IdUser) == tonumber(UserId) then
local DCBAN = Redis:get(SILV..ChatId..IdUser.."zkrf:text")
DCBAN = DCBAN:gsub('A','a') DCBAN = DCBAN:gsub('S','s') DCBAN = DCBAN:gsub('D','d') DCBAN = DCBAN:gsub('F','f') DCBAN = DCBAN:gsub('G','g') DCBAN = DCBAN:gsub('H','h') DCBAN = DCBAN:gsub('J','j') DCBAN = DCBAN:gsub('K','k') DCBAN = DCBAN:gsub('L','l') DCBAN = DCBAN:gsub('Q','q') DCBAN = DCBAN:gsub('W','w') DCBAN = DCBAN:gsub('E','e' ) DCBAN = DCBAN:gsub('R','r' ) DCBAN = DCBAN:gsub('T','t' ) DCBAN = DCBAN:gsub('Y','y' ) DCBAN = DCBAN:gsub('U','u' ) DCBAN = DCBAN:gsub('I','i' ) DCBAN = DCBAN:gsub('O','o' ) DCBAN = DCBAN:gsub('P','p' ) DCBAN = DCBAN:gsub('Z','z' ) DCBAN = DCBAN:gsub('X','x' ) DCBAN = DCBAN:gsub('C','c' ) DCBAN = DCBAN:gsub('V','v' ) DCBAN = DCBAN:gsub('B','b' ) DCBAN = DCBAN:gsub('N','n' ) DCBAN = DCBAN:gsub('M','m')
local Q_bna4 = DCBAN:gsub('a','𝗔' ) Q_bna4 = Q_bna4:gsub('b','𝗕' ) Q_bna4 = Q_bna4:gsub('c','𝗖' ) Q_bna4 = Q_bna4:gsub('d','𝗗' ) Q_bna4 = Q_bna4:gsub('e','𝗘' ) Q_bna4 = Q_bna4:gsub('f','f' ) Q_bna4 = Q_bna4:gsub('g','𝗚' ) Q_bna4 = Q_bna4:gsub('h','𝗛' ) Q_bna4 = Q_bna4:gsub('i','𝗜' ) Q_bna4 = Q_bna4:gsub('j','𝗝' ) Q_bna4 = Q_bna4:gsub('k','𝗞' ) Q_bna4 = Q_bna4:gsub('l','𝗟' ) Q_bna4 = Q_bna4:gsub('m','𝗠' ) Q_bna4 = Q_bna4:gsub('n','𝗡' ) Q_bna4 = Q_bna4:gsub('o','𝗢' ) Q_bna4 = Q_bna4:gsub('p','𝗣' ) Q_bna4 = Q_bna4:gsub('q','𝗤' ) Q_bna4 = Q_bna4:gsub('r','𝗥' ) Q_bna4 = Q_bna4:gsub('s','𝗦' ) Q_bna4 = Q_bna4:gsub('t','𝗧' ) Q_bna4 = Q_bna4:gsub('u','𝗨' ) Q_bna4 = Q_bna4:gsub('v','𝗩' ) Q_bna4 = Q_bna4:gsub('w','𝗪' ) Q_bna4 = Q_bna4:gsub('x','𝗫' ) Q_bna4 = Q_bna4:gsub('y','𝗬' ) Q_bna4 = Q_bna4:gsub('z','𝗭')
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text= '✨💗' , data = Q_bna4..'/zarfs'},
},
{
{text= '🧸♥' , data = Q_bna4..'/zakrag'},
},
}
}
edit(ChatId, Msg_id, "⇜ لـقـد اخـترت   \n▷ `"..Q_bna4.."`", "md",true,false,reply_markup)
end
end
----------
if Text and Text:match('(%d+)/N5') then
local UserId = Text:match('(%d+)/N5')
if tonumber(IdUser) == tonumber(UserId) then
local DCBAN = Redis:get(SILV..ChatId..IdUser.."zkrf:text")
DCBAN = DCBAN:gsub('A','a') DCBAN = DCBAN:gsub('S','s') DCBAN = DCBAN:gsub('D','d') DCBAN = DCBAN:gsub('F','f') DCBAN = DCBAN:gsub('G','g') DCBAN = DCBAN:gsub('H','h') DCBAN = DCBAN:gsub('J','j') DCBAN = DCBAN:gsub('K','k') DCBAN = DCBAN:gsub('L','l') DCBAN = DCBAN:gsub('Q','q') DCBAN = DCBAN:gsub('W','w') DCBAN = DCBAN:gsub('E','e' ) DCBAN = DCBAN:gsub('R','r' ) DCBAN = DCBAN:gsub('T','t' ) DCBAN = DCBAN:gsub('Y','y' ) DCBAN = DCBAN:gsub('U','u' ) DCBAN = DCBAN:gsub('I','i' ) DCBAN = DCBAN:gsub('O','o' ) DCBAN = DCBAN:gsub('P','p' ) DCBAN = DCBAN:gsub('Z','z' ) DCBAN = DCBAN:gsub('X','x' ) DCBAN = DCBAN:gsub('C','c' ) DCBAN = DCBAN:gsub('V','v' ) DCBAN = DCBAN:gsub('B','b' ) DCBAN = DCBAN:gsub('N','n' ) DCBAN = DCBAN:gsub('M','m')
local Q_bna5 = DCBAN:gsub('a','𝐀' ) Q_bna5 = Q_bna5:gsub('b','𝐁' ) Q_bna5 = Q_bna5:gsub('c','𝐂' ) Q_bna5 = Q_bna5:gsub('d','𝐃' ) Q_bna5 = Q_bna5:gsub('e','𝐄' ) Q_bna5 = Q_bna5:gsub('f','𝐅' ) Q_bna5 = Q_bna5:gsub('g','𝐆' ) Q_bna5 = Q_bna5:gsub('h','𝐇' ) Q_bna5 = Q_bna5:gsub('i','𝐈' ) Q_bna5 = Q_bna5:gsub('j','𝐉' ) Q_bna5 = Q_bna5:gsub('k','𝐊' ) Q_bna5 = Q_bna5:gsub('l','𝑳' ) Q_bna5 = Q_bna5:gsub('m','𝐌' ) Q_bna5 = Q_bna5:gsub('n','𝐍' ) Q_bna5 = Q_bna5:gsub('o','𝐎' ) Q_bna5 = Q_bna5:gsub('p','𝐏' ) Q_bna5 = Q_bna5:gsub('q','𝐐' ) Q_bna5 = Q_bna5:gsub('r','𝐑' ) Q_bna5 = Q_bna5:gsub('s','𝐒' ) Q_bna5 = Q_bna5:gsub('t','𝐓' ) Q_bna5 = Q_bna5:gsub('u','𝐔' ) Q_bna5 = Q_bna5:gsub('v','𝐕' ) Q_bna5 = Q_bna5:gsub('w','𝐖' ) Q_bna5 = Q_bna5:gsub('x','𝐗' ) Q_bna5 = Q_bna5:gsub('y','𝐘' ) Q_bna5 = Q_bna5:gsub('z','𝐙')
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text= '✨💗' , data = Q_bna5..'/zarfs'},
},
{
{text= '🧸♥' , data = Q_bna5..'/zakrag'},
},
}
}
edit(ChatId, Msg_id, "⇜ لـقـد اخـترت   \n▷ `"..Q_bna5.."`", "md",true,false,reply_markup)
end
end
----------
if Text and Text:match('(%d+)/N6') then
local UserId = Text:match('(%d+)/N6')
if tonumber(IdUser) == tonumber(UserId) then
local DCBAN = Redis:get(SILV..ChatId..IdUser.."zkrf:text")
DCBAN = DCBAN:gsub('A','a') DCBAN = DCBAN:gsub('S','s') DCBAN = DCBAN:gsub('D','d') DCBAN = DCBAN:gsub('F','f') DCBAN = DCBAN:gsub('G','g') DCBAN = DCBAN:gsub('H','h') DCBAN = DCBAN:gsub('J','j') DCBAN = DCBAN:gsub('K','k') DCBAN = DCBAN:gsub('L','l') DCBAN = DCBAN:gsub('Q','q') DCBAN = DCBAN:gsub('W','w') DCBAN = DCBAN:gsub('E','e' ) DCBAN = DCBAN:gsub('R','r' ) DCBAN = DCBAN:gsub('T','t' ) DCBAN = DCBAN:gsub('Y','y' ) DCBAN = DCBAN:gsub('U','u' ) DCBAN = DCBAN:gsub('I','i' ) DCBAN = DCBAN:gsub('O','o' ) DCBAN = DCBAN:gsub('P','p' ) DCBAN = DCBAN:gsub('Z','z' ) DCBAN = DCBAN:gsub('X','x' ) DCBAN = DCBAN:gsub('C','c' ) DCBAN = DCBAN:gsub('V','v' ) DCBAN = DCBAN:gsub('B','b' ) DCBAN = DCBAN:gsub('N','n' ) DCBAN = DCBAN:gsub('M','m')
local Q_bna6 = DCBAN:gsub('a','𝐚' ) Q_bna6 = Q_bna6:gsub('b','𝐛' ) Q_bna6 = Q_bna6:gsub('c','𝐜' ) Q_bna6 = Q_bna6:gsub('d','𝐝' ) Q_bna6 = Q_bna6:gsub('e','𝐞' ) Q_bna6 = Q_bna6:gsub('f','𝐅' ) Q_bna6 = Q_bna6:gsub('g','𝐠' ) Q_bna6 = Q_bna6:gsub('h','𝐡' ) Q_bna6 = Q_bna6:gsub('i','𝐢' ) Q_bna6 = Q_bna6:gsub('j','𝐣' ) Q_bna6 = Q_bna6:gsub('k','𝐤' ) Q_bna6 = Q_bna6:gsub('l','𝐥' ) Q_bna6 = Q_bna6:gsub('m','𝐦' ) Q_bna6 = Q_bna6:gsub('n','𝐧' ) Q_bna6 = Q_bna6:gsub('o','𝐨' ) Q_bna6 = Q_bna6:gsub('p','𝐩' ) Q_bna6 = Q_bna6:gsub('q','𝐪' ) Q_bna6 = Q_bna6:gsub('r','𝐫' ) Q_bna6 = Q_bna6:gsub('s','𝐬' ) Q_bna6 = Q_bna6:gsub('t','𝐭' ) Q_bna6 = Q_bna6:gsub('u','𝐮' ) Q_bna6 = Q_bna6:gsub('v','𝐯' ) Q_bna6 = Q_bna6:gsub('w','𝐰' ) Q_bna6 = Q_bna6:gsub('x','𝐱' ) Q_bna6 = Q_bna6:gsub('y','𝐲' ) Q_bna6 = Q_bna6:gsub('z','𝐳')
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text= '✨💗' , data = Q_bna6..'/zarfs'},
},
{
{text= '🧸♥' , data = Q_bna6..'/zakrag'},
},
}
}
edit(ChatId, Msg_id, "⇜ لـقـد اخـترت   \n▷ `"..Q_bna6.."`", "md",true,false,reply_markup)
end
end
----------
if Text and Text:match('(%d+)/N7') then
local UserId = Text:match('(%d+)/N7')
if tonumber(IdUser) == tonumber(UserId) then
local DCBAN = Redis:get(SILV..ChatId..IdUser.."zkrf:text")
DCBAN = DCBAN:gsub('A','a') DCBAN = DCBAN:gsub('S','s') DCBAN = DCBAN:gsub('D','d') DCBAN = DCBAN:gsub('F','f') DCBAN = DCBAN:gsub('G','g') DCBAN = DCBAN:gsub('H','h') DCBAN = DCBAN:gsub('J','j') DCBAN = DCBAN:gsub('K','k') DCBAN = DCBAN:gsub('L','l') DCBAN = DCBAN:gsub('Q','q') DCBAN = DCBAN:gsub('W','w') DCBAN = DCBAN:gsub('E','e' ) DCBAN = DCBAN:gsub('R','r' ) DCBAN = DCBAN:gsub('T','t' ) DCBAN = DCBAN:gsub('Y','y' ) DCBAN = DCBAN:gsub('U','u' ) DCBAN = DCBAN:gsub('I','i' ) DCBAN = DCBAN:gsub('O','o' ) DCBAN = DCBAN:gsub('P','p' ) DCBAN = DCBAN:gsub('Z','z' ) DCBAN = DCBAN:gsub('X','x' ) DCBAN = DCBAN:gsub('C','c' ) DCBAN = DCBAN:gsub('V','v' ) DCBAN = DCBAN:gsub('B','b' ) DCBAN = DCBAN:gsub('N','n' ) DCBAN = DCBAN:gsub('M','m')
local Q_bna7 = DCBAN:gsub('a','𝑎' ) Q_bna7 = Q_bna7:gsub('b','𝑏' ) Q_bna7 = Q_bna7:gsub('c','𝑐' ) Q_bna7 = Q_bna7:gsub('d','𝑑' ) Q_bna7 = Q_bna7:gsub('e','𝑒' ) Q_bna7 = Q_bna7:gsub('f','𝒇' ) Q_bna7 = Q_bna7:gsub('g','𝑔' ) Q_bna7 = Q_bna7:gsub('h','ℎ' ) Q_bna7 = Q_bna7:gsub('i','𝑖' ) Q_bna7 = Q_bna7:gsub('j','𝑗' ) Q_bna7 = Q_bna7:gsub('k','𝑘' ) Q_bna7 = Q_bna7:gsub('l','𝑙' ) Q_bna7 = Q_bna7:gsub('m','𝑚' ) Q_bna7 = Q_bna7:gsub('n','𝑛' ) Q_bna7 = Q_bna7:gsub('o','𝑜' ) Q_bna7 = Q_bna7:gsub('p','𝑝' ) Q_bna7 = Q_bna7:gsub('q','𝑞' ) Q_bna7 = Q_bna7:gsub('r','𝑟' ) Q_bna7 = Q_bna7:gsub('s','𝑠' ) Q_bna7 = Q_bna7:gsub('t','𝑡' ) Q_bna7 = Q_bna7:gsub('u','𝑢' ) Q_bna7 = Q_bna7:gsub('v','𝑣' ) Q_bna7 = Q_bna7:gsub('w','𝑤' ) Q_bna7 = Q_bna7:gsub('x','𝑥' ) Q_bna7 = Q_bna7:gsub('y','𝑦' ) Q_bna7 = Q_bna7:gsub('z','𝑧')
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text= '✨💗' , data = Q_bna7..'/zarfs'},
},
{
{text= '🧸♥' , data = Q_bna7..'/zakrag'},
},
}
}
edit(ChatId, Msg_id, "⇜ لـقـد اخـترت   \n▷ `"..Q_bna7.."`", "md",true,false,reply_markup)
end
end
----------
if Text and Text:match('(%d+)/N8') then
local UserId = Text:match('(%d+)/N8')
if tonumber(IdUser) == tonumber(UserId) then
local DCBAN = Redis:get(SILV..ChatId..IdUser.."zkrf:text")
DCBAN = DCBAN:gsub('A','a') DCBAN = DCBAN:gsub('S','s') DCBAN = DCBAN:gsub('D','d') DCBAN = DCBAN:gsub('F','f') DCBAN = DCBAN:gsub('G','g') DCBAN = DCBAN:gsub('H','h') DCBAN = DCBAN:gsub('J','j') DCBAN = DCBAN:gsub('K','k') DCBAN = DCBAN:gsub('L','l') DCBAN = DCBAN:gsub('Q','q') DCBAN = DCBAN:gsub('W','w') DCBAN = DCBAN:gsub('E','e' ) DCBAN = DCBAN:gsub('R','r' ) DCBAN = DCBAN:gsub('T','t' ) DCBAN = DCBAN:gsub('Y','y' ) DCBAN = DCBAN:gsub('U','u' ) DCBAN = DCBAN:gsub('I','i' ) DCBAN = DCBAN:gsub('O','o' ) DCBAN = DCBAN:gsub('P','p' ) DCBAN = DCBAN:gsub('Z','z' ) DCBAN = DCBAN:gsub('X','x' ) DCBAN = DCBAN:gsub('C','c' ) DCBAN = DCBAN:gsub('V','v' ) DCBAN = DCBAN:gsub('B','b' ) DCBAN = DCBAN:gsub('N','n' ) DCBAN = DCBAN:gsub('M','m')
local Q_bna8 = DCBAN:gsub('a','ᗩ' ) Q_bna8 = Q_bna8:gsub('b','β' ) Q_bna8 = Q_bna8:gsub('c','Ｃ' ) Q_bna8 = Q_bna8:gsub('d','Ɗ' ) Q_bna8 = Q_bna8:gsub('e','Ｅ' ) Q_bna8 = Q_bna8:gsub('f','Բ' ) Q_bna8 = Q_bna8:gsub('g','Ｇ' ) Q_bna8 = Q_bna8:gsub('h','ⴼ' ) Q_bna8 = Q_bna8:gsub('i','Ｉ' ) Q_bna8 = Q_bna8:gsub('j','Ј' ) Q_bna8 = Q_bna8:gsub('k','₭' ) Q_bna8 = Q_bna8:gsub('l','Ł' ) Q_bna8 = Q_bna8:gsub('m','ᗰ' ) Q_bna8 = Q_bna8:gsub('n','Ŋ' ) Q_bna8 = Q_bna8:gsub('o','σ' ) Q_bna8 = Q_bna8:gsub('p','Ꝑ' ) Q_bna8 = Q_bna8:gsub('q','℺' ) Q_bna8 = Q_bna8:gsub('r','Ꮢ' ) Q_bna8 = Q_bna8:gsub('s','₷' ) Q_bna8 = Q_bna8:gsub('t','Ƭ' ) Q_bna8 = Q_bna8:gsub('u','ᵿ' ) Q_bna8 = Q_bna8:gsub('v','ѵ' ) Q_bna8 = Q_bna8:gsub('w','Ꮤ' ) Q_bna8 = Q_bna8:gsub('x','χ' ) Q_bna8 = Q_bna8:gsub('y','ɣ' ) Q_bna8 = Q_bna8:gsub('z','Ꙃ')
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text= '✨💗' , data = Q_bna8..'/zarfs'},
},
{
{text= '🧸♥' , data = Q_bna8..'/zakrag'},
},
}
}
edit(ChatId, Msg_id, "⇜ لـقـد اخـترت   \n▷ `"..Q_bna8.."`", "md",true,false,reply_markup)
end
end
----------
if Text and Text:match('(%d+)/N9') then
local UserId = Text:match('(%d+)/N9')
if tonumber(IdUser) == tonumber(UserId) then
local DCBAN = Redis:get(SILV..ChatId..IdUser.."zkrf:text")
DCBAN = DCBAN:gsub('A','a') DCBAN = DCBAN:gsub('S','s') DCBAN = DCBAN:gsub('D','d') DCBAN = DCBAN:gsub('F','f') DCBAN = DCBAN:gsub('G','g') DCBAN = DCBAN:gsub('H','h') DCBAN = DCBAN:gsub('J','j') DCBAN = DCBAN:gsub('K','k') DCBAN = DCBAN:gsub('L','l') DCBAN = DCBAN:gsub('Q','q') DCBAN = DCBAN:gsub('W','w') DCBAN = DCBAN:gsub('E','e' ) DCBAN = DCBAN:gsub('R','r' ) DCBAN = DCBAN:gsub('T','t' ) DCBAN = DCBAN:gsub('Y','y' ) DCBAN = DCBAN:gsub('U','u' ) DCBAN = DCBAN:gsub('I','i' ) DCBAN = DCBAN:gsub('O','o' ) DCBAN = DCBAN:gsub('P','p' ) DCBAN = DCBAN:gsub('Z','z' ) DCBAN = DCBAN:gsub('X','x' ) DCBAN = DCBAN:gsub('C','c' ) DCBAN = DCBAN:gsub('V','v' ) DCBAN = DCBAN:gsub('B','b' ) DCBAN = DCBAN:gsub('N','n' ) DCBAN = DCBAN:gsub('M','m')
local Q_bna9 = DCBAN:gsub('a','𝒂' ) Q_bna9 = Q_bna9:gsub('b','𝒃' ) Q_bna9 = Q_bna9:gsub('c','𝒄' ) Q_bna9 = Q_bna9:gsub('d','𝒅' ) Q_bna9 = Q_bna9:gsub('e','𝒆' ) Q_bna9 = Q_bna9:gsub('f','𝒇' ) Q_bna9 = Q_bna9:gsub('g','𝒈' ) Q_bna9 = Q_bna9:gsub('h','𝒉' ) Q_bna9 = Q_bna9:gsub('i','𝒊' ) Q_bna9 = Q_bna9:gsub('j','𝒋' ) Q_bna9 = Q_bna9:gsub('k','𝒌' ) Q_bna9 = Q_bna9:gsub('l','𝒍' ) Q_bna9 = Q_bna9:gsub('m','𝒎' ) Q_bna9 = Q_bna9:gsub('n','𝒏' ) Q_bna9 = Q_bna9:gsub('o','𝒐' ) Q_bna9 = Q_bna9:gsub('p','𝒑' ) Q_bna9 = Q_bna9:gsub('q','𝒒' ) Q_bna9 = Q_bna9:gsub('r','𝒓' ) Q_bna9 = Q_bna9:gsub('s','𝒔' ) Q_bna9 = Q_bna9:gsub('t','𝒕' ) Q_bna9 = Q_bna9:gsub('u','𝒖' ) Q_bna9 = Q_bna9:gsub('v','𝒗' ) Q_bna9 = Q_bna9:gsub('w','𝒘' ) Q_bna9 = Q_bna9:gsub('x','𝒙' ) Q_bna9 = Q_bna9:gsub('y','𝒚' ) Q_bna9 = Q_bna9:gsub('z','𝒛')
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text= '✨💗' , data = Q_bna9..'/zarfs'},
},
{
{text= '🧸♥' , data = Q_bna9..'/zakrag'},
},
}
}
edit(ChatId, Msg_id, "⇜ لـقـد اخـترت   \n▷ `"..Q_bna9.."`", "md",true,false,reply_markup)
end
end
----------
if Text and Text:match('(%d+)/N10') then
local UserId = Text:match('(%d+)/N10')
if tonumber(IdUser) == tonumber(UserId) then
local DCBAN = Redis:get(SILV..ChatId..IdUser.."zkrf:text")
DCBAN = DCBAN:gsub('A','a') DCBAN = DCBAN:gsub('S','s') DCBAN = DCBAN:gsub('D','d') DCBAN = DCBAN:gsub('F','f') DCBAN = DCBAN:gsub('G','g') DCBAN = DCBAN:gsub('H','h') DCBAN = DCBAN:gsub('J','j') DCBAN = DCBAN:gsub('K','k') DCBAN = DCBAN:gsub('L','l') DCBAN = DCBAN:gsub('Q','q') DCBAN = DCBAN:gsub('W','w') DCBAN = DCBAN:gsub('E','e' ) DCBAN = DCBAN:gsub('R','r' ) DCBAN = DCBAN:gsub('T','t' ) DCBAN = DCBAN:gsub('Y','y' ) DCBAN = DCBAN:gsub('U','u' ) DCBAN = DCBAN:gsub('I','i' ) DCBAN = DCBAN:gsub('O','o' ) DCBAN = DCBAN:gsub('P','p' ) DCBAN = DCBAN:gsub('Z','z' ) DCBAN = DCBAN:gsub('X','x' ) DCBAN = DCBAN:gsub('C','c' ) DCBAN = DCBAN:gsub('V','v' ) DCBAN = DCBAN:gsub('B','b' ) DCBAN = DCBAN:gsub('N','n' ) DCBAN = DCBAN:gsub('M','m')
local Q_bna10 = DCBAN:gsub('a','𝔸' ) Q_bna10 = Q_bna10:gsub('b','𝔹' ) Q_bna10 = Q_bna10:gsub('c','ℂ' ) Q_bna10 = Q_bna10:gsub('d','𝔻' ) Q_bna10 = Q_bna10:gsub('e','𝔼' ) Q_bna10 = Q_bna10:gsub('f','𝔽' ) Q_bna10 = Q_bna10:gsub('g','𝔾' ) Q_bna10 = Q_bna10:gsub('h','ℍ' ) Q_bna10 = Q_bna10:gsub('i','𝕀' ) Q_bna10 = Q_bna10:gsub('j','𝕁' ) Q_bna10 = Q_bna10:gsub('k','𝕂' ) Q_bna10 = Q_bna10:gsub('l','𝕃' ) Q_bna10 = Q_bna10:gsub('m','𝕄' ) Q_bna10 = Q_bna10:gsub('n','ℕ' ) Q_bna10 = Q_bna10:gsub('o','𝕆' ) Q_bna10 = Q_bna10:gsub('p','ℙ' ) Q_bna10 = Q_bna10:gsub('q','ℚ' ) Q_bna10 = Q_bna10:gsub('r','ℝ' ) Q_bna10 = Q_bna10:gsub('s','𝕊' ) Q_bna10 = Q_bna10:gsub('t','𝕋' ) Q_bna10 = Q_bna10:gsub('u','𝕌' ) Q_bna10 = Q_bna10:gsub('v','𝕍' ) Q_bna10 = Q_bna10:gsub('w','𝕎' ) Q_bna10 = Q_bna10:gsub('x','𝕏' ) Q_bna10 = Q_bna10:gsub('y','𝕐' ) Q_bna10 = Q_bna10:gsub('z','ℤ')
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text= '✨💗' , data = Q_bna10..'/zarfs'},
},
{
{text= '🧸♥' , data = Q_bna10..'/zakrag'},
},
}
}
edit(ChatId, Msg_id, "⇜ لـقـد اخـترت   \n▷ `"..Q_bna10.."`", "md",true,false,reply_markup)
end
end
----------
if Text and Text:match('(%d+)/N11') then
local UserId = Text:match('(%d+)/N11')
if tonumber(IdUser) == tonumber(UserId) then
local DCBAN = Redis:get(SILV..ChatId..IdUser.."zkrf:text")
DCBAN = DCBAN:gsub('A','a') DCBAN = DCBAN:gsub('S','s') DCBAN = DCBAN:gsub('D','d') DCBAN = DCBAN:gsub('F','f') DCBAN = DCBAN:gsub('G','g') DCBAN = DCBAN:gsub('H','h') DCBAN = DCBAN:gsub('J','j') DCBAN = DCBAN:gsub('K','k') DCBAN = DCBAN:gsub('L','l') DCBAN = DCBAN:gsub('Q','q') DCBAN = DCBAN:gsub('W','w') DCBAN = DCBAN:gsub('E','e' ) DCBAN = DCBAN:gsub('R','r' ) DCBAN = DCBAN:gsub('T','t' ) DCBAN = DCBAN:gsub('Y','y' ) DCBAN = DCBAN:gsub('U','u' ) DCBAN = DCBAN:gsub('I','i' ) DCBAN = DCBAN:gsub('O','o' ) DCBAN = DCBAN:gsub('P','p' ) DCBAN = DCBAN:gsub('Z','z' ) DCBAN = DCBAN:gsub('X','x' ) DCBAN = DCBAN:gsub('C','c' ) DCBAN = DCBAN:gsub('V','v' ) DCBAN = DCBAN:gsub('B','b' ) DCBAN = DCBAN:gsub('N','n' ) DCBAN = DCBAN:gsub('M','m')
local Q_bna11 = DCBAN:gsub('a','𝕬 ' ) Q_bna11 = Q_bna11:gsub('b','𝕭' ) Q_bna11 = Q_bna11:gsub('c','𝕮' ) Q_bna11 = Q_bna11:gsub('d','𝕯' ) Q_bna11 = Q_bna11:gsub('e','𝕰' ) Q_bna11 = Q_bna11:gsub('f','f' ) Q_bna11 = Q_bna11:gsub('g','𝕲' ) Q_bna11 = Q_bna11:gsub('h','𝕳' ) Q_bna11 = Q_bna11:gsub('i','𝕴' ) Q_bna11 = Q_bna11:gsub('j','𝕵' ) Q_bna11 = Q_bna11:gsub('k','𝕶' ) Q_bna11 = Q_bna11:gsub('l','𝕷' ) Q_bna11 = Q_bna11:gsub('m','𝕸' ) Q_bna11 = Q_bna11:gsub('n','𝕹' ) Q_bna11 = Q_bna11:gsub('o','𝕺' ) Q_bna11 = Q_bna11:gsub('p','𝕻' ) Q_bna11 = Q_bna11:gsub('q','𝕼' ) Q_bna11 = Q_bna11:gsub('r','𝕽' ) Q_bna11 = Q_bna11:gsub('s','𝕾' ) Q_bna11 = Q_bna11:gsub('t','𝕿' ) Q_bna11 = Q_bna11:gsub('u','𝖀' ) Q_bna11 = Q_bna11:gsub('v','𝖁' ) Q_bna11 = Q_bna11:gsub('w','𝖂' ) Q_bna11 = Q_bna11:gsub('x','𝖃' ) Q_bna11 = Q_bna11:gsub('y','𝖄' ) Q_bna11 = Q_bna11:gsub('z','𝖅')
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text= '✨💗' , data = Q_bna11..'/zarfs'},
},
{
{text= '🧸♥' , data = Q_bna11..'/zakrag'},
},
}
}
edit(ChatId, Msg_id, "⇜ لـقـد اخـترت   \n▷ `"..Q_bna11.."`", "md",true,false,reply_markup)
end
end
----------
if Text and Text:match('(%d+)/N12') then
local UserId = Text:match('(%d+)/N12')
if tonumber(IdUser) == tonumber(UserId) then
local DCBAN = Redis:get(SILV..ChatId..IdUser.."zkrf:text")
DCBAN = DCBAN:gsub('A','a') DCBAN = DCBAN:gsub('S','s') DCBAN = DCBAN:gsub('D','d') DCBAN = DCBAN:gsub('F','f') DCBAN = DCBAN:gsub('G','g') DCBAN = DCBAN:gsub('H','h') DCBAN = DCBAN:gsub('J','j') DCBAN = DCBAN:gsub('K','k') DCBAN = DCBAN:gsub('L','l') DCBAN = DCBAN:gsub('Q','q') DCBAN = DCBAN:gsub('W','w') DCBAN = DCBAN:gsub('E','e' ) DCBAN = DCBAN:gsub('R','r' ) DCBAN = DCBAN:gsub('T','t' ) DCBAN = DCBAN:gsub('Y','y' ) DCBAN = DCBAN:gsub('U','u' ) DCBAN = DCBAN:gsub('I','i' ) DCBAN = DCBAN:gsub('O','o' ) DCBAN = DCBAN:gsub('P','p' ) DCBAN = DCBAN:gsub('Z','z' ) DCBAN = DCBAN:gsub('X','x' ) DCBAN = DCBAN:gsub('C','c' ) DCBAN = DCBAN:gsub('V','v' ) DCBAN = DCBAN:gsub('B','b' ) DCBAN = DCBAN:gsub('N','n' ) DCBAN = DCBAN:gsub('M','m')
local Q_bna12 = DCBAN:gsub('a','𝐴' ) Q_bna12 = Q_bna12:gsub('b','b' ) Q_bna12 = Q_bna12:gsub('c','𝐶' ) Q_bna12 = Q_bna12:gsub('d','𝐷' ) Q_bna12 = Q_bna12:gsub('e','𝐸' ) Q_bna12 = Q_bna12:gsub('f','𝐹' ) Q_bna12 = Q_bna12:gsub('g','𝐺' ) Q_bna12 = Q_bna12:gsub('h','𝐻' ) Q_bna12 = Q_bna12:gsub('i','𝐼' ) Q_bna12 = Q_bna12:gsub('j','𝐽' ) Q_bna12 = Q_bna12:gsub('k','𝐾' ) Q_bna12 = Q_bna12:gsub('l','𝐿' ) Q_bna12 = Q_bna12:gsub('m','𝑀' ) Q_bna12 = Q_bna12:gsub('n','𝑁' ) Q_bna12 = Q_bna12:gsub('o','𝑂' ) Q_bna12 = Q_bna12:gsub('p','𝑃' ) Q_bna12 = Q_bna12:gsub('q','𝑄' ) Q_bna12 = Q_bna12:gsub('r','𝑅' ) Q_bna12 = Q_bna12:gsub('s','𝑆' ) Q_bna12 = Q_bna12:gsub('t','𝑇' ) Q_bna12 = Q_bna12:gsub('u','𝐔' ) Q_bna12 = Q_bna12:gsub('v','𝑉' ) Q_bna12 = Q_bna12:gsub('w','𝑊' ) Q_bna12 = Q_bna12:gsub('x','𝑋' ) Q_bna12 = Q_bna12:gsub('y','𝑌' ) Q_bna12 = Q_bna12:gsub('z','𝑍')
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text= '✨💗' , data = Q_bna12..'/zarfs'},
},
{
{text= '🧸♥' , data = Q_bna12..'/zakrag'},
},
}
}
edit(ChatId, Msg_id, "⇜ لـقـد اخـترت   \n▷ `"..Q_bna12.."`", "md",true,false,reply_markup)
end
end
----------
if Text and Text:match('(%d+)/N13') then
local UserId = Text:match('(%d+)/N13')
if tonumber(IdUser) == tonumber(UserId) then
local DCBAN = Redis:get(SILV..ChatId..IdUser.."zkrf:text")
DCBAN = DCBAN:gsub('A','a') DCBAN = DCBAN:gsub('S','s') DCBAN = DCBAN:gsub('D','d') DCBAN = DCBAN:gsub('F','f') DCBAN = DCBAN:gsub('G','g') DCBAN = DCBAN:gsub('H','h') DCBAN = DCBAN:gsub('J','j') DCBAN = DCBAN:gsub('K','k') DCBAN = DCBAN:gsub('L','l') DCBAN = DCBAN:gsub('Q','q') DCBAN = DCBAN:gsub('W','w') DCBAN = DCBAN:gsub('E','e' ) DCBAN = DCBAN:gsub('R','r' ) DCBAN = DCBAN:gsub('T','t' ) DCBAN = DCBAN:gsub('Y','y' ) DCBAN = DCBAN:gsub('U','u' ) DCBAN = DCBAN:gsub('I','i' ) DCBAN = DCBAN:gsub('O','o' ) DCBAN = DCBAN:gsub('P','p' ) DCBAN = DCBAN:gsub('Z','z' ) DCBAN = DCBAN:gsub('X','x' ) DCBAN = DCBAN:gsub('C','c' ) DCBAN = DCBAN:gsub('V','v' ) DCBAN = DCBAN:gsub('B','b' ) DCBAN = DCBAN:gsub('N','n' ) DCBAN = DCBAN:gsub('M','m')
local Q_bna13 = DCBAN:gsub('a','𝓪 ' ) Q_bna13 = Q_bna13:gsub('b','𝓫' ) Q_bna13 = Q_bna13:gsub('c','𝓬' ) Q_bna13 = Q_bna13:gsub('d','𝓭' ) Q_bna13 = Q_bna13:gsub('e','𝓮' ) Q_bna13 = Q_bna13:gsub('f','𝓯' ) Q_bna13 = Q_bna13:gsub('g','𝓰' ) Q_bna13 = Q_bna13:gsub('h','𝓱' ) Q_bna13 = Q_bna13:gsub('i','𝓲' ) Q_bna13 = Q_bna13:gsub('j','𝓳' ) Q_bna13 = Q_bna13:gsub('k','𝓴' ) Q_bna13 = Q_bna13:gsub('l','𝓵' ) Q_bna13 = Q_bna13:gsub('m','𝓶' ) Q_bna13 = Q_bna13:gsub('n','𝓷' ) Q_bna13 = Q_bna13:gsub('o','𝓸' ) Q_bna13 = Q_bna13:gsub('p','𝓹' ) Q_bna13 = Q_bna13:gsub('q','𝓺' ) Q_bna13 = Q_bna13:gsub('r','𝓻' ) Q_bna13 = Q_bna13:gsub('s','𝓼' ) Q_bna13 = Q_bna13:gsub('t','𝓽' ) Q_bna13 = Q_bna13:gsub('u','𝓾' ) Q_bna13 = Q_bna13:gsub('v','𝓾' ) Q_bna13 = Q_bna13:gsub('w','𝔀' ) Q_bna13 = Q_bna13:gsub('x','𝔁' ) Q_bna13 = Q_bna13:gsub('y','𝔂' ) Q_bna13 = Q_bna13:gsub('z','𝔃')
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text= '✨💗' , data = Q_bna13..'/zarfs'},
},
{
{text= '🧸♥' , data = Q_bna13..'/zakrag'},
},
}
}
edit(ChatId, Msg_id, "⇜ لـقـد اخـترت   \n▷ `"..Q_bna13.."`", "md",true,false,reply_markup)
end
end
if Text and Text:match('(%d+)/N14') then
local UserId = Text:match('(%d+)/N14')
if tonumber(IdUser) == tonumber(UserId) then
local DCBAN = Redis:get(SILV..ChatId..IdUser.."zkrf:text")
DCBAN = DCBAN:gsub('A','a') DCBAN = DCBAN:gsub('S','s') DCBAN = DCBAN:gsub('D','d') DCBAN = DCBAN:gsub('F','f') DCBAN = DCBAN:gsub('G','g') DCBAN = DCBAN:gsub('H','h') DCBAN = DCBAN:gsub('J','j') DCBAN = DCBAN:gsub('K','k') DCBAN = DCBAN:gsub('L','l') DCBAN = DCBAN:gsub('Q','q') DCBAN = DCBAN:gsub('W','w') DCBAN = DCBAN:gsub('E','e' ) DCBAN = DCBAN:gsub('R','r' ) DCBAN = DCBAN:gsub('T','t' ) DCBAN = DCBAN:gsub('Y','y' ) DCBAN = DCBAN:gsub('U','u' ) DCBAN = DCBAN:gsub('I','i' ) DCBAN = DCBAN:gsub('O','o' ) DCBAN = DCBAN:gsub('P','p' ) DCBAN = DCBAN:gsub('Z','z' ) DCBAN = DCBAN:gsub('X','x' ) DCBAN = DCBAN:gsub('C','c' ) DCBAN = DCBAN:gsub('V','v' ) DCBAN = DCBAN:gsub('B','b' ) DCBAN = DCBAN:gsub('N','n' ) DCBAN = DCBAN:gsub('M','m')
local Q_bna14 = DCBAN:gsub('a','𝙰' ) Q_bna14 = Q_bna14:gsub('b','𝙱' ) Q_bna14 = Q_bna14:gsub('c','𝙲' ) Q_bna14 = Q_bna14:gsub('d','𝙳' ) Q_bna14 = Q_bna14:gsub('e','𝙴' ) Q_bna14 = Q_bna14:gsub('f','𝙵' ) Q_bna14 = Q_bna14:gsub('g','𝙶' ) Q_bna14 = Q_bna14:gsub('h','𝙷' ) Q_bna14 = Q_bna14:gsub('i','𝙸' ) Q_bna14 = Q_bna14:gsub('j','𝙹' ) Q_bna14 = Q_bna14:gsub('k','𝙺' ) Q_bna14 = Q_bna14:gsub('l','𝙻' ) Q_bna14 = Q_bna14:gsub('m','𝙼' ) Q_bna14 = Q_bna14:gsub('n','𝙽' ) Q_bna14 = Q_bna14:gsub('o','𝙾' ) Q_bna14 = Q_bna14:gsub('p','𝙿' ) Q_bna14 = Q_bna14:gsub('q','𝚀' ) Q_bna14 = Q_bna14:gsub('r','𝚁' ) Q_bna14 = Q_bna14:gsub('s','𝚂' ) Q_bna14 = Q_bna14:gsub('t','𝚃' ) Q_bna14 = Q_bna14:gsub('u','𝙺' ) Q_bna14 = Q_bna14:gsub('v','𝚅' ) Q_bna14 = Q_bna14:gsub('w','𝚆' ) Q_bna14 = Q_bna14:gsub('x','𝚇' ) Q_bna14 = Q_bna14:gsub('y','𝚈' ) Q_bna14 = Q_bna14:gsub('z','𝚉')
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text= '✨💗' , data = Q_bna14..'/zarfs'},
},
{
{text= '🧸♥' , data = Q_bna14..'/zakrag'},
},
}
}
edit(ChatId, Msg_id, "⇜ لـقـد اخـترت   \n▷ `"..Q_bna14.."`", "md",true,false,reply_markup)
end
end
if Text and Text:match('(%d+)/N15') then
local UserId = Text:match('(%d+)/N15')
if tonumber(IdUser) == tonumber(UserId) then
local DCBAN = Redis:get(SILV..ChatId..IdUser.."zkrf:text")
DCBAN = DCBAN:gsub('A','a') DCBAN = DCBAN:gsub('S','s') DCBAN = DCBAN:gsub('D','d') DCBAN = DCBAN:gsub('F','f') DCBAN = DCBAN:gsub('G','g') DCBAN = DCBAN:gsub('H','h') DCBAN = DCBAN:gsub('J','j') DCBAN = DCBAN:gsub('K','k') DCBAN = DCBAN:gsub('L','l') DCBAN = DCBAN:gsub('Q','q') DCBAN = DCBAN:gsub('W','w') DCBAN = DCBAN:gsub('E','e' ) DCBAN = DCBAN:gsub('R','r' ) DCBAN = DCBAN:gsub('T','t' ) DCBAN = DCBAN:gsub('Y','y' ) DCBAN = DCBAN:gsub('U','u' ) DCBAN = DCBAN:gsub('I','i' ) DCBAN = DCBAN:gsub('O','o' ) DCBAN = DCBAN:gsub('P','p' ) DCBAN = DCBAN:gsub('Z','z' ) DCBAN = DCBAN:gsub('X','x' ) DCBAN = DCBAN:gsub('C','c' ) DCBAN = DCBAN:gsub('V','v' ) DCBAN = DCBAN:gsub('B','b' ) DCBAN = DCBAN:gsub('N','n' ) DCBAN = DCBAN:gsub('M','m')
local Q_bna15 = DCBAN:gsub('a','𝖆' ) Q_bna15 = Q_bna15:gsub('b','𝖇' ) Q_bna15 = Q_bna15:gsub('c','𝖈' ) Q_bna15 = Q_bna15:gsub('d','𝖉' ) Q_bna15 = Q_bna15:gsub('e','𝖊' ) Q_bna15 = Q_bna15:gsub('f','𝖋' ) Q_bna15 = Q_bna15:gsub('g','𝖌' ) Q_bna15 = Q_bna15:gsub('h','𝖍' ) Q_bna15 = Q_bna15:gsub('i','𝖎' ) Q_bna15 = Q_bna15:gsub('j','𝖏' ) Q_bna15 = Q_bna15:gsub('k','𝖐' ) Q_bna15 = Q_bna15:gsub('l','𝖑' ) Q_bna15 = Q_bna15:gsub('m','𝖒' ) Q_bna15 = Q_bna15:gsub('n','𝖓' ) Q_bna15 = Q_bna15:gsub('o','𝖔' ) Q_bna15 = Q_bna15:gsub('p','𝖕' ) Q_bna15 = Q_bna15:gsub('q','𝖖' ) Q_bna15 = Q_bna15:gsub('r','𝖗' ) Q_bna15 = Q_bna15:gsub('s','𝖘' ) Q_bna15 = Q_bna15:gsub('t','𝖙' ) Q_bna15 = Q_bna15:gsub('u','𝖚' ) Q_bna15 = Q_bna15:gsub('v','𝖛' ) Q_bna15 = Q_bna15:gsub('w','𝖜' ) Q_bna15 = Q_bna15:gsub('x','𝖝' ) Q_bna15 = Q_bna15:gsub('y','𝖞' ) Q_bna15 = Q_bna15:gsub('z','𝖟')
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text= '✨💗' , data = Q_bna15..'/zarfs'},
},
{
{text= '🧸♥' , data = Q_bna15..'/zakrag'},
},
}
}
edit(ChatId, Msg_id, "⇜ لـقـد اخـترت   \n▷ `"..Q_bna15.."`", "md",true,false,reply_markup)
end
end
if Text and Text:match('(%d+)/N16') then
local UserId = Text:match('(%d+)/N16')
if tonumber(IdUser) == tonumber(UserId) then
local DCBAN = Redis:get(SILV..ChatId..IdUser.."zkrf:text")
DCBAN = DCBAN:gsub('A','a') DCBAN = DCBAN:gsub('S','s') DCBAN = DCBAN:gsub('D','d') DCBAN = DCBAN:gsub('F','f') DCBAN = DCBAN:gsub('G','g') DCBAN = DCBAN:gsub('H','h') DCBAN = DCBAN:gsub('J','j') DCBAN = DCBAN:gsub('K','k') DCBAN = DCBAN:gsub('L','l') DCBAN = DCBAN:gsub('Q','q') DCBAN = DCBAN:gsub('W','w') DCBAN = DCBAN:gsub('E','e' ) DCBAN = DCBAN:gsub('R','r' ) DCBAN = DCBAN:gsub('T','t' ) DCBAN = DCBAN:gsub('Y','y' ) DCBAN = DCBAN:gsub('U','u' ) DCBAN = DCBAN:gsub('I','i' ) DCBAN = DCBAN:gsub('O','o' ) DCBAN = DCBAN:gsub('P','p' ) DCBAN = DCBAN:gsub('Z','z' ) DCBAN = DCBAN:gsub('X','x' ) DCBAN = DCBAN:gsub('C','c' ) DCBAN = DCBAN:gsub('V','v' ) DCBAN = DCBAN:gsub('B','b' ) DCBAN = DCBAN:gsub('N','n' ) DCBAN = DCBAN:gsub('M','m')
local Q_bna16 = DCBAN:gsub('a','🅰' ) Q_bna16 = Q_bna16:gsub('b','🅱' ) Q_bna16 = Q_bna16:gsub('c','🅲' ) Q_bna16 = Q_bna16:gsub('d','🅳' ) Q_bna16 = Q_bna16:gsub('e','🅴' ) Q_bna16 = Q_bna16:gsub('f','🅵' ) Q_bna16 = Q_bna16:gsub('g','🅶' ) Q_bna16 = Q_bna16:gsub('h','🅷' ) Q_bna16 = Q_bna16:gsub('i','🅸' ) Q_bna16 = Q_bna16:gsub('j','🅹' ) Q_bna16 = Q_bna16:gsub('k','🅺' ) Q_bna16 = Q_bna16:gsub('l','🅻' ) Q_bna16 = Q_bna16:gsub('m','🅼' ) Q_bna16 = Q_bna16:gsub('n','🅽' ) Q_bna16 = Q_bna16:gsub('o','🅾' ) Q_bna16 = Q_bna16:gsub('p','🅿' ) Q_bna16 = Q_bna16:gsub('q','🆀' ) Q_bna16 = Q_bna16:gsub('r','🆁' ) Q_bna16 = Q_bna16:gsub('s','🆂' ) Q_bna16 = Q_bna16:gsub('t','🆃' ) Q_bna16 = Q_bna16:gsub('u','🆄' ) Q_bna16 = Q_bna16:gsub('v','🆅' ) Q_bna16 = Q_bna16:gsub('w','🆆' ) Q_bna16 = Q_bna16:gsub('x','🆇' ) Q_bna16 = Q_bna16:gsub('y','🆈' ) Q_bna16 = Q_bna16:gsub('z','🆉')                
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text= '✨💗' , data = Q_bna16..'/zarfs'},
},
{
{text= '🧸♥' , data = Q_bna16..'/zakrag'},
},
}
}
edit(ChatId, Msg_id, "⇜ لـقـد اخـترت   \n▷ `"..Q_bna16.."`", "md",true,false,reply_markup)
end
end
----------
if Text and Text:match('(%d+)/N17') then
local UserId = Text:match('(%d+)/N17')
if tonumber(IdUser) == tonumber(UserId) then
local DCBAN = Redis:get(SILV..ChatId..IdUser.."zkrf:text")
DCBAN = DCBAN:gsub('A','a') DCBAN = DCBAN:gsub('S','s') DCBAN = DCBAN:gsub('D','d') DCBAN = DCBAN:gsub('F','f') DCBAN = DCBAN:gsub('G','g') DCBAN = DCBAN:gsub('H','h') DCBAN = DCBAN:gsub('J','j') DCBAN = DCBAN:gsub('K','k') DCBAN = DCBAN:gsub('L','l') DCBAN = DCBAN:gsub('Q','q') DCBAN = DCBAN:gsub('W','w') DCBAN = DCBAN:gsub('E','e' ) DCBAN = DCBAN:gsub('R','r' ) DCBAN = DCBAN:gsub('T','t' ) DCBAN = DCBAN:gsub('Y','y' ) DCBAN = DCBAN:gsub('U','u' ) DCBAN = DCBAN:gsub('I','i' ) DCBAN = DCBAN:gsub('O','o' ) DCBAN = DCBAN:gsub('P','p' ) DCBAN = DCBAN:gsub('Z','z' ) DCBAN = DCBAN:gsub('X','x' ) DCBAN = DCBAN:gsub('C','c' ) DCBAN = DCBAN:gsub('V','v' ) DCBAN = DCBAN:gsub('B','b' ) DCBAN = DCBAN:gsub('N','n' ) DCBAN = DCBAN:gsub('M','m')
local Q_bna17 = DCBAN:gsub('a','🄰' ) Q_bna17 = Q_bna17:gsub('b','🄱' ) Q_bna17 = Q_bna17:gsub('c','🄲' ) Q_bna17 = Q_bna17:gsub('d','🄳' ) Q_bna17 = Q_bna17:gsub('e','🄴' ) Q_bna17 = Q_bna17:gsub('f','🄵' ) Q_bna17 = Q_bna17:gsub('g','🄶' ) Q_bna17 = Q_bna17:gsub('h','🄷' ) Q_bna17 = Q_bna17:gsub('i','🄸' ) Q_bna17 = Q_bna17:gsub('j','🄹' ) Q_bna17 = Q_bna17:gsub('k','🄺' ) Q_bna17 = Q_bna17:gsub('l','🄻' ) Q_bna17 = Q_bna17:gsub('m','🄼' ) Q_bna17 = Q_bna17:gsub('n','🄽' ) Q_bna17 = Q_bna17:gsub('o','🄾' ) Q_bna17 = Q_bna17:gsub('p','🄿' ) Q_bna17 = Q_bna17:gsub('q','🅀' ) Q_bna17 = Q_bna17:gsub('r','🅁' ) Q_bna17 = Q_bna17:gsub('s','🅂' ) Q_bna17 = Q_bna17:gsub('t','🅃' ) Q_bna17 = Q_bna17:gsub('u','🅄' ) Q_bna17 = Q_bna17:gsub('v','🅅' ) Q_bna17 = Q_bna17:gsub('w','🅆' ) Q_bna17 = Q_bna17:gsub('x','🅇' ) Q_bna17 = Q_bna17:gsub('y','🅈' ) Q_bna17 = Q_bna17:gsub('z','🅉')
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text= '✨💗' , data = Q_bna17..'/zarfs'},
},
{
{text= '🧸♥' , data = Q_bna17..'/zakrag'},
},
}
}
edit(ChatId, Msg_id, "⇜ لـقـد اخـترت   \n▷ `"..Q_bna17.."`", "md",true,false,reply_markup)
end
end
----------
if Text and Text:match('(%d+)/N18') then
local UserId = Text:match('(%d+)/N18')
if tonumber(IdUser) == tonumber(UserId) then
local DCBAN = Redis:get(SILV..ChatId..IdUser.."zkrf:text")
DCBAN = DCBAN:gsub('A','a') DCBAN = DCBAN:gsub('S','s') DCBAN = DCBAN:gsub('D','d') DCBAN = DCBAN:gsub('F','f') DCBAN = DCBAN:gsub('G','g') DCBAN = DCBAN:gsub('H','h') DCBAN = DCBAN:gsub('J','j') DCBAN = DCBAN:gsub('K','k') DCBAN = DCBAN:gsub('L','l') DCBAN = DCBAN:gsub('Q','q') DCBAN = DCBAN:gsub('W','w') DCBAN = DCBAN:gsub('E','e' ) DCBAN = DCBAN:gsub('R','r' ) DCBAN = DCBAN:gsub('T','t' ) DCBAN = DCBAN:gsub('Y','y' ) DCBAN = DCBAN:gsub('U','u' ) DCBAN = DCBAN:gsub('I','i' ) DCBAN = DCBAN:gsub('O','o' ) DCBAN = DCBAN:gsub('P','p' ) DCBAN = DCBAN:gsub('Z','z' ) DCBAN = DCBAN:gsub('X','x' ) DCBAN = DCBAN:gsub('C','c' ) DCBAN = DCBAN:gsub('V','v' ) DCBAN = DCBAN:gsub('B','b' ) DCBAN = DCBAN:gsub('N','n' ) DCBAN = DCBAN:gsub('M','m')
local Q_bna18 = DCBAN:gsub('a','🅐' ) Q_bna18= Q_bna18:gsub('b','🅑' ) Q_bna18= Q_bna18:gsub('c','🅒' ) Q_bna18= Q_bna18:gsub('d','🅓') Q_bna18 = Q_bna18:gsub('e','🅔' ) Q_bna18= Q_bna18:gsub('f','🅕' ) Q_bna18= Q_bna18:gsub('g','🅖' ) Q_bna18= Q_bna18:gsub('h','🅗' ) Q_bna18= Q_bna18:gsub('i','🅘' ) Q_bna18= Q_bna18:gsub('j','🅙' ) Q_bna18= Q_bna18:gsub('k','🅚' ) Q_bna18= Q_bna18:gsub('l','🅛' ) Q_bna18= Q_bna18:gsub('m','🅜' ) Q_bna18= Q_bna18:gsub('n','🅝' ) Q_bna18= Q_bna18:gsub('o','🅞' ) Q_bna18= Q_bna18:gsub('p','🅟' ) Q_bna18= Q_bna18:gsub('q','🅠' ) Q_bna18= Q_bna18:gsub('r','🅡' ) Q_bna18= Q_bna18:gsub('s','🅢' ) Q_bna18= Q_bna18:gsub('t','🅣' ) Q_bna18= Q_bna18:gsub('u','🅤' ) Q_bna18= Q_bna18:gsub('v','🅥' ) Q_bna18= Q_bna18:gsub('w','🅦' ) Q_bna18= Q_bna18:gsub('x','🅧' ) Q_bna18= Q_bna18:gsub('y','🅨' ) Q_bna18= Q_bna18:gsub('z','🅩')
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text= '✨💗' , data = Q_bna18..'/zarfs'},
},
{
{text= '🧸♥' , data = Q_bna18..'/zakrag'},
},
}
}
edit(ChatId, Msg_id, "⇜ لـقـد اخـترت   \n▷ `"..Q_bna18.."`", "md",true,false,reply_markup)
end
end
if Text and Text:match('(.*)/zakragrt') then
  local z_selv = Text:match('(.*)/zakraget')
 local seltextc = "⇜ تمت الزخࢪفھـۃ بنجاح\n\n▷ `𓂄𓆩"..z_selv.."𓆪𓂁` \n\n▷ `𓆩⸤"..z_selv.."⸥𓆪`\n\n▷ `𓆩"..z_selv.."𓆪`\n\n▷ `⌁ "..z_selv.." ’♥ `\n\n▷ `ꔷ"..z_selv.." 🧸💕 ˝♥›.`\n\n▷ `➹"..z_selv.." 𓂄𓆩♥𓆪‌‌𓂁`\n\n▷ `★⃝➼"..z_selv.." ꗛ`\n\n▷ `⋆⃟➼"..z_selv.." ꕸ`\n\n▷ `⸢"..z_selv.."⸥`\n\n▷ `ꞏ"..z_selv.." ｢♥｣`\n\n▷ `⋆"..z_selv.." ’🧸💕›`\n\n▷ ` ᯓ 𓆩 ˹ "..z_selv.." ˼ 𓆪 𓆃`\n\n▷`𓆩 "..z_selv.."ｌ➝ ˛⁽♥₎ 𓆪`\n\n▷`𒅒• !! "..z_selv.."  ᵛ͢ᵎᵖ 𒅒`\n\n▷`˚₊· ͟͟͞͞➳❥❬ "..z_selv.." ❭•°'\n\nاضغط علي الزخࢪفھـۃ للنسخ 🎀..!"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = chsourceNa,url="t.me/"..chsource},
},
}
}
edit(ChatId, Msg_id, seltextc, "md",true,false,reply_markup)
  end

if Text and Text:match('(.*)/zarfs') then
  local z_text = Text:match('(.*)/zarfs')
  local zeetmed =  "⇜ تمت الزخࢪفھـۃ بنجاح\n\n▷ `"..z_text.." ¦✨❤️` \n\n▷ `"..z_text.." “̯ 🐼💗`\n\n▷ `"..z_text.." 🦋“`\n\n▷ `"..z_text.."ّ ❥̚͢₎ 🐣`\n\n▷ `"..z_text.." ℡ ̇ ✨🐯⇣✧`\n\n▷ `"..z_text.." 😴🌸✿⇣`\n\n▷ `"..z_text.." •🙊💙`\n\n▷ `"..z_text.." ❥┊⁽ ℡🦁🌸`\n\n▷ `"..z_text.." •💚“`\n\n▷ `"..z_text.." ⚡️♛ֆ₎`\n\n▷ `"..z_text.." ⁞♩⁽💎🌩₎⇣✿`\n\n▷ `"..z_text.." 〄💖‘`\n\nاضغط علي الزخࢪفھـۃ للنسخ 🎀..!"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = chsourceNa,url="t.me/"..chsource},
},
}
}
edit(ChatId, Msg_id, zeetmed, "md",true,false,reply_markup)
  end
if Text and Text:match('(.*)/zakrag') then
  local z_text = Text:match('(.*)/zakrag') or "nome"
 local zeetamed = "⇜ تمت الزخࢪفھـۃ بنجاح\n\n▷ `𓂄𓆩"..z_text.."𓆪𓂁` \n\n▷ `𓆩⸤"..z_text.."⸥𓆪`\n\n▷ `𓆩"..z_text.."𓆪`\n\n▷ `⌁ "..z_text.." ’♥ `\n\n▷ `ꔷ"..z_text.." 🧸💕 ˝♥›.`\n\n▷ `➹"..z_text.." 𓂄𓆩♥𓆪‌‌𓂁`\n\n▷ `★⃝➼"..z_text.." ꗛ`\n\n▷ `⋆⃟➼"..z_text.." ꕸ`\n\n▷ `⸢"..z_text.."⸥`\n\n▷ `ꞏ"..z_text.." ｢♥｣`\n\n▷ `⋆"..z_text.."’🧸💕›`\n\n▷ ` ᯓ 𓆩 ˹ "..z_text.." ˼ 𓆪 𓆃`\n\n▷`𓆩 "..z_text.."ｌ➝ ˛⁽♥₎ 𓆪`\n\nاضغط علي الزخࢪفھـۃ للنسخ 🎀..!"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = chsourceNa,url="t.me/"..chsource},
},
}
}
edit(ChatId, Msg_id, zeetamed, "md",true,false,reply_markup)
  end
--------------------------------------------------------------------------------------------------------------
if Text and Text:match('(%d+)/xogamesta//') then
local UserIdii = Text:match('(%d+)/xogamesta')
if tonumber(UserIdii) == tonumber(IdUser) then
return bot.answerCallbackQuery(data.id, "• عذراً لايمكنك لعب مع نفسك •", true)
end
Redis:setex(SILV.."xopleyers"..UserIdii..":"..ChatId,300, "❌")
Redis:setex(SILV.."xopleyers"..IdUser..":"..ChatId,300, "⭕️")
Redis:setex(SILV.."xotern"..UserIdii..":"..ChatId,300,true)
return xogames(ChatId,UserIdii,IdUser,Msg_id)
end

if Text and Text:match('(%d+)/xo1//(%d+)') then
local UserId = {Text:match('(%d+)/xo1//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[2]) or tonumber(IdUser) == tonumber(UserId[1]) then
if Redis:get(SILV.."xotern"..UserId[1]..":"..ChatId) == "true" then
if tonumber(IdUser) == tonumber(UserId[2]) then
return bot.answerCallbackQuery(data.id, "• عذراً ليس دورك •", true)
end
elseif Redis:get(SILV.."xotern"..UserId[2]..":"..ChatId) == "true" then
if tonumber(IdUser) == tonumber(UserId[1]) then
return bot.answerCallbackQuery(data.id, "• عذراً ليس دورك •", true)
end
end 
if Redis:get(SILV.."xosgear1"..(UserId[1]+UserId[2])..":"..ChatId) then
return bot.answerCallbackQuery(data.id, "• هذا زر مختار مسبقا •", true)
end
  local currentPlayer = nil
  local nextPlayer = nil
  
  if Redis:get(SILV.."xotern"..UserId[1]..":"..ChatId) == "true" then
    currentPlayer = UserId[1]
    nextPlayer = UserId[2]
  elseif Redis:get(SILV.."xotern"..UserId[2]..":"..ChatId) == "true" then
    currentPlayer = UserId[2]
    nextPlayer = UserId[1]
  end  
  if currentPlayer and nextPlayer then
    local isha = Redis:get(SILV.."xopleyers"..currentPlayer..":"..ChatId)
    Redis:setex(SILV.."xosgear1"..(nextPlayer+currentPlayer)..":"..ChatId,300, isha)
    Redis:setex(SILV.."xoswin1"..currentPlayer..":"..ChatId,300,true)
    Redis:del(SILV.."xotern"..currentPlayer..":"..ChatId)
    Redis:setex(SILV.."xotern"..nextPlayer..":"..ChatId,300,true)
   Redis:incrby(SILV.."xonumt"..ChatId..(nextPlayer+currentPlayer), 1)    
    local currentPlayerInfo = bot.getUser(currentPlayer)
    local nextPlayerInfo = bot.getUser(nextPlayer)
    
    local currentPlayerName = currentPlayerInfo.first_name or "لا يوجد اسم"
    local nextPlayerName = nextPlayerInfo.first_name or "لا يوجد اسم"
    
    pleyerT = "- الان دور اللاعب : "..nextPlayerName.." "..Redis:get(SILV.."xopleyers"..nextPlayer..":"..ChatId).." "
    xogames(ChatId, currentPlayer, nextPlayer, Msg_id, isha, nil, nil, nil, nil, nil, nil, nil, nil, pleyerT)
  end
else
bot.answerCallbackQuery(data.id, "• عذراً انت لست مشترك بالعبه •", true)
end
end
if Text and Text:match('(%d+)/xo2//(%d+)') then
local UserId = {Text:match('(%d+)/xo2//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[2]) or tonumber(IdUser) == tonumber(UserId[1]) then
if Redis:get(SILV.."xotern"..UserId[1]..":"..ChatId) == "true" then
if tonumber(IdUser) == tonumber(UserId[2]) then
return bot.answerCallbackQuery(data.id, "• عذراً ليس دورك •", true)
end
elseif Redis:get(SILV.."xotern"..UserId[2]..":"..ChatId) == "true" then
if tonumber(IdUser) == tonumber(UserId[1]) then
return bot.answerCallbackQuery(data.id, "• عذراً ليس دورك •", true)
end
end 
if Redis:get(SILV.."xosgear2"..(UserId[1]+UserId[2])..":"..ChatId) then
return bot.answerCallbackQuery(data.id, "• عذراً هذا الزر مختار مسبقا •", true)
end
  local currentPlayer = nil
  local nextPlayer = nil
  
  if Redis:get(SILV.."xotern"..UserId[1]..":"..ChatId) == "true" then
    currentPlayer = UserId[1]
    nextPlayer = UserId[2]
  elseif Redis:get(SILV.."xotern"..UserId[2]..":"..ChatId) == "true" then
    currentPlayer = UserId[2]
    nextPlayer = UserId[1]
  end  
  if currentPlayer and nextPlayer then
    local isha = Redis:get(SILV.."xopleyers"..currentPlayer..":"..ChatId)
    Redis:setex(SILV.."xosgear2"..(nextPlayer+currentPlayer)..":"..ChatId,300, isha)
    Redis:setex(SILV.."xoswin2"..currentPlayer..":"..ChatId,300,true)
    Redis:del(SILV.."xotern"..currentPlayer..":"..ChatId)
    Redis:setex(SILV.."xotern"..nextPlayer..":"..ChatId,300,true)
    Redis:incrby(SILV.."xonumt"..ChatId..(nextPlayer+currentPlayer), 1)    
    local currentPlayerInfo = bot.getUser(currentPlayer)
    local nextPlayerInfo = bot.getUser(nextPlayer)
    
    local currentPlayerName = currentPlayerInfo.first_name or "لا يوجد اسم"
    local nextPlayerName = nextPlayerInfo.first_name or "لا يوجد اسم"
    
    pleyerT = "- الان دور اللاعب : "..nextPlayerName.." "..Redis:get(SILV.."xopleyers"..nextPlayer..":"..ChatId).." "
    xogames(ChatId, currentPlayer, nextPlayer, Msg_id, nil, isha, nil, nil, nil, nil, nil, nil, nil, pleyerT)
  end
else
bot.answerCallbackQuery(data.id, "• عذراً انت لست مشترك بالعبه •", true)
end
end
if Text and Text:match('(%d+)/xo3//(%d+)') then
local UserId = {Text:match('(%d+)/xo3//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[2]) or tonumber(IdUser) == tonumber(UserId[1]) then
if Redis:get(SILV.."xotern"..UserId[1]..":"..ChatId) == "true" then
if tonumber(IdUser) == tonumber(UserId[2]) then
return bot.answerCallbackQuery(data.id, "• عذراً ليس دورك •", true)
end
elseif Redis:get(SILV.."xotern"..UserId[2]..":"..ChatId) == "true" then
if tonumber(IdUser) == tonumber(UserId[1]) then
return bot.answerCallbackQuery(data.id, "• عذراً ليس دورك •", true)
end
end 
if Redis:get(SILV.."xosgear3"..(UserId[1]+UserId[2])..":"..ChatId) then
return bot.answerCallbackQuery(data.id, "• عذراً هذا الزر مختار مسبقا •", true)
end
  local currentPlayer = nil
  local nextPlayer = nil
  
  if Redis:get(SILV.."xotern"..UserId[1]..":"..ChatId) == "true" then
    currentPlayer = UserId[1]
    nextPlayer = UserId[2]
  elseif Redis:get(SILV.."xotern"..UserId[2]..":"..ChatId) == "true" then
    currentPlayer = UserId[2]
    nextPlayer = UserId[1]
  end  
  if currentPlayer and nextPlayer then
    local isha = Redis:get(SILV.."xopleyers"..currentPlayer..":"..ChatId)
    Redis:setex(SILV.."xosgear3"..(nextPlayer+currentPlayer)..":"..ChatId,300, isha)
    Redis:setex(SILV.."xoswin3"..currentPlayer..":"..ChatId,300,true)
    Redis:del(SILV.."xotern"..currentPlayer..":"..ChatId)
    Redis:setex(SILV.."xotern"..nextPlayer..":"..ChatId,300,true)
       Redis:incrby(SILV.."xonumt"..ChatId..(nextPlayer+currentPlayer), 1)    
    local currentPlayerInfo = bot.getUser(currentPlayer)
    local nextPlayerInfo = bot.getUser(nextPlayer)
    
    local currentPlayerName = currentPlayerInfo.first_name or "لا يوجد اسم"
    local nextPlayerName = nextPlayerInfo.first_name or "لا يوجد اسم"
    
    pleyerT = "- الان دور اللاعب : "..nextPlayerName.." "..Redis:get(SILV.."xopleyers"..nextPlayer..":"..ChatId).." "
    xogames(ChatId, currentPlayer, nextPlayer, Msg_id, nil, nil, isha, nil, nil, nil, nil, nil, nil, pleyerT)
  end
else
bot.answerCallbackQuery(data.id, "• عذراً انت لست مشترك بالعبه •", true)
end
end
if Text and Text:match('(%d+)/xo4//(%d+)') then
local UserId = {Text:match('(%d+)/xo4//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[2]) or tonumber(IdUser) == tonumber(UserId[1]) then
if Redis:get(SILV.."xotern"..UserId[1]..":"..ChatId) == "true" then
if tonumber(IdUser) == tonumber(UserId[2]) then
return bot.answerCallbackQuery(data.id, "• عذراً ليس دورك •", true)
end
elseif Redis:get(SILV.."xotern"..UserId[2]..":"..ChatId) == "true" then
if tonumber(IdUser) == tonumber(UserId[1]) then
return bot.answerCallbackQuery(data.id, "• عذراً ليس دورك •", true)
end
end 
if Redis:get(SILV.."xosgear4"..(UserId[1]+UserId[2])..":"..ChatId) then
return bot.answerCallbackQuery(data.id, "• عذراً هذا الزر مختار مسبقا •", true)
end
  local currentPlayer = nil
  local nextPlayer = nil
  
  if Redis:get(SILV.."xotern"..UserId[1]..":"..ChatId) == "true" then
    currentPlayer = UserId[1]
    nextPlayer = UserId[2]
  elseif Redis:get(SILV.."xotern"..UserId[2]..":"..ChatId) == "true" then
    currentPlayer = UserId[2]
    nextPlayer = UserId[1]
  end  
  if currentPlayer and nextPlayer then
    local isha = Redis:get(SILV.."xopleyers"..currentPlayer..":"..ChatId)
    Redis:setex(SILV.."xosgear4"..(nextPlayer+currentPlayer)..":"..ChatId,300, isha)
    Redis:setex(SILV.."xoswin4"..currentPlayer..":"..ChatId,300,true)
    Redis:del(SILV.."xotern"..currentPlayer..":"..ChatId)
    Redis:setex(SILV.."xotern"..nextPlayer..":"..ChatId,300,true)
       Redis:incrby(SILV.."xonumt"..msg.chat_id..(nextPlayer+currentPlayer), 1)
    local currentPlayerInfo = bot.getUser(currentPlayer)
    local nextPlayerInfo = bot.getUser(nextPlayer)
    
    local currentPlayerName = currentPlayerInfo.first_name or "لا يوجد اسم"
    local nextPlayerName = nextPlayerInfo.first_name or "لا يوجد اسم"
    
    pleyerT = "- الان دور اللاعب : "..nextPlayerName.." "..Redis:get(SILV.."xopleyers"..nextPlayer..":"..ChatId).." "
    xogames(ChatId, currentPlayer, nextPlayer, Msg_id, nil, nil, nil, isha, nil, nil, nil, nil, nil, pleyerT)
  end
else
bot.answerCallbackQuery(data.id, "• عذراً انت لست مشترك بالعبه •", true)
end
end

if Text and Text:match('(%d+)/xo5//(%d+)') then
local UserId = {Text:match('(%d+)/xo5//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[2]) or tonumber(IdUser) == tonumber(UserId[1]) then
if Redis:get(SILV.."xotern"..UserId[1]..":"..ChatId) == "true" then
if tonumber(IdUser) == tonumber(UserId[2]) then
return bot.answerCallbackQuery(data.id, "• عذراً ليس دورك •", true)
end
elseif Redis:get(SILV.."xotern"..UserId[2]..":"..ChatId) == "true" then
if tonumber(IdUser) == tonumber(UserId[1]) then
return bot.answerCallbackQuery(data.id, "• عذراً ليس دورك •", true)
end
end 
if Redis:get(SILV.."xosgear5"..(UserId[1]+UserId[2])..":"..ChatId) then
return bot.answerCallbackQuery(data.id, "• عذراً هذا الزر مختار مسبقا •", true)
end
  local currentPlayer = nil
  local nextPlayer = nil
  
  if Redis:get(SILV.."xotern"..UserId[1]..":"..ChatId) == "true" then
    currentPlayer = UserId[1]
    nextPlayer = UserId[2]
  elseif Redis:get(SILV.."xotern"..UserId[2]..":"..ChatId) == "true" then
    currentPlayer = UserId[2]
    nextPlayer = UserId[1]
  end  
  if currentPlayer and nextPlayer then
    local isha = Redis:get(SILV.."xopleyers"..currentPlayer..":"..ChatId)
    Redis:setex(SILV.."xosgear5"..(nextPlayer+currentPlayer)..":"..ChatId,300, isha)
    Redis:setex(SILV.."xoswin5"..currentPlayer..":"..ChatId,300,true)
    Redis:del(SILV.."xotern"..currentPlayer..":"..ChatId)
    Redis:setex(SILV.."xotern"..nextPlayer..":"..ChatId,300,true)
   Redis:incrby(SILV.."xonumt"..ChatId..(nextPlayer+currentPlayer), 1)    
    local currentPlayerInfo = bot.getUser(currentPlayer)
    local nextPlayerInfo = bot.getUser(nextPlayer)
    
    local currentPlayerName = currentPlayerInfo.first_name or "لا يوجد اسم"
    local nextPlayerName = nextPlayerInfo.first_name or "لا يوجد اسم"
    
    pleyerT = "- الان دور اللاعب : "..nextPlayerName.." "..Redis:get(SILV.."xopleyers"..nextPlayer..":"..ChatId).." "
    xogames(ChatId, currentPlayer, nextPlayer, Msg_id, nil, nil, nil, nil, isha, nil, nil, nil, nil, pleyerT)
  end
else
bot.answerCallbackQuery(data.id, "• عذراً انت لست مشترك بالعبه •", true)
end
end
if Text and Text:match('(%d+)/xo6//(%d+)') then
local UserId = {Text:match('(%d+)/xo6//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[2]) or tonumber(IdUser) == tonumber(UserId[1]) then
if Redis:get(SILV.."xotern"..UserId[1]..":"..ChatId) == "true" then
if tonumber(IdUser) == tonumber(UserId[2]) then
return bot.answerCallbackQuery(data.id, "• عذراً ليس دورك •", true)
end
elseif Redis:get(SILV.."xotern"..UserId[2]..":"..ChatId) == "true" then
if tonumber(IdUser) == tonumber(UserId[1]) then
return bot.answerCallbackQuery(data.id, "• عذراً ليس دورك •", true)
end
end 
if Redis:get(SILV.."xosgear6"..(UserId[1]+UserId[2])..":"..ChatId) then
return bot.answerCallbackQuery(data.id, "• عذراً هذا الزر مختار مسبقا •", true)
end
  local currentPlayer = nil
  local nextPlayer = nil
  
  if Redis:get(SILV.."xotern"..UserId[1]..":"..ChatId) == "true" then
    currentPlayer = UserId[1]
    nextPlayer = UserId[2]
  elseif Redis:get(SILV.."xotern"..UserId[2]..":"..ChatId) == "true" then
    currentPlayer = UserId[2]
    nextPlayer = UserId[1]
  end  
  if currentPlayer and nextPlayer then
    local isha = Redis:get(SILV.."xopleyers"..currentPlayer..":"..ChatId)
    Redis:setex(SILV.."xosgear6"..(nextPlayer+currentPlayer)..":"..ChatId,300, isha)
    Redis:setex(SILV.."xoswin6"..currentPlayer..":"..ChatId,300,true)
    Redis:del(SILV.."xotern"..currentPlayer..":"..ChatId)
    Redis:setex(SILV.."xotern"..nextPlayer..":"..ChatId,300,true)
    Redis:incrby(SILV.."xonumt"..ChatId..(nextPlayer+currentPlayer), 1)     
    local currentPlayerInfo = bot.getUser(currentPlayer)
    local nextPlayerInfo = bot.getUser(nextPlayer)
    
    local currentPlayerName = currentPlayerInfo.first_name or "لا يوجد اسم"
    local nextPlayerName = nextPlayerInfo.first_name or "لا يوجد اسم"
    
    pleyerT = "- الان دور اللاعب : "..nextPlayerName.." "..Redis:get(SILV.."xopleyers"..nextPlayer..":"..ChatId).." "
    xogames(ChatId, currentPlayer, nextPlayer, Msg_id, nil, nil, nil, nil, nil, isha, nil, nil, nil, pleyerT)
  end
else
bot.answerCallbackQuery(data.id, "• عذراً انت لست مشترك بالعبه •", true)
end
end
if Text and Text:match('(%d+)/xo7//(%d+)') then
local UserId = {Text:match('(%d+)/xo7//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[2]) or tonumber(IdUser) == tonumber(UserId[1]) then
if Redis:get(SILV.."xotern"..UserId[1]..":"..ChatId) == "true" then
if tonumber(IdUser) == tonumber(UserId[2]) then
return bot.answerCallbackQuery(data.id, "• عذراً ليس دورك •", true)
end
elseif Redis:get(SILV.."xotern"..UserId[2]..":"..ChatId) == "true" then
if tonumber(IdUser) == tonumber(UserId[1]) then
return bot.answerCallbackQuery(data.id, "• عذراً ليس دورك •", true)
end
end 
if Redis:get(SILV.."xosgear7"..(UserId[1]+UserId[2])..":"..ChatId) then
return bot.answerCallbackQuery(data.id, "• عذراً هذا الزر مختار مسبقا •", true)
end
  local currentPlayer = nil
  local nextPlayer = nil
  
  if Redis:get(SILV.."xotern"..UserId[1]..":"..ChatId) == "true" then
    currentPlayer = UserId[1]
    nextPlayer = UserId[2]
  elseif Redis:get(SILV.."xotern"..UserId[2]..":"..ChatId) == "true" then
    currentPlayer = UserId[2]
    nextPlayer = UserId[1]
  end  
  if currentPlayer and nextPlayer then
    local isha = Redis:get(SILV.."xopleyers"..currentPlayer..":"..ChatId)
    Redis:setex(SILV.."xosgear7"..(nextPlayer+currentPlayer)..":"..ChatId,300, isha)
    Redis:setex(SILV.."xoswin7"..currentPlayer..":"..ChatId,300,true)
    Redis:del(SILV.."xotern"..currentPlayer..":"..ChatId)
    Redis:setex(SILV.."xotern"..nextPlayer..":"..ChatId,300,true)
    Redis:incrby(SILV.."xonumt"..ChatId..(nextPlayer+currentPlayer), 1)        
    local currentPlayerInfo = bot.getUser(currentPlayer)
    local nextPlayerInfo = bot.getUser(nextPlayer)
    
    local currentPlayerName = currentPlayerInfo.first_name or "لا يوجد اسم"
    local nextPlayerName = nextPlayerInfo.first_name or "لا يوجد اسم"
    
    pleyerT = "- الان دور اللاعب : "..nextPlayerName.." "..Redis:get(SILV.."xopleyers"..nextPlayer..":"..ChatId).." "
    xogames(ChatId, currentPlayer, nextPlayer, Msg_id, nil, nil, nil, nil, nil, nil, isha, nil, nil, pleyerT)
  end
else
bot.answerCallbackQuery(data.id, "• عذراً انت لست مشترك بالعبه •", true)
end
end
if Text and Text:match('(%d+)/xo8//(%d+)') then
local UserId = {Text:match('(%d+)/xo8//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[2]) or tonumber(IdUser) == tonumber(UserId[1]) then
if Redis:get(SILV.."xotern"..UserId[1]..":"..ChatId) == "true" then
if tonumber(IdUser) == tonumber(UserId[2]) then
return bot.answerCallbackQuery(data.id, "• عذراً ليس دورك •", true)
end
elseif Redis:get(SILV.."xotern"..UserId[2]..":"..ChatId) == "true" then
if tonumber(IdUser) == tonumber(UserId[1]) then
return bot.answerCallbackQuery(data.id, "• عذراً ليس دورك •", true)
end
end 
if Redis:get(SILV.."xosgear8"..(UserId[1]+UserId[2])..":"..ChatId) then
return bot.answerCallbackQuery(data.id, "• عذراً هذا الزر مختار مسبقا •", true)
end
  local currentPlayer = nil
  local nextPlayer = nil
  
  if Redis:get(SILV.."xotern"..UserId[1]..":"..ChatId) == "true" then
    currentPlayer = UserId[1]
    nextPlayer = UserId[2]
  elseif Redis:get(SILV.."xotern"..UserId[2]..":"..ChatId) == "true" then
    currentPlayer = UserId[2]
    nextPlayer = UserId[1]
  end  
  if currentPlayer and nextPlayer then
    local isha = Redis:get(SILV.."xopleyers"..currentPlayer..":"..ChatId)
    Redis:setex(SILV.."xosgear8"..(nextPlayer+currentPlayer)..":"..ChatId,300, isha)
    Redis:setex(SILV.."xoswin8"..currentPlayer..":"..ChatId,300,true)
    Redis:del(SILV.."xotern"..currentPlayer..":"..ChatId)
    Redis:setex(SILV.."xotern"..nextPlayer..":"..ChatId,300,true)
    Redis:incrby(SILV.."xonumt"..ChatId..(nextPlayer+currentPlayer), 1)        
    local currentPlayerInfo = bot.getUser(currentPlayer)
    local nextPlayerInfo = bot.getUser(nextPlayer)
    
    local currentPlayerName = currentPlayerInfo.first_name or "لا يوجد اسم"
    local nextPlayerName = nextPlayerInfo.first_name or "لا يوجد اسم"
    
    pleyerT = "- الان دور اللاعب : "..nextPlayerName.." "..Redis:get(SILV.."xopleyers"..nextPlayer..":"..ChatId).." "
    xogames(ChatId, currentPlayer, nextPlayer, Msg_id, nil, nil, nil, nil, nil, nil, nil, isha, nil, pleyerT)
  end
else
bot.answerCallbackQuery(data.id, "• عذراً انت لست مشترك بالعبه •", true)
end
end
if Text and Text:match('(%d+)/xo9//(%d+)') then
local UserId = {Text:match('(%d+)/xo9//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[2]) or tonumber(IdUser) == tonumber(UserId[1]) then
if Redis:get(SILV.."xotern"..UserId[1]..":"..ChatId) == "true" then
if tonumber(IdUser) == tonumber(UserId[2]) then
return bot.answerCallbackQuery(data.id, "• عذراً ليس دورك •", true)
end
elseif Redis:get(SILV.."xotern"..UserId[2]..":"..ChatId) == "true" then
if tonumber(IdUser) == tonumber(UserId[1]) then
return bot.answerCallbackQuery(data.id, "• عذراً ليس دورك •", true)
end
end 
if Redis:get(SILV.."xosgear9"..(UserId[1]+UserId[2])..":"..ChatId) then
return bot.answerCallbackQuery(data.id, "• عذراً هذا الزر مختار مسبقا •", true)
end
  local currentPlayer = nil
  local nextPlayer = nil
  
  if Redis:get(SILV.."xotern"..UserId[1]..":"..ChatId) == "true" then
    currentPlayer = UserId[1]
    nextPlayer = UserId[2]
  elseif Redis:get(SILV.."xotern"..UserId[2]..":"..ChatId) == "true" then
    currentPlayer = UserId[2]
    nextPlayer = UserId[1]
  end  
  if currentPlayer and nextPlayer then
    local isha = Redis:get(SILV.."xopleyers"..currentPlayer..":"..ChatId)
    Redis:setex(SILV.."xosgear9"..(nextPlayer+currentPlayer)..":"..ChatId,300, isha)    
    Redis:setex(SILV.."xoswin9"..currentPlayer..":"..ChatId,300,true)
    Redis:del(SILV.."xotern"..currentPlayer..":"..ChatId)
    Redis:setex(SILV.."xotern"..nextPlayer..":"..ChatId,300,true)
    Redis:incrby(SILV.."xonumt"..ChatId..(nextPlayer+currentPlayer), 1)        
    local currentPlayerInfo = bot.getUser(currentPlayer)
    local nextPlayerInfo = bot.getUser(nextPlayer)
    
    local currentPlayerName = currentPlayerInfo.first_name or "لا يوجد اسم"
    local nextPlayerName = nextPlayerInfo.first_name or "لا يوجد اسم"
    
    pleyerT = "- الان دور اللاعب : "..nextPlayerName.." "..Redis:get(SILV.."xopleyers"..nextPlayer..":"..ChatId).." "
    xogames(ChatId, currentPlayer, nextPlayer, Msg_id, nil, nil, nil, nil, nil, nil, nil, nil, isha, pleyerT)
  end
else
bot.answerCallbackQuery(data.id, "• عذراً انت لست مشترك بالعبه •", true)
end
end
----------------------------------------------------------------------------------------------
if Text and Text:match('(%d+)/tranen') then
local UserId = Text:match('(%d+)/tranen')
if tonumber(IdUser) == tonumber(UserId) then
Redis:setex(SILV..":translae:en"..UserId,500,true)
bot.editMessageText(ChatId,Msg_id,"⇜ ارسل النص اترجمة الي لغة العربية", 'md', false)
end
end
if Text and Text:match('(%d+)/tranartoen') then
local UserId = Text:match('(%d+)/tranartoen')
if tonumber(IdUser) == tonumber(UserId) then
Redis:setex(SILV..":translae:toen"..UserId,500,true)
bot.editMessageText(ChatId,Msg_id,"⇜ ارسل النص بي لغة العربية اترجمة الي إنجليزية", 'md', false)
end
end
if Text and Text:match('(%d+)/tranartoku') then
local UserId = Text:match('(%d+)/tranartoku')
if tonumber(IdUser) == tonumber(UserId) then
Redis:setex(SILV..":translae:toku"..UserId,500,true)
bot.editMessageText(ChatId,Msg_id,"⇜ ارسل النص بي لغة العربية اترجمة الي الكردية", 'md', false)
end
end
if Text and Text:match('(%d+)/tranartokor') then
local UserId = Text:match('(%d+)/tranartokor')
if tonumber(IdUser) == tonumber(UserId) then
Redis:setex(SILV..":translae:tokor"..UserId,500,true)
bot.editMessageText(ChatId,Msg_id,"⇜ ارسل النص بي لغة العربية اترجمة الي الكورية", 'md', false)
end
end
if Text and Text:match('(%d+)/tranartoen') then
local UserId = Text:match('(%d+)/tranartoen')
if tonumber(IdUser) == tonumber(UserId) then
Redis:setex(SILV..":translae:toya"..UserId,500,true)
bot.editMessageText(ChatId,Msg_id,"⇜ ارسل النص بي لغة العربية اترجمة الي لغة اليابانية", 'md', false)
end
end
if Text and Text:match('(%d+)/tranartotr') then
local UserId = Text:match('(%d+)/tranartotr')
if tonumber(IdUser) == tonumber(UserId) then
Redis:setex(SILV..":translae:totr"..UserId,500,true)
bot.editMessageText(ChatId,Msg_id,"⇜ ارسل النص بي لغة العربية اترجمة الي لغة التركية", 'md', false)
end
end
--------------------------------------------------------------------------------------------------------------العاب
if Text and Text:match('(%d+)/Wrong') then
local UserId = Text:match('(%d+)/Wrong')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'إعادة اللعبه', data = IdUser..'/mn'},},}}
local TextHelp = [[*•  للأسف خطأ يا صديقي حظ اوفر المره القادمه *]]
bot.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end end
if Text and Text:match('(%d+)/mn') then
local UserId = Text:match('(%d+)/mn')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'ابدء المستوي الاول من اللعبة', data = IdUser..'/R1'},},}}
local TextHelp = [[*• اللعبة 3 مستويات عبارة عن اسئلة عامة 
كل سؤال نقطه  *]]
bot.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end end
if Text and Text:match('(%d+)/R1') then
local UserId = Text:match('(%d+)/R1')
if tonumber(IdUser) == tonumber(UserId) then
Redis:incrby(SILV.."Mero:Num:Add:Games"..ChatId..IdUser, 1)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'الدولار', data = IdUser..'/Wrong'},},
{{text = 'الزلوتي', data = IdUser..'/R2'},},
{{text = 'اليورو', data = IdUser..'/Wrong'},},}}
local TextHelp = [[*• ما هي عملة دولة بولاندا ؟*]]
bot.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end end
if Text and Text:match('(%d+)/R2') then
local UserId = Text:match('(%d+)/R2')
if tonumber(IdUser) == tonumber(UserId) then
Redis:incrby(SILV.."Mero:Num:Add:Games"..ChatId..IdUser, 1)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'/R3'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة  *]]
bot.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end end
if Text and Text:match('(%d+)/R3') then
local UserId = Text:match('(%d+)/R3')
if tonumber(IdUser) == tonumber(UserId) then
Redis:incrby(SILV.."Mero:Num:Add:Games"..ChatId..IdUser, 1)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = '24 ساعه', data = IdUser..'/R4'},},
{{text = '23 ساعه', data = IdUser..'/Wrong'},},
{{text = '22 ساعه', data = IdUser..'/Wrong'},},}}
local TextHelp = [[*•  كم ساعة في اليوم ؟ *]]
bot.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end end
if Text and Text:match('(%d+)/R4') then
local UserId = Text:match('(%d+)/R4')
if tonumber(IdUser) == tonumber(UserId) then
Redis:incrby(SILV.."Mero:Num:Add:Games"..ChatId..IdUser, 1)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'/R5'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة  *]]
bot.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end end
if Text and Text:match('(%d+)/R5') then
local UserId = Text:match('(%d+)/R5')
if tonumber(IdUser) == tonumber(UserId) then
Redis:incrby(SILV.."Mero:Num:Add:Games"..ChatId..IdUser, 1)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'الخلية ', data = IdUser..'/R6'},},
{{text = 'الشجرة', data = IdUser..'/Wrong'},},
{{text = 'الكهف', data = IdUser..'/Wrong'},},}}
local TextHelp = [[*•  ما هو اسم المكان الذي يعيش فيه النحل ؟ *]]
bot.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end end
if Text and Text:match('(%d+)/R6') then
local UserId = Text:match('(%d+)/R6')
if tonumber(IdUser) == tonumber(UserId) then
Redis:incrby(SILV.."Mero:Num:Add:Games"..ChatId..IdUser, 1)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'/R7'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة  *]]
bot.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end end
if Text and Text:match('(%d+)/R7') then
local UserId = Text:match('(%d+)/R7')
if tonumber(IdUser) == tonumber(UserId) then
Redis:incrby(SILV.."Mero:Num:Add:Games"..ChatId..IdUser, 1)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'اطعمته', data = IdUser..'/Wrong'},},
{{text = 'استضفته', data = IdUser..'/Wrong'},},
{{text = 'اكرمته ', data = IdUser..'/R8'},},}}
local TextHelp = [[*•  اكمل المثل :- احذر من اللئيم اذا ...؟ *]]
bot.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end end
if Text and Text:match('(%d+)/R8') then
local UserId = Text:match('(%d+)/R8')
if tonumber(IdUser) == tonumber(UserId) then
Redis:incrby(SILV.."Mero:Num:Add:Games"..ChatId..IdUser, 1)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'/R9'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة  *]]
bot.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end end
if Text and Text:match('(%d+)/R9') then
local UserId = Text:match('(%d+)/R9')
if tonumber(IdUser) == tonumber(UserId) then
Redis:incrby(SILV.."Mero:Num:Add:Games"..ChatId..IdUser, 1)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'قبرص', data = IdUser..'/Wrong'},},
{{text = 'باريس', data = IdUser..'/Wrong'},},
{{text = 'لندن ', data = IdUser..'/RR10'},},}}
local TextHelp = [[*•  ما هي أكبر مدينة في قارة اوروبا ؟ *]]
bot.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end end
if Text and Text:match('(%d+)/RR10') then
local UserId = Text:match('(%d+)/RR10')
if tonumber(IdUser) == tonumber(UserId) then
Redis:incrby(SILV.."Mero:Num:Add:Games"..ChatId..IdUser, 1)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'/X11'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة  *]]
bot.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end end
if Text and Text:match('(%d+)/X11') then
local UserId = Text:match('(%d+)/X11')
if tonumber(IdUser) == tonumber(UserId) then
Redis:incrby(SILV.."Mero:Num:Add:Games"..ChatId..IdUser, 1)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'العربيه ', data = IdUser..'/X12'},},
{{text = 'الانجليزيه', data = IdUser..'/Wrong'},},
{{text = 'الفرنسيه', data = IdUser..'/Wrong'},},}}
local TextHelp = [[*•  ما هي اللغة التي تحتل المركز الخامس كأكثر اللغات المتحدث بها*]]
bot.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end end
if Text and Text:match('(%d+)/X12') then
local UserId = Text:match('(%d+)/X12')
if tonumber(IdUser) == tonumber(UserId) then
Redis:incrby(SILV.."Mero:Num:Add:Games"..ChatId..IdUser, 1)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'/X13'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة  *]]
bot.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end end
if Text and Text:match('(%d+)/X13') then
local UserId = Text:match('(%d+)/X13')
if tonumber(IdUser) == tonumber(UserId) then
Redis:incrby(SILV.."Mero:Num:Add:Games"..ChatId..IdUser, 1)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'مدريد', data = IdUser..'/Wrong'},},
{{text = 'اسطنبول ', data = IdUser..'/X14'},},
{{text = 'انقرا', data = IdUser..'/Wrong'},},}}
local TextHelp = [[*•  ما هو الاسم الحالي لمدينه القسطنطينيه ؟*]]
bot.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end end
if Text and Text:match('(%d+)/X14') then
local UserId = Text:match('(%d+)/X14')
if tonumber(IdUser) == tonumber(UserId) then
Redis:incrby(SILV.."Mero:Num:Add:Games"..ChatId..IdUser, 1)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'/X15'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة  *]]
bot.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end end
if Text and Text:match('(%d+)/X15') then
local UserId = Text:match('(%d+)/X15')
if tonumber(IdUser) == tonumber(UserId) then
Redis:incrby(SILV.."Mero:Num:Add:Games"..ChatId..IdUser, 1)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = '6 جيب', data = IdUser..'/Wrong'},},
{{text = '8 جيب', data = IdUser..'/Z16'},},
{{text = '4 جيب', data = IdUser..'/Wrong'},},}}
local TextHelp = [[*•  كم عدد الجيوب الانفية داخل جسم الانسان ؟*]]
bot.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end end
if Text and Text:match('(%d+)/Z16') then
local UserId = Text:match('(%d+)/Z16')
if tonumber(IdUser) == tonumber(UserId) then
Redis:incrby(SILV.."Mero:Num:Add:Games"..ChatId..IdUser, 1)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'/Z17'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة  *]]
bot.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end end
if Text and Text:match('(%d+)/Z17') then
local UserId = Text:match('(%d+)/Z17')
if tonumber(IdUser) == tonumber(UserId) then
Redis:incrby(SILV.."Mero:Num:Add:Games"..ChatId..IdUser, 1)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'فرنسا', data = IdUser..'/Wrong'},},
{{text = 'امريكا', data = IdUser..'/Wrong'},},
{{text = 'لندن ', data = IdUser..'/Z18'},},}}
local TextHelp = [[*•  في أي مدينه تقع ساعة بيج بين الشهيرة ؟*]]
bot.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end end
if Text and Text:match('(%d+)/Z18') then
local UserId = Text:match('(%d+)/Z18')
if tonumber(IdUser) == tonumber(UserId) then
Redis:incrby(SILV.."Mero:Num:Add:Games"..ChatId..IdUser, 1)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'/Z19'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة  *]]
bot.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end end
if Text and Text:match('(%d+)/Z19') then
local UserId = Text:match('(%d+)/Z19')
if tonumber(IdUser) == tonumber(UserId) then
Redis:incrby(SILV.."Mero:Num:Add:Games"..ChatId..IdUser, 1)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = '3 فصول', data = IdUser..'/Wrong'},},
{{text = '4 فصول', data = IdUser..'/Z20'},},
{{text = '5 فصول', data = IdUser..'/Wrong'},},}}
local TextHelp = [[*•  كم عدد فصول السنة ؟*]]
bot.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end end
if Text and Text:match('(%d+)/Z20') then
local UserId = Text:match('(%d+)/Z20')
if tonumber(IdUser) == tonumber(UserId) then
Redis:incrby(SILV.."Mero:Num:Add:Games"..ChatId..IdUser, 1)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'انتقل للمستوي الثاني ', data = IdUser..'/C21'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحه ونجحت في تخطي المستوي الاول يا بطل  *]]
bot.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end end
if Text and Text:match('(%d+)/C21') then
local UserId = Text:match('(%d+)/C21')
if tonumber(IdUser) == tonumber(UserId) then
Redis:incrby(SILV.."Mero:Num:Add:Games"..ChatId..IdUser, 1)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'الفحم', data = IdUser..'/Wrong'},},
{{text = 'المنجنيز', data = IdUser..'/Wrong'},},
{{text = 'البترول ', data = IdUser..'/C22'},},}}
local TextHelp = [[*•  إلي ماذا يشير مصطلح الذهب الاسود ؟*]]
bot.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end end
if Text and Text:match('(%d+)/C22') then
local UserId = Text:match('(%d+)/C22')
if tonumber(IdUser) == tonumber(UserId) then
Redis:incrby(SILV.."Mero:Num:Add:Games"..ChatId..IdUser, 1)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'/C23'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة  *]]
bot.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end end
if Text and Text:match('(%d+)/C23') then
local UserId = Text:match('(%d+)/C23')
if tonumber(IdUser) == tonumber(UserId) then
Redis:incrby(SILV.."Mero:Num:Add:Games"..ChatId..IdUser, 1)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'الصقر ', data = IdUser..'/Wrong'},},
{{text = 'الشعلة', data = IdUser..'/Wrong'},},
{{text = 'النسر ', data = IdUser..'/C24'},},}}
local TextHelp = [[*•  الولايات المتحدة الامريكية دولة مميزة وفريدة فما هو شعارها؟*]]
bot.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end end
if Text and Text:match('(%d+)/C24') then
local UserId = Text:match('(%d+)/C24')
if tonumber(IdUser) == tonumber(UserId) then
Redis:incrby(SILV.."Mero:Num:Add:Games"..ChatId..IdUser, 1)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'/C25'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة  *]]
bot.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end end
if Text and Text:match('(%d+)/C25') then
local UserId = Text:match('(%d+)/C25')
if tonumber(IdUser) == tonumber(UserId) then
Redis:incrby(SILV.."Mero:Num:Add:Games"..ChatId..IdUser, 1)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = '20 سن ', data = IdUser..'/Wrong'},},
{{text = '40 سن', data = IdUser..'/V26'},},
{{text = '60 سن', data = IdUser..'/Wrong'},},}}
local TextHelp = [[*•  كم عدد أسنان القط ؟*]]
bot.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end end
if Text and Text:match('(%d+)/V26') then
local UserId = Text:match('(%d+)/V26')
if tonumber(IdUser) == tonumber(UserId) then
Redis:incrby(SILV.."Mero:Num:Add:Games"..ChatId..IdUser, 1)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'/V27'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة  *]]
bot.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end end
if Text and Text:match('(%d+)/V27') then
local UserId = Text:match('(%d+)/V27')
if tonumber(IdUser) == tonumber(UserId) then
Redis:incrby(SILV.."Mero:Num:Add:Games"..ChatId..IdUser, 1)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = '3 قلوب ', data = IdUser..'/V28'},},
{{text = '4 قلوب  ', data = IdUser..'/Wrong'},},
{{text = '5 قلوب', data = IdUser..'/Wrong'},},}}
local TextHelp = [[*•  كم قلب للاخطبوط ؟*]]
bot.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end end
if Text and Text:match('(%d+)/V28') then
local UserId = Text:match('(%d+)/V28')
if tonumber(IdUser) == tonumber(UserId) then
Redis:incrby(SILV.."Mero:Num:Add:Games"..ChatId..IdUser, 1)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'/V29'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة  *]]
bot.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end end
if Text and Text:match('(%d+)/V29') then
local UserId = Text:match('(%d+)/V29')
if tonumber(IdUser) == tonumber(UserId) then
Redis:incrby(SILV.."Mero:Num:Add:Games"..ChatId..IdUser, 1)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'مصر ', data = IdUser..'/V30'},},
{{text = 'انجلترا ', data = IdUser..'/Wrong'},},
{{text = 'فرنسا', data = IdUser..'/Wrong'},},}}
local TextHelp = [[*•  أين أفتتح اول متحف في العالم؟*]]
bot.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end end
if Text and Text:match('(%d+)/V30') then
local UserId = Text:match('(%d+)/V30')
if tonumber(IdUser) == tonumber(UserId) then
Redis:incrby(SILV.."Mero:Num:Add:Games"..ChatId..IdUser, 1)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'/B31'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة  *]]
bot.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end end
if Text and Text:match('(%d+)/B31') then
local UserId = Text:match('(%d+)/B31')
if tonumber(IdUser) == tonumber(UserId) then
Redis:incrby(SILV.."Mero:Num:Add:Games"..ChatId..IdUser, 1)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'الفرنسية ', data = IdUser..'/Wrong'},},
{{text = 'الإسبانية ', data = IdUser..'/B32'},},
{{text = 'الانجليزية', data = IdUser..'/Wrong'},},}}
local TextHelp = [[*•  ماهي اللغة الرسمية للارجنتين؟*]]
bot.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end end
if Text and Text:match('(%d+)/B32') then
local UserId = Text:match('(%d+)/B32')
if tonumber(IdUser) == tonumber(UserId) then
Redis:incrby(SILV.."Mero:Num:Add:Games"..ChatId..IdUser, 1)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'/B33'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة  *]]
bot.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end end
if Text and Text:match('(%d+)/B33') then
local UserId = Text:match('(%d+)/B33')
if tonumber(IdUser) == tonumber(UserId) then
Redis:incrby(SILV.."Mero:Num:Add:Games"..ChatId..IdUser, 1)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'الهادي ', data = IdUser..'/B34'},},
{{text = 'الهندي ', data = IdUser..'/Wrong'},},
{{text = 'الاطلنطي', data = IdUser..'/Wrong'},},}}
local TextHelp = [[*•  ما هو أكبر محيط في العالم؟*]]
bot.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end end
if Text and Text:match('(%d+)/B34') then
local UserId = Text:match('(%d+)/B34')
if tonumber(IdUser) == tonumber(UserId) then
Redis:incrby(SILV.."Mero:Num:Add:Games"..ChatId..IdUser, 1)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'/B35'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة  *]]
bot.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end end
if Text and Text:match('(%d+)/B35') then
local UserId = Text:match('(%d+)/B35')
if tonumber(IdUser) == tonumber(UserId) then
Redis:incrby(SILV.."Mero:Num:Add:Games"..ChatId..IdUser, 1)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'القوة ', data = IdUser..'/N36'},},
{{text = 'الغرور ', data = IdUser..'/Wrong'},},
{{text = 'الكبرياء', data = IdUser..'/Wrong'},},}}
local TextHelp = [[*•  ماذا تعني كلمة جنكيزخان ؟*]]
bot.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end end
if Text and Text:match('(%d+)/N36') then
local UserId = Text:match('(%d+)/N36')
if tonumber(IdUser) == tonumber(UserId) then
Redis:incrby(SILV.."Mero:Num:Add:Games"..ChatId..IdUser, 1)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'/N37'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة  *]]
bot.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end end
if Text and Text:match('(%d+)/N37') then
local UserId = Text:match('(%d+)/N37')
if tonumber(IdUser) == tonumber(UserId) then
Redis:incrby(SILV.."Mero:Num:Add:Games"..ChatId..IdUser, 1)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = '4 لترات ', data = IdUser..'/Wrong'},},
{{text = '5 لترات', data = IdUser..'/Wrong'},},
{{text = '6 لترات ', data = IdUser..'/N38'},},}}
local TextHelp = [[*•  ما سعة جسم الانسان من الدم؟*]]
bot.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end end
if Text and Text:match('(%d+)/N38') then
local UserId = Text:match('(%d+)/N38')
if tonumber(IdUser) == tonumber(UserId) then
Redis:incrby(SILV.."Mero:Num:Add:Games"..ChatId..IdUser, 1)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'/N39'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة  *]]
bot.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end end
if Text and Text:match('(%d+)/N39') then
local UserId = Text:match('(%d+)/N39')
if tonumber(IdUser) == tonumber(UserId) then
Redis:incrby(SILV.."Mero:Num:Add:Games"..ChatId..IdUser, 1)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السعوديه ', data = IdUser..'/Wrong'},},
{{text = 'اليمن', data = IdUser..'/Wrong'},},
{{text = 'عمان ', data = IdUser..'/N40'},},}}
local TextHelp = [[*•  اين يوجد الجبل الاخضر؟*]]
bot.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end end
if Text and Text:match('(%d+)/N40') then
local UserId = Text:match('(%d+)/N40')
if tonumber(IdUser) == tonumber(UserId) then
Redis:incrby(SILV.."Mero:Num:Add:Games"..ChatId..IdUser, 1)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'انتقل إلي المستوي الأخير ', data = IdUser..'/M41'},},}}
local TextHelp = [[*•  احسنت يا بطل الأبطال لقد تخطيت المستوي الثاني وهو المتوسط انتقل لأخر المستويات الان   *]]
bot.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end end
if Text and Text:match('(%d+)/M41') then
local UserId = Text:match('(%d+)/M41')
if tonumber(IdUser) == tonumber(UserId) then
Redis:incrby(SILV.."Mero:Num:Add:Games"..ChatId..IdUser, 1)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'طه ', data = IdUser..'/M42'},},
{{text = 'المطففين ', data = IdUser..'/Wrong'},},
{{text = 'العمران', data = IdUser..'/Wrong'},},}}
local TextHelp = [[*•  ما هي السورة التي كانت سببا في إسلام عمر بن الخطاب رضي الله عنه ؟*]]
bot.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end end
if Text and Text:match('(%d+)/M42') then
local UserId = Text:match('(%d+)/M42')
if tonumber(IdUser) == tonumber(UserId) then
Redis:incrby(SILV.."Mero:Num:Add:Games"..ChatId..IdUser, 1)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'/M43'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة  *]]
bot.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end end
if Text and Text:match('(%d+)/M43') then
local UserId = Text:match('(%d+)/M43')
if tonumber(IdUser) == tonumber(UserId) then
Redis:incrby(SILV.."Mero:Num:Add:Games"..ChatId..IdUser, 1)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'الصومال ', data = IdUser..'/M44'},},
{{text = 'ماليزيا ', data = IdUser..'/Wrong'},},
{{text = 'السودان', data = IdUser..'/Wrong'},},}}
local TextHelp = [[*•  ما هي الدولة العربية التي يمر بها خط الاستواء ؟*]]
bot.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end end
if Text and Text:match('(%d+)/M44') then
local UserId = Text:match('(%d+)/M44')
if tonumber(IdUser) == tonumber(UserId) then
Redis:incrby(SILV.."Mero:Num:Add:Games"..ChatId..IdUser, 1)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'/M45'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة  *]]
bot.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end end
if Text and Text:match('(%d+)/M45') then
local UserId = Text:match('(%d+)/M45')
if tonumber(IdUser) == tonumber(UserId) then
Redis:incrby(SILV.."Mero:Num:Add:Games"..ChatId..IdUser, 1)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'الورق ', data = IdUser..'/Wrong'},},
{{text = 'الاموال', data = IdUser..'/Wrong'},},
{{text = 'الطوابع ', data = IdUser..'/A46'},},}}
local TextHelp = [[*•  انجلترا لا تضع إسمها على؟*]]
bot.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end end
if Text and Text:match('(%d+)/A46') then
local UserId = Text:match('(%d+)/A46')
if tonumber(IdUser) == tonumber(UserId) then
Redis:incrby(SILV.."Mero:Num:Add:Games"..ChatId..IdUser, 1)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'/A47'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة  *]]
bot.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end end
if Text and Text:match('(%d+)/A47') then
local UserId = Text:match('(%d+)/A47')
if tonumber(IdUser) == tonumber(UserId) then
Redis:incrby(SILV.."Mero:Num:Add:Games"..ChatId..IdUser, 1)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = '126 غرفة', data = IdUser..'/Wrong'},},
{{text = '110 غرفة', data = IdUser..'/Wrong'},},
{{text = '143 غرفة ', data = IdUser..'/A48'},},}}
local TextHelp = [[*•  عدد غرف البيت الأبيض؟*]]
bot.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end end
if Text and Text:match('(%d+)/A48') then
local UserId = Text:match('(%d+)/A48')
if tonumber(IdUser) == tonumber(UserId) then
Redis:incrby(SILV.."Mero:Num:Add:Games"..ChatId..IdUser, 1)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'/A49'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة  *]]
bot.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end end
if Text and Text:match('(%d+)/A49') then
local UserId = Text:match('(%d+)/A49')
if tonumber(IdUser) == tonumber(UserId) then
Redis:incrby(SILV.."Mero:Num:Add:Games"..ChatId..IdUser, 1)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'الدب', data = IdUser..'/Wrong'},},
{{text = 'حصان البحر ', data = IdUser..'/A50'},},
{{text = 'فرس النهر', data = IdUser..'/Wrong'},},}}
local TextHelp = [[*•  الحيوان الذي يقوم ذكرة بمهمة الحمل بدلاً من الأنثى هو ؟*]]
bot.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end end
if Text and Text:match('(%d+)/A50') then
local UserId = Text:match('(%d+)/A50')
if tonumber(IdUser) == tonumber(UserId) then
Redis:incrby(SILV.."Mero:Num:Add:Games"..ChatId..IdUser, 1)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'/S51'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة إجمد قربت تكسب   *]]
bot.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end end
if Text and Text:match('(%d+)/S51') then
local UserId = Text:match('(%d+)/S51')
if tonumber(IdUser) == tonumber(UserId) then
Redis:incrby(SILV.."Mero:Num:Add:Games"..ChatId..IdUser, 1)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = '11 عام', data = IdUser..'/Wrong'},},
{{text = '22 عام ', data = IdUser..'/S52'},},
{{text = '33 عام', data = IdUser..'/Wrong'},},}}
local TextHelp = [[*•  القرامطة سرقوا الحجر الأسود من مكة المكرمة وأعادوه بعد؟*]]
bot.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end end
if Text and Text:match('(%d+)/S52') then
local UserId = Text:match('(%d+)/S52')
if tonumber(IdUser) == tonumber(UserId) then
Redis:incrby(SILV.."Mero:Num:Add:Games"..ChatId..IdUser, 1)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'/S53'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة إجمد   *]]
bot.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end end
if Text and Text:match('(%d+)/S53') then
local UserId = Text:match('(%d+)/S53')
if tonumber(IdUser) == tonumber(UserId) then
Redis:incrby(SILV.."Mero:Num:Add:Games"..ChatId..IdUser, 1)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'الإغريق', data = IdUser..'/Wrong'},},
{{text = 'اليونانيين', data = IdUser..'/Wrong'},},
{{text = 'المصريين القدماء ', data = IdUser..'/S54'},},}}
local TextHelp = [[*من الشعب الذي ابتكر التقويم الشمسي؟ •*]]
bot.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end end
if Text and Text:match('(%d+)/S54') then
local UserId = Text:match('(%d+)/S54')
if tonumber(IdUser) == tonumber(UserId) then
Redis:incrby(SILV.."Mero:Num:Add:Games"..ChatId..IdUser, 1)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'/S55'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة إجمد   *]]
bot.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end end
if Text and Text:match('(%d+)/S55') then
local UserId = Text:match('(%d+)/S55')
if tonumber(IdUser) == tonumber(UserId) then
Redis:incrby(SILV.."Mero:Num:Add:Games"..ChatId..IdUser, 1)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'الثعبان', data = IdUser..'/D56'},},
{{text = 'التمساح', data = IdUser..'/Wrong'},},
{{text = 'السمك', data = IdUser..'/Wrong'},},}}
local TextHelp = [[*مما هو الحيوان الذي يتنفس بلسانه؟ •*]]
bot.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end end
if Text and Text:match('(%d+)/D56') then
local UserId = Text:match('(%d+)/D56')
if tonumber(IdUser) == tonumber(UserId) then
Redis:incrby(SILV.."Mero:Num:Add:Games"..ChatId..IdUser, 1)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'/D57'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة إجمد   *]]
bot.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end end
if Text and Text:match('(%d+)/D57') then
local UserId = Text:match('(%d+)/D57')
if tonumber(IdUser) == tonumber(UserId) then
Redis:incrby(SILV.."Mero:Num:Add:Games"..ChatId..IdUser, 1)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = '206', data = IdUser..'/Wrong'},},
{{text = '406', data = IdUser..'/Wrong'},},
{{text = '706', data = IdUser..'/D58'},},}}
local TextHelp = [[*كم عدد الناجين من سفينة التايتنك؟ •*]]
bot.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end end
if Text and Text:match('(%d+)/D58') then
local UserId = Text:match('(%d+)/D58')
if tonumber(IdUser) == tonumber(UserId) then
Redis:incrby(SILV.."Mero:Num:Add:Games"..ChatId..IdUser, 1)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'/D59'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة إجمد   *]]
bot.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end end
if Text and Text:match('(%d+)/D59') then
local UserId = Text:match('(%d+)/D59')
if tonumber(IdUser) == tonumber(UserId) then
Redis:incrby(SILV.."Mero:Num:Add:Games"..ChatId..IdUser, 1)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السلحفاه', data = IdUser..'/Wrong'},},
{{text = 'الضفدع', data = IdUser..'/D60'},},
{{text = 'السحليه', data = IdUser..'/Wrong'},},}}
local TextHelp = [[*من هو الحيوان الذي لا يعد من الزواحف من قائمة الحيوانات الآتية ؟ •*]]
bot.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end end
if Text and Text:match('(%d+)/D60') then
local UserId = Text:match('(%d+)/D60')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'إعادة اللعبة ', data = IdUser..'/mn'},},}}
local ballancee = Redis:get(SILV.."boob"..IdUser) or 0
local ratpep = ballancee + 100000
Redis:set(SILV.."boob"..IdUser , math.floor(ratpep))
local ballancee = Redis:get(SILV.."boob"..IdUser) or 0
local TextHelp = [[*•  تم الانتهاء من جميع الاسئله بنجاح عاش يا بطل 💕😂 \nلقد ربحت مليون دولار اريل `فلوسي` 🎉✨*]]
bot.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end end
if Text and Text:match('(%d+)/ahakaka') then
local UserId = Text:match('(%d+)/ahakaka')
if tonumber(IdUser) == tonumber(UserId) then
local Teext = [[
⍆ هل انت جهاز للعب ⍆
]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'حسنا', data = IdUser.."/guitar"},
},
}
}
bot.editMessageText(ChatId,Msg_id,Teext, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/guitar') then
local UserId = Text:match('(%d+)/guitar')
if tonumber(IdUser) == tonumber(UserId) then
local Teext =[[
شيء لا يمشي إلا بالضرب فمن يكون؟
]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'الحمار', data = IdUser.."/WTT"},{text = 'الكلب', data = IdUser.."/WTT"},
},
{
{text = 'المسمار', data = IdUser.."/Karen"},{text = 'انت', data = IdUser.."/WTT"},
},
}
}
bot.editMessageText(ChatId,Msg_id,Teext, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/Karen') then
local UserId = Text:match('(%d+)/Karen')
if tonumber(IdUser) == tonumber(UserId) then
local Teext =[[
لقد كسبت مبروك ✓
]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'سوال اخر', data = IdUser.."/whoa"},
},
}
}
bot.editMessageText(ChatId,Msg_id,Teext, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/whoa') then
local UserId = Text:match('(%d+)/whoa')
if tonumber(IdUser) == tonumber(UserId) then
local Teext =[[
شخص توجد قدماه في الأرض ورأسه عند النجوم فمن يكون؟
]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'الكوكب', data = IdUser.."/WTT"},{text = 'برج خليفا', data = IdUser.."/WTT"},
},
{
{text = 'القمر', data = IdUser.."/WTT"},{text = 'الضابط', data = IdUser.."/fighting"},
},
}
}
bot.editMessageText(ChatId,Msg_id,Teext, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/fighting') then
local UserId = Text:match('(%d+)/fighting')
if tonumber(IdUser) == tonumber(UserId) then
local Teext =[[
لقد كسبت مبروك ✓
]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'سوال اخر', data = IdUser.."/aliquots"},
},
}
}
bot.editMessageText(ChatId,Msg_id,Teext, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/aliquots') then
local UserId = Text:match('(%d+)/aliquots')
if tonumber(IdUser) == tonumber(UserId) then
local Teext =[[
شيء كلما ذبحته بكيت عليه فمن هو؟
]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'الخروف', data = IdUser.."/WTT"},{text = 'البصل', data = IdUser.."/trait"},
},
{
{text = 'ابي', data = IdUser.."/WTT"},{text = 'الثوم', data = IdUser.."/WTT"},
},
}
}
bot.editMessageText(ChatId,Msg_id,Teext, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/trait') then
local UserId = Text:match('(%d+)/trait')
if tonumber(IdUser) == tonumber(UserId) then
local Teext =[[
لقد كسبت مبروك ✓
]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'سوال اخر', data = IdUser.."/qqpi"},
},
}
}
bot.editMessageText(ChatId,Msg_id,Teext, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/qqpi') then
local UserId = Text:match('(%d+)/qqpi')
if tonumber(IdUser) == tonumber(UserId) then
local Teext =[[
شيء يتحرك أمامك ولكن لم تشاهده فمن هو؟
]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'الجن', data = IdUser.."/WTT"},{text = 'الفهد', data = IdUser.."/WTT"},
},
{
{text = 'الهواء', data = IdUser.."/duio"},{text = 'النمله', data = IdUser.."/WTT"},
},
}
}
bot.editMessageText(ChatId,Msg_id,Teext, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/duio') then
local UserId = Text:match('(%d+)/duio')
if tonumber(IdUser) == tonumber(UserId) then
local Teext =[[
لقد كسبت مبروك ✓
]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'سوال اخر', data = IdUser.."/yyuu"},
},
}
}
bot.editMessageText(ChatId,Msg_id,Teext, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/yyuu') then
local UserId = Text:match('(%d+)/yyuu')
if tonumber(IdUser) == tonumber(UserId) then
local Teext =[[
شيء يوجد في الليل ثلاث مرات وفي النهار مرة واحدة فمن هو؟
]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'النجوم', data = IdUser.."/WTT"},{text = 'القمر', data = IdUser.."/WTT"},
},
{
{text = 'حرف الالف', data = IdUser.."/WTT"},{text = 'حرف اللام', data = IdUser.."/your"},
},
}
}
bot.editMessageText(ChatId,Msg_id,Teext, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/your') then
local UserId = Text:match('(%d+)/your')
if tonumber(IdUser) == tonumber(UserId) then
local Teext =[[
لقد كسبت مبروك ✓
]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'سوال اخر', data = IdUser.."/oppp"},
},
}
}
bot.editMessageText(ChatId,Msg_id,Teext, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/oppp') then
local UserId = Text:match('(%d+)/oppp')
if tonumber(IdUser) == tonumber(UserId) then
local Teext =[[
يتحرك بلا أقدام ولا يدخل إلى بالأذنين فما هو؟
]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'منظف الاذنين', data = IdUser.."/WTT"},{text = 'الهواء', data = IdUser.."/WTT"},
},
{
{text = 'التراب', data = IdUser.."/WTT"},{text = 'الصوت', data = IdUser.."/plma"},
},
}
}
bot.editMessageText(ChatId,Msg_id,Teext, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/WTT') then
local UserId = Text:match('(%d+)/WTT')
if tonumber(IdUser) == tonumber(UserId) then
local Teext =[[
✖ لقد خصرت العاب من جديد ✖
]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'العاب مجدداً', data = IdUser.."/ahakaka"},
},
}
}
bot.editMessageText(ChatId,Msg_id,Teext, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/plma') then
local UserId = Text:match('(%d+)/plma')
if tonumber(IdUser) == tonumber(UserId) then
local Teext =[[
لقد كسبت مبروك ✓
]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'سوال اخر', data = IdUser.."/fusion"},
},
}
}
bot.editMessageText(ChatId,Msg_id,Teext, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/fusion') then
local UserId = Text:match('(%d+)/fusion')
if tonumber(IdUser) == tonumber(UserId) then
local Teext =[[
نشأ القانون الدولي....؟
]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'في الحرب العالمية', data = IdUser.."/WTT"},{text = 'قبل الحرب العالمية', data = IdUser.."/WTT"},
},
{
{text = 'بعد الحرب العالمية', data = IdUser.."/teggvffg"},{text = 'في حرب فيتنام', data = IdUser.."/WTT"},
},
}
}
bot.editMessageText(ChatId,Msg_id,Teext, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/teggvffg') then
local UserId = Text:match('(%d+)/teggvffg')
if tonumber(IdUser) == tonumber(UserId) then
local Teext =[[
لقد كسبت مبروك ✓
]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'سوال اخر', data = IdUser.."/selvfgh"},
},
}
}
bot.editMessageText(ChatId,Msg_id,Teext, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/selvfgh') then
local UserId = Text:match('(%d+)/selvfgh')
if tonumber(IdUser) == tonumber(UserId) then
local Teext =[[
طائر يتصف بالغرور ......
]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'الهدهد', data = IdUser.."/WTT"},{text = 'الطاوس', data = IdUser.."/selheh"},
},
{
{text = 'الاسد', data = IdUser.."/WTT"},
},
}
}
bot.editMessageText(ChatId,Msg_id,Teext, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/selheh') then
local UserId = Text:match('(%d+)/selheh')
if tonumber(IdUser) == tonumber(UserId) then
local Teext =[[
لقد كسبت مبروك ✓
]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'سوال اخر', data = IdUser.."/sepdhdhhd"},
},
}
}
bot.editMessageText(ChatId,Msg_id,Teext, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/sepdhdhhd') then
local UserId = Text:match('(%d+)/sepdhdhhd')
if tonumber(IdUser) == tonumber(UserId) then
local Teext =[[
تاجر من التجار إذا اقتلعنا عينه طار. فمن هو ....
]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'البقال', data = IdUser.."/WTT"},{text = 'العطار', data = IdUser.."/akkakak"},
},
{
{text = 'الجزار', data = IdUser.."/WTT"},
},
}
}
bot.editMessageText(ChatId,Msg_id,Teext, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/akkakak') then
local UserId = Text:match('(%d+)/akkakak')
if tonumber(IdUser) == tonumber(UserId) then
local Teext =[[
لقد كسبت مبروك ✓
]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'لبدا العبه من جديد', data = IdUser.."/ahakaka"},
},
}
}
bot.editMessageText(ChatId,Msg_id,Teext, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/may') then
local Teext =[[
• يلا بنا نبحث عن المنزل •
]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'هيا بنا', data = IdUser.."/afkl"},
},
}
}
bot.editMessageText(ChatId,Msg_id,Teext, 'md', true, false, reply_markup)end
if Text and Text:match('(%d+)/afkl') then
local Teext =[[
• في صوت هل صدر من الامام ام الخلف •
]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'الامام', data = IdUser.."/amen"},{text = 'الخلف', data = IdUser.."/should"},
}
},
}
bot.editMessageText(ChatId,Msg_id,Teext, 'md', true, false, reply_markup)end
if Text and Text:match('(%d+)/amen') then
local Teext =[[
• هيا بنا نذهب الي الامام لنرا المنزل •
]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'هيا', data = IdUser.."/have"},
}
},
}
bot.editMessageText(ChatId,Msg_id,Teext, 'md', true, false, reply_markup)end
if Text and Text:match('(%d+)/should') then
local Teext =[[
• هيا بنا نذهب الي الخلف لنرا المنزل •
]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'هيا', data = IdUser.."/have"},
}
},
}
bot.editMessageText(ChatId,Msg_id,Teext, 'md', true, false, reply_markup)end
if Text and Text:match('(%d+)/have') then
local Teext =[[
• لقد وصلنا الى المنزل شكراَ جزيلَ انتطرني ثواني وسوف اعود •
]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'منتظر', data = IdUser.."/VBV"},
}
},
}
bot.editMessageText(ChatId,Msg_id,Teext, 'md', true, false, reply_markup)end

if Text and Text:match('(%d+)/VBV') then
local Teext =[[
• لقد عودت إليك ظهر شيئ •
]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'احد ما خرج من المنزل', data = IdUser.."/ALLL"},
}
},
}
bot.editMessageText(ChatId,Msg_id,Teext, 'md', true, false, reply_markup)end
if Text and Text:match('(%d+)/ALLL') then
local Teext =[[
• هيا نذهب داخل المنزل •
]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'هيا', data = IdUser.."/Jake"},
}
},
}
bot.editMessageText(ChatId,Msg_id,Teext, 'md', true, false, reply_markup)end
if Text and Text:match('(%d+)/Jake') then
local Teext =[[
•  نحنو نتوه في هذه المكان •
]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'تعالي نذهب الي الضوء', data = IdUser.."/GGGG"},
}
},
}
bot.editMessageText(ChatId,Msg_id,Teext, 'md', true, false, reply_markup)end
if Text and Text:match('(%d+)/GGGG') then
local Teext =[[
• لا يوجد ضواء في هذا المكان •
]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'ياالهي كان هناك', data = IdUser.."/can"},
}
},
}
bot.editMessageText(ChatId,Msg_id,Teext, 'md', true, false, reply_markup)end
if Text and Text:match('(%d+)/can') then
local Teext =[[
• تعالى نذهب الي الباب الرئيسي •
]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'انهو مغلق', data = IdUser.."/zxz"},
}
},
}
bot.editMessageText(ChatId,Msg_id,Teext, 'md', true, false, reply_markup)end
if Text and Text:match('(%d+)/zxz') then
local Teext =[[
• انها النهاية هتكمل ولا لا •
]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'هكمل', data = IdUser.."/optionis"},{text = 'انسحب', data = IdUser.."/looks"},
}
},
}
bot.editMessageText(ChatId,Msg_id,Teext, 'md', true, false, reply_markup)end
if Text and Text:match('(%d+)/optionis') then
local Teext =[[
• سارسل اليك  سوال مع اختيارت لو حليت صح ستنجو من العقاب لو خطأ سيقوم عليك العقاب •
السوال هوا - شيء لا يتأثر بالماء حتى عندما يمر من خلالها فمن يكون؟
]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'السمك', data = IdUser.."/Kelly"},{text = 'المركب', data = IdUser.."/kalalal"},
},
{
{text = 'الضوء', data = IdUser.."/klllag"},{text = 'الحوت', data = IdUser.."/akakakk"},
},
{
{text = 'الخضار', data = IdUser.."/allowj"},{text = 'الموت', data = IdUser.."/allaly"},
},
}
}
bot.editMessageText(ChatId,Msg_id,Teext, 'md', true, false, reply_markup)end
if Text and Text:match('(%d+)/klllag') then
local Teext =[[
•مبروك لقد فوزت ونجيت من العقاب•
]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '✅✅✅✅✅', data = IdUser.."/01ahakaka"},
}
},
}
bot.editMessageText(ChatId,Msg_id,Teext, 'md', true, false, reply_markup)end
if Text and Text:match('(%d+)/allowj') then
local Teext =[[
• غلط القاب هوا-   خلاص سامحتك •
]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '❌❌❌❌❌', data = IdUser.."/01ahakaka"},
}
},
}
bot.editMessageText(ChatId,Msg_id,Teext, 'md', true, false, reply_markup)end

if Text and Text:match('(%d+)/allaly') then
local Teext =[[
• غلط القاب هوا-    سكر خشمك و قول كلمة من اختيار الاعبين الي معك•
]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '❌❌❌❌❌', data = IdUser.."/01ahakaka"},
}
},
}
bot.editMessageText(ChatId,Msg_id,Teext, 'md', true, false, reply_markup)end
if Text and Text:match('(%d+)/akakakk') then
local Teext =[[
• غلط القاب هوا-    اذهب الى واحد ماتعرفه وقل له انا كيوت وابي بوسه •
]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '❌❌❌❌❌', data = IdUser.."/01ahakaka"},
}
},
}
bot.editMessageText(ChatId,Msg_id,Teext, 'md', true, false, reply_markup)end
if Text and Text:match('(%d+)/kalalal') then
local Teext =[[
• غلط القاب هوا-    روح المطبخ و اكسر صحن او كوب•
]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '❌❌❌❌❌', data = IdUser.."/01ahakaka"},
}
},
}
bot.editMessageText(ChatId,Msg_id,Teext, 'md', true, false, reply_markup)end
if Text and Text:match('(%d+)/Kelly') then
local Teext =[[
• غلط القاب هوا-    تتصل على الوالده  و تقول لها تزوجت با سر•
]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '❌❌❌❌❌', data = IdUser.."/01ahakaka"},
}
},
}
bot.editMessageText(ChatId,Msg_id,Teext, 'md', true, false, reply_markup)end



if Text and Text:match('(%d+)/looks') then
local Teext =[[
• انت ستندم سأقتلك •
]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '❌❌❌❌❌', data = IdUser.."/01ahakaka"},
}
},
}
bot.editMessageText(ChatId,Msg_id,Teext, 'md', true, false, reply_markup)end



if Text and Text:match('^(%d+)/back_lists$') then
local UserId = Text:match('^(%d+)/back_lists$')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = "inline",
data = {
{
{text="قائمه Dev",data=UserId..'/Redis:Devall'},
},
{
{text="المكتومين عام",data=UserId..'/KtmAll'},{text="المحظورين عام",data=UserId..'/BanAll'},
},
{
{text="قائمه MY",data=UserId..'/DevelopersQ'},{text="قائمه M",data=UserId..'/Developers'},
},
{
{text="المالكين",data=UserId..'/TheBasicsQ'},{text="المنشئين الاساسيين",data=UserId..'/TheBasics'},
},
{
{text="المنشئين",data=UserId..'/Originators'},{text="المدراء",data=UserId..'/Managers'},
},
{
{text="الادمنيه",data=UserId..'/Addictive'},{text="المميزين",data=UserId..'/DelDistinguished'},
},
{
{text="المكتومين",data=UserId..'/SilentGroupGroup'},{text="المحظورين",data=UserId..'/BanGroup'},
},
{
{text = "- اخفاء الامر ", data =UserId.."/delAmr"}
},
}
}
return edit(ChatId,Msg_id,"⇜ اختر احدى القوائم لمسحها", "md",true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/deaallvankm') and data.ControllerBot then
local UserId = Text:match('(%d+)/deaallvankm')
if tonumber(IdUser) == tonumber(UserId) then
local zwag_users = Redis:smembers(SILV.."roogg1")
for k,v in pairs(zwag_users) do
Redis:del(SILV.."roog1"..v)
Redis:del(SILV.."rooga1"..v)
Redis:del(SILV.."rahr1"..v)
Redis:del(SILV.."rahrr1"..v)
Redis:del(SILV.."roogte1"..v)
end
local zwaga_users = Redis:smembers(SILV.."roogga1")
for k,v in pairs(zwaga_users) do
Redis:del(SILV.."roog1"..v)
Redis:del(SILV.."rooga1"..v)
Redis:del(SILV.."rahr1"..v)
Redis:del(SILV.."rahrr1"..v)
Redis:del(SILV.."roogte1"..v)
end
Redis:del(SILV.."roogga1")
Redis:del(SILV.."roogg1")
edit(ChatId,Msg_id, "⇜ مسحت لعبه الزواج","md",true)
end
end
if Text and Text:match('(%d+)/delemazras') and data.ControllerBot then
local UserId = Text:match('(%d+)/delemazras')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(SILV.."rrfffid")
Redis:del(SILV.."booob")
Redis:del(SILV.."taza")
Redis:del(SILV.."ownerfram")
Redis:del(SILV.."farmarname")
Redis:setex(SILV.."deletbank" .. 111,1123200, true)
edit(ChatId,Msg_id, "⇜ تم تصفير لعبه البنك 🏦","md",true)
end
end
if Text and Text:match('(%d+)/delzawagm') and data.ControllerBot then
local UserId = Text:match('(%d+)/delzawagm')
if tonumber(IdUser) == tonumber(UserId) then
local bank_users = Redis:smembers(SILV.."booob")
for k,v in pairs(bank_users) do
Redis:del(SILV.."boob"..v)
Redis:del(SILV.."rrfffid")
Redis:del(SILV.."booob")
Redis:del(SILV.."taza")
Redis:del(SILV.."ownerfram")
Redis:del(SILV.."farmarname")
Redis:del(SILV.."kreednum"..v)
Redis:del(SILV.."kreed"..v)
Redis:del(SILV.."rrfff"..v)
Redis:del(SILV.."numattack"..v)
Redis:del(SILV.."tabbroat"..v)
Redis:del(SILV.."shkse"..v)
Redis:del(SILV.."doltebank"..v)
Redis:del(SILV.."ratbinc"..v)
Redis:del(SILV.."ratbtrans"..v)
Redis:del(SILV.."mgrmasname"..v)
Redis:del(SILV.."mgrmasnum"..v)
Redis:del(SILV.."mgrkldname"..v)
Redis:del(SILV.."mgrkldnum"..v)
Redis:del(SILV.."mgrswrname"..v)
Redis:del(SILV.."mgrswrnum"..v)
Redis:del(SILV.."mgrktmname"..v)
Redis:del(SILV.."mgrktmnum"..v)
Redis:del(SILV.."akrksrname"..v)
Redis:del(SILV.."akrksrnum"..v)
Redis:del(SILV.."akrfelname"..v)
Redis:del(SILV.."akrfelnum"..v)
Redis:del(SILV.."akrmnzname"..v)
Redis:del(SILV.."akrmnznum"..v)
Redis:del(SILV.."airshbhname"..v)
Redis:del(SILV.."airshbhnum"..v)
Redis:del(SILV.."airsfarname"..v)
Redis:del(SILV.."airsfarnum"..v)
Redis:del(SILV.."airkhasname"..v)
Redis:del(SILV.."airkhasnum"..v)
Redis:del(SILV.."carrangname"..v)
Redis:del(SILV.."carrangnum"..v)
Redis:del(SILV.."caraccename"..v)
Redis:del(SILV.."caraccenum"..v)
Redis:del(SILV.."carcamrname"..v)
Redis:del(SILV.."carcamrnum"..v)
Redis:del(SILV.."caralntrname"..v)
Redis:del(SILV.."caralntrnum"..v)
Redis:del(SILV.."carhilxname"..v)
Redis:del(SILV.."carhilxnum"..v)
Redis:del(SILV.."carsonaname"..v)
Redis:del(SILV.."carsonanum"..v)
Redis:del(SILV.."carcoroname"..v)
Redis:del(SILV.."carcoronum"..v)
Redis:del(SILV.."rotpa"..v)
Redis:del(SILV.."rddd"..v)
Redis:del(SILV.."rotpagrid"..v)
Redis:del(SILV.."rotpaid"..v)
Redis:del(SILV.."rdddgr"..v)
Redis:del(SILV.."rdddid"..v)
Redis:del(SILV.."rdddtex"..v)
end
for k,v in pairs(Redis:smembers(SILV.."company_owners:")) do 
local Cname = Redis:get(SILV.."companys_name:"..v)
Redis:del(SILV.."companys_owner:"..Cname)
Redis:del(SILV.."companys_id:"..Cname)
Redis:del(SILV.."company:mem:"..Cname)
Redis:del(SILV.."companys_name:"..v)
end
Redis:del(SILV.."company_owners:")
Redis:del(SILV.."companys:")
Redis:del(SILV.."in_company:")
local bank_usersr = Redis:smembers(SILV.."rrfffid")
for k,v in pairs(bank_usersr) do
Redis:del(SILV.."boob"..v)
Redis:del(SILV.."rrfff"..v)
end
for k,v in pairs(Redis:smembers(SILV.."ownerfram")) do 
Redis:del(SILV.."toplvfarm"..v)
Redis:del(SILV.."btatatime"..v)
Redis:del(SILV.."btatanum"..v)
Redis:del(SILV.."btataname"..v)
Redis:del(SILV.."lemontime"..v)
Redis:del(SILV.."lemonnum"..v)
Redis:del(SILV.."lemonname"..v)
Redis:del(SILV.."khesstime"..v)
Redis:del(SILV.."khessnum"..v)
Redis:del(SILV.."khessname"..v)
Redis:del(SILV.."kheartime"..v)
Redis:del(SILV.."khearnum"..v)
Redis:del(SILV.."khearname"..v)
Redis:del(SILV.."jzartime"..v)
Redis:del(SILV.."jzarnum"..v)
Redis:del(SILV.."jzarname"..v)
Redis:del(SILV.."fleflatime"..v)
Redis:del(SILV.."fleflanum"..v)
Redis:del(SILV.."fleflaname"..v)
Redis:del(SILV.."freaztime"..v)
Redis:del(SILV.."freaznum"..v)
Redis:del(SILV.."freazname"..v)
Redis:del(SILV.."doratime"..v)
Redis:del(SILV.."doranum"..v)
Redis:del(SILV.."doraname"..v)
Redis:del(SILV.."tomtime"..v)
Redis:del(SILV.."tomnum"..v)
Redis:del(SILV.."tomname"..v)
Redis:del(SILV.."ftrtime"..v)
Redis:del(SILV.."ftrnum"..v)
Redis:del(SILV.."ftrname"..v)
Redis:del(SILV.."tfahtime"..v)
Redis:del(SILV.."tfahnum"..v)
Redis:del(SILV.."tfahname"..v)
Redis:del(SILV.."enabtime"..v)
Redis:del(SILV.."enabnum"..v)
Redis:del(SILV.."enabname"..v)
Redis:del(SILV.."zetontime"..v)
Redis:del(SILV.."zetonnum"..v)
Redis:del(SILV.."zetonname"..v)
Redis:del(SILV.."mozztime"..v)
Redis:del(SILV.."mozznum"..v)
Redis:del(SILV.."mozzname"..v)
Redis:del(SILV.."mangatime"..v)
Redis:del(SILV.."manganum"..v)
Redis:del(SILV.."manganame"..v)
Redis:del(SILV.."sizefram"..v)
Redis:del(SILV.."namefram"..v)
Redis:del(SILV.."mzroatsize"..v)
Redis:setex(SILV.."deletbank" .. 111,1123200, true)
end
edit(ChatId,Msg_id, "⇜ مسحت لعبه البنك 🏦","md",true)
end
end
if Text and Text:match('(%d+)/tobasma') and data.ControllerBot then
local UserId = Text:match('(%d+)/tobasma')
if tonumber(IdUser) == tonumber(UserId) then
for k,v in pairs(Redis:smembers(SILV.."booob")) do 
Redis:del(SILV.."namenade"..v)
Redis:del(SILV.."nokatnade"..v)
Redis:del(SILV.."energynade"..v)
Redis:del(SILV.."traningnade"..v)
Redis:del(SILV.."lkbnade"..v)
Redis:del(SILV.."nameplayer".."1"..v)
Redis:del(SILV.."nameplayer".."2"..v)
Redis:del(SILV.."nameplayer".."3"..v)
Redis:del(SILV.."nameplayer".."4"..v)
Redis:del(SILV.."nameplayer".."5"..v)
Redis:del(SILV.."energyplayer".."1"..v)
Redis:del(SILV.."energyplayer".."2"..v)
Redis:del(SILV.."energyplayer".."3"..v)
Redis:del(SILV.."energyplayer".."4"..v)
Redis:del(SILV.."energyplayer".."5"..v)
Redis:del(SILV.."mrkzplayer".."1"..v)
Redis:del(SILV.."mrkzplayer".."2"..v)
Redis:del(SILV.."mrkzplayer".."3"..v)
Redis:del(SILV.."mrkzplayer".."4"..v)
Redis:del(SILV.."mrkzplayer".."5"..v)
Redis:del(SILV.."cityplayer".."1"..v)
Redis:del(SILV.."cityplayer".."2"..v)
Redis:del(SILV.."cityplayer".."3"..v)
Redis:del(SILV.."cityplayer".."4"..v)
Redis:del(SILV.."cityplayer".."5"..v)
Redis:del(SILV.."priceplayer".."1"..v)
Redis:del(SILV.."priceplayer".."2"..v)
Redis:del(SILV.."priceplayer".."3"..v)
Redis:del(SILV.."priceplayer".."4"..v)
Redis:del(SILV.."priceplayer".."5"..v)
end
Redis:del(SILV.."lkbnadesadd")
Redis:del(SILV.."ownernade")
edit(ChatId,Msg_id, "⇜ مسحت لعبه النوادي ⚽️","md",true)
end
end
if Text and Text:match('(%d+)/banktzfug') and data.ControllerBot then
local UserId = Text:match('(%d+)/banktzfug')
if tonumber(IdUser) == tonumber(UserId) then
for k,v in pairs(Redis:smembers(SILV.."booob")) do 
Redis:del(SILV.."toplvfarm"..v)
Redis:del(SILV.."btatatime"..v)
Redis:del(SILV.."btatanum"..v)
Redis:del(SILV.."btataname"..v)
Redis:del(SILV.."lemontime"..v)
Redis:del(SILV.."lemonnum"..v)
Redis:del(SILV.."lemonname"..v)
Redis:del(SILV.."khesstime"..v)
Redis:del(SILV.."khessnum"..v)
Redis:del(SILV.."khessname"..v)
Redis:del(SILV.."kheartime"..v)
Redis:del(SILV.."khearnum"..v)
Redis:del(SILV.."khearname"..v)
Redis:del(SILV.."jzartime"..v)
Redis:del(SILV.."jzarnum"..v)
Redis:del(SILV.."jzarname"..v)
Redis:del(SILV.."fleflatime"..v)
Redis:del(SILV.."fleflanum"..v)
Redis:del(SILV.."fleflaname"..v)
Redis:del(SILV.."freaztime"..v)
Redis:del(SILV.."freaznum"..v)
Redis:del(SILV.."freazname"..v)
Redis:del(SILV.."doratime"..v)
Redis:del(SILV.."doranum"..v)
Redis:del(SILV.."doraname"..v)
Redis:del(SILV.."tomtime"..v)
Redis:del(SILV.."tomnum"..v)
Redis:del(SILV.."tomname"..v)
Redis:del(SILV.."ftrtime"..v)
Redis:del(SILV.."ftrnum"..v)
Redis:del(SILV.."ftrname"..v)
Redis:del(SILV.."tfahtime"..v)
Redis:del(SILV.."tfahnum"..v)
Redis:del(SILV.."tfahname"..v)
Redis:del(SILV.."enabtime"..v)
Redis:del(SILV.."enabnum"..v)
Redis:del(SILV.."enabname"..v)
Redis:del(SILV.."zetontime"..v)
Redis:del(SILV.."zetonnum"..v)
Redis:del(SILV.."zetonname"..v)
Redis:del(SILV.."mozztime"..v)
Redis:del(SILV.."mozznum"..v)
Redis:del(SILV.."mozzname"..v)
Redis:del(SILV.."mangatime"..v)
Redis:del(SILV.."manganum"..v)
Redis:del(SILV.."manganame"..v)
Redis:del(SILV.."sizefram"..v)
Redis:del(SILV.."namefram"..v)
Redis:del(SILV.."mzroatsize"..v)
end
Redis:del(SILV.."ownerfram")
Redis:del(SILV.."farmarname")
edit(ChatId,Msg_id, "⇜ مسحت لعبه المزرعه 🏦","md",true)
end
end
if Text and Text:match('(%d+)/DevelopersQ') and data.ControllerBot then
local UserId = Text:match('(%d+)/DevelopersQ')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(SILV.."Mero:DevelopersQ:Groups") 
local reply_markup = bot.replyMarkup{
type = "inline",
data = {
{
{text="رجوع",data=UserId..'/back_lists'},
},
}
}
edit(ChatId,Msg_id,"⇜ تم مسح قائمه MYtm🎖️", "md",true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Developers') and data.DevelopersQ then
local UserId = Text:match('(%d+)/Developers')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(SILV.."Mero:Developers:Groups") 
local reply_markup = bot.replyMarkup{
type = "inline",
data = {
{
{text="رجوع",data=UserId..'/back_lists'},
},
}
}
edit(ChatId,Msg_id,"⇜ تم مسح MYtm", "md",true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Redis:Devall') and data.ControllerBot then
local UserId = Text:match('(%d+)/Redis:Devall')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(SILV.."Mero:ControlAll:Groups") 
local reply_markup = bot.replyMarkup{
type = "inline",
data = {
{
{text="رجوع",data=UserId..'/back_lists'},
},
}
}
edit(ChatId,Msg_id,"⇜ تم مسح قائمه Dev²🎖", "md",true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/TheBasicsQ') and data.Developers then
local UserId = Text:match('(%d+)/TheBasicsQ')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(SILV.."Mero:TheBasicsQ:Group"..ChatId) 
local reply_markup = bot.replyMarkup{
type = "inline",
data = {
{
{text="رجوع",data=UserId..'/back_lists'},
},
}
}
edit(ChatId,Msg_id,"⇜ تم مسح المالكين", "md",true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/MalekAsase') and data.Developers then
local UserId = Text:match('(%d+)/MalekAsase')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(SILV.."Mero:MalekAsase:Group"..ChatId) 
local reply_markup = bot.replyMarkup{
type = "inline",
data = {
{
{text="رجوع",data=UserId..'/back_lists'},
},
}
}
edit(ChatId,Msg_id,"⇜ تم مسح المالكين", "md",true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/TheBasics') and data.TheBasicsQ then
local UserId = Text:match('(%d+)/TheBasics')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(SILV.."Mero:TheBasics:Group"..ChatId) 
local reply_markup = bot.replyMarkup{
type = "inline",
data = {
{
{text="رجوع",data=UserId..'/back_lists'},
},
}
}
edit(ChatId,Msg_id,"⇜ تم مسح المنشئين الاساسيين", "md",true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Originators') and data.TheBasics then
local UserId = Text:match('(%d+)/Originators')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(SILV.."Mero:Originators:Group"..ChatId) 
local reply_markup = bot.replyMarkup{
type = "inline",
data = {
{
{text="رجوع",data=UserId..'/back_lists'},
},
}
}
edit(ChatId,Msg_id,"⇜ تم مسح المنشئين", "md",true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Managers') and data.Originators then
local UserId = Text:match('(%d+)/Managers')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(SILV.."Mero:Managers:Group"..ChatId) 
local reply_markup = bot.replyMarkup{
type = "inline",
data = {
{
{text="رجوع",data=UserId..'/back_lists'},
},
}
}
edit(ChatId,Msg_id,"⇜ تم مسح المدراء", "md",true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Addictive') and data.Managers then
local UserId = Text:match('(%d+)/Addictive')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(SILV.."Mero:Addictive:Group"..ChatId) 
local reply_markup = bot.replyMarkup{
type = "inline",
data = {
{
{text="رجوع",data=UserId..'/back_lists'},
},
}
}
edit(ChatId,Msg_id,"⇜ تم مسح الادمنيه", "md",true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/DelDistinguished') then
local UserId = Text:match('(%d+)/DelDistinguished')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(SILV.."Mero:Distinguished:Group"..ChatId) 
local reply_markup = bot.replyMarkup{
type = "inline",
data = {
{
{text="رجوع",data=UserId..'/back_lists'},
},
}
}
edit(ChatId,Msg_id,"⇜ تم مسح المميزين", "md",true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/KtmAll') and data.ControllerBot then
local UserId = Text:match('(%d+)/KtmAll')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(SILV.."Mero:KtmAll:Groups") 
local reply_markup = bot.replyMarkup{
type = "inline",
data = {
{
{text="رجوع",data=UserId..'/back_lists'},
},
}
}
edit(ChatId,Msg_id,"⇜ تم مسح المكتومين عام", "md",true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/BanAll') and data.ControllerBot then
local UserId = Text:match('(%d+)/BanAll')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(SILV.."Mero:BanAll:Groups") 
local reply_markup = bot.replyMarkup{
type = "inline",
data = {
{
{text="رجوع",data=UserId..'/back_lists'},
},
}
}
edit(ChatId,Msg_id,"⇜ تم مسح المحظورين عام", "md",true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/BanGroup') and data.Addictive then
local UserId = Text:match('(%d+)/BanGroup')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(SILV.."Mero:BanGroup:Group"..ChatId) 
local reply_markup = bot.replyMarkup{
type = "inline",
data = {
{
{text="رجوع",data=UserId..'/back_lists'},
},
}
}
edit(ChatId,Msg_id,"⇜ تم مسح المحظورين", "md",true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/SilentGroupGroup') and data.Addictive then
local UserId = Text:match('(%d+)/SilentGroupGroup')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(SILV.."Mero:SilentGroup:Group"..ChatId) 
local reply_markup = bot.replyMarkup{
type = "inline",
data = {
{
{text="رجوع",data=UserId..'/back_lists'},
},
}
}
edit(ChatId,Msg_id,"⇜ تم مسح المكتومين", "md",true, false, reply_markup)
end
end
end
end