#########################################################################################
Manual Clone Soundbank Unload Fix + Automatic EX Soundbank Unload Fix [codes, ds22, Desi]
#Following link contains original code. 
#https://smashboards.com/threads/ds22s-code-showcase.428060/#post-20793302
#########################################################################################
#Note: If you are including a manual fix, you will have to add it to both hootks.
.Macro ManualUnloadFix(<CloneID>,<BaseID>)
{
	cmpwi r4,<CloneID>
	bne+ 0x10		#Go to <CloneID> if loader ID is not Lucario
	cmpwi r0, <BaseID>
	bne+ EXIT 		#Skip if exiting ID is not <BaseID>
	b MOVE
	
	cmpwi r4,<BaseID>
	bne+ 0x10		#Go to <BaseID> if loader ID is not Lucario
	cmpwi r0, <CloneID>
	bne+ EXIT 		#Skip if exiting ID is not <BaseID>
	b MOVE
}

HOOK @ $8084C30C
{
START:
	cmpwi  r7,3
	bne-  EXIT  	#Skip if not soundbank loader routine

	cmpw  r0,r4
	beq-  EXIT  	#Skip if instance IDs match

#Insert Manual Unload Fixes here. vPM example below.
	#%ManualUnloadFix(0x27, 0x11)	#Roy/Marth
	#%ManualUnloadFix(0x26, 0x21)	#Mewtwo/Lucario
	
#Automatic EX Fix Here. A manual fix for an EX ID will override this.
	cmpwi r0, 0x40
	blt- EXIT
	cmpwi r4, 0x40
	blt- EXIT		#Go to exit if this doesn't involve EX Characters.

	stw r30, 30(r2)		#Automatic Soundbank Unload Fix
	stw r28, 34(r2)
	stw r29, 38(r2)
	mulli r30, r0, 0x4
	mulli r28, r4, 0x4
	lis r29, 0x817C
	ori r29, r29, 0x92E0
	add r30, r30, r29
	add r28, r28, r29
	lwz r30, 0(r30)
	lwz r28, 0(r28)
	cmpw r30, r28
	lwz r30, 30(r2)
	lwz r28, 34(r2)
	lwz r29, 38(r2)

MOVE:
	mr r0,r4 		#Make loader EXIST

EXIT:
	cmpw r0, r4		#Original Function

}

HOOK @ $8084C9D4
{
START:
	cmpwi  r7,3
	bne-  EXIT  	#Skip if not soundbank loader routine

	cmpw  r0,r4
	beq-  EXIT  	#Skip if instance IDs match

#Insert Manual Unload Fixes here. vPM example below.
	#%ManualUnloadFix(0x27, 0x11)	#Roy/Marth
	#%ManualUnloadFix(0x26, 0x21)	#Mewtwo/Lucario
	
#Automatic EX Fix Here. A manual fix for an EX ID will override this.
	cmpwi r0, 0x40
	blt- EXIT
	cmpwi r4, 0x40
	blt- EXIT		#Go to exit if this doesn't involve EX Characters.

	stw r30, 30(r2)		#Automatic Soundbank Unload Fix
	stw r28, 34(r2)
	stw r29, 38(r2)
	mulli r30, r0, 0x4
	mulli r28, r4, 0x4
	lis r29, 0x817C
	ori r29, r29, 0x92E0
	add r30, r30, r29
	add r28, r28, r29
	lwz r30, 0(r30)
	lwz r28, 0(r28)
	cmpw r30, r28
	lwz r30, 30(r2)
	lwz r28, 34(r2)
	lwz r29, 38(r2)

MOVE:
	mr r0,r4 		#Make loader EXIST

EXIT:
	cmpw r0, r4		#Original Function

}