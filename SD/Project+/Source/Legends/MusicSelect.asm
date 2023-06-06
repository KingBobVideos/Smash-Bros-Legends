#######################################
Select music for match on SSS [Squidgy]
#######################################
# Press a custom button while hovering over a stage to open the My Music screen
# Press the custom button to select the song and automatically start the match
# Press A to preview songs, or B to back out
# Only available in regular VS mode

# --CONTROL OPTIONS--
# button values : 21 (X), 20 (Y)
.alias button = 20
# classicButton values : 12 (X), 14 (Y)
.alias classicButton = 14

# --CUSTOM ADDRESSES USED--
# 80002810 - we use this address for a flag that tells us what step we are on
# 80002818 - we use this address for the selected song ID
# 8000281C - we use this address for cursor X position
# 80002820 - we use this address for cursor Y position
# 80002824 - we use this address for SSS page
# 80002828 - we use this address to store the current mode
# 8000282C - this is where we store muSelectStageTask since it is not stored normally. This is used to...
# ...get the frame count, and we also use an offset from this to get cursor positions

# --FLAG STATES--
# 1 - going to My Music, 2 - My Music opened, 3 - song chosen, 4 - backing out of My Music, 
# 5 - returning from My Music, 6 - back to SSS, 7 - change to correct page

# this hook makes our button work on SSS
HOOK @ $806b5864 # hook where we check if A is being pressed on SSS
{
    # check to ensure this only works in regular VS mode
    mr r9, r3   # store r3

    lis r12, 0x8002     # \ call getInstance/[gfSceneManager]
    ori r12, r12 0xd018 # |
    mtctr r12           # |
    bctrl               # | scene manager address placed in r3
    lwz r3, 0x10 (r3)   # | load currentSequence (10th offset from scene manager) into r3
    lwz r3, 0 (r3)      # / load address of currentSequence name into r3

    lis r4, 0x8070      # \ load address of string "sqVsMelee" into r4
    ori r4, r4, 0x17E0  # /

    lis r12, 0x803f         # \ call strcmp
    ori r12, r12, 0xa3fc    # |
    mtctr r12               # |
    bctrl                   # /

    cmpwi r3, 0         # \ if strings don't match, skip
    mr r3, r9           # | restore r3
    bne skip            # / skip

    lis r8, 0x805b
    ori r8, r8, 0x8ba0
    lwz r8, 0x0280 (r8) # check we are on Main Menu sequence
    cmpwi r8, 1
    beq skip            # if we are, skip

    rlwinm. r0, r3, 0, button, button # if button is being pressed, treat that as a valid stage select button
    bne goToMyMusic
    rlwinm. r0, r3, 0, classicButton, classicButton
    bne goToMyMusic

    # this block here is to force-select the stage after picking a song
    lis r9, 0x8000     # \
    ori r9, r9, 0x2810 # |
    lwz r4, 0 (r9)     # |
    cmpwi r4, 0        # | if state flag isn't 0, check if we need to change pages
    bne checkPage      # /
    lwz r4, 0x8 (r9)   # \ otherwise, get stored song ID
    cmpwi r4, 0        # | if song ID isn't 0, automatically start the stage
    bne startStage     # /

    skip:
    rlwinm. r0, r3, 0, 23, 23 # original line
    b %end%

    checkPage:
    cmpwi r4, 7         # \ if the state flag isn't 7, just do original code
    bne skip            # /
    lbz r4, 0x14 (r9)   # \ get the selected page we stored
    lis r6, 0x8049      # |
    ori r6, r6, 0x6000  # | this is where selected page is normally stored
    subi r4, r4, 1      # | subtract 1, because we are telling it what page we are on, not what we want to change to
    stb r4, 0 (r6)      # / storing value here forces page to change on button press

    # this block here is also for forcing stage selection
    startStage:
    li r3, 0x100
    rlwinm. r0, r3, 0, 23, 23 # force register button press
    b %end%

    goToMyMusic:
    lis r9, 0x8000     # \
    ori r9, r9, 0x2810 # |
    li r4, 1           # |
    stw r4, 0 (r9)     # / if we pressed the button, set the flag indicating to go to My Music

    li r4, 1            # \ set the mode we will jump to from My Music - 1 is VS
    stw r4, 0x18 (r9)   # / right now is always 1, this could be expanded to work with other modes
}

# additional hook to ensure button works on CSS (prevents a crash with MMU enabled)
HOOK @ $806b5780
{
    # check to ensure this only works in regular VS mode
    mr r9, r3   # store r3

    lis r12, 0x8002     # \ call getInstance/[gfSceneManager]
    ori r12, r12 0xd018 # |
    mtctr r12           # |
    bctrl               # | scene manager address placed in r3
    lwz r3, 0x10 (r3)   # | load currentSequence (10th offset from scene manager) into r3
    lwz r3, 0 (r3)      # / load address of currentSequence name into r3

    lis r4, 0x8070      # \ load address of string "sqVsMelee" into r4
    ori r4, r4, 0x17E0  # /

    lis r12, 0x803f         # \ call strcmp
    ori r12, r12, 0xa3fc    # |
    mtctr r12               # |
    bctrl                   # /

    cmpwi r3, 0         # \ if strings don't match, skip
    mr r3, r9           # | restore r3
    bne skip            # / skip

    lis r8, 0x805b
    ori r8, r8, 0x8ba0
    lwz r8, 0x0280 (r8) # check we are on Main Menu sequence
    cmpwi r8, 1
    beq skip            # if we are, skip

    rlwinm. r0, r3, 0, button, button # if button is being pressed, treat that as a valid stage select button
    bne %end%
    rlwinm. r0, r3, 0, classicButton, classicButton
    bne %end%

    # this block here is to force-select the stage after picking a song
    lis r9, 0x8000     # \
    ori r9, r9, 0x2810 # |
    lwz r4, 0 (r9)     # |
    cmpwi r4, 0        # | if state flag isn't 0, skip
    bne skip           # /
    lwz r4, 0x8 (r9)   # \ otherwise, get stored song ID
    cmpwi r4, 0        # | if song ID isn't 0, automatically start the stage
    bne startStage     # /

    skip:
    rlwinm. r0, r3, 0, 23, 23 # original line
    b %end%

    # this block here is also for forcing stage selection
    startStage:
    li r3, 0x100
    rlwinm. r0, r3, 0, 23, 23 # force register button press
    b %end%
}

# additional hook to ensure button works on CSS (prevents a crash with MMU enabled)
HOOK @ $806b589c
{
    # check to ensure this only works in regular VS mode
    mr r9, r3   # store r3

    lis r12, 0x8002     # \ call getInstance/[gfSceneManager]
    ori r12, r12 0xd018 # |
    mtctr r12           # |
    bctrl               # | scene manager address placed in r3
    lwz r3, 0x10 (r3)   # | load currentSequence (10th offset from scene manager) into r3
    lwz r3, 0 (r3)      # / load address of currentSequence name into r3

    lis r4, 0x8070      # \ load address of string "sqVsMelee" into r4
    ori r4, r4, 0x17E0  # /

    lis r12, 0x803f         # \ call strcmp
    ori r12, r12, 0xa3fc    # |
    mtctr r12               # |
    bctrl                   # /

    cmpwi r3, 0         # \ if strings don't match, skip
    mr r3, r9           # | restore r3
    bne skip            # / skip

    lis r8, 0x805b
    ori r8, r8, 0x8ba0
    lwz r8, 0x0280 (r8) # check we are on Main Menu sequence
    cmpwi r8, 1
    beq skip            # if we are, skip

    rlwinm. r0, r3, 0, button, button # if button is being pressed, treat that as a valid stage select button
    bne %end%
    rlwinm. r0, r3, 0, classicButton, classicButton
    bne %end%

    # this block here is to force-select the stage after picking a song
    lis r9, 0x8000     # \
    ori r9, r9, 0x2810 # |
    lwz r4, 0 (r9)     # |
    cmpwi r4, 0        # | if state flag isn't 0, skip
    bne skip           # /
    lwz r4, 0x8 (r9)   # \ otherwise, get stored song ID
    cmpwi r4, 0        # | if song ID isn't 0, automatically start the stage
    bne startStage     # /

    skip:
    rlwinm. r0, r3, 0, 23, 23 # original line
    b %end%

    # this block here is also for forcing stage selection
    startStage:
    li r3, 0x100
    rlwinm. r0, r3, 0, 23, 23 # force register button press
    b %end%
}

# This hook is used to get the address for muSelectStageTask and store it for later
HOOK @ $806b6178 # moveCursor
{
    lwz r3, 0x0200 (r30) # original instruction

    lis r9, 0x8000      # \
    ori r9, r9, 0x2810  # |
    lwz r10, 0x1C (r9)  # | 
    cmpwi r10, 0        # | if we have already stored the address, just skip
    bne %end%           # /

    stw r30, 0x1C (r9)  # store muSelectStageTask
}

# this hook makes it so our button sends us to My Music instead of starting the match - VS
HOOK @ $806dcb50 # hook for transitioning to a match
{
    lwz r0, 0x0008 (r15) # original code

    cmpwi r0, 0x7 # if we are not changing stages, check if we're returning from My Music
    bne %end%

    lis r9, 0x8000     # \
    ori r9, r9, 0x2810 # |
    lwz r3, 0 (r9)     # | get flag
    cmpwi r3, 1        # | if flag isn't 1 (going to My Music), jump to end
    bne %end%          # /

    lwz r4, 0x1C (r9)   # \ load muSelectStageTask
    lwz r4, 0x200 (r4)  # | offset 200 contains cursor information
    lfs f4, 0x3C (r4)   # | offset to X position
    stfs f4, 0xC (r9)   # / store cursor X position

    lfs f4, 0x40 (r4)   # \ offset to y position
    stfs f4, 0x10 (r9)  # / store cursor Y position

    lis r4, 0x8049	    # \
    ori r4, r4, 0x6000	# | address where the SSS page is
    lbz r4, 0 (r4)	    # |
    stb r4, 0x14 (r9)	# / store current page

    # if we're on SSS and flag is 1, go to main menu
    li r0, 0x10 # set switch/case to pick main menu option
    b %end%
}

# this hook makes it so we get warped to My Music instead of just the main menu
HOOK @ $806cc058 # The instruction for when we go to main menu
{
    lis r4, 0x8000      # \
    ori r4, r4, 0x2810  # |
    lwz r4, 0 (r4)      # | get flag
    cmpwi r4, 1         # | if flag isn't 1 (going to My Music), just run original code
    bne done            # /

    li r3, 12 # otherwise, force it to go to My Music
    
    done:
    stw	r3, 0x03D0 (r31) # original code
}

# this hook makes the tracklist open and hides elements when we go to My Music
HOOK @ $8117de68 # My Music function that runs every frame
{
    lis r4, 0x8000      # \
    ori r4, r4, 0x2810  # |
    lwz r4, 0 (r4)      # | get flag
    cmpwi r4, 1         # |
    bne done            # / if flag isn't 1, just do original code

    lis r8, 0x8150
    ori r8, r8, 0x9ea0 # store address used for cursor and SSS icon
	
    mr r9, r3

    lwz r3, 0x0050 (r8)   # \ hides cursor
    lwz r4, 0x0200 (r8)   # |
    lwz r12, 0 (r3)       # |
    lwz r4, 0x0010 (r4)   # |
    lwz r12, 0x003C (r12) # |
    mtctr r12             # |
    bctrl                 # /

    lwz r3, 0x0214 (r8)    # \ hides highlights around the SSS icon
    lwz r4, 0x0204 (r8)    # |
    lwz r12, 0 (r3)        # |
    lwz r4, 0x0010 (r4)    # |
    lwz r12, 0x003C (r12)  # |
    mtctr r12              # |
    bctrl                  # /

    lis r3, 0x0000
    ori r3, r3, 0x0003
    stw r3, 0x0224 (r8) # flip the flag to disable cursor

    lis r3, 0x0000
    ori r3, r3, 0x0001
    stw r3, 0x0274 (r8) # flip flag to open track list

    lis r3, 0x8000     # \
    ori r3, r3, 0x2810 # |
    li r4, 2           # |
    stw r4, 0 (r3)     # / set our flag to 2, meaning My Music is opened

    mr r3, r9 # restore r3

    done:
    lwz r0, 0x0664 (r3) # original code
}

# this hook forces My Music to open the correct tracklist
HOOK @ $8117defc # manipulate this instruction so that the correct track list is displayed
{
    lis r7, 0x805a      # \ load the chosen stage ID instead of a default
    lwz r7, 0xE0 (r7)   # | 0x805a00e0 - GameGlobal
    lwz r7, 0x14 (r7)   # | offset 0x14 - gmSelStageData
    lhz r7, 0x22 (r7)   # | offset 0x22 - stage ID
    b %end%             # /

    done:
    li r7, 66 # original line
}

# this hook makes our button work on the track list
HOOK @ $8117f030 # when checking what button is pressed with tracklist open
{
    lis r4, 0x8000      # \
    ori r4, r4, 0x2810  # |
    lwz r7, 0 (r4)      # | get flag
    cmpwi r7, 2         # |
    bne done            # / if flag isn't 2 (on My Music from SSS)

    rlwinm. r0, r29, 0, button, button # if button is being pressed, treat that as a valid select button
    bne buttonPressed
    rlwinm. r0, r29, 0, classicButton, classicButton
    bne buttonPressed

    done:
    rlwinm. r0, r29, 0, 22, 22 # otherwise, just do original code
    b %end%

    buttonPressed:
    li r7, 3
    stw r7, 0 (r4) # set flag to 3
    cmpwi r0, 1 # force the check to fail, so it counts as pressing A
}

# this hook stores the chosen song ID when we choose a song
HOOK @ $8117f07c # when playing a song on my music
{
    li r6, 1 # original line

    lis r8, 0x8000     # \
    ori r8, r8, 0x2810 # |
    lwz r7, 0 (r8)     # | get flag
    cmpwi r7, 3        # |
    bne %end%          # / if flag isn't 3, skip

    li r7, 4
    stw r7, 0 (r8) # set flag to 4, meaning we are returning to SSS

    lis r8, 0x8000     # \ storing song ID for stage to use
    ori r8, r8, 0x2810 # | address where we will store song ID
    lis r7, 0x8152     # |
    ori r7, r7, 0x1F00 # | address with currently playing song ID
    lwz r7, 0 (r7)     # |
    stw r7, 0x8 (r8)   # / set stored song ID to the one we are playing
}

# this hook is to make it so pressing our button will keep the song playing even if it is already playing
HOOK @ $8117f03c # when checking if a song is already playing on My Music when we hit A
{
    lis r8, 0x8000      # \
    ori r8, r8, 0x2810  # |
    lwz r7, 0 (r8)      # | get flag
    cmpwi r7, 3         # |
    bne done            # / if flag isn't 3, skip
    li r0, 0 # force to count as not playing

    done:
    cmpwi r0, 0 # original code
}

# this hook is to ensure that pressing our button will trigger the song selection
HOOK @ $8117f060 # another when we press A on track list
{
    lis r8, 0x8000      # \
    ori r8, r8, 0x2810  # |
    lwz r7, 0 (r8)      # | get flag
    cmpwi r7, 3         # |
    bne done            # / if flag isn't 3, skip
    li r0, 0 # force to count as not playing

    done:
    cmplw r30, r0 # original line
}

# this hook is so that when we back out, we'll return to SSS
HOOK @ $8117e670 # exit/[muProcOptSong] (when exiting My Music)
{
    lis r8, 0x8000     		# \
    ori r8, r8, 0x2810 		# |
    lwz r7, 0 (r8)     		# | get flag
    cmpwi r7, 4        		# |
    bne done			    # / if flag isn't 4, skip

    li r7, 5
    stw r7, 0 (r8) 		# set flag to 5, returning from My Music

    # Old scene change code, no longer used, could be useful reference
    #lis r9, 0x805b		    # \ tell scene manager to change scenes to vs
    #ori r9, r9, 0x5030		# | load scene manager into r9
    #li r10, 0x0		    # |
    #stb r10, 0x002C (r9)	# |
    #stb r10, 0x002D (r9)	# |
    #stb r10, 0x002E (r9)	# |
    #stb r10, 0x002F (r9) 	# | set some flags that need to be 0
    #lis r9, 0x805b		    # | 
    #ori r9, r9, 0x8ba0		# | load scene manager into r9
    #li r10, 0x1		    # |
    #stw r10, 0x0284 (r9) 	# | this flag determines what screen we go to from main - 0x1 is VS
    #li r10, 0x2		    # |
    #stw r10, 0x0288 (r9) 	# / set flag used by scene manager to 2, triggering scene change

    lis r9, 0x805b          # \ change scenes
    ori r9, r9, 0x8ba0      # | this address is the scene manager
    lwz r9, 0x4 (r9)        # | this offset gives us the flag to determine what scene to change to
    lwz r10, 0x18 (r8)      # | load the scene number we stored - right now is always 0x1
    stw r10, 0x0AB0 (r9)    # /

    done:
    mr r31, r3 			# original line
}

# this hook is to force the tracklist to close when an option is chosen
HOOK @ $8117e4b0 # check if B is pressed when My Music tracklist is open
{
    lis r9, 0x8000      # \
    ori r9, r9, 0x2810  # |
    lwz r8, 0 (r9)      # | get flag
    cmpwi r8, 4         # |
    bne done            # / if flag isn't 4, skip

    li r0, 0x20 # count as we are pressing B
    cmpwi r0, 0
    b %end%

    done:
    rlwinm. r0, r3, 0, 26, 26 # original line
}

# this hook is to ensure we go all the way back to SSS when B is pressed
HOOK @ $8117e4bc # when B is pressed while My Music tracklist is open
{
    lis r9, 0x8000      # \
    ori r9, r9, 0x2810  # |
    lwz r8, 0 (r9)      # | get flag
    cmpwi r8, 2         # |
    bne done            # / if flag isn't 2, skip

    li r8, 4
    stw r8, 0 (r9) # | set flag to 4
    
    # This fixes an issue where looking at the songs for a stage alt would force that alt to load when the stage was selected
    li r9, 0            # \
    lis r8, 0x8053      # |
    ori r8, r8, 0xe000  # | this address stores the chosen stage ID, which is used to determine if we should reload or not
    sth r9, 0x0FB8 (r8) # / by setting it to 0, the game will see no stage as loaded, and reload the file
    
    done:
    lbz	r0, 0x0674 (r30) # original code
}

# this hook makes sure we go back to SSS from My Music
HOOK @ $806b5670 # check if B is pressed on My Music screen
{
    lis r9, 0x8000      # \
    ori r9, r9, 0x2810  # |
    lwz r9, 0 (r9)      # | get flag
    cmpwi r9, 4         # |
    bne done            # / if flag isn't 4, just do original code

    li r0, 0x200 # count as we are pressing B
    cmpwi r0, 0
    b %end%

    done:
    rlwinm. r0, r0, 0, 22, 22 # original line
}

# this hook makes it so we go to SSS after backing out from My Music - VS
HOOK @ $806dcbc8 # when transitioning to VS, we set this to tell the game to go to SSS after mem change
{
    lis r5, 0x8000      # \
    ori r5, r5, 0x2810  # |
    lwz r10, 0 (r5)     # | get flag
    cmpwi r10, 5        # | if flag isn't 5 (returning from My Music), jump to end
    bne done            # /

    # otherwise, load SSS
    li r24, 0x5

    li r10, 6           # \
    stw r10, 0 (r5)     # / set our flag to 6

    lis r5, 0x805b          # \ set flag indicating current screen to 1
    ori r5, r5, 0x8ba0      # | this is used sometimes to check if we are on SSS
    li r10, 1               # |
    stw r10, 0x0284 (r5)    # /

    done:
    stw r24, 0xc (r15) # original line
}

# this hook is used to ensure addresses correctly indicate we're on SSS after returning from My Music
HOOK @ $806be64c # runs every frame on process/[scMemoryChange]
{
    lis r5, 0x8000      # \
    ori r5, r5, 0x2810  # |
    lwz r10, 0 (r5)     # | get flag
    cmpwi r10, 6        # | if flag isn't 6, go to end
    bne done            # /

    li r10, 7           # \
    stw r10, 0 (r5)     # / set our flag to 7 - set pages

    li r0, 1            # this flag indicates what screen we're on after this, 1 in this case means SSS
    b %end%

    done:
    li r0, 0 # original line
}

# this hook makes the game think we are changing pages when returning to SSS from My Music
HOOK @ $806b58c8 # every frame, if we pressed a button, check that we were pressing page button on SSS
{
    lis r5, 0x8000      # \
    ori r5, r5, 0x2810  # |
    lwz r10, 0 (r5)
    cmpwi r10, 7        # if flag is not 7, go to end
    bne done

    li r10, 0           # \
    stw r10, 0 (r5)     # / set our flag to 0 - we are done

    lwz r10, 0x14 (r5)  # | get stored page

    li r10, 0           # \
    stw r10, 0x14 (r5)  # / set selected page back to 0
    
    li r0, 5        # force button to count as pressed so we change pages
    
    done:
    cmplwi r0, 7 # original code line
}

# this hook checks if we are changing pages, and if so, doesn't set the flag to go to music select
HOOK @ $806b58d0 # just after checking if we are changing pages
{
    lis r5, 0x8000      # \
    ori r5, r5, 0x2810  # |
    lwz r10, 0 (r5)
    cmpwi r10, 1        # if flag is not 1, go to end
    bne done

    li r10, 0           # \
    stw r10, 0 (r5)     # / set our flag to 0 - we changed pages, didn't select a stage

    done:
    lis r3, 0x806C # original line
}

# this hook is used to restore the cursor position when returning to SSS from My Music
HOOK @ $806c8e80 # runs every frame on SSS
{
    lis r9, 0x8000      # \ get muSelectStageTask
    ori r9, r9, 0x2810  # |
    lwz r8, 0x1C (r9)   # |
    cmpwi r8, 0         # |
    beq done            # | if we don't have an address stored yet, just skip
    lwz r8, 0x250 (r8)  # | offset 250 contains the frame count
    cmpwi r8, 10        # |
    bne done            # / only perform new code if SSS has been up for 10 frames

    lwz r8, 0x1C (r9)   # \ get muSelectStageTask
    lwz r8, 0x200 (r8)  # | offset 200 is cursor stuff
    lwz r10, 0xC (r9)   # | our x address
    cmpwi r10, 0        # |
    beq checkY          # / if X address is not set, check Y

    lfs f10, 0xC (r9)   # \
    stfs f10, 0x3C (r8) # | set cursor X to stored X value
    li r10, 0           # |
    stw r10, 0xC (r9)   # / set stored X to 0

    checkY:
    lwz r10, 0x10 (r9)  # \
    cmpwi r10, 0        # | if Y address is not set, original code
    beq done            # /

    lfs f10, 0x10 (r9)  # \
    stfs f10, 0x40 (r8) # | set cursor Y to stored Y value
    li r10, 0           # |
    stw r10, 0x10 (r9)  # / set stored Y to 0

    done:
    mr r31, r3 # original code
}

# this hook forces the song ID to be the one we selected
HOOK @ $8010f9e4 # hook just before calling setBgmId when loading stage
{
    lis r10, 0x8000         # \
    ori r10, r10, 0x2810    # |
    lwz r7, 0x8 (r10)       # | get song ID
    cmpwi r7, 0             # |
    beq done                # / if stored song ID is set to 0, jump to original line

    mr r6, r7               # set r6 (param4 for setBgmId) to song ID, which will force it to be picked
    li r7, 0
    stw r7, 0x8 (r10)       # set stored song ID to 0

    done:
    mr r4, r28 # original line
}

# this hook resets all of our stored values when we return to the main menu
HOOK @ $806dce4c # hook in sqVsMelee/setNext when we are changing to main menu
{
    lis r5, 0x8000      # \
    ori r5, r5, 0x2810  # |
    lwz r6, 0 (r5)      # |
    cmpwi r6, 1         # | if flag is 1 (going to My Music), jump to end
    beq done            # /

    li r7, 0            # \ reset all stored values to 0
    stw r7, 0 (r5)      # |
    stw r7, 0x8 (r5)    # |
    stw r7, 0xC (r5)    # |
    stw r7, 0x10 (r5)   # |
    stw r7, 0x14 (r5)   # |
    stw r7, 0x18 (r5)   # |
    stw r7, 0x1C (r5)   # /

    done:
    stb	r30, 0x0448 (r3) # original line
}