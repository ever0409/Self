do
local function run(msg, matches, callback, extra)
local hash = 'group:'..msg.to.id
local group_lang = redis:hget(hash,'lang')
if matches[1] == 'تنظیم زبان' and  matches[2] == 'انگلیسی' and is_sudo(msg) then 
   redis:hdel(hash,'lang')
        return 'زبان من از الان اینگلیش شد'
end



if matches[1] == 'تنظیم زبان' and matches[2] == 'فارسی' and is_sudo(msg) then
redis:hset(hash,'lang',matches[2])
        return 'زبان من از الان فارسی شد'
end
if matches[1] == 'زبان' then
if group_lang then 
return "در حال حاظر فارسی است"
else
return "اینگلیسی است :|"
end
end
end
return {
  patterns = {
    "^(تنظیم زبان) (فارسی)$",
  "^(تنظیم زبان) (انگلیسی)$",
  "^(زبان)$"
  },
  run = run
}
end
-- Edit By Mr.Nitro :-D
