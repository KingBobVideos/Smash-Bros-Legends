PSA command 11210100 sets next GFX anim index [Eon]
HOOK @ $807A55F0
{
    li r3, 0
    bne %end%
    lwz r12, 0(r21)
    mr r4, r21
    addi r3, r1, 0x818
    lwz r12, 0x1C(r12)
    mtctr r12 
    bctrl 
    addi r3, r1, 0x818
    stw r31, 0x10(r3) #store moduleAccesser for getInt to use
    li r4, 0
    #soAnimCmdArgList.getInt(animArgList, index) #static function
    lis r12, 0x8077 
    ori r12, r12, 0xDFDC
    mtctr r12 
    bctrl
    mr r27, r3

    #ecMgr.getInstance() #static function
    lis r12, 0x807A
    ori r12, r12, 0x2874
    mtctr r12 
    bctrl
    mr r4, r27
    mr r5, r27
    mr r6, r27
    mr r7, r27
    mr r8, r27
    mr r9, r27
    #ecMgr.presetAnimIdx(i, i, i, i, i, i, i) #static function
    lis r12, 0x8006
    ori r12, r12, 0x06A8
    mtctr r12 
    bctrl
    li r3, 1
}

#######################################################################
Dedede Clones Fix [MarioDox]
#######################################################################
.Macro DededeFix(<CloneID>)
{
  cmpwi r3, <CloneID>
  beq %END%
}

HOOK @ $80aa1544
{
  %DededeFix(0x20) //Dedede
}
HOOK @ $80aa0af0
{
  %DededeFix(0x20) //Dedede
}
HOOK @ $80aa0d4c
{
  %DededeFix(0x20) //Dedede
}
HOOK @ $8088f768
{
  %DededeFix(0x20) //Dedede
}
HOOK @ $8088e758
{
  %DededeFix(0x20) //Dedede
}
HOOK @ $8088f120
{
  %DededeFix(0x20) //Dedede
}
HOOK @ $8088fa50
{
  %DededeFix(0x20) //Dedede
}
HOOK @ $80890050
{
  %DededeFix(0x20) //Dedede
}

##################################################
Bowser Clone Fire Breath Bone Fix [KingJigglypuff]
##################################################
.macro BoneIDFix(<FighterID>, <BoneID>)
{
    cmpwi r28, <FighterID>
    bne- 0x0C
    li r5, <BoneID>
    b %END%
}
HOOK @ $80A391F8        #Use Register 28, followed by Fighter ID and Bone ID
{
    %BoneIDFix(0x69, 0x21)        #Charizard Clone Test
    li r5, 0x33                        #If not defined, use Bowser
}
* 06A391FC 0000000C
* 809B00d8 38610008
* 38C10020 00000000