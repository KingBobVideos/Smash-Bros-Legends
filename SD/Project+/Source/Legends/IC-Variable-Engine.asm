Custom IC-Variable Engine [Eon]
#exposes a range from IC-Basic[30000] to IC-Basic[30031]
#writes a pointer at 0x80548D00 to the function array.

#write pointer to function for IC-variable, e.g. to add IC-Basic[30000+i] write function pointer at (0x80548D00) + i*0x4

HOOK @ $8079721C
{
  cmpwi r4, 30000
  blt original
  subi r0, r4, 30000
  rlwinm r0, r0, 2, 0, 29
  lis r3, 0x8054
  ori r3, r3, 0x8D00
  lwz r3, 0x0(r3)
  lwzx r12, r3, r0
  cmpwi r12, 0
  beq exit  #if unset, return 0
  mr r3, r29  #r3 = soModuleAccessor of object
              #r4 = the IC-Basic requested
  mr r5, r31  #r5 = i honestly dont know but this is important enough to be passed through function calls in the other accessors so you get it too
  mtctr r12
  bctrl

exit:
  lis r12, 0x8079
  ori r12, r12, 0x72B4
  mtctr r12
  bctr
original:
  lwz r3, 0x8(r3)
}

  .BA<-functions  
  .BA->$80548D00 #function array pointer
  .RESET
  .GOTO->end
functions:
int[32] 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
end:

Timestamp at IC-Basic[30000] [Eon]

#first two lines get function pointer
  .BA<-CustomCommand
* 42100000 00000008 #BA+=8 to abuse Pulse command as an easy way to write a block of code
#get function array, write to wanted index, in this case 4*0x0 = 0x0
* 48000000 80548D00
* 54010000 00000000 #set second word to 4*IC-variable you want it to be
  .RESET
  .GOTO->end

CustomCommand:
PULSE
{
    stwu r1, -0x10(r1)
    mflr r0
    stw r0, 0x14(r1)

    #gfSceneManager.getInstance() static function
    #could just be replaced by `lwz r3, -0x43C0(r13)` if you feel like it`
    lis r12, 0x8002
    ori r12, r12, 0xD018
    mtctr r12 
    bctrl 

    #r4 = "scMelee"
    lis r4, 0x8070
    addi r4, r4, 0x1B50
    addi r4, r4, 64

    lis r12, 0x8002
    ori r12, r12, 0xD3F4
    mtctr r12 
    bctrl #gfSceneManager.searchScene("scMelee")

    lwz r3, 0x54(r3) #\scMelee.stOperatorRuleMelee.currentFrameCounter 
    lwz r3, 0xE8(r3) #/
    
    lwz r0, 0x14(r1)
    mtlr r0
    addi r1, r1, 0x10
    blr
}
end: