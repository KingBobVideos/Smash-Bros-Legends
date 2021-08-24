##############################################################
Toggle Platform Interaction When Grabbed [KingJigglypuff, Eon]
##############################################################
.alias PSA_Offset = 0x8054A668
.alias PSA_Offset2 = 0x8054A6A0
.alias PSA_Offset3 = 0x8054A778
.alias PSA_Offset4 = 0x8054A7B0
#Disable platform interaction if LA-Basic[124] is set to 1 and enable it if it's set to 0.
CODE @ $8054A668
{
	word 2; word PSA_Offset+0x20					#Pointer: 0x80546C50
	#Concurrent Infinite Loop: Thread: 0x9: Offset: 0x80546C88
	word 0; word 9									#Value: 9
	word 2; word PSA_Offset2+0x70					#Pointer: 0x80546CD8
	#Sub Routine
	word 2; word 0x8054C200							#Pointer: 0x8054C200
	
	
	word 0x0D000200; word PSA_Offset+0x08			#(Concurrent Infinite Loop) Param Offset: 0x80546C38
	word 0x00070100; word PSA_Offset+0x18			#(Sub Routine) Param Offset: 0x80546C48
	word 0; word 0									#Return
}
CODE @ $8054A6A0
{
	#If Compare: LA-Basic[124] == 1.0
	word 6; word 0x7								#Requirement: 7 (Compare)
	word 5; LA_Basic 124							#Variable: LA-Basic[124]
	word 0; word 2									#Value: 2 (Equals)
	word 1; scalar 1								#Scalar: 1.0
	#Edge Interaction 04: false (Disables platform interaction)
	word 3; word 0									#Boolean: 0 (False)
	#Else If Compare: LA-Basic[124] == 2.0
	word 6; word 0x7								#Requirement: 7 (Compare)
	word 5; LA_Basic 124							#Variable: LA-Basic[124]
	word 0; word 2									#Value: 2 (Equals)
	word 1; scalar 2								#Scalar: 2.0
	#Set Aerial/Onstage State: 0 (No-Clip)
	word 0; word 0									#Value: 0
	#Edge Interaction 04: true (Enables platform interaction)
	word 3; word 1									#Boolean: 1 (True)
	#If On Ground
	word 6; word 0x3								#Requirement: 3 (On Ground)
	#Set Aerial/Onstage State: 3 (Can drop off side of stage)
	word 0; word 1									#Value: 1
	#Set Aerial/Onstage State: 5 (In Air: Can leave stage vertically)
	word 0; word 5									#Value: 5
	
	
	word 0x000A0400; word PSA_Offset2				#(If Compare) Param Offset: 0x80546C68
	word 0x08040100; word PSA_Offset2+0x20			#(Edge Interaction 04) Param Offset: 0x80546C88
	word 0x000D0400; word PSA_Offset2+0x28			#(Else If Compare) Param Offset: 0x80546C90
	word 0x08000100; word PSA_Offset2+0x48			#(Set Aerial/Onstage State) Param Offset: 0x80546CB0
	word 0x000E0000; word 0							#Else
	word 0x08040100; word PSA_Offset2+0x50			#(Edge Interaction 04) Param Offset: 0x80546CB8
	word 0x000A0100; word PSA_Offset2+0x58			#(If) Param Offset: 0x80546CC0
	word 0x08000100; word PSA_Offset2+0x60			#(Set Aerial/Onstage State) Param Offset: 0x80546CC8
	word 0x000E0000; word 0							#Else
	word 0x08000100; word PSA_Offset2+0x68			#(Set Aerial/Onstage State) Param Offset: 0x80546CD0
	word 0x000F0000; word 0							#EndIf
	word 0x000F0000; word 0							#EndIf
	word 0; word 0									#Return
}
CODE @ $8054A778
{
	word 0; word 9									#Value: 9
	word 2; word PSA_Offset3+0x20					#Pointer: 0x80546EEC
	#Sub Routine
	word 2; word PSA_Offset2+0x70					#Pointer: 0x80546CD8
	#Sub Routine
	word 2; word 0x80FB00C4
	
	
	word 0x00070100; word PSA_Offset3+0x10			#(Sub Routine) Param Offset: 0x80546EDC
	word 0x00070100; word PSA_Offset3+0x18			#(Sub Routine) Param Offset: 0x80546EE4
	word 0; word 0									#Return
}
CODE @ $8054A7B0
{
	#If Compare: IC-Basic[20001] != 62.0 [If current action does not equal 62.0 (CaptureWait)]
	word 6; word 0x7								#Requirement: 7 (Compare)
	word 5; IC_Basic 20001							#Variable: IC-Basic[20001]
	word 0; word 0x3								#Value: 3 (Does not Equal)
	word 1; scalar 62								#Scalar: 62.0
	#Basic Variable Set: LA-Basic[124] = 0
	word 0; word 0x0								#Value: 0
	word 5; LA_Basic 124							#Variable: LA-Basic[124]
	
	
	word 0x000A0400; word PSA_Offset4				#(If Compare) Param Offset: 0x80546F04
	word 0x12000200; word PSA_Offset4+0x20			#(Basic Variable Set) Param Offset: 0x80546F24
	word 0x000F0000; word 0							#EndIf
	word 0; word 0									#Return
	word 0x12000200; word PSA_Offset4+0x20			#(Basic Variable Set) Param Offset: 0x80546F24
	word 0; word 0									#Return
}
word 0x8054A7E0 @ $80FC04C8							#CapturePulled (Exit)
word 0x8054A800 @ $80FC04CC							#CaptureWait (Exit)
CODE @ $80FB0014 #CapturePulled (Entry): 0x80F9FC20 + 0x103F4, replaces top command.
{
	word 0x00070100; word PSA_Offset				#(Sub Routine) Param Offset: 0x80546C30
}
CODE @ $80FB0274 #CaptureWait (Entry): 0x80F9FC20 + 0x10654, replaces top command.
{
	word 0x0D000200; word PSA_Offset3				#(Concurrent Infinite Loop) Param Offset: 0x
}