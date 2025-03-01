local math = ((function() local x, y = pcall(require, 'math'); return x and y end)()) or _G.math
local src_version_1d59c8 = nil
local src_lib_util_decorator_192138 = nil
local src_lib_common_module_1987a0 = nil
local src_lib_engine_api_encoder_1d2908 = nil
local src_lib_engine_api_app_198778 = nil
local src_lib_engine_api_hash_1a7b00 = nil
local src_lib_engine_api_http_1a7c38 = nil
local src_lib_engine_api_i18n_19f898 = nil
local src_lib_engine_api_media_19c440 = nil
local src_lib_engine_api_key_19ed18 = nil
local src_lib_engine_api_math_1a7de0 = nil
local src_lib_engine_api_array_19d778 = nil
local src_lib_engine_draw_ui_1a23b8 = nil
local src_lib_engine_draw_fps_19d3d8 = nil
local src_lib_engine_draw_text_1a01c0 = nil
local src_lib_engine_draw_poly_1a1cc8 = nil
local src_lib_engine_raw_bus_10e5b0 = nil
local src_lib_engine_raw_node_1c0de8 = nil
local src_lib_engine_raw_memory_20fb00 = nil
local src_lib_object_root_19ce10 = nil
local src_lib_object_color_1983b8 = nil
local src_lib_object_std_1a25a8 = nil
local src_lib_util_pipeline_1c5468 = nil
local src_lib_engine_draw_ui_grid_199d00 = nil
local src_lib_engine_draw_ui_slide_1a0a58 = nil
local src_lib_engine_draw_ui_style_197058 = nil
local src_lib_object_node_1a0e50 = nil
local src_lib_engine_draw_ui_common_19a238 = nil
local function main_248230()
local version = src_version_1d59c8()
local util_decorator = src_lib_util_decorator_192138()
local zeebo_module = src_lib_common_module_1987a0()
local engine_encoder = src_lib_engine_api_encoder_1d2908()
local engine_game = src_lib_engine_api_app_198778()
local engine_hash = src_lib_engine_api_hash_1a7b00()
local engine_http = src_lib_engine_api_http_1a7c38()
local engine_i18n = src_lib_engine_api_i18n_19f898()
local engine_media = src_lib_engine_api_media_19c440()
local engine_key = src_lib_engine_api_key_19ed18()
local engine_math = src_lib_engine_api_math_1a7de0()
local engine_array = src_lib_engine_api_array_19d778()
local engine_draw_ui = src_lib_engine_draw_ui_1a23b8()
local engine_draw_fps = src_lib_engine_draw_fps_19d3d8()
local engine_draw_text = src_lib_engine_draw_text_1a01c0()
local engine_draw_poly = src_lib_engine_draw_poly_1a1cc8()
local engine_raw_bus = src_lib_engine_raw_bus_10e5b0()
local engine_raw_node = src_lib_engine_raw_node_1c0de8()
local engine_raw_memory = src_lib_engine_raw_memory_20fb00()
local application_default = src_lib_object_root_19ce10()
local color = src_lib_object_color_1983b8()
local std = src_lib_object_std_1a25a8()
local application = application_default
local engine = {
current = application_default,
root = application_default,
offset_x = 0,
offset_y = 0
}
local cfg_system = {
exit = native_system_exit,
reset = native_system_reset,
title = native_system_title,
get_fps = native_system_get_fps,
get_secret = native_system_get_secret,
get_language = native_system_get_language
}
local cfg_media = {
position=native_media_position,
resize=native_media_resize,
pause=native_media_pause,
load=native_media_load,
play=native_media_play
}
local cfg_poly = {
repeats = {
native_cfg_poly_repeat_0 or false,
native_cfg_poly_repeat_1 or false,
native_cfg_poly_repeat_2 or false
},
triangle = native_draw_triangle,
poly2 = native_draw_poly2,
poly = native_draw_poly,
line = native_draw_line
}
local cfg_http = {
ssl = native_http_has_ssl,
handler = native_http_handler
}
local cfg_base64 = {
decode = native_base64_decode,
encode = native_base64_encode
}
local cfg_json = {
decode = native_json_decode,
encode = native_json_encode
}
local cfg_xml = {
decode = native_xml_decode,
encode = native_xml_encode
}
local cfg_text = {
font_previous = native_text_font_previous
}
local function clear(tint)
local x, y = engine.offset_x, engine.offset_y
local width, height = engine.current.data.width, engine.current.data.height
native_draw_clear(tint, x, y, width, height)
end
function native_callback_loop(dt)
std.milis = std.milis + dt
std.delta = dt
std.bus.emit('loop')
end
function native_callback_draw()
native_draw_start()
std.bus.emit('draw')
native_draw_flush()
end
function native_callback_resize(width, height)
engine.root.data.width = width
engine.root.data.height = height
std.app.width = width
std.app.height = height
std.bus.emit('resize', width, height)
end
function native_callback_keyboard(key, value)
std.bus.emit('rkey', key, value)
end
function native_callback_init(width, height, game_lua)
if std.bus then
std.bus.emit('clear_all')
end
application = zeebo_module.loadgame(game_lua)
if application then
application.data.width = width
application.data.height = height
std.app.width = width
std.app.height = height
end
std.draw.color=native_draw_color
std.draw.clear=clear
std.draw.rect=util_decorator.offset_xy2(engine, native_draw_rect)
std.draw.line=util_decorator.offset_xyxy1(engine, native_draw_line)
std.draw.image=util_decorator.offset_xy2(engine, native_draw_image)
std.text.print = util_decorator.offset_xy1(engine, native_text_print)
std.text.mensure=native_text_mensure
std.text.font_size=native_text_font_size
std.text.font_name=native_text_font_name
std.text.font_default=native_text_font_default
zeebo_module.require(std, application, engine)
:package('@bus', engine_raw_bus)
:package('@node', engine_raw_node)
:package('@memory', engine_raw_memory)
:package('@game', engine_game, cfg_system)
:package('@math', engine_math)
:package('@array', engine_array)
:package('@key', engine_key, {})
:package('@draw.ui', engine_draw_ui)
:package('@draw.fps', engine_draw_fps)
:package('@draw.text', engine_draw_text, cfg_text)
:package('@draw.poly', engine_draw_poly, cfg_poly)
:package('@color', color)
:package('math', engine_math.clib)
:package('math.random', engine_math.clib_random)
:package('http', engine_http, cfg_http)
:package('base64', engine_encoder, cfg_base64)
:package('json', engine_encoder, cfg_json)
:package('xml', engine_encoder, cfg_xml)
:package('i18n', engine_i18n, cfg_system)
:package('media', engine_media, cfg_media)
:package('hash', engine_hash, cfg_system)
:run()
application.data.width, std.app.width = width, width
application.data.height, std.app.height = height, height
std.node.spawn(application)
std.app.title(application.meta.title..' - '..application.meta.version)
engine.root = application
engine.current = application
std.bus.emit_next('load')
std.bus.emit_next('init')
end
local P = {
meta={
title='gly-engine',
author='RodrigoDornelles',
description='native core',
version=version
}
}
return P
end
src_version_1d59c8 = function()
return '0.0.18'
end
--
src_lib_util_decorator_192138 = function()
local function decorator_prefix3(zig, zag, zom, func)
return function (a, b, c, d, e, f)
return func(zig, zag, zom, a, b, c, d, e, f)
end
end
local function decorator_prefix2(zig, zag, func)
return function (a, b, c, d, e, f)
return func(zig, zag, a, b, c, d, e, f)
end
end
local function decorator_prefix1(zig, func)
return function (a, b, c, d, e, f)
return func(zig, a, b, c, d, e, f)
end
end
local function decorator_offset_xy2(object, func)
return function(a, b, c, d, e, f)
local x = object.offset_x + (b or 0)
local y = object.offset_y + (c or 0)
return func(a, x, y, d, e, f)
end
end
local function decorator_offset_xyxy1(object, func)
return function(a, b, c, d, e, f)
local x1 = object.offset_x + a
local y1 = object.offset_y + b
local x2 = object.offset_x + c
local y2 = object.offset_y + d
return func(x1, y1, x2, y2, e, f)
end
end
local function decorator_offset_xy1(object, func)
return function(a, b, c, d, e, f)
local x = object.offset_x + a
local y = object.offset_y + b
return func(x, y, c, d, e, f)
end
end
local P = {
offset_xy1 = decorator_offset_xy1,
offset_xy2 = decorator_offset_xy2,
offset_xyxy1 = decorator_offset_xyxy1,
prefix3 = decorator_prefix3,
prefix2 = decorator_prefix2,
prefix1 = decorator_prefix1
}
return P
end
--
src_lib_common_module_1987a0 = function()
local zeebo_pipeline = src_lib_util_pipeline_1c5468()
local application_default = src_lib_object_root_19ce10()
local function default(application, defaults)
if not application then return nil end
local index = 1    
local items = {'data', 'meta', 'config', 'callbacks'}
local normalized_aplication = {}
defaults = defaults or application_default
while index <= #items do
local key1 = items[index]
local keys = defaults[key1]
normalized_aplication[key1] = {}
for key2, default_value in pairs(keys) do
local value = application[key1] and application[key1][key2]
normalized_aplication[key1][key2] = value or default_value
end
index = index + 1
end
normalized_aplication.config.id = tostring(application) 
normalized_aplication.assets = application.assets or {}
if application.callbacks then
for event, handler in pairs(application.callbacks) do
normalized_aplication.callbacks[event] = handler
end
end
return normalized_aplication
end
local function normalize(application)
if not application then return nil end
if application.Game then
application = application.Game
end
if application.new and type(application.new) == 'function' then
application = application.new()
end
if application and (application.meta or application.callbacks) then
return application
end
local normalized_aplication = {
data = {},
meta = {},
assets = {},
config = {},
callbacks = {}
}
for key, value in pairs(application) do
if key == 'assets' then
normalized_aplication.assets = value
elseif application_default.meta[key] then
normalized_aplication.meta[key] = value
elseif application_default.config[key] then
normalized_aplication.config[key] = value
elseif type(value) == 'function' then
normalized_aplication.callbacks[key] = value
else
normalized_aplication.data[key] = value
end
end
return normalized_aplication
end
local function loadgame(game_file, defaults)
if type(game_file) == 'table' or type(game_file) == 'userdata' then
return default(normalize(game_file), defaults)
end
local cwd = '.'
local application = type(game_file) == 'function' and game_file
local game_title = not application and game_file and game_file:gsub('%.lua$', '') or 'game'
if not application and game_file and game_file:find('\n') then
local ok, app = pcall(load, game_file)
if not ok then
ok, app = pcall(loadstring, game_file)
end
application = ok and app
else
if love and love.filesystem and love.filesystem.getSource then
cwd = love.filesystem.getSource()
end
if not application then
application = loadfile(cwd..'/'..game_title..'.lua')
end
if not application then
local ok, app = pcall(require, game_title)
application = ok and app
end
end
if not application and io and io.open and game_file then
local app_file = io.open(game_file)
if app_file then
local app_src = app_file:read('*a')
local ok, app = pcall(load, app_src)
if not ok then
ok, app = pcall(loadstring, app_src)
end
application = ok and app
app_file:close()
end
end
while application and type(application) == 'function' do
application = application()
end
return default(normalize(application), defaults)
end
local function package(self, module_name, module, custom)
local system = module_name:sub(1, 1) == '@'
local name = system and module_name:sub(2) or module_name
if system then
self.list_append(name)
self.stdlib_required[name] = true
end
self.pipeline[#self.pipeline + 1] = function ()
if not self.list_exist(name) then return end
if not system and not self.lib_required[name] then return end
if not system and self.engine.lib_installed[name] then return end
if system and self.engine.stdlib_installed[name] then return end
local try_install = function()
module.install(self.std, self.engine, custom, name)
if module.event_bus then
module.event_bus(self.std, self.engine, custom, name)
end
end
local ok, msg = pcall(try_install)
if not ok then
self.lib_error[name] = msg    
return
end
if system then
self.engine.stdlib_installed[name] = true
else
self.engine.lib_installed[name] = true
end
end
return self
end
local function require(std, application, engine)
if not application then
error('game not found!')
end
local application_require = application.config.require
local next_library = application_require:gmatch('%S+')
local self = {
std=std,
engine=engine,
package = package,
event = {},
list = {},
lib_error = {},
lib_optional = {},
lib_required = {},
stdlib_required = {},
pipeline = {},
pipe = zeebo_pipeline.pipe
}
if not engine.lib_installed then
engine.lib_installed = {}
engine.stdlib_installed = {}
end
self.list_exist = function (name)
return self.lib_optional[name] or self.lib_required[name] or self.stdlib_required[name]
end
self.list_append = function (name)
if not self.list_exist(name) then
self.list[#self.list + 1] = name
end
end
self.run = function()
local index = 1
zeebo_pipeline.run(self)
while index <= #self.list do
local name = self.list[index]
if self.stdlib_required[name] and not self.engine.stdlib_installed[name] then
error('system library not loaded: '..name..'\n'..(self.lib_error[name] or ''))
end
if self.lib_required[name] and not self.engine.lib_installed[name] then
error('library not loaded: '..name..'\n'..(self.lib_error[name] or ''))
end
index = index + 1
end
end
repeat
local lib = next_library()
if lib then
local name, optional = lib:match('([%w%.]+)([?]?)')
self.list_append(name)
if optional and #optional > 0 then
self.lib_optional[name] = true
else
self.lib_required[name] = true
end
end
until not lib
return self
end
local P = {
loadgame = loadgame,
require = require
}
return P
end
--
src_lib_engine_api_encoder_1d2908 = function()
local function install(std, engine, library, name)
std = std or {}
std[name] = {
encode=library.encode,
decode=library.decode
}
return {[name]=std[name]}
end
local P = {
install=install
}
return P
end
--
src_lib_engine_api_app_198778 = function()
local util_decorator = src_lib_util_decorator_192138()
local function reset(std, engine)
if std.node then
std.bus.emit('exit')
std.bus.emit('init')
else
engine.root.callbacks.exit(std, engine.root.data)
engine.root.callbacks.init(std, engine.root.data)
end
end
local function exit(std)
std.bus.emit('exit')
std.bus.emit('quit')
end
local function title(func, window_name)
if func then
func(window_name)
end
end
local function install(std, engine, config)
std = std or {}
config = config or {}
std.app = std.app or {}
std.bus.listen('post_quit', function()
if config.quit then
config.quit()
end
end)
std.app.title = util_decorator.prefix1(config.set_title, title)
std.app.exit = util_decorator.prefix1(std, exit)
std.app.reset = util_decorator.prefix2(std, engine, reset)
std.app.get_fps = config.get_fps
return std.app
end
local P = {
install=install
}
return P
end
--
src_lib_engine_api_hash_1a7b00 = function()
local function djb2(digest)
local index = 1
local hash = 5381
while index <= #digest do
local char = string.byte(digest, index)
hash = (hash * 33) + char
index = index + 1
end
hash = string.format('%08x', hash)
hash = tonumber(hash:sub(#hash - 7), 16)
return hash
end
local function install(std, engine, cfg_system)
local id = djb2(cfg_system.get_secret())
std = std or {}
std.hash = std.hash or {}
std.hash.djb2 = djb2
std.hash.fingerprint = function() return id end
end
local P = {
install = install
}
return P
end
--
src_lib_engine_api_http_1a7c38 = function()
local zeebo_pipeline = src_lib_util_pipeline_1c5468()
local function fast(self)
self.speed = '_fast'
return self
end
local function body(self, content)
self.body_content=content
return self
end
local function param(self, name, value)
local index = #self.param_list + 1
self.param_list[index] = name
self.param_dict[name] = value
return self
end
local function header(self, name, value)
local index = #self.header_list + 1
self.header_list[index] = name
self.header_dict[name] = value
return self
end
local function success(self, handler_func)
self.success_handler = handler_func
return self
end
local function failed(self, handler_func)
self.failed_handler = handler_func
return self
end
local function http_error(self, handler_func)
self.error_handler = handler_func
return self
end
local function request(method, std, engine, protocol_handler)
local callback_handler = function()
std.node.emit(engine.current, 'http')
end
return function (url)
local game = engine.current.data
local self = {
url = url,
speed = '',
method = method,
body_content = '',
header_list = {},
header_dict = {},
param_list = {},
param_dict = {},
callback_handler = callback_handler,
success_handler = function (std, game) end,
failed_handler = function (std, game) end,
error_handler = function (std, game) end,
std = std,
game = game,
fast = fast,
body = body,
param = param,
header = header,
success = success,
failed = failed,
error = http_error,
run = zeebo_pipeline.run,
protocol_handler = protocol_handler
}
self.promise = function()
zeebo_pipeline.stop(self)
end
self.resolve = function()
zeebo_pipeline.resume(self)
end
self.set = function (key, value)
self.std.http[key] = value
end
self.pipeline = {
function()
self:protocol_handler()
end,
function()
self.callback_handler(self.std, self.game)
if self.std.http.ok then
self.success_handler(self.std, self.game)
elseif self.std.http.error or not self.std.http.status then
self.error_handler(self.std, self.game)
else
self.failed_handler(self.std, self.game)
end
end,
function ()
self.std.http.ok = nil
self.std.http.body = nil
self.std.http.error = nil
self.std.http.status = nil
end,
function()
zeebo_pipeline.reset(self)
end
}
return self
end
end
local function install(std, engine, protocol)
local protocol_handler = protocol and protocol.handler
if not protocol_handler then
error('missing protocol handler')
end
std.http = std.http or {}
std.http.get=request('GET', std, engine, protocol_handler)
std.http.head=request('HEAD', std, engine, protocol_handler)
std.http.post=request('POST', std, engine, protocol_handler)
std.http.put=request('PUT', std, engine, protocol_handler)
std.http.delete=request('DELETE', std, engine, protocol_handler)
std.http.patch=request('PATCH', std, engine, protocol_handler)
if protocol.install then
protocol.install(std, engine)
end
return {
std={http=std.http}
}
end
local P = {
install=install
}
return P
end
--
src_lib_engine_api_i18n_19f898 = function()
local language = 'en-US'
local language_default = 'en-US'
local language_list = {}
local language_inverse_list = {}
local translate = {}
local function update_languages(texts)
local index = 1
translate = texts
language_list = {language_default}
language_inverse_list = {[language_default]=1}
repeat
local lang = next(texts)
if lang then
index = index + 1
language_inverse_list[lang] = index
language_list[#language_list + 1] = lang
end
until lang
end
local function get_text(old_text)
local new_text = translate[language] and translate[language][old_text]
return new_text or old_text
end
local function get_language()
return language
end
local function set_language(l)
if language_inverse_list[l] then
language = l
else 
language = language_default
end
end
local function next_language(to)
local index = language_inverse_list[language]
local incr = to or 1
if index then
index = index + incr
if index > #language_list then
index = 1
end
if index <= 0 then
index = #language_list
end
index = index == 0 and 1 or index
set_language(language_list[index])
end
end
local function back_language()
next_language(-1)
end
local function decorator_draw_text(func)
return function (x, y, text, a, b, c)
return func(x, y, get_text(text), a, b, c)
end
end
local function install(std, engine, cfg)
if not (std and std.text and std.text.print) then
error('missing draw text')
end
local old_put = std.text.put
local old_print = std.text.print
local old_print_ex = std.text.print_ex
local callback_lang = function(result)
update_languages(result)
if cfg and cfg.get_language then
set_language(cfg.get_language())
end
end
if not std.node and engine.root.callbacks.i18n then
callback_lang(engine.root.callbacks.i18n())
else
std.bus.listen('ret_i18n', callback_lang)
std.bus.emit_next('i18n')
end
std.text.put = decorator_draw_text(old_put)
std.text.print = decorator_draw_text(old_print)
std.text.print_ex = decorator_draw_text(old_print_ex)
std.i18n = {}
std.i18n.get_text = get_text
std.i18n.get_language = get_language
std.i18n.set_language = set_language
std.i18n.back = back_language
std.i18n.next = next_language
end
local P = {
install=install
}
return P
end
--
src_lib_engine_api_media_19c440 = function()
local util_decorator = src_lib_util_decorator_192138()
local function media_add(func, self, src)
func(self.id - 1, src)
return self
end
local function media_play(func, self)
func(self.id - 1)
return self
end
local function media_pause(func, self)
func(self.id - 1)
return self
end
local function media_resize(func, self, width, height)
func(self.id - 1, width, height)
return self
end
local function media_position(func, self, pos_x, pos_y)
func(self.id - 1, pos_x, pos_y)
return self
end
local channels = {}
local function media_channel(std, handler)
return function(id)
id = id or 1
if 0 >= id or id > 8 then
error('Please, do not do that!')
end
if not channels[id] then
channels[id] = {
id = id,
add = util_decorator.prefix1(handler.load, media_add),
play = util_decorator.prefix1(handler.play, media_play),
pause = util_decorator.prefix1(handler.pause, media_pause),
resize = util_decorator.prefix1(handler.resize, media_resize),
position = util_decorator.prefix1(handler.position, media_position)
}
if std.node then
channels[id].node = std.node.load({})
channels[id].apply = function()
local node = channels[id].node
local depth = 0
local offset_x = 0
local offset_y = 0
while node and depth < 100 do
offset_x = offset_x + node.config.offset_x
offset_y = offset_y + node.config.offset_y
node = node.config.parent
depth = depth + 1
end
media_position(handler.position, channels[id], offset_x, offset_y)
media_resize(handler.resize, channels[id], channels[id].node.data.width, channels[id].node.data.height)
end
end
end
return channels[id]
end
end
local function install(std, engine, handlers)
std.media = std.media or {}
std.media.video = media_channel(std, handlers)
end
local P = {
install=install
}
return P
end
--
src_lib_engine_api_key_19ed18 = function()
local function real_key(std, engine, rkey, rvalue)
local value = rvalue == 1 or rvalue == true
local key = engine.key_bindings[rkey] or (std.key.axis[rkey] and rkey)
if key then
std.key.axis[key] = value and 1 or 0
std.key.press[key] = value
if key == 'right' or key == 'left' then
std.key.axis.x = std.key.axis.right - std.key.axis.left
end
if key == 'down' or key == 'up' then
std.key.axis.y = std.key.axis.down - std.key.axis.up
end
std.bus.emit('key')
end
end
local function real_keydown(std, engine, key)
real_key(std, engine, key, 1)
end
local function real_keyup(std, engine, key)
real_key(std, engine, key, 0)
end
local function event_bus(std, engine)
std.bus.listen_std_engine('rkey', real_key)
std.bus.listen_std_engine('rkey1', real_keydown)
std.bus.listen_std_engine('rkey0', real_keyup)
end
local function install(std, engine, key_bindings)
engine.key_bindings = key_bindings or {}
engine.keyboard = real_key
end
local P = {
event_bus = event_bus,
install = install
}
return P
end
--
src_lib_engine_api_math_1a7de0 = function()
local function abs(value)
if value < 0 then
return -value
end
return value
end
local function clamp(value, value_min, value_max)
if value < value_min then
return value_min
elseif value > value_max then
return value_max
else
return value
end
end
local function clamp2(value, value_min, value_max)
return (value - value_min) % (value_max - value_min + 1) + value_min
end
local function dir(value, alpha)
alpha = alpha or 0
if value < -alpha then
return -1
elseif value > alpha then
return 1
else
return 0
end
end
local function dis(x1,y1,x2,y2)
local sqr = 1/2
return ((x2 - x1) ^ 2 + (y2 - y1) ^ 2) ^ (sqr ~= 0 and sqr or 1)
end
local function dis2(x1,y1,x2,y2)
return (x2 - x1) ^ 2 + (y2 - y1) ^ 2
end
local function dis3(x1,y1,x2,y2)
return abs(x1 - x2) + abs(x2 - y2)
end
local function lerp(a, b, alpha)
return a + alpha * ( b - a )
end 
local function map(value, in_min, in_max, out_min, out_max)
return (value - in_min) * (out_max - out_min) / (in_max - in_min) + out_min
end
local function max(...)
local args = {...}
local index = 1
local value = nil
local max_value = nil
if #args == 1 then
args = args[1]
end
while index <= #args do
value = args[index]
if max_value == nil or value > max_value then
max_value = value
end
index = index + 1
end
return max_value
end
local function min(...)
local args = {...}
local index = 1
local value = nil
local min_value = nil
if #args == 1 then
args = args[1]
end
while index <= #args do
value = args[index]
if min_value == nil or value < min_value then
min_value = value
end
index = index + 1
end
return min_value
end
local function install(std)
std = std or {}
std.math = std.math or {}
std.math.abs=abs
std.math.clamp=clamp
std.math.clamp2=clamp2
std.math.dir=dir
std.math.dis=dis
std.math.dis2=dis2
std.math.dis3=dis3
std.math.lerp=lerp
std.math.map=map
std.math.max=max
std.math.min=min
return std.math
end
local function install_clib(std)
std = std or {}
std.math = std.math or {}
std.math.acos=math.acos
std.math.asin=math.asin
std.math.atan=math.atan
std.math.atan2=math.atan2
std.math.ceil=math.ceil
std.math.cos=math.cos
std.math.cosh=math.cosh
std.math.deg=math.deg
std.math.exp=math.exp
std.math.floor=math.floor
std.math.fmod=math.fmod
std.math.frexp=math.frexp
std.math.huge=math.huge
std.math.ldexp=math.ldexp
std.math.log=math.log
std.math.log10=math.log10
std.math.modf=math.modf
std.math.pi=math.pi
std.math.pow=math.pow
std.math.rad=math.rad
std.math.sin=math.sin
std.math.sinh=math.sinh
std.math.sqrt=math.sqrt
std.math.tan=math.tan
std.math.tanh=math.tanh
return std.math
end
local function install_clib_random(std)
std = std or {}
std.math = std.math or {}
std.math.random = function(a, b)
a = a and math.floor(a)
b = b and math.floor(b)
return math.random(a, b)
end
return std.math
end
local P = {
install = install,
clib = {
install = install_clib
},
clib_random = {
install = install_clib_random
}
}
return P;
end
--
src_lib_engine_api_array_19d778 = function()
local util_decorator = src_lib_util_decorator_192138()
local function array_map(array, func)
local res = {}
local index = 1
local length = #array
while index <= length do
res[#res + 1] = func(array[index], index)
index = index + 1
end
return res
end
local function array_filter(array, func)
func = func or (function(v) return v and v ~= 0 end)
local res = {}
local index = 1
local length = #array
while index <= length do
local value = array[index]
if func(value, index) then
res[#res + 1] = value
end
index = index + 1
end
return res
end
local function array_unique(array)
local res = {}
local index = 1
local length = #array
local setmap = {}
while index <= length do
local value = array[index]
if not setmap[value] then
res[#res + 1] = value
end
setmap[value] = true
index = index + 1
end
return res
end
local function array_foreach(array, func)
local index = 1
local length = #array
while index <= length do
func(array[index], index)
index = index + 1
end
end
local function array_reducer(array, func, value)
local index = value and 1 or 2
local length = #array
value = value or array[1]
while index <= length do
value = func(value, array[index], index)
index = index + 1
end
return value
end
local function array_index(array, func, reverse)
func = func or function() return true end
local index, inc, final = 1, 1, #array
if reverse then
index, inc, final = #array, -1, 1
end
repeat
if func(array[index], index) then
return index
end
index = index + inc
until (reverse and index < final) or (not reverse and index > final)
return nil
end
local function array_first(array, func)
local index = array_index(array, func)
if index then
return array[index]
end
return nil
end
local function array_last(array, func)
local index = array_index(array, func, true)
if index then
return array[index]
end
return nil
end
local function array_some(array, func, reverse)
local index, inc, final = 1, 1, #array
if reverse then
index, inc, final = #array, -1, 1
end
repeat
if func(array[index], index) then
return true
end
index = index + inc
until (reverse and index < final) or (not reverse and index > final)
return false
end
local function array_every(array, func)
local index = 1
local length = #array
while index <= length do
if not func(array[index], index) then
return false
end
index = index + 1
end
return true
end
local function array_pipeline(std, array)
local decorator_iterator = function(func) 
return function(self, func2, extra)
self.array = func(self.array, func2, extra)
return self
end
end
local decorator_reduce = function(func, return_self)
return function(self, func2, extra)
local res = func(self.array, func2, extra)
return (return_self and self) or res
end
end
local self = {
array = array,
map = decorator_iterator(array_map),
filter = decorator_iterator(array_filter),
unique = decorator_iterator(array_unique),
each = decorator_reduce(array_foreach, true),
reducer = decorator_reduce(array_reducer),
index = decorator_reduce(array_index),
first = decorator_reduce(array_first),
last = decorator_reduce(array_last),
some = decorator_reduce(array_some),
every = decorator_reduce(array_every),
table = function(self) return self.array end,
json = function(self) return std.json.encode(self.array) end
}
return self
end
local function install(std, engine, library, name)
local lib = std[name] or {}
lib.filter = array_filter
lib.unique = array_unique
lib.each = array_foreach
lib.reducer = array_reducer
lib.index = array_index
lib.first = array_first
lib.last = array_last
lib.some = array_some
lib.every = array_every
lib.from = util_decorator.prefix1(std, array_pipeline)
std[name] = lib
end
local P = {
install = install
}
return P
end
--
src_lib_engine_draw_ui_1a23b8 = function()
local ui_grid = src_lib_engine_draw_ui_grid_199d00()
local ui_slide = src_lib_engine_draw_ui_slide_1a0a58()
local ui_style = src_lib_engine_draw_ui_style_197058()
local util_decorator = src_lib_util_decorator_192138()
local function install(std, engine, application)
std.ui = std.ui or {}
std.ui.grid = util_decorator.prefix2(std, engine, ui_grid.component)
std.ui.slide = util_decorator.prefix2(std, engine, ui_slide.component)
std.ui.style = util_decorator.prefix2(std, engine, ui_style.component)
end
local P = {
install=install
}
return P
end
--
src_lib_engine_draw_fps_19d3d8 = function()
local function draw_fps(std, engine, show, pos_x, pos_y)
if show < 1 then return end
local x = engine.current.config.offset_x + pos_x
local y = engine.current.config.offset_y + pos_y
local s = 4
std.draw.color(0xFFFF00FF)
if show >= 1 then
std.draw.rect(0, x, y, 40, 24)
end
if show >= 2 then
std.draw.rect(0, x + 48, y, 40, 24)
end
if show >= 3 then
std.draw.rect(0, x + 96, y, 40, 24)
end
std.draw.color(0x000000FF)
std.text.font_size(16)
if show >= 3 then
local floor = std.math.floor or math.floor or function() return 'XX' end
local fps =  floor((1/std.delta) * 1000)
std.text.print(x + s, y, fps)
s = s + 46
end
if show >= 1 then
std.text.print(x + s, y, engine.fps)
s = s + 46
end
if show >= 2 then
std.text.print(x + s, y, engine.root.config.fps_max)
s = s + 46
end
end
local function event_bus(std, engine)
std.bus.listen('post_draw', function()
engine.current = engine.root
draw_fps(std, engine, engine.root.config.fps_show, 8, 8)
end)
end
local function install(std, engine)
std.app = std.app or {}
std.app.fps_show = function(show)
engine.root.config.fps_show = show
end
end
local P = {
event_bus=event_bus,
install=install
}
return P
end
--
src_lib_engine_draw_text_1a01c0 = function()
local util_decorator = src_lib_util_decorator_192138()
local function text_put(std, engine, font_previous, pos_x, pos_y, text, size)
size = size or 2
local hem = engine.current.data.width / 80
local vem = engine.current.data.height / 24
local font_size = hem * size
std.text.font_default(0)
std.text.font_size(font_size)
std.text.print(pos_x * hem, pos_y * vem, text)
font_previous()
end
local function text_print_ex(std, engine, x, y, text, align)
local w, h = std.text.mensure(text)
local aligns = {w, w/2, 0}
std.text.print(x - aligns[(align or 1) + 2], y, text)
return w, h
end
local function install(std, engine, config)
std.text.print_ex = util_decorator.prefix2(std, engine, text_print_ex)
std.text.put = util_decorator.prefix3(std, engine, config.font_previous, text_put)
end
local P = {
install=install
}
return P
end
--
src_lib_engine_draw_poly_1a1cc8 = function()
local function decorator_poo(object, func)
if not object or not func then return func end
return function(a, b, c, d)
return func(object, a, b, c, d)
end
end
local function decorator_line(func_draw_line)
return function(mode, verts)
local index = 4
while index <= #verts do
func_draw_line(verts[index - 3], verts[index - 2], verts[index - 1], verts[index])
index = index + 2
end
end
end
local function decorator_triangle(func_draw_poly, std, func_draw_triangle)
if not func_draw_triangle then
return func_draw_poly
end
local point = function(x, y, px, py, scale, angle, ox, oy)
local xx = x + ((ox - px) * -scale * std.math.cos(angle)) - ((ox - py) * -scale * std.math.sin(angle))
local yy = y + ((oy - px) * -scale * std.math.sin(angle)) + ((oy - py) * -scale * std.math.cos(angle))
return xx, yy
end
return function(engine_mode, verts, x, y, scale, angle, ox, oy)
if #verts ~= 6 then
return func_draw_poly(engine_mode, verts, x, y, scale, angle, ox, oy)
end
ox = ox or 0
oy = oy or ox or 0
local x1, y1 = point(x, y, verts[1], verts[2], scale, angle, ox, oy)
local x2, y2 = point(x, y, verts[3], verts[4], scale, angle, ox, oy)
local x3, y3 = point(x, y, verts[5], verts[6], scale, angle, ox, oy)
return func_draw_triangle(engine_mode, x1, y1, x2, y2, x3, y3)
end
end
local function decorator_poly(func_draw_poly, std, modes, repeats)
local func_repeat = function(verts, mode)
if repeats and repeats[mode + 1] then
verts[#verts + 1] = verts[1]
verts[#verts + 1] = verts[2]
end
end
return function (engine_mode, verts, x, y, scale, angle, ox, oy)
if #verts < 6 or #verts % 2 ~= 0 then return end
local mode = modes and modes[engine_mode + 1] or engine_mode
local rotated = std.math.cos and angle and angle ~= 0
ox = ox or 0
oy = oy or ox or 0
if x and y and not rotated then
local index = 1
local verts2 = {}
scale = scale or 1
while index <= #verts do
if index % 2 ~= 0 then
verts2[index] = x + (verts[index] * scale)
else
verts2[index] = y + (verts[index] * scale)
end
index = index + 1
end
func_repeat(verts2, engine_mode)
func_draw_poly(mode, verts2)
elseif x and y then
local index = 1
local verts2 = {}
while index < #verts do
local px = verts[index]
local py = verts[index + 1]
local xx = x + ((ox - px) * -scale * std.math.cos(angle)) - ((ox - py) * -scale * std.math.sin(angle))
local yy = y + ((oy - px) * -scale * std.math.sin(angle)) + ((oy - py) * -scale * std.math.cos(angle))
verts2[index] = xx
verts2[index + 1] = yy
index = index + 2
end
func_repeat(verts2, engine_mode)
func_draw_poly(mode, verts2)
else
func_draw_poly(mode, verts)
end
end
end
local function decorator_position(engine, func)
return function(mode, verts, pos_x, pos_y, scale, angle, ox, oy)
local x = engine.current.config.offset_x + (pos_x or 0)
local y = engine.current.config.offset_y + (pos_y or 0)
ox = ox or 0
oy = ox or oy or 0
scale = scale or 1
angle = angle or 0
return func(mode, verts, x, y, scale, angle, ox, oy)
end
end
local function install(std, engine, config)
local draw_line = decorator_poo(config.object, config.line)
local draw_poly = decorator_poo(config.object, config.poly) or decorator_line(draw_line)
local draw_poly2 = config.poly2 or decorator_poly(draw_poly, std, config.modes, config.repeats)
local draw_verts = decorator_triangle(draw_poly2, std, config.triangle)
std.draw.poly = decorator_position(engine, draw_verts)
end
local P = {
install=install
}
return P
end
--
src_lib_engine_raw_bus_10e5b0 = function()
local ev_prefixes = {
'pre_',
'',
'post_'
}
local buses = {
list = {},
dict = {},
queue = {},
pause = {},
all = {}
}
local must_abort = false
local function abort()
must_abort = true
end
local function emit_next(key, a, b, c, d, e, f)
buses.queue[#buses.queue + 1] = {key, a, b, c, d, e, f}
end
local function emit(prefixes, key, a, b, c, d, e, f)
local index1, index2, index3 = 1, 1, 1
while index1 <= #prefixes do
index2 = 1
local prefix = prefixes[index1]
local topic = prefix..key
local bus = buses.dict[topic]
while not must_abort and bus and index2 <= #bus do
local func = bus[index2]
if not buses.pause[func] then
func(a, b, c, d, e, f)
end
index2 = index2 + 1
end
index3 = 1
while index3 <= #buses.all do
buses.all[index3](topic, a, b, c, d, e, f)
index3 = index3 + 1
end
index1 = index1 + 1
end
must_abort = false
end
local function trigger(key)
return function (a, b, c, d, e, f)
emit(ev_prefixes, key, a, b, c, d, e, f)
end
end
local function listen(key, handler_func)
if not buses.dict[key] then
buses.list[#buses.list + 1] = key
buses.dict[key] = {}
end
local index = #buses.dict[key] + 1
buses.dict[key][index] = handler_func 
end
local function listen_all(handler_func)
buses.all[#buses.all + 1] = handler_func
end
local function install(std, engine)
std.bus = std.bus or {}
std.bus.abort = abort
std.bus.listen = listen
std.bus.trigger = trigger
std.bus.emit_next = emit_next
std.bus.listen_all = listen_all
engine.bus_emit_ret = function(key, a)
emit({'ret_'}, key, a)
end
std.bus.emit = function(key, a, b, c, d, e, f)
emit(ev_prefixes, key, a, b, c, d, e, f)
end
std.bus.listen_std = function(key, handler_func)
listen(key, function(a, b, c, d, e, f)
handler_func(std, a, b, c, d, e, f)
end)
end
std.bus.listen_std_data = function(key, handler_func)
listen(key, function(a, b, c, d, e, f)
handler_func(std, engine.current.data, a, b, c, d, e, f)
end)
end
std.bus.listen_std_engine = function(key, handler_func)
listen(key, function(a, b, c, d, e, f)
handler_func(std, engine, a, b, c, d, e, f)
end)
end
listen('pre_loop', function()
local index = 1
while index <= #buses.queue do
local pid = buses.queue[index]
emit({''}, pid[1], pid[2], pid[3], pid[4], pid[5], pid[6])
index = index + 1
end
buses.queue = {}
end)
return {
bus=std.bus
}
end
local P = {
install=install
}
return P
end
--
src_lib_engine_raw_node_1c0de8 = function()
local zeebo_module = src_lib_common_module_1987a0()
local node_default = src_lib_object_node_1a0e50()
local buses = {
list = {},
inverse_list = {},
pause = {},
}
local function emit(std, application, key, a, b, c, d, e, f)
local callback = application.callbacks[key]
if not buses.pause[key..tostring(application)] and callback then
return callback(std, application.data, a, b, c, d, e, f)
end
return nil
end
local function load(application)
return zeebo_module.loadgame(application, node_default)
end
local function spawn(engine, application)
if not application or buses.inverse_list[application] then return end
local index = #buses.list + 1
buses.list[index] = application
buses.inverse_list[application] = index
if engine.current then
application.config.parent = engine.current
end
end
local function kill(application)
local index = application and buses.inverse_list[application]
local last_item = #buses.list
while index and index <= last_item do
buses.list[index] = buses.list[index + 1]
index = index + 1
end
if application then
buses.inverse_list[application] = nil
application.config.parent = nil
end
end
local function pause(application, key)
buses.pause[key..tostring(application)] = true
end
local function resume(application, key)
buses.pause[key..tostring(application)] = false
end
local function clear_bus()
local index = 1
while index <= #buses.list do
local application = buses.list[index]
buses.inverse_list[application] = nil
application.config.parent = nil
buses.list[index] = nil
index = index + 1
end
end
local function event_bus(std, engine, key, a, b, c, d, e, f)
local index = 1
local depth = 0
while index <= #buses.list do
local application = buses.list[index]
if engine.current ~= application then
local node = application
engine.current = application
engine.offset_x = 0
engine.offset_y = 0
while node and depth < 100 do
engine.offset_x = engine.offset_x + node.config.offset_x
engine.offset_y = engine.offset_y + node.config.offset_y
node = node.config.parent
depth = depth + 1
end
end
local ret = emit(std, application, key, a, b, c, d, e, f)
if ret ~= nil then
engine.bus_emit_ret(key, ret)
end
index = index + 1
end
end
local function install(std, engine)
std.node = std.node or {}
std.node.kill = kill
std.node.pause = pause
std.node.resume = resume
std.node.load = load
std.bus.listen('clear_all', clear_bus)
std.node.spawn = function (application)
spawn(engine, application)
end
std.bus.listen_all(function(key, a, b, c, d, e, f)
event_bus(std, engine, key, a, b, c, d, e, f)
end)
std.node.emit = function(application, key, a, b, c, d, e, f)
return emit(std, application, key, a, b, c, e, f)
end
std.node.emit_root = function(key, a, b, c, d, e, f)
return emit(std, engine.root, key, a, b, c, e, f)
end
std.node.emit_parent = function(key, a, b, c, d, e, f)
return emit(std, engine.current.config.parent, key, a, b, c, e, f)
end
end
local P = {
install=install
}
return P
end
--
src_lib_engine_raw_memory_20fb00 = function()
local memory_dict_unload = {}
local memory_dict = {}
local memory_list = {}
local function cache(key, load_func, unload_func)
if memory_dict[key] then
return memory_dict[key]
end
if not load_func then
return nil
end
local value = load_func()
memory_list[#memory_list + 1] = key
memory_dict_unload[key] = unload_func
memory_dict[key] = value
return value
end
local function unset(key)
if memory_dict_unload[key] then
memory_dict_unload[key](memory_dict[key])
end
memory_dict[key] = nil
end
local function gc_clear_all()
local index = 1
local items = #memory_list
while index <= items do
unset(memory_list[index])
index = index + 1
end
memory_list = {}
return items
end
local function install(std)
std = std or {}
std.mem = std.mem or {}
std.mem.cache = cache
std.mem.unset = unset
std.mem.gc_clear_all = gc_clear_all
return {
mem=std.mem
}
end
local P = {
install=install
}
return P
end
--
src_lib_object_root_19ce10 = function()
local P = {
data={
width=1280,
height=720
},
meta={
id='',
title='',
author='',
company='',
description='',
tizen_package='',
version=''
},
config = {
offset_x = 0,
offset_y = 0,
require = '',
fps_max = 60,
fps_show = 0,
fps_drop = 5,
fps_time = 5
},
callbacks={
}
}
return P;
end
--
src_lib_object_color_1983b8 = function()
local white = 0xFFFFFFFF
local lightgray = 0xC8CCCCFF
local gray = 0x828282FF
local darkgray = 0x505050FF
local yellow = 0xFDF900FF
local gold = 0xFFCB00FF
local orange = 0xFFA100FF
local pink = 0xFF6DC2FF
local red = 0xE62937FF
local maroon = 0xBE2137FF
local green = 0x00E430FF
local lime = 0x009E2FFF
local darkgreen = 0x00752CFF
local skyblue = 0x66BFFFFF
local blue = 0x0079F1FF
local darkblue = 0x0052ACFF
local purple = 0xC87AFFFF
local violet = 0x873CBEFF
local darkpurple = 0x701F7EFF
local beige = 0xD3B083FF
local brown = 0x7F6A4FFF
local darkbrown = 0x4C3F2FFF
local black = 0x000000FF
local blank = 0x00000000
local magenta = 0xFF00FFFF
local function install(std)
std = std or {}
std.color = std.color or {}
std.color.white = white
std.color.lightgray = lightgray
std.color.gray = gray
std.color.darkgray = darkgray
std.color.yellow = yellow
std.color.gold = gold
std.color.orange = orange
std.color.pink = pink
std.color.red = red
std.color.maroon = maroon
std.color.green = green
std.color.lime = lime
std.color.darkgreen = darkgreen
std.color.skyblue = skyblue
std.color.blue = blue
std.color.darkblue = darkblue
std.color.purple = purple
std.color.violet = violet
std.color.darkpurple = darkpurple
std.color.beige = beige
std.color.brown = brown
std.color.darkbrown = darkbrown
std.color.black = black
std.color.blank = blank
std.color.magenta = magenta
return std.color
end
local P = {
install = install
}
return P
end
--
src_lib_object_std_1a25a8 = function()
local P = {
milis = 0,
delta = 0,
math = {
},
draw = {
image = function() end,
clear = function () end,
color = function () end,
rect = function () end,
line = function () end,
poly = function () end,
tui_text = function() end
},
text = {
put = function() end,
print = function() end,
mensure = function() end,
font_size = function() end,
font_name = function() end,
font_default = function() end
},
app = {
width = 1280,
height = 720,
title = function() end,
reset = function () end,
load = function() end,
exit = function () end
},
key = {
axis = {
x = 0,
y = 0,
menu=0,
up=0,
down=0,
left=0,
right=0,
a = 0,
b = 0, 
c = 0,
d = 0
},
press = {
menu=false,
up=false,
down=false,
left=false,
right=false,
a=false,
b=false,
c=false,
d=false
}
}
}
return P;
end
--
src_lib_util_pipeline_1c5468 = function()
local function pipe(self)
return function()
self:run()
end
end
local function stop(self)
if self.pipeline and not self.pipeline2 then
self.pipeline2 = self.pipeline
self.pipeline = nil
end
end
local function resume(self)
if not self.pipeline and self.pipeline2 then
self.pipeline = self.pipeline2
self.pipeline2 = nil
self:run()
end
end
local function run(self)
self.pipeline_current = self.pipeline_current or 1
while self.pipeline and self.pipeline_current and self.pipeline_current <= #self.pipeline do
self.pipeline[self.pipeline_current]()
if self.pipeline_current then
self.pipeline_current = self.pipeline_current + 1
end
end
return self
end
local function reset(self)
self.pipeline = self.pipeline or self.pipeline2
self.pipeline2 = nil
self.pipeline_current = nil
end
local function clear(self)
self.pipeline_current = nil
self.pipeline2 = nil
self.pipeline = nil
end
local P = {
reset=reset,
clear=clear,
pipe=pipe,
stop=stop,
resume=resume,
run=run
}
return P
end
--
src_lib_engine_draw_ui_grid_199d00 = function()
local ui_common = src_lib_engine_draw_ui_common_19a238()
local util_decorator = src_lib_util_decorator_192138()
local function dir(std, engine, self, mode)
self.direction = mode
return self
end
local function apply(std, engine, self)
local index = 1
local x, y = 0, 0
local index2 = 1
local pipeline = std.ui.style(self.classlist).pipeline
while index2 <= #pipeline do
pipeline[index2](std, self.node, self.node.config.parent, engine.root)
index2 = index2 + 1
end
local hem = self.node.data.width / self.rows
local vem = self.node.data.height / self.cols
while self.direction == 1 and index <= #self.items_node do
local node = self.items_node[index]
local size = self.items_size[index]
local ui = self.items_ui[node]
node.config.offset_x = x * hem
node.config.offset_y = y * vem
node.data.width = hem
node.data.height = size * vem
y = y + size
if y >= self.cols then
x = x + 1
y = 0
end
if ui then
ui:apply()
end
index = index + 1
end    
while self.direction == 0 and index <= #self.items_node do
local node = self.items_node[index]
local size = self.items_size[index]
local ui = self.items_ui[node]
node.config.offset_x = x * hem
node.config.offset_y = y * vem
node.data.width = size * hem
node.data.height = vem
x = x + size
if x >= self.rows then
y = y + 1
x = 0
end
if ui then
ui:apply()
end
index = index + 1
end
return self
end
local function component(std, engine, layout)
local rows, cols = layout:match('(%d+)x(%d+)')
local node = std.node.load({
width = engine.current.data.width,
height = engine.current.data.height
})
local self = {
direction=0,
rows=tonumber(rows),
cols=tonumber(cols),
items_node = {},
items_size = {},
items_ui = {},
node=node,
classlist='',
dir=util_decorator.prefix2(std, engine, dir),
add=util_decorator.prefix2(std, engine, ui_common.add),
add_items=util_decorator.prefix2(std, engine, ui_common.add_items),
style=ui_common.style,
apply=util_decorator.prefix2(std, engine, apply),
get_item=ui_common.get_item
}
if self.rows == 1 and self.cols > 1 then
self.direction = 1
end
if engine.root == engine.current then
node.callbacks.resize = function()
if node.config.parent ~= engine.root then
node.callbacks.resize = nil
return
end
node.data.height = engine.root.data.height
node.data.width = engine.root.data.width
self:apply()
end
end
std.node.spawn(node)
return self
end
local P = {
component = component
}
return P
end
--
src_lib_engine_draw_ui_slide_1a0a58 = function()
local ui_common = src_lib_engine_draw_ui_common_19a238()
local util_decorator = src_lib_util_decorator_192138()
local function slider_next(self, to)
local incr = to or 1
self.index = self.index + incr
if self.index == 0 then
self.index = #self.items_node
end
if self.index > #self.items_node then
self.index = 1
end
return self
end
local function slider_back(self)
return slider_next(self, -1)
end
local function apply(std, engine, self)
local index = 1
local x, y = 0, 0
local index2 = 1
local pipeline = std.ui.style(self.classlist).pipeline
while index2 <= #pipeline do
pipeline[index2](std, self.node, self.node.config.parent, engine.root)
index2 = index2 + 1
end
local hem = self.node.data.width / self.rows
local vem = self.node.data.height / self.cols
while index <= #self.items_node do
local node = self.items_node[index]
local size = self.items_size[index]
local ui = self.items_ui[node]
node.config.offset_x = x * hem
node.config.offset_y = y * vem
node.data.width = size * hem
node.data.height = vem
x = x + size
if x >= self.rows then
y = y + 1
x = 0
end
if index == self.index then
local index3 = 1
local pipeline2 = std.ui.style(self.classlist_selected).pipeline
while index3 <= #pipeline2 do
pipeline2[index3](std, node, node.config.parent, engine.root)
index3 = index3 + 1
end
end
if ui then
ui:apply()
end
index = index + 1
end
return self
end
local function component(std, engine, layout)
local rows, cols = layout:match('(%d+)x(%d+)')
if rows ~= '1' and cols ~= '1' then
error('invalid grid layout')
end
local node = std.node.load({
width = engine.current.data.width,
height = engine.current.data.height
})
local self = {
index = 1,
rows=tonumber(rows),
cols=tonumber(cols),
items_node = {},
items_size = {},
items_ui = {},
node=node,
classlist='',
classlist_selected='',
next=slider_next,
back=slider_back,
add=util_decorator.prefix2(std, engine, ui_common.add),
add_items=util_decorator.prefix2(std, engine, ui_common.add_items),
style_item_select=util_decorator.prefix1('classlist_selected', ui_common.style),
style=util_decorator.prefix1('classlist', ui_common.style),
apply=util_decorator.prefix2(std, engine, apply),
get_item=ui_common.get_item
}
if engine.root == engine.current then
node.callbacks.resize = function()
if node.config.parent ~= engine.root then
node.callbacks.resize = nil
return
end
node.data.height = engine.root.data.height
node.data.width = engine.root.data.width
self:apply()
end
end
std.node.spawn(node)
return self
end
local P = {
component = component
}
return P
end
--
src_lib_engine_draw_ui_style_197058 = function()
local style = {
list = {},
dict = {}
}
local function decorate_style(namespace, attribute)
return function(self, value)
self.pipeline[#self.pipeline + 1] = function(std, node, parent, root)
local is_func = type(value) == 'function'
node[namespace][attribute] =  is_func and value(std, node, parent, root) or value
end
return self
end
end
local function component(std, engine, classname)
local self = style.dict[classname]
if not self then
self = {
pipeline = {},
width = decorate_style('data', 'width'),
height = decorate_style('data', 'height'),
pos_y = decorate_style('config', 'offset_y'),
pos_x = decorate_style('config', 'offset_x')
}
style.list[#style.list] = classname
style.dict[classname] = self
end
return self
end
local P = {
component = component
}
return P
end
--
src_lib_object_node_1a0e50 = function()
local P = {
data={
width=1280,
height=720
},
meta={
},
config = {
offset_x = 0,
offset_y = 0
},
callbacks={
}
}
return P;
end
--
src_lib_engine_draw_ui_common_19a238 = function()
local function add(std, engine, self, application, size)
if not application then return self end
local index = #self.items_node + 1
local node = application.node or std.node.load(application.node or application)
std.node.spawn(node)
node.config.parent = self.node
self.items_node[index] = node
self.items_size[index] = size or 1
if application.node then
self.items_ui[application.node] = application
end
return self
end
local function add_items(std, engine, self, applications)
local index = 1
while applications and index < #applications do
add(std, engine, self, applications[index])
index = index + 1
end
return self
end
local function get_item(self, id)
return self.items_node[id]
end
local function style(classkey, self, classlist)
self[classkey] = classlist
return self
end
local P = {
add=add,
style=style,
get_item=get_item,
add_items=add_items,
}
return P
end
--
return main_248230()
