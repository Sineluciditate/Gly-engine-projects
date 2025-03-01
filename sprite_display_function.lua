
--[[
Sprite Export Manual for Gly Engine

1. Introduction

This project aims to enable sprite export in 
the browser version of the Gly Engine.

2. Creating and Copying Sprites

Sprites must be created in TIC-80.
link of TIC-80( https://tic80.com/create )
After creating a sprite, copy the area where it is located
(all sizes are supportable).

3. Color Limitations

You can use only 15 different colors at the same time.

One color will be sacrificed to represent the empty pixel.

This limitation exists due to the way TIC-80 operates.

4. Color Interpretation

Each color in the sprite is represented by a number 
and will be interpreted by the export function.

The color palette has been adjusted to be as close
as possible to TIC-80’s palette for an intuitive experience.

5. Changing the Color Palette

Changing TIC-80’s palette will not affect the colors displayed
 in the export function.

To correctly modify colors, you must adjust the 16 
available colors within the export function itself.

6. Final Considerations

Make sure to follow these limitations to avoid export errors.

edit:Last tip, use my website to compress the strings, 
but know that you will not be able to modify them again in 
tic 80 if compressed.
link of my web site( https://sinel.neocities.org/ )


Good luck! >:P

]]

local function init(std, game)
nzpo=false -- unzip operation.
frame_timer=0
current_frame=1
sprite={'[aac]0200222[37]02002200022[34]02[9]022[31]02[4c]0[3]2[2b]02[6]0[3]2[7]02[29]02[5]02[3b]02[39]02[3]02[7]0222[32]02[7]0[8]2[35]0[4]200[3]2[27]020002[5]0[d]2[31]0[a]20022[25]020002[5]0[6]2[7]02[1e]04[4]02002[4]0[5]2[2a]044[3]02002[3]0[6]200[3]2[24]0404[3]020200[4]21110[3]20[4]2[1f]04404400022000222111000[8]2[20]044004[3]020002221000[6]20022[1f]0440004400dc200222100[4]211200222[1e]044[3]0440dcd000200022211100100022[1d]044[5]04dcdd0002002201[3]011[3]02000',
'[19]044[7]044ddc0c20c22[b]02[10]040004[5]044[9]0444dddcdc[1e]04[9]044[d]044dcdcd00440004[14]04[8]044[10]0[3]4c[9]0444[19]04[14]0[8]4[7]0404[b]04[7]044[19]0[9]4[3]04[11]0444[14]0c00ccc00c[3]0[7]4[b]04[3]044[17]0ccc0c0ccc[6]0[4]4[a]0400044[1b]0[4]c[a]044[a]040044[1b]0cc0c0c0cc[8]04[a]0[3]4[1d]0c[6]0c[7]04[a]0444[3b]0444[19]08808808[1b]04[17]088808808808808[6]08[11]04[11]0808808880880880880880[3]808[12]04[f]09809[4]80880880880[6]8008[11]04[c]0900980888088088088088088808088088[17]09800099880988098088088088088088808008088[17]09980090880988088088088[4]08088808008088[17]09980090880888088088[4]01110008088088088[16]08999808088008808[7]0[4]1008088080088[16]08999808088808111[6]0110001100[4]80808[16]0989980808880[4]1[5]01[4]010[5]808088[14]08988980800801100011[c]0[3]80888088[14]0[3]8980880001[12]0[3]808[3]08[14]098088800898[10]01000[3]808[19]09808880889880001[b]01000[4]800[3]d[13]089808880089980001[a]01[3]0[5]8[5]d[12]08980888008998[3]01[6]010111000d[4]8dccddd[12]08880888009898800[3]10100[4]1[3]0d[4]80ccddd[12]0980[3]80c98988c000[8]1[3]0ddd[4]80cccdcd[11]0980888c0cc8988cc[3]0[4]1[4]0[3]d[3]8c0dccdcc[11]09[3]8cc0cc8[3]9cd[5]01[5]0dd0d[3]8c0dcc[3]d[10]0988[3]c0cc89989cdd[8]0ddd000[4]8[4]cddcd[10]0988[3]c0cc889880c00ddd[3]0[3]d0dd[4]8dccdcdcdd[10]090[4]c00cc999880cc0[4]d0[3]d0dd[4]8d0c[5]d[f]0990[5]c0cc89988ccc0[4]d00dd0ddd[4]80dd00[3]d[f]098[6]c00c89988[3]c0ddd00d00[3]d[4]8dd[3]0d[11]098[6]c00cc89888ccc00d00[7]d[4]8000dd[13]0988[6]c0cc89988[4]c0[8]d0[3]80dcccddc[12]088[6]cd00089988[5]c[6]d0[4]8dccc[3]d[11]088ddcddcccd0d089898[a]c000[4]8[4]d[14]0888[3]dcccddd089989[4]0cc[4]0cc[4]8ddd000d[12]0888000ddccdd0089980[3]c000[4]c01[4]8[3]0ddcd[11]08880cc0dc[4]d8999000[8]c0011[3]8d[3]cddd[11]0888[3]c[6]d898981110ccc[3]02011[3]8dcccddd[12]0888[3]c[4]0dd89898122210c02022211[3]8ddeeed[13]0888[7]c000889881222100[5]211[3]8[3]e[3]0ee[f]0880[7]cddd08998812221011211211888eee000[3]e[f]08880[8]cd0188998112100[4]122188eee0[3]e00eee[d]088800ddccdcccd01188988122cd[4]12111[c]e[e]0[3]80dddcdcddd0008898ddc00ddd11121ff[8]e000ee[d]0[4]80[8]d018898dc00ccddd112fff[c]e[e]0[4]800[3]d00dd01888cc00ccc[7]f[9]e00e[f]0[5]8[3]0[3]d0018ccc00cccfff[11]e[10]0808880cdddc[3]d00ccc00[3]cf[9]ef[6]e[12]0808880ccd[3]cd000ccc0[3]cff[6]ef[3]80001[14]0808800[5]cdd0dd[3]0[3]cffeeefff01[3]80[7]1[f]0808800[4]cdc0dcc0c0[3]cffeeef00111[3]8[8]1[f]0808800[3]cddccdc0cc0[3]c00fd[3]0111888[7]12111[c]08808800[3]c00ccc00[5]c00eddcc0[3]188811221[4]21211[a]0880800[3]c0[3]c00ccc[4]0edddc011222888[3]21[7]2102[8]088080[3]c0ccc000ccc[4]0eeddcc01[3]2888[3]211[6]2112[8]0[3]80[3]c0ccc0[5]c000eddcc0001[4]288[d]2120',
'[19]044[7]044ddc0c20c22[b]02[10]040004[5]044[9]0444dddcdc[1e]04[9]044[d]044dcdcd00440004[14]04[8]044[10]0[3]4c[9]0444[19]04[14]0[8]4[7]0404[b]04[7]044[19]0[9]4[3]04[11]0444[14]0c00ccc00c[3]0[7]4[b]04[3]044[17]0ccc0c0ccc[6]0[4]4[a]0400044[1b]0[4]c[a]044[a]040044[1b]0cc0c0c0cc[8]04[a]0[3]4[1d]0c[6]0c[7]04[a]0444[3b]0444[19]08808808[1b]04[17]088808808808808[6]08[11]04[11]0808808880880880880880[3]808[12]04[f]09809[4]80880880880[6]8008[11]04[c]0900980888088088088088088808088088[17]09800099880988098088088088088088808008088[17]09980090880988088088088[4]08088808008088[17]09980090880888088088[4]02220008088088088[16]08999808088008808[7]0[4]2008088080088[16]08999808088808222[6]0220002200[4]80808[16]0989980808880[4]2[5]02[4]020[5]808088[14]08988980800802200022[c]0[3]80888088[14]0[3]8980880002[12]0[3]808[3]08[14]098088800898[10]02000[3]808[19]09808880889880002[b]02000[4]800[3]d[13]089808880089980002[a]02[3]0[5]8[5]d[12]08980888008998[3]02[6]020222000d[4]8dccddd[12]08880888009898800[3]20200[4]2[3]0d[4]80ccddd[12]0980[3]80c98988c000[8]2[3]0ddd[4]80cccdcd[11]0980888c0cc8988cc[3]0[4]2[4]0[3]d[3]8c0dccdcc[11]09[3]8cc0cc8[3]9cd[5]02[5]0dd0d[3]8c0dcc[3]d[10]0988[3]c0cc89989cdd[8]0ddd000[4]8[4]cddcd[10]0988[3]c0cc889880c00ddd[3]0[3]d0dd[4]8dccdcdcdd[10]090[4]c00cc999880cc0[4]d0[3]d0dd[4]8d0c[5]d[f]0990[5]c0cc89988ccc0[4]d00dd0ddd[4]80dd00[3]d[f]098[6]c00c89988[3]c0ddd00d00[3]d[4]8dd[3]0d[11]098[6]c00cc89888ccc00d00[7]d[4]8000dd[13]0988[6]c0cc89988[4]c0[8]d0[3]80dcccddc[12]088[6]cd00089988[5]c[6]d0[4]8dccc[3]d[11]088ddcddcccd0d089898[a]c000[4]8[4]d[14]0888[3]dcccddd089989[4]0cc[4]0cc[4]8ddd000d[12]0888000ddccdd0089980[3]c000[4]c01[4]8[3]0ddcd[11]08880cc0dc[4]d8999000[8]c0011[3]8d[3]cddd[11]0888[3]c[6]d898981110ccc[3]02011[3]8dcccddd[12]0888[3]c[4]0dd89898122210c02022211[3]8ddeeed[13]0888[7]c000889881222100[5]211[3]8[3]e[3]0ee[f]0880[7]cddd08998812221011211211888eee000[3]e[f]08880[8]cd0188998112100[4]122188eee0[3]e00eee[d]088800ddccdcccd01188988122cd[4]12111[c]e[e]0[3]80dddcdcddd0008898ddc00ddd11121ff[8]e000ee[d]0[4]80[8]d018898dc00ccddd112fff[c]e[e]0[4]800[3]d00dd01888cc00ccc[7]f[9]e00e[f]0[5]8[3]0[3]d0018ccc00cccfff[11]e[10]0808880cdddc[3]d00ccc00[3]cf[9]ef[6]e[12]0808880ccd[3]cd000ccc0[3]cff[6]ef[3]80001[14]0808800[5]cdd0dd[3]0[3]cffeeefff01[3]80[7]1[f]0808800[4]cdc0dcc0c0[3]cffeeef00111[3]8[8]1[f]0808800[3]cddccdc0cc0[3]c00fd[3]0111888[7]12111[c]08808800[3]c00ccc00[5]c00eddcc0[3]188811221[4]21211[a]0880800[3]c0[3]c00ccc[4]0edddc011222888[3]21[7]2102[8]088080[3]c0ccc000ccc[4]0eeddcc01[3]2888[3]211[6]2112[8]0[3]80[3]c0ccc0[5]c000eddcc0001[4]288[d]2120',
'[19]044[7]044ddc0c20c22[b]02[10]040004[5]044[9]0444dddcdc[1e]04[9]044[d]044dcdcd00440004[14]04[8]044[10]0[3]4c[9]0444[19]04[14]0[8]4[7]0404[b]04[7]044[19]0[9]4[3]04[11]0444[14]0c00ccc00c[3]0[7]4[b]04[3]044[17]0ccc0c0ccc[6]0[4]4[a]0400044[1b]0[4]c[a]044[a]040044[1b]0cc0c0c0cc[8]04[a]0[3]4[1d]0c[6]0c[7]04[a]0444[3b]0444[19]08808808[1b]04[17]088808808808808[6]08[11]04[11]0808808880880880880880[3]808[12]04[f]09809[4]80880880880[6]8008[11]04[c]0900980888088088088088088808088088[17]09800099880988098088088088088088808008088[17]09980090880988088088088[4]08088808008088[17]09980090880888088088[4]03330008088088088[16]08999808088008808[7]0[4]3008088080088[16]08999808088808333[6]0330003300[4]80808[16]0989980808880[4]3[5]03[4]030[5]808088[14]08988980800803300033[c]0[3]80888088[14]0[3]8980880003[12]0[3]808[3]08[14]098088800898[10]03000[3]808[19]09808880889880003[b]03000[4]800[3]d[13]089808880089980003[a]03[3]0[5]8[5]d[12]08980888008998[3]03[6]030333000d[4]8dccddd[12]08880888009898800[3]30300[4]3[3]0d[4]80ccddd[12]0980[3]80c98988c000[8]3[3]0ddd[4]80cccdcd[11]0980888c0cc8988cc[3]0[4]3[4]0[3]d[3]8c0dccdcc[11]09[3]8cc0cc8[3]9cd[5]03[5]0dd0d[3]8c0dcc[3]d[10]0988[3]c0cc89989cdd[8]0ddd000[4]8[4]cddcd[10]0988[3]c0cc889880c00ddd[3]0[3]d0dd[4]8dccdcdcdd[10]090[4]c00cc999880cc0[4]d0[3]d0dd[4]8d0c[5]d[f]0990[5]c0cc89988ccc0[4]d00dd0ddd[4]80dd00[3]d[f]098[6]c00c89988[3]c0ddd00d00[3]d[4]8dd[3]0d[11]098[6]c00cc89888ccc00d00[7]d[4]8000dd[13]0988[6]c0cc89988[4]c0[8]d0[3]80dcccddc[12]088[6]cd00089988[5]c[6]d0[4]8dccc[3]d[11]088ddcddcccd0d089898[a]c000[4]8[4]d[14]0888[3]dcccddd089989[4]0cc[4]0cc[4]8ddd000d[12]0888000ddccdd0089980[3]c000[4]c01[4]8[3]0ddcd[11]08880cc0dc[4]d8999000[8]c0011[3]8d[3]cddd[11]0888[3]c[6]d898981110ccc[3]02011[3]8dcccddd[12]0888[3]c[4]0dd89898122210c02022211[3]8ddeeed[13]0888[7]c000889881222100[5]211[3]8[3]e[3]0ee[f]0880[7]cddd08998812221011211211888eee000[3]e[f]08880[8]cd0188998112100[4]122188eee0[3]e00eee[d]088800ddccdcccd01188988122cd[4]12111[c]e[e]0[3]80dddcdcddd0008898ddc00ddd11121ff[8]e000ee[d]0[4]80[8]d018898dc00ccddd112fff[c]e[e]0[4]800[3]d00dd01888cc00ccc[7]f[9]e00e[f]0[5]8[3]0[3]d0018ccc00cccfff[11]e[10]0808880cdddc[3]d00ccc00[3]cf[9]ef[6]e[12]0808880ccd[3]cd000ccc0[3]cff[6]ef[3]80001[14]0808800[5]cdd0dd[3]0[3]cffeeefff01[3]80[7]1[f]0808800[4]cdc0dcc0c0[3]cffeeef00111[3]8[8]1[f]0808800[3]cddccdc0cc0[3]c00fd[3]0111888[7]12111[c]08808800[3]c00ccc00[5]c00eddcc0[3]188811221[4]21211[a]0880800[3]c0[3]c00ccc[4]0edddc011222888[3]21[7]2102[8]088080[3]c0ccc000ccc[4]0eeddcc01[3]2888[3]211[6]2112[8]0[3]80[3]c0ccc0[5]c000eddcc0001[4]288[d]2120',
'[19]044[7]044ddc0c20c22[b]02[10]040004[5]044[9]0444dddcdc[1e]04[9]044[d]044dcdcd00440004[14]04[8]044[10]0[3]4c[9]0444[19]04[14]0[8]4[7]0404[b]04[7]044[19]0[9]4[3]04[11]0444[14]0c00ccc00c[3]0[7]4[b]04[3]044[17]0ccc0c0ccc[6]0[4]4[a]0400044[1b]0[4]c[a]044[a]040044[1b]0cc0c0c0cc[8]04[a]0[3]4[1d]0c[6]0c[7]04[a]0444[3b]0444[19]08808808[1b]04[17]088808808808808[6]08[11]04[11]0808808880880880880880[3]808[12]04[f]09809[4]80880880880[6]8008[11]04[c]0900980888088088088088088808088088[17]09800099880988098088088088088088808008088[17]09980090880988088088088[4]08088808008088[17]09980090880888088088[4]04440008088088088[16]08999808088008808[7]0[4]4008088080088[16]08999808088808444[6]0440004400[4]80808[16]0989980808880[4]4[5]04[4]040[5]808088[14]08988980800804400044[c]0[3]80888088[14]0[3]8980880004[12]0[3]808[3]08[14]098088800898[10]04000[3]808[19]09808880889880004[b]04000[4]800[3]d[13]089808880089980004[a]04[3]0[5]8[5]d[12]08980888008998[3]04[6]040444000d[4]8dccddd[12]08880888009898800[3]40400[4]4[3]0d[4]80ccddd[12]0980[3]80c98988c000[8]4[3]0ddd[4]80cccdcd[11]0980888c0cc8988cc[3]0[4]4[4]0[3]d[3]8c0dccdcc[11]09[3]8cc0cc8[3]9cd[5]04[5]0dd0d[3]8c0dcc[3]d[10]0988[3]c0cc89989cdd[8]0ddd000[4]8[4]cddcd[10]0988[3]c0cc889880c00ddd[3]0[3]d0dd[4]8dccdcdcdd[10]090[4]c00cc999880cc0[4]d0[3]d0dd[4]8d0c[5]d[f]0990[5]c0cc89988ccc0[4]d00dd0ddd[4]80dd00[3]d[f]098[6]c00c89988[3]c0ddd00d00[3]d[4]8dd[3]0d[11]098[6]c00cc89888ccc00d00[7]d[4]8000dd[13]0988[6]c0cc89988[4]c0[8]d0[3]80dcccddc[12]088[6]cd00089988[5]c[6]d0[4]8dccc[3]d[11]088ddcddcccd0d089898[a]c000[4]8[4]d[14]0888[3]dcccddd089989[4]0cc[4]0cc[4]8ddd000d[12]0888000ddccdd0089980[3]c000[4]c01[4]8[3]0ddcd[11]08880cc0dc[4]d8999000[8]c0011[3]8d[3]cddd[11]0888[3]c[6]d898981110ccc[3]02011[3]8dcccddd[12]0888[3]c[4]0dd89898122210c02022211[3]8ddeeed[13]0888[7]c000889881222100[5]211[3]8[3]e[3]0ee[f]0880[7]cddd08998812221011211211888eee000[3]e[f]08880[8]cd0188998112100[4]122188eee0[3]e00eee[d]088800ddccdcccd01188988122cd[4]12111[c]e[e]0[3]80dddcdcddd0008898ddc00ddd11121ff[8]e000ee[d]0[4]80[8]d018898dc00ccddd112fff[c]e[e]0[4]800[3]d00dd01888cc00ccc[7]f[9]e00e[f]0[5]8[3]0[3]d0018ccc00cccfff[11]e[10]0808880cdddc[3]d00ccc00[3]cf[9]ef[6]e[12]0808880ccd[3]cd000ccc0[3]cff[6]ef[3]80001[14]0808800[5]cdd0dd[3]0[3]cffeeefff01[3]80[7]1[f]0808800[4]cdc0dcc0c0[3]cffeeef00111[3]8[8]1[f]0808800[3]cddccdc0cc0[3]c00fd[3]0111888[7]12111[c]08808800[3]c00ccc00[5]c00eddcc0[3]188811221[4]21211[a]0880800[3]c0[3]c00ccc[4]0edddc011222888[3]21[7]2102[8]088080[3]c0ccc000ccc[4]0eeddcc01[3]2888[3]211[6]2112[8]0[3]80[3]c0ccc0[5]c000eddcc0001[4]288[d]2120',
'[19]044[7]044ddc0c20c22[b]02[10]040004[5]044[9]0444dddcdc[1e]04[9]044[d]044dcdcd00440004[14]04[8]044[10]0[3]4c[9]0444[19]04[14]0[8]4[7]0404[b]04[7]044[19]0[9]4[3]04[11]0444[14]0c00ccc00c[3]0[7]4[b]04[3]044[17]0ccc0c0ccc[6]0[4]4[a]0400044[1b]0[4]c[a]044[a]040044[1b]0cc0c0c0cc[8]04[a]0[3]4[1d]0c[6]0c[7]04[a]0444[3b]0444[19]08808808[1b]04[17]088808808808808[6]08[11]04[11]0808808880880880880880[3]808[12]04[f]09809[4]80880880880[6]8008[11]04[c]0900980888088088088088088808088088[17]09800099880988098088088088088088808008088[17]09980090880988088088088[4]08088808008088[17]09980090880888088088[4]0c4c0008088088088[16]08999808088008808[7]0cc4cc008088080088[16]08999808088808c4c[6]04c000c400[4]80808[16]0989980808880cc4cc[5]04[4]040[5]808088[14]08988980800804c000c4[c]0[3]80888088[14]0[3]8980880004[12]0[3]808[3]08[14]098088800898[10]04000[3]808[19]0980888088988000c[b]04000[4]800[3]d[13]089808880089980004[a]0c[3]0[5]8[5]d[12]08980888008998[3]0c[6]0c0cc4000d[4]8dccddd[12]08880888009898800c4c40c00[4]c[3]0d[4]80ccddd[12]0980[3]80c98988c000[8]c[3]0ddd[4]80cccdcd[11]0980888c0cc8988cc[3]0[4]c[4]0[3]d[3]8c0dccdcc[11]09[3]8cc0cc8[3]9cd[5]0c[5]0dd0d[3]8c0dcc[3]d[10]0988[3]c0cc89989cdd[8]0ddd000[4]8[4]cddcd[10]0988[3]c0cc889880c00ddd[3]0[3]d0dd[4]8dccdcdcdd[10]090[4]c00cc999880cc0[4]d0[3]d0dd[4]8d0c[5]d[f]0990[5]c0cc89988ccc0[4]d00dd0ddd[4]80dd00[3]d[f]098[6]c00c89988[3]c0ddd00d00[3]d[4]8dd[3]0d[11]098[6]c00cc89888ccc00d00[7]d[4]8000dd[13]0988[6]c0cc89988[4]c0[8]d0[3]80dcccddc[12]088[6]cd00089988[5]c[6]d0[4]8dccc[3]d[11]088ddcddcccd0d089898[a]c000[4]8[4]d[14]0888[3]dcccddd089989[4]0cc[4]0cc[4]8ddd000d[12]0888000ddccdd0089980[3]c000[4]c01[4]8[3]0ddcd[11]08880cc0dc[4]d8999000[8]c0011[3]8d[3]cddd[11]0888[3]c[6]d898981110ccc[3]02011[3]8dcccddd[12]0888[3]c[4]0dd89898122210c02022211[3]8ddeeed[13]0888[7]c000889881222100[5]211[3]8[3]e[3]0ee[f]0880[7]cddd08998812221011211211888eee000[3]e[f]08880[8]cd0188998112100[4]122188eee0[3]e00eee[d]088800ddccdcccd01188988122cd[4]12111[c]e[e]0[3]80dddcdcddd0008898ddc00ddd11121ff[8]e000ee[d]0[4]80[8]d018898dc00ccddd112fff[c]e[e]0[4]800[3]d00dd01888cc00ccc[7]f[9]e00e[f]0[5]8[3]0[3]d0018ccc00cccfff[11]e[10]0808880cdddc[3]d00ccc00[3]cf[9]ef[6]e[12]0808880ccd[3]cd000ccc0[3]cff[6]ef[3]80001[14]0808800[5]cdd0dd[3]0[3]cffeeefff01[3]80[7]1[f]0808800[4]cdc0dcc0c0[3]cffeeef00111[3]8[8]1[f]0808800[3]cddccdc0cc0[3]c00fd[3]0111888[7]12111[c]08808800[3]c00ccc00[5]c00eddcc0[3]188811221[4]21211[a]0880800[3]c0[3]c00ccc[4]0edddc011222888[3]21[7]2102[8]088080[3]c0ccc000ccc[4]0eeddcc01[3]2888[3]211[6]2112[8]0[3]80[3]c0ccc0[5]c000eddcc0001[4]288[d]2120'
}
sequence_of_sprites={2,3,4,5,6,6,5,4,3,2}
end

local function loop(std, game)
if frame_timer > 2 then  
    current_frame = current_frame + 1  
    frame_timer = 0  
end  

if current_frame > 10 then  
    current_frame = 1  
end
frame_timer=frame_timer+1
end

local function draw(std, game)

local drawC=std.draw.color
local Color=std.color
local White,Lightgray,Gray,Darkgray,Yellow,Gold,Orange,Pink,Red,Maroon,Green,Lime,Darkgreen,Skyblue,Blue,Darkblue,Purple,Violet,Darkpurple,Beige,Brown,Darkbrown,Black,Blank,Magenta=Color.white,Color.lightgray,Color.gray,Color.darkgray,Color.yellow,Color.gold,Color.orange,Color.pink,Color.red,Color.maroon,Color.green,Color.lime,Color.darkgreen,Color.skyblue,Color.blue,Color.darkblue,Color.purple,Color.violet,Color.darkpurple,Color.beige,Color.brown,Color.darkbrown,Color.black,Color.blanck,Color.magenta


    std.draw.clear(std.color.black)
   
function sprite_div(Snumero)
 if Snumero<67 then
 div=8
 elseif Snumero<=265 then
   div=16
    elseif Snumero<=1057 then
       div=32
       else 
       div=64
    end
  return div
end

function UnpackeString(str, id)
    local endstring = ""
    local idL = string.sub(str, id, id)
    
    if idL == "[" then
        nzpo = true
        -- Move past the initial '['
        id = id + 1
        local hexNum = ""
        local char = string.sub(str, id, id)
        
        -- Read the hexadecimal number until the closing ']'
       while char ~= "]" do
            hexNum = hexNum .. char
            id = id + 1
            char = string.sub(str, id, id)
        end
        
        -- Convert the hexadecimal number to decimal
        local repeatCount = tonumber(hexNum, 16)
        
        -- Get the character to be repeated
        id = id + 1
        local charToRepeat = string.sub(str, id, id)
        
        -- Append the repeated character to the end string
        if repeatCount then
            for _ = 1, repeatCount+1 do
                endstring = endstring .. charToRepeat
            end
        end
        nzpo = false
        -- Move past the character that was repeated
        id = id + 1
    else
        -- If not within brackets, just append the current character
        endstring = endstring .. idL
        id = id + 1
    end

    return endstring, id
end

-- Function to decompress the entire string
function decompress(str)
    local result = ""
    local id = 1
    while id <= #str do
       local unpacked, newId = UnpackeString(str, id)
        result = result .. unpacked	
        id = newId
    end    
    return result
end

function draw_sprite(x, y,zoom,data1,ccl)
   local data=""
   local compressedString=data1  
   local decompressedString = decompress(compressedString)
  data=data..decompressedString     
   local div= sprite_div(#data)
   
    for i = 1, #data do
     local col = tonumber(data:sub(i,i),16)
     local div=sprite_div(#data) 
     local j=div*((i-1)//div)-(i-1)
     if col~=ccl then
    -- color palette
     if col==0 then drawC(Black) 
     elseif col==1 then drawC(Maroon) 
     elseif col==2 then drawC(Red)
     elseif col==3 then drawC(Orange) 
     elseif col==4 then drawC(Gold) 
     elseif col==5 then drawC(Green)
     elseif col==6 then drawC(Lime)
     elseif col==7 then drawC(Darkgreen)    
     elseif col==8 then drawC(Darkblue)   
     elseif col==9 then drawC(Blue)   
     elseif col==10 then drawC(Skyblue)
     elseif col==11 then drawC(Beige)
     elseif col==12 then drawC(White) 
     elseif col==13 then drawC(Lightgray)
     elseif col==14 then drawC(Gray)      
     elseif col==15 then drawC(Darkgray)
     end
     --end of color palette
      std.draw.rect(0,x-j*zoom,y+(((i-1)//div)*zoom),zoom,zoom)--pixel     
     end
    end	 
end
--example
local x,y=120,150
local zoom=3
local clear_color=0
draw_sprite(x,y-((8*zoom)*8),zoom,sprite[1],clear_color)--pirate hat
draw_sprite(x,y,zoom,sprite[sequence_of_sprites[current_frame]],clear_color)--character
end

local function exit(std, game)
end

local P = {
    meta={
        title='sprite displayer',
        author='sineluciditate(sinel)',
        description='show sprites!',
        version='1.0.0'
    },
    callbacks={
        init=init,
        loop=loop,
        draw=draw,
        exit=exit
    }
}

return P;
