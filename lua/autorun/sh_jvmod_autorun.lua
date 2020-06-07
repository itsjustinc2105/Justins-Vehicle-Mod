JVMOD = JVMOD or {}

local include_cl = SERVER and AddCSLuaFile or include
local include_sv = SERVER and include or function() end
local include_sh = SERVER and function(a) AddCSLuaFile(a) include(a) end or include

include_cl('jvmod/datamine.lua')
include_cl('jvmod/cl_hooks.lua')
include_sv('jvmod/sv_internalfunctions.lua')
include_sv('jvmod/sv_hooks.lua')
