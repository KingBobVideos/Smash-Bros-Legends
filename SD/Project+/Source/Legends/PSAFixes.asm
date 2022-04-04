Project Ganondorf Fix v2.1 [HyperL!nk, BronzeGreekGod, PyotrLuzhin]
* 04AD7324 00006DAA

Requirement 0 (Thread has ended) returns True if no args passed [Eon]
#made since people incorrectly assumed requirement 0 was "character exists" and was sortof used as a "if True" requirement.
#this meant anywhere that requirement was used without requirements then its final functionality was based on whatever happened to be next in the file.
#so this is to make sure that command is consistent
HOOK @ $807826DC
{
    mr r3, r27
    lwz r12, 0x0(r3)
    lwz r12, 0x14(r12)
    mtctr r12 
    bctrl #getSize()
    cmpwi r3, 0x2
    bge cont
    #not enough args so dont read invalid data
    li r3, 1
    lis r12, 0x8078
    ori r12, r12, 0x54B4
    mtctr r12 
    bctr
cont:
    mr r3, r27
}
