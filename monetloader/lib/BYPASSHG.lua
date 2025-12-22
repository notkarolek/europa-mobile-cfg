

local M = {}


M.sf = require('sampfuncs')
M.ds = false
M.imgui = require 'mimgui'
M.ffi = require 'ffi'
M.FontFlags = require('lib.moonloader').font_flag
M.weapons = require 'game.weapons'
M.sampev = require('lib.samp.events')
M.faicons = require('fAwesome6')
M.listKS = M.imgui.new.bool(false)
M.listHGC = M.imgui.new.bool(false)
M.sizeX, M.sizeY = getScreenResolution()

return M
