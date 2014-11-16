Paperclip.interpolates :system_id do |attachment, style|
  attachment.instance.system_id # or whatever you've named your User's login/username/etc. attribute
end

Paperclip.interpolates :sucursal  do |attachment, style|
  attachment.instance.dir_sucursal
end