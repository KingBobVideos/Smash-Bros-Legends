#.include source/Extras/CostumeAddition.asm # If trying to add more than 15 costumes, use this code to load all costumes from the result portraits, instead of the CSS file.
											# Note that in its current state, this code lags on console when multiple people try to scroll through the CSS at the same time.
											# Troubleshooting for this code will not be supported until it is further updated in the future!
#.include source/Extras/AI/AiDebug.asm 		# Displays AI debug for CPU in P1 slot. Incompatible with CodeMenu.asm (In RSBE01.txt). One or the other must be ignored with # in front of .include

#.include source/Extras/USBGecko.asm 		# Adds support for Gecko codes passed in by a USB Gecko

.include source/Extras/AllStar.asm
.include source/Extras/Angle.asm
.include source/Extras/CustomEnding.asm
.include source/Extras/Maths.asm
.include source/Extras/SoundbankFix.asm
.include source/Extras/VariableParameter.asm
.include source/Extras/BigHeadMode.asm
.include "source/Extras/Input Buffer.asm"
.include "source/Extras/L-Cancel PreBuffer.asm"
.include source/Extras/L-Cancel.asm
.include source/Extras/RandomAngleMode.asm
.include source/Extras/ScaleModifier.asm
.include source/Extras/SpeedModifier.asm
.include source/Extras/WarMode.asm

###########################
Pointer Wizardry v1.1 [Eon]
###########################
* C27ACE9C 00000088
* 7C600774 2C000015
* 41800430 2C00001D
* 41810428 4800000D
* 38000064 4800041C
* 9421FF00 BC410020
* 7C0802A6 90010104
* 7C700774 7FEFFB78
* 823D0008 8A310002
* 3A400002 3A600000
* 2C100016 4182000C
* 2C100019 40820008
* 3A520001 2C10001A
* 41800050 3A7F0008
* 3A10FFFB 3DC08000
* 7C137000 4180011C
* 3DC08180 39CEFFFC
* 7C137000 40810020
* 3DC09000 7C137000
* 41800100 3DC09400
* 39CEFFFC 7C137000
* 418100F0 7C128800
* 4080001C 82730000
* 7E459378 480000ED
* 7E73FA14 3A520001
* 4BFFFFAC 38A00001
* 3BE00001 4800027D
* 2C100015 41820028
* 2C100016 41820034
* 2C100017 41820048
* 2C100018 41820050
* 2C100019 41820058
* 4800032C 83F30000
* C0330000 38A00000
* 48000241 48000318
* 38A00002 4800008D
* 82730000 7E7FF838
* 38A00000 48000225
* 480002FC 38A00000
* 48000071 93F30000
* 480002EC 38A00000
* 480000E9 93F30000
* 480002DC 38A00000
* 48000185 2C1F0000
* 40820020 38A00002
* 48000041 81D30000
* 7FFFF8F8 7DDFF838
* 93F30000 480002B0
* 38A00002 48000025
* 81D30000 7DDFFB78
* 93F30000 48000298
* 38A00001 3BE00000
* 480001B1 48000288
* 7DC802A6 38000000
* 7FA3EB78 90010250
* 38810250 98010254
* 819D0000 818C0020
* 7D8903A6 4E800421
* 80610250 80030000
* 2C000000 40820010
* 80610250 83E30004
* 4800023C 2C000002
* 40820010 80610250
* 83E30004 48000228
* 2C000005 40820220
* 7DE37B78 80810250
* 80840004 38A00000
* 3D808079 398C7104
* 7D8903A6 4E800421
* 7C7F1B78 480001F8
* 7DC802A6 38000000
* 7FA3EB78 90010250
* 38810250 98010254
* 819D0000 818C0020
* 7D8903A6 4E800421
* 80610250 80030000
* 2C000001 40820044
* 80A10250 3C004330
* 3C8080AD 3C6080AD
* 80A50004 90010278
* 6CA08000 C8447A60
* 9001027C C0037A58
* C8210278 EC211028
* EFE10024 D3E1027C
* 83E1027C 48000180
* 2C000005 40820178
* 7DE37B78 80810250
* 80840004 38A00000
* 3D808079 398C6F14
* 7D8903A6 4E800421
* D021027C 83E1027C
* 4800014C 7DC802A6
* 38000000 7FA3EB78
* 90010250 38810250
* 98010254 819D0000
* 818C0020 7D8903A6
* 4E800421 80610250
* 80030000 2C000003
* 40820010 80610250
* 83E30004 48000108
* 2C000005 40820100
* 7DE37B78 80810250
* 80840004 38A00000
* 3D80807B 398CCCDC
* 7D8903A6 4E800421
* 7C7F1B78 480000D8
* 7DC802A6 3BC00000
* 7FA3EB78 93C10248
* 38810248 9BC1024C
* 819D0000 818C0020
* 7D8903A6 4E800421
* 80610248 80030000
* 2C000005 408200A0
* 80610248 83C30004
* 819D0000 88630004
* 7063000F 2C030001
* 4182002C 2C030002
* 41820040 819C0000
* 7F83E378 7FE4FB78
* 7FC5F378 818C001C
* 7D8903A6 4E800421
* 4800005C 819C0000
* 7F83E378 7FC4F378
* 818C003C 7D8903A6
* 4E800421 48000040
* 2C1F0000 40820020
* 819C0000 7F83E378
* 7FC4F378 818C0054
* 7D8903A6 4E800421
* 4800001C 819C0000
* 7F83E378 7FC4F378
* 818C0050 7D8903A6
* 4E800421 7DC803A6
* 4E800020 80010104
* 7C0803A6 B8410020
* 38210100 4E800020
* 60000000 00000000
* 047ACE78 2C000033

############################################################
BrawlEx Clone Engine v2.0.0.0 Subspace Fix (RSBE.Ver) [JOJI]
############################################################
* C2026074 00000003
* 3CA08000 7C042840
* 41810008 48000008
* 80A40008 00000000
* C2026078 00000006
* 3C808001 7C042840
* 41800020 3C808041
* 60846B70 90840000
* 38800000 6084F060
* 3CA08000 48000008
* 80850004 00000000
* 20416B70 80416B70
* 04416B70 00000000
* 077BA5A0 000000A0
* 80B84500 817BA5A0
* 817DA5A0 00020000
* 004C00CC 00010001
* 00010F20 00010F20
* 817BA600 00CCCCCC
* 00000000 00000000
* 00000000 00000000
* CCCCCCCC CCCCCCCC
* CCCCCCCC CCCCCCCC
* CCCCCCCC CCCCCCCC
* CCCCCCCC CCCCCCCC
* CCCCCCCC CCCCCCCC
* 817BA5A0 00000000
* 817BA620 00000000
* 00000000 CCCCCCCC
* CCCCCCCC CCCCCCCC
* 817BA5A0 0000F060
* 817BA600 00000000
* 00000000 CCCCCCCC
* CCCCCCCC CCCCCCCC
* E0000000 80008000

######################################################
Clear Specific Transition Term Group PSA Command [Eon]
######################################################
#020E0100 = Clear Specific transition term, with argument
#020E0000 = Original command, left in tact, clears all transition terms
HOOK @ $80781F04
{
#is arg list empty   
    addi r3, r1, 0x138
    lwz r12, 0x0(r3)
    lwz r12, 0x18(r12)
    mtctr r12
    bctrl
    cmpwi r3, 1
    li r4, -1
    beq end #if empty, pass arg as -1
#else get value of arg 0 as pass as r4
    addi r3, r1, 0x138
    li r4, 0
    stw r28, 0x10(r3)
    lis r12, 0x8077
    ori r12, r12, 0xDFDC
    mtctr r12
    bctrl
    mr r4, r3
end:
    mr r3, r26
    lwz r12, 0x0(r26)
}

######################################
Grabboxes work out of any action [Eon]
######################################
op nop @ $8083D250
op nop @ $8083D25C

###################################################
Falco can use his own final smash files [DukeItOut]
###################################################
op b 0x58 @ $8084D5B8
op b 0x5C @ $8084D450

############################
Crush anywhere anytime [Eon]
############################ 
op nop @ $8083b1ac 

#########################################################
Null GroundModule makes rayCheckTarget return false [Eon]
#########################################################
HOOK @ $80734254
{
    mr r28, r3
    #target.groundModule.isNull()
    lwz r12, 0x8(r3)
    lwz r12, 0x10(r12)
    mtctr r12
    bctrl 
    cmpwi r3, 1 
    beq isNull #if isNull, return false
    #this.groundModule.isNull()
    mr r3, r29
    lis r12, 0x8079
    ori r12, r12, 0x77D8
    mtctr r12
    bctrl
    lwz r12, 0x8(r3)
    lwz r12, 0x10(r12)
    mtctr r12
    bctrl 
    cmpwi r3, 1
    bne notNull 
isNull:
    li r3, 0 #return false
    lis r12, 0x8073
    ori r12, r12, 0x4300
    mtctr r12
    bctr
notNull:
    mr r3, r28 #do normal function with raycast
}