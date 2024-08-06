--[[pod_format="raw",created="2024-08-06 01:29:19",modified="2024-08-06 01:29:19",revision=0]]
window{
  width      = 280,
  height     = 180,
  resizeable = true,
  title      = "Gemini"
}

include("gemini.lua")
include("web.lua")

W=200
H=270

function get_url(url)
	local u=string.gsub(url,"gemini://","gemini/")
	web:GET("https://portal.mozz.us/"..u.."/?raw=1")
end	

yoff=-10
xoff=-10
function _init()
  get_url("gemini://geminiprotocol.net/docs/cheatsheet.gmi")
end
mx,my,mb,mwx,mwy=0,0,0,0,0

function _update()
	mx,my,mb,mwx,mwy=mouse()
	if btn(3) then yoff=yoff+1 end
	if btn(2) then yoff=yoff-1 end
	if btn(1) then xoff=xoff+1 end
	if btn(0) then xoff=xoff-1 end
	yoff=yoff-mwy
	xoff=xoff+mwx
	web:process_threads()
end	

function _draw()
	cls(th.bg)
	camera(xoff*4,yoff*4)
	web:render()
	--debug_ord()
end

function debug_ord()
	for x=0,15 do
		for y=0,15 do
			o=x+y*16
			color(8)
			print(chr(o),x*16,y*16+2)
			color(8)
			print(o,x*16,y*16+10)
		end
	end
end