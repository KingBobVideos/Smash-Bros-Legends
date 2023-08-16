#############################################################################
Character Costumes are decompressed in the Network Heap [Kapedani, DukeItOut]
#
# This avoids a conflict where final smashes and compressed costumes
# attempted to use the same memory allocation, causing crashes.
#############################################################################
op li r9, 6 @ $8084FE2C
# The following gets rid of the pause/endgame buffer
# The game can allocate a new one when it needs to. 
HOOK @ $8084FDB8            
{
    lis r3, 0x805A
    lwz r3, 0x90(r3)
    lis r12, 0x8003            
    ori r12, r12, 0x7BE4    
    mtctr r12                
    bctrl                    
    mr r3, r26        # Original operation
}

####################################################
Bowser and Giga Bowser Can Be Compressed [DukeItOut]
####################################################
op NOP @ $808275B4
byte 0x4C @ $8081DF63    # Used by Bowser
byte 0x6C @ $8081DF87    # Used by Giga Bowser!