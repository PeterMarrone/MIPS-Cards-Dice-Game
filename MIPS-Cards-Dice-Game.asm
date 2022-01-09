#Author:	Peter Marrone
#Date:		28 April 2021
#Description: 	This game is 1-4 players and consists of dealing two cards and rolling one die per player. Calculations will be performed; totals will be compared, and a winner will be declared. 

.data
Welcome: 	.asciiz "Deal, Deal, Roll by Peter Marrone!\n"

Instructions: 	.asciiz "\nInstructions:\n1. Enter a number from 1-4 for how many players will be playing the game.\n2. Cards will be dealt with ace cards representing only 1.\n3. After receiving cards, players will enter 'R' when they are ready to roll the die.\n4. Winner of the game will be printed on screen.\n5. 5. Enter a ‘Y’ in order to play the game again or an ‘N’ to exit the program."

players: 	.asciiz "\n\nHow many players will there be: "

begin: 		.asciiz "The game will now begin!\n"

errorMsg:	.asciiz "***Invalid amount of players entered, try again***"

restart:	.asciiz "\n\nWould you like to play again? (Y/N): "

tieGame:	.asciiz "\nThere has been a tie!"

player1: 	.asciiz "\nPlayer 1: "

player2: 	.asciiz "\n\nPlayer 2: "

player3: 	.asciiz "\n\nPlayer 3: "

player4: 	.asciiz "\n\nPlayer 4: "

computer: 	.asciiz "\n\nComputer: "

playerOne: 	.asciiz "\n\nPlayer 1 is the winner!"

playerTwo: 	.asciiz "\n\nPlayer 2 is the winner!"

playerThree: 	.asciiz "\n\nPlayer 3 is the winner!"

playerFour: 	.asciiz "\n\nPlayer 4 is the winner!"

Computer: 	.asciiz "\n\nThe Computer is the winner!"

firstCardValue:	.asciiz "\nFirst Card: "

secondCardValue:.asciiz "\nSecond Card: "

dice: 		.asciiz "\nDie Roll: "

diceReady: 	.asciiz "\nAre you ready to roll the die? "

total: 		.asciiz "\nTotal = "

newLine: 	.asciiz "\n"

howMany: 	.word 0

diceResponse: 	.word 0

keepPlaying:	.word 0

cardlfsr:	.word 0

dicelfsr:	.word 0

onePlayerRA:	.space 8

twoPlayerRA:	.space 8

threePlayerRA:	.space 12

fourPlayerRA:	.space 16

ePitch:		.word 76

ePitch2:	.word 88

cPitch:		.word 72

gPitch:		.word 67

gPitch2:	.word 79

bPitch:		.word 83

piano:		.word 1

duration1:	.word 250

duration2:	.word 500

duration3:	.word 1000

volume:		.word 127

.text

#Pseudocode:
#  main() {
#    set LFSR seed value
#    play(introduction tone)
#    print(Welcome)
#    print(Instructions)
#    print(players)
#    howMany = readInt()
#    players()
#    print(restart)
#    keepPlaying = readChar()
#    while(keepPlaying == 'Y')
#      goto playAgain
#  }

main:
	li	$s2, 0xF00F5AA5			# Sets seed value for LFSR.
	
	li	$v0, 31				# Outputs introduction sounds.
	lw	$t1, ePitch			# Louds the pitch of an E note.
	lw	$t2, duration2			# Loads the duration of the note.
	lw	$t3, piano			# Loads the type of instrument.
	lw	$t4, volume			# Loads the max volume.
	move	$a0, $t1			# Moves sound data to $a0 - $a3 to be played.
	move	$a1, $t2
	move	$a2, $t3
	move	$a3, $t4
	syscall
	li	$v0, 32				# Sleeps for 150 milliseconds.
	la	$a0, 150
	syscall 
	li	$v0, 31
	lw	$t1, ePitch			# Louds the pitch of an E note.
	lw	$t2, duration2			# Loads the duration of the note.
	lw	$t3, piano			# Loads the type of instrument.
	lw	$t4, volume			# Loads the max volume.
	move	$a0, $t1			# Moves sound data to $a0 - $a3 to be played.
	move	$a1, $t2
	move	$a2, $t3
	move	$a3, $t4
	syscall
	li	$v0, 32				# Sleeps for 300 milliseconds.
	la	$a0, 300
	syscall 
	li	$v0, 31
	lw	$t1, ePitch			# Louds the pitch of an E note.
	lw	$t2, duration2			# Loads the duration of the note.
	lw	$t3, piano			# Loads the type of instrument.
	lw	$t4, volume			# Loads the max volume.
	move	$a0, $t1			# Moves sound data to $a0 - $a3 to be played.
	move	$a1, $t2
	move	$a2, $t3
	move	$a3, $t4
	syscall
	li	$v0, 32				# Sleeps for 200 milliseconds.
	la	$a0, 200
	syscall
	li	$v0, 31
	lw	$t1, cPitch			# Louds the pitch of a C note.
	lw	$t2, duration2			# Loads the duration of the note.
	lw	$t3, piano			# Loads the type of instrument.
	lw	$t4, volume			# Loads the max volume.
	move	$a0, $t1			# Moves sound data to $a0 - $a3 to be played.
	move	$a1, $t2
	move	$a2, $t3
	move	$a3, $t4
	syscall
	li	$v0, 32				# Sleeps for 250 milliseconds.
	la	$a0, 250
	syscall 
	li	$v0, 31
	lw	$t1, ePitch			# Louds the pitch of an E note.
	lw	$t2, duration2			# Loads the duration of the note.
	lw	$t3, piano			# Loads the type of instrument.
	lw	$t4, volume			# Loads the max volume.
	move	$a0, $t1			# Moves sound data to $a0 - $a3 to be played.
	move	$a1, $t2
	move	$a2, $t3
	move	$a3, $t4
	syscall
	li	$v0, 32				# Sleeps for 250 milliseconds.
	la	$a0, 250
	syscall
	li	$v0, 31
	lw	$t1, gPitch2			# Louds the pitch of a G note.
	lw	$t2, duration2			# Loads the duration of the note.
	lw	$t3, piano			# Loads the type of instrument.
	lw	$t4, volume			# Loads the max volume.
	move	$a0, $t1			# Moves sound data to $a0 - $a3 to be played.
	move	$a1, $t2
	move	$a2, $t3
	move	$a3, $t4
	syscall
	li	$v0, 32				# Sleeps for 350 milliseconds.
	la	$a0, 450
	syscall
	li	$v0, 31
	lw	$t1, gPitch			# Louds the pitch of a G note.
	lw	$t2, duration1			# Loads the duration of the note.
	lw	$t3, piano			# Loads the type of instrument.
	lw	$t4, volume			# Loads the max volume.
	move	$a0, $t1			# Moves sound data to $a0 - $a3 to be played.
	move	$a1, $t2
	move	$a2, $t3
	move	$a3, $t4
	syscall	
				
	li 	$v0, 4				# Prints welcome message.
	la 	$a0, Welcome
	syscall 
	
	li 	$v0, 4
	la 	$a0, Instructions		# Prints instructions space.
	syscall 
	
playAgain:
	li	$v0, 4
	la 	$a0, players			# Prompts for amount of players.
	syscall 
	
	li 	$v0, 5				# Reads value from user.
	syscall 
	
	sw 	$v0, howMany			# Saves value to howMany. 
	
	addi 	$sp, $sp, -16			# Allocates space on the stack.
	jal	Players				# Calls Players function.
	
	addi 	$sp, $sp, 16			# Reclaims space from the stack. 
	
	li	$v0, 4				# Prompts user to play again.
	la	$a0, restart
	syscall 
	
	li 	$v0, 12				# Reads response from user.
	syscall 
	
	sw	$v0, keepPlaying		# Stores response in keepPlaying location.
	lw	$s1, keepPlaying		# Loads response to register s1.
		
	beq	$s1, 'Y', playAgain		# while (keepPlaying == 'Y')
	
	li 	$v0, 10				# Exits the program.
	syscall 

#Pseudocode:
#  Players() {
#    print(begin)
#    if(howMany == 1)
#      play Game() with 1 player
#    else if(howMany == 2)
#      play Game() with 2 players
#    else if(howMany == 3)
#      play Game() with 3 players
#    else if(howmany == 4)
#      play Game() with 4 players
#    else
#      print(errorMSG)
#      goto playAgain
#  }

Players:
	lw 	$t0, howMany			# Loads howMany into t0.
	
	addi	$s4, $zero, 0
	
	sw 	$ra, 12($sp)			# Stores return address onto the stack.
	
	bne 	$t0, 1, else			# if(howMany == 1)
	li 	$v0, 4				# Prints game beginning.
	la 	$a0, begin
	syscall
	li 	$v0, 4				# Player 1
	la 	$a0, player1
	syscall
	jal 	Game				# Calls to Game function.
	sw	$s0, onePlayerRA($s4)		# Saves player 1 total in first location in array.
	addi	$s4, $s4, 4			# Increments array to next position
	li 	$v0, 4				# Prints the total value for player 1.
	la 	$a0, total
	syscall 
	li 	$v0, 1				
	lw 	$a0, onePlayerRA($zero)
	syscall 

	li 	$v0, 4				# Computer
	la 	$a0, computer
	syscall 
	jal 	Bot				# Calls to Bot function.
	sw	$s0, onePlayerRA($s4)
	li 	$v0, 4				# Prints the computers total value.
	la	$a0, total
	syscall 
	li 	$v0, 1				
	lw 	$a0, onePlayerRA($s4)
	syscall 
	
	lw	$t6, onePlayerRA($zero)		# Loads first players total into register $t6.
	lw	$t7, onePlayerRA($s4)		# Loads computers total value into register $t7.
	
	blt 	$t6, $t7, next			# if(player1 > computer)
	li	$v0, 31
	lw	$t1, bPitch			# Louds the pitch of an B note.
	lw	$t2, duration1			# Loads the duration of the note.
	lw	$t3, piano			# Loads the type of instrument.
	lw	$t4, volume			# Loads the max volume.
	move	$a0, $t1			# Moves sound data to $a0 - $a3 to be played.
	move	$a1, $t2
	move	$a2, $t3
	move	$a3, $t4
	syscall
	li	$v0, 32				# Sleeps for 110 milliseconds.
	la	$a0, 110
	syscall 
	li	$v0, 31
	lw	$t1, ePitch2			# Louds the pitch of an E note.
	lw	$t2, duration2			# Loads the duration of the note.
	lw	$t3, piano			# Loads the type of instrument.
	lw	$t4, volume			# Loads the max volume.
	move	$a0, $t1			# Moves sound data to $a0 - $a3 to be played.
	move	$a1, $t2
	move	$a2, $t3
	move	$a3, $t4
	syscall
	li 	$v0, 4				# Player 1 is the winner.
	la 	$a0, playerOne
	syscall
	j  	end				# Jump to end.
	
next:
	li	$v0, 31
	lw	$t1, bPitch			# Louds the pitch of an B note.
	lw	$t2, duration1			# Loads the duration of the note.
	lw	$t3, piano			# Loads the type of instrument.
	lw	$t4, volume			# Loads the max volume.
	move	$a0, $t1			# Moves sound data to $a0 - $a3 to be played.
	move	$a1, $t2
	move	$a2, $t3
	move	$a3, $t4
	syscall
	li	$v0, 32				# Sleeps for 110 milliseconds.
	la	$a0, 110
	syscall
	li	$v0, 31
	lw	$t1, ePitch2			# Louds the pitch of an E note.
	lw	$t2, duration2			# Loads the duration of the note.
	lw	$t3, piano			# Loads the type of instrument.
	lw	$t4, volume			# Loads the max volume.
	move	$a0, $t1			# Moves sound data to $a0 - $a3 to be played.
	move	$a1, $t2
	move	$a2, $t3
	move	$a3, $t4
	syscall
	li 	$v0, 4				# else, the computer is the winner.
	la 	$a0, Computer
	syscall
	j 	end 				# Jump to end. 

else:
	bne 	$t0, 2, else2			# if(howMany == 2)
	li 	$v0, 4				# Prints game beginning.
	la 	$a0, begin
	syscall
	li 	$v0, 4				# Player 1
	la 	$a0, player1
	syscall 
	jal	Game				# Calls to the Game function.
	sw	$s0, twoPlayerRA($s4)		# Saves player 1 total in first location in array.
	addi	$s4, $s4, 4			# Increments array to next location
	li 	$v0, 4				# Prints the total value for player 1.
	la 	$a0, total
	syscall 
	li 	$v0, 1
	lw 	$a0, twoPlayerRA($zero)
	syscall
	
	li	$v0, 4				# Player 2
	la	$a0, player2
	syscall
	jal	Game				# Calls to Game function.
	sw	$s0, twoPlayerRA($s4)		# Saves player 2 total in second location in array.
	li 	$v0, 4				# Prints the total value for player 2.
	la 	$a0, total
	syscall 
	li 	$v0, 1
	lw	$a0, twoPlayerRA($s4)
	syscall
	
	lw	$t6, twoPlayerRA($zero)		# Loads first players total into register $t6.
	lw	$t7, twoPlayerRA($s4)		# Loads second players total into register $t7.
	
	blt 	$t6, $t7, next1			# if(playerOne > playerTwo) 
	li	$v0, 31
	lw	$t1, bPitch			# Louds the pitch of an B note.
	lw	$t2, duration1			# Loads the duration of the note.
	lw	$t3, piano			# Loads the type of instrument.
	lw	$t4, volume			# Loads the max volume.
	move	$a0, $t1			# Moves sound data to $a0 - $a3 to be played.
	move	$a1, $t2
	move	$a2, $t3
	move	$a3, $t4
	syscall
	li	$v0, 32				# Sleeps for 110 milliseconds.
	la	$a0, 110
	syscall 
	li	$v0, 31
	lw	$t1, ePitch2			# Louds the pitch of an E note.
	lw	$t2, duration2			# Loads the duration of the note.
	lw	$t3, piano			# Loads the type of instrument.
	lw	$t4, volume			# Loads the max volume.
	move	$a0, $t1			# Moves sound data to $a0 - $a3 to be played.
	move	$a1, $t2
	move	$a2, $t3
	move	$a3, $t4
	syscall
	li	$v0, 4				# Player 1 is the winner.
	la	$a0, playerOne
	syscall
	j	end				# Jump to end.
next1:
	li	$v0, 31
	lw	$t1, bPitch			# Louds the pitch of an B note.
	lw	$t2, duration1			# Loads the duration of the note.
	lw	$t3, piano			# Loads the type of instrument.
	lw	$t4, volume			# Loads the max volume.
	move	$a0, $t1			# Moves sound data to $a0 - $a3 to be played.
	move	$a1, $t2
	move	$a2, $t3
	move	$a3, $t4
	syscall
	li	$v0, 32				# Sleeps for 110 milliseconds.
	la	$a0, 110
	syscall 
	li	$v0, 31
	lw	$t1, ePitch2			# Louds the pitch of an E note.
	lw	$t2, duration2			# Loads the duration of the note.
	lw	$t3, piano			# Loads the type of instrument.
	lw	$t4, volume			# Loads the max volume.
	move	$a0, $t1			# Moves sound data to $a0 - $a3 to be played.
	move	$a1, $t2
	move	$a2, $t3
	move	$a3, $t4
	syscall
	li	$v0, 4				# else, player 2 is the winner.
	la	$a0, playerTwo
	syscall 
	j	end				# Jump to end.
	
else2:
	bne	$t0, 3, else3			# if(howMany == 3)
	li 	$v0, 4				# Prints game beginning.
	la 	$a0, begin
	syscall
	li 	$v0, 4				# Player 1
	la 	$a0, player1
	syscall 
	jal	Game				# Calls to Game function.
	sw	$s0, threePlayerRA($s4)		# Saves player 1 total in first location in array.
	addi	$s4, $s4, 4			# Increments array to next location.
	li 	$v0, 4				# Prints the total value of the player.
	la 	$a0, total
	syscall 
	li 	$v0, 1
	lw	$a0, threePlayerRA($zero)
	syscall
	
	li	$v0, 4				# Player 2
	la	$a0, player2
	syscall
	jal	Game				# Calls to Game function.
	sw	$s0, threePlayerRA($s4)		# Saves player 2 total in second location in array.
	li 	$v0, 4				# Prints the total value for player 2.
	la 	$a0, total
	syscall 
	li 	$v0, 1
	lw 	$a0, threePlayerRA($s4)
	syscall
	
	li	$v0, 4				# Player 3
	la	$a0, player3
	syscall 
	jal	Game				# Calls to Game function.
	addi	$s4, $s4, 4			# Increments array to next location.
	sw	$s0, threePlayerRA($s4)		# Saves player 3 total in third location in array
	li 	$v0, 4				# Prints the total value for player 3.
	la 	$a0, total
	syscall 
	li 	$v0, 1
	lw 	$a0, threePlayerRA($s4)
	syscall	
	
	lw	$t6, threePlayerRA($zero)	# Loads first players total into register $t6.
	addi	$s4, $zero, 4			# $s4 = 4.
	lw	$t7, threePlayerRA($s4)		# Loads second players total into register $t7.
	addi	$s4, $zero, 8			# #s4 = 8.
	lw	$t8, threePlayerRA($s4)		# Loads third players total into register $t8.
	
	blt 	$t6, $t7, next2			# if(playerOne > playerTwo && playerOne > playerThree)
	blt	$t6, $t8, next2
	li	$v0, 31
	lw	$t1, bPitch			# Louds the pitch of an B note.
	lw	$t2, duration1			# Loads the duration of the note.
	lw	$t3, piano			# Loads the type of instrument.
	lw	$t4, volume			# Loads the max volume.
	move	$a0, $t1			# Moves sound data to $a0 - $a3 to be played.
	move	$a1, $t2
	move	$a2, $t3
	move	$a3, $t4
	syscall
	li	$v0, 32				# Sleeps for 110 milliseconds.
	la	$a0, 110
	syscall 
	li	$v0, 31
	lw	$t1, ePitch2			# Louds the pitch of an E note.
	lw	$t2, duration2			# Loads the duration of the note.
	lw	$t3, piano			# Loads the type of instrument.
	lw	$t4, volume			# Loads the max volume.
	move	$a0, $t1			# Moves sound data to $a0 - $a3 to be played.
	move	$a1, $t2
	move	$a2, $t3
	move	$a3, $t4
	syscall
	li	$v0, 4				# Player one is the winner.
	la	$a0, playerOne
	syscall
	j	end				# Jump to end.
	
next2:
	blt	$t7, $t6, next3			# if(playerTwo > playerOne && playerTwo > playerThree)
	blt	$t7, $t8, next3
	li	$v0, 31
	lw	$t1, bPitch			# Louds the pitch of an B note.
	lw	$t2, duration1			# Loads the duration of the note.
	lw	$t3, piano			# Loads the type of instrument.
	lw	$t4, volume			# Loads the max volume.
	move	$a0, $t1			# Moves sound data to $a0 - $a3 to be played.
	move	$a1, $t2
	move	$a2, $t3
	move	$a3, $t4
	syscall
	li	$v0, 32				# Sleeps for 110 milliseconds.
	la	$a0, 110
	syscall 
	li	$v0, 31
	lw	$t1, ePitch2			# Louds the pitch of an E note.
	lw	$t2, duration2			# Loads the duration of the note.
	lw	$t3, piano			# Loads the type of instrument.
	lw	$t4, volume			# Loads the max volume.
	move	$a0, $t1			# Moves sound data to $a0 - $a3 to be played.
	move	$a1, $t2
	move	$a2, $t3
	move	$a3, $t4
	syscall
	li	$v0, 4				# Player Two is the winner.
	la	$a0, playerTwo
	syscall 
	j	end				# Jump to end.
	
next3:
	li	$v0, 31
	lw	$t1, bPitch			# Louds the pitch of an B note.
	lw	$t2, duration1			# Loads the duration of the note.
	lw	$t3, piano			# Loads the type of instrument.
	lw	$t4, volume			# Loads the max volume.
	move	$a0, $t1			# Moves sound data to $a0 - $a3 to be played.
	move	$a1, $t2
	move	$a2, $t3
	move	$a3, $t4
	syscall
	li	$v0, 32				# Sleeps for 110 milliseconds.
	la	$a0, 110
	syscall 
	li	$v0, 31
	lw	$t1, ePitch2			# Louds the pitch of an E note.
	lw	$t2, duration2			# Loads the duration of the note.
	lw	$t3, piano			# Loads the type of instrument.
	lw	$t4, volume			# Loads the max volume.
	move	$a0, $t1			# Moves sound data to $a0 - $a3 to be played.
	move	$a1, $t2
	move	$a2, $t3
	move	$a3, $t4
	syscall
	li	$v0, 4				# else, player three is the winner. 
	la	$a0, playerThree
	syscall 
	j	end				# Jump to end.
	
else3:
	bne	$t0, 4, else4			# if(howMany == 4)
	li 	$v0, 4				# Prints game beginning.
	la 	$a0, begin
	syscall
	li 	$v0, 4				# Player 1
	la 	$a0, player1
	syscall 
	jal	Game				# Calls to Game function.
	sw	$s0, fourPlayerRA($s4)		# Saves player 1 total in first location in array.
	addi	$s4, $s4, 4			# Increments array to next location.
	li 	$v0, 4				# Prints the total value for player 1.
	la 	$a0, total
	syscall 
	li 	$v0, 1
	lw	$a0, fourPlayerRA($zero)
	syscall
	
	li	$v0, 4				# Player 2
	la	$a0, player2
	syscall
	jal	Game				# Calls to Game function.
	sw	$s0, fourPlayerRA($s4)		# Saves player 2 total in second location in array.
	li 	$v0, 4				# Prints the total value for player 2.
	la 	$a0, total
	syscall 
	li 	$v0, 1
	lw 	$a0, fourPlayerRA($s4)
	syscall
	
	li	$v0, 4				# Player 3
	la	$a0, player3
	syscall 
	jal	Game				# Calls to Game function.
	addi	$s4, $s4, 4			# Increments array to next location.
	sw	$s0, fourPlayerRA($s4)		# Saves player 3 total in third location in array.
	li 	$v0, 4				# Prints the total value for player 3.
	la 	$a0, total
	syscall 
	li 	$v0, 1
	lw	$a0, fourPlayerRA($s4)
	syscall	
	
	li	$v0, 4				# Player 4
	la	$a0, player4
	syscall
	jal	Game				# Calls the Game function.
	addi	$s4, $s4, 4			# Increments array to next location.
	sw	$s0, fourPlayerRA($s4)		# Saves player 4 total in fourth location in array.
	li 	$v0, 4				# Prints the total value for player 4.
	la 	$a0, total
	syscall 
	li 	$v0, 1
	lw 	$a0, fourPlayerRA($s4)
	syscall	
	
	lw	$t6, fourPlayerRA($zero)	# Loads first players total into register $t6.
	addi	$s4, $zero, 4			# $s4 = 4.
	lw	$t7, fourPlayerRA($s4)		# Loads second players total into register $t7.
	addi	$s4, $zero, 8			# $s4 = 8.
	lw	$t8, fourPlayerRA($s4)		# Loads third players total into register $t8.
	addi	$s4, $zero, 12			# $s4 = 12.
	lw	$t9, fourPlayerRA($s4)		# Loads fourth players total into register $t9.
	
	blt	$t6, $t7, next4			# if(playerOne > playerTwo && playerOne > playerThree && playerOne > playerFour)
	blt	$t6, $t8, next4
	blt	$t6, $t9, next4
	li	$v0, 31
	lw	$t1, bPitch			# Louds the pitch of an B note.
	lw	$t2, duration1			# Loads the duration of the note.
	lw	$t3, piano			# Loads the type of instrument.
	lw	$t4, volume			# Loads the max volume.
	move	$a0, $t1			# Moves sound data to $a0 - $a3 to be played.
	move	$a1, $t2
	move	$a2, $t3
	move	$a3, $t4
	syscall
	li	$v0, 32				# Sleeps for 110 milliseconds.
	la	$a0, 110
	syscall 
	li	$v0, 31
	lw	$t1, ePitch2			# Louds the pitch of an E note.
	lw	$t2, duration2			# Loads the duration of the note.
	lw	$t3, piano			# Loads the type of instrument.
	lw	$t4, volume			# Loads the max volume.
	move	$a0, $t1			# Moves sound data to $a0 - $a3 to be played.
	move	$a1, $t2
	move	$a2, $t3
	move	$a3, $t4
	syscall
	li	$v0, 4				# Player one is the winner.
	la	$a0, playerOne
	syscall 
	j	end				# Jump to end.
next4:
	blt	$t7, $t6, next5			# if(playerTwo > playerOne && playerTwo > playerThree && playerTwo > playerFour)
	blt	$t7, $t8, next5
	blt	$t7, $t9, next5	
	li	$v0, 31
	lw	$t1, bPitch			# Louds the pitch of an B note.
	lw	$t2, duration1			# Loads the duration of the note.
	lw	$t3, piano			# Loads the type of instrument.
	lw	$t4, volume			# Loads the max volume.
	move	$a0, $t1			# Moves sound data to $a0 - $a3 to be played.
	move	$a1, $t2
	move	$a2, $t3
	move	$a3, $t4
	syscall
	li	$v0, 32				# Sleeps for 110 milliseconds.
	la	$a0, 110
	syscall 
	li	$v0, 31
	lw	$t1, ePitch2			# Louds the pitch of an E note.
	lw	$t2, duration2			# Loads the duration of the note.
	lw	$t3, piano			# Loads the type of instrument.
	lw	$t4, volume			# Loads the max volume.
	move	$a0, $t1			# Moves sound data to $a0 - $a3 to be played.
	move	$a1, $t2
	move	$a2, $t3
	move	$a3, $t4
	syscall	
	li	$v0, 4				# Player two is the winner.
	la	$a0, playerTwo
	syscall 
	j	end				# Jumps to end.
next5:
	blt	$t8, $t6, next6			# if(playerThree > playerOne && playerThree > playerTwo && playerThree > playerFour)
	blt	$t8, $t7, next6
	blt	$t8, $t9, next6
	li	$v0, 31
	lw	$t1, bPitch			# Louds the pitch of an B note.
	lw	$t2, duration1			# Loads the duration of the note.
	lw	$t3, piano			# Loads the type of instrument.
	lw	$t4, volume			# Loads the max volume.
	move	$a0, $t1			# Moves sound data to $a0 - $a3 to be played.
	move	$a1, $t2
	move	$a2, $t3
	move	$a3, $t4
	syscall
	li	$v0, 32				# Sleeps for 110 milliseconds.
	la	$a0, 110
	syscall 
	li	$v0, 31
	lw	$t1, ePitch2			# Louds the pitch of an E note.
	lw	$t2, duration2			# Loads the duration of the note.
	lw	$t3, piano			# Loads the type of instrument.
	lw	$t4, volume			# Loads the max volume.
	move	$a0, $t1			# Moves sound data to $a0 - $a3 to be played.
	move	$a1, $t2
	move	$a2, $t3
	move	$a3, $t4
	syscall
	li	$v0, 4				# Player three is the winner.
	la	$a0, playerThree
	syscall 
	j	end				# Jump to end.
next6:
	li	$v0, 31
	lw	$t1, bPitch			# Louds the pitch of an B note.
	lw	$t2, duration1			# Loads the duration of the note.
	lw	$t3, piano			# Loads the type of instrument.
	lw	$t4, volume			# Loads the max volume.
	move	$a0, $t1			# Moves sound data to $a0 - $a3 to be played.
	move	$a1, $t2
	move	$a2, $t3
	move	$a3, $t4
	syscall
	li	$v0, 32				# Sleeps for 110 milliseconds.
	la	$a0, 110
	syscall 
	li	$v0, 31
	lw	$t1, ePitch2			# Louds the pitch of an E note.
	lw	$t2, duration2			# Loads the duration of the note.
	lw	$t3, piano			# Loads the type of instrument.
	lw	$t4, volume			# Loads the max volume.
	move	$a0, $t1			# Moves sound data to $a0 - $a3 to be played.
	move	$a1, $t2
	move	$a2, $t3
	move	$a3, $t4
	syscall
	li	$v0, 4				# else, player four is the winner.
	la	$a0, playerFour
	syscall 
	j	end				# Jump to end.
	
else4:
	li	$v0, 4				# Prints error message for invalid amount of players.
	la	$a0, errorMsg
	syscall 
	j	playAgain			# Jump to playAgain for a valid input.
	
end:
	lw 	$ra, 12($sp)			# Restores the return address. 
	jr 	$ra				# Return to main.

#Pseudocode
#  cardsanddice() {
#    $t3 = 0
#    for(i=0, i < 32, i++) {
#      shifts to 30th bit
#      XOR 32nd and 30th bit
#      shifts to 26th bit
#      XOR results and 26th bit
#      shifts to 25th bit
#      XOR results and 25th bit
#      shifts XOR result to far left
#      shifts one bit to the right
#      $t4 = 10
#      $t5 = 6
#      mod 10
#      mod 6
#      $s7 + 1
#      $s6 + 1
#      cardlfsr = $s7
#      dicelfsr = $s6
#    }
#  }

cardsanddice:
	addi	$t3, $zero, 0			# $t3 = 0, start of the loop. 
loop:
	bgt	$t3, 31, exit			# Loops 32 times so 32 new bits are generated.
	addi	$t3, $t3, 1

	srl	$t0, $s2, 2			# Shifts to 30th bit.
	xor	$t1, $t0, $s2			# XOR 32nd and 30th bit. 
	srl	$t0, $s2, 6			# Shifts to 26th bit.
	xor	$t1, $t1, $t0			# XOR results from first XOR and 26th bit. 
	srl	$t0, $s2, 7			# Shifts to 25th bit. 
	xor	$t1, $t1, $t0			# XOR results from second XOR and 25th bit. 
	sll	$t1, $t1, 31			# Shifts XOR result to the far left.
	srl	$s2, $s2, 1			# Shifts one bit to the right.
	or	$s2, $t1, $s2			
	
	addi	$t4, $zero, 10			# $t4 = 10.
	
	addi	$t5, $zero, 6			# $t5 = 6.
	
	divu	$s2, $t4			# mod 10 to get values from 0-9.
	mfhi	$s7
	
	divu	$s2, $t5			# mod 6 to get values from 0-5.
	mfhi	$s6
	
	addi	$s7, $s7, 1			# Adds one to make values from 1-10.
	addi	$s6, $s6, 1			# Adds one to make values from 1-6.
	
	sw	$s7, cardlfsr			# Saves random generated card to cardlfsr.
	sw	$s6, dicelfsr			# Saves random generated die roll to dicelfsr.
	
	j	loop				# Jumps to loop.
	
exit:
	jr	$ra				# returns.

#Pseudocode:
#  Game() {
#    cardsanddice()
#    $t2 = cardlfsr
#    print(firstCard)
#    cardsanddice()
#    $t3 = cardlfsr
#    print(secondCard)
#    total = firstCard + secondCard
#    Roll()
#    total = total * diceRoll
#  }

Game:
	sw 	$ra, 8($sp)			# Saves return address to the stack.
	li 	$v0, 4				# Prints the first cards value.
	la 	$a0, firstCardValue
	syscall 
	jal 	cardsanddice			# Jump and link to cardsanddice.
	lw	$t2, cardlfsr			# Loads cardlfsr to register $t2.
	li 	$v0, 1
	la 	$a0, ($t2)
	syscall 
	li 	$v0, 4				# Prints the second cards value.
	la 	$a0, secondCardValue
	syscall 
	jal	cardsanddice			# Jump and link to cardsanddice.
	lw	$t3, cardlfsr			# Loads cardlfsr to register $t3. 
	li 	$v0, 1
	la 	$a0, ($t3)
	syscall 
	
	add 	$t4, $t3, $t2			# Adds the two card values together.
	
	jal 	Roll				# Calls the Roll function.
	
	mult 	$t4, $t5			# Calculates the total value for the player.
	mflo 	$s0				# Total value in register s0.
	
	lw 	$ra, 8($sp)			# Restores the return address.
	jr 	$ra				# Jumps to the return.
	
#Pseudocode:
#  Bot() {
#    cardsanddice()
#    $t2 = cardlfsr
#    print(firstCard)
#    cardsanddice()
#    $t3 = cardlfsr
#    print(secondCard)
#    total = firstCard + secondCard
#    $t5 = dicelfsr
#    print(diceRoll)
#    total = total * diceRoll
#  }	

Bot:
	sw	$ra, 4($sp)			# Saves return address to the stack.
	li 	$v0, 4				# Prints the first cards value.
	la 	$a0, firstCardValue
	syscall 
	jal 	cardsanddice			# Jump and link to cardsanddice.
	lw	$t2, cardlfsr			# Loads cardsanddice to register #t2.
	li 	$v0, 1				# Prints the first cards value.
	la 	$a0, ($t2)
	syscall 
	li 	$v0, 4				# Prints the second cards value.
	la 	$a0, secondCardValue
	syscall 
	jal	cardsanddice			# Jump and link to cardsanddice.
	lw	$t3, cardlfsr			# Loads cardsanddice to register $t3.
	li 	$v0, 1				# Prints the seconds cards value.
	la 	$a0, ($t3)
	syscall 
	
	add 	$t4, $t3, $t2			# Adds the two card values together.
	
	lw	$t5, dicelfsr			# Loads dicelfsr to register $t5.
	
	li 	$v0, 4				# Prints the value from the dice roll.
	la 	$a0, dice
	syscall 
	li 	$v0, 1
	la 	$a0, ($t5)
	syscall 
	
	mult 	$t4, $t5			# Calculates the total value for the player.
	mflo 	$s0
	
	lw	$ra, 4($sp)			# Restores the return address.
	jr 	$ra				# Jumps to the return.

#Pseudocode:
#  Roll() {
#    print(diceReady)
#    diceResponse = readChar()
#    if(diceResponse == 'R')
#      $t5 = dicelfsr
#      print(diceRoll)
#    else
#      sleep(5 seconds)
#      goto Roll
#  }

Roll:
	sw 	$ra, 0($sp)
	li 	$v0, 4 				# Prompts for user to be ready for dice roll.
	la 	$a0, diceReady
	syscall 
	
	li 	$v0, 12				# Reads response from user.
	syscall 
	
	sw 	$v0, diceResponse		# Stores response from user in diceResponse location.
	
	lw 	$t1, diceResponse		# Loads response to register.
	
	bne 	$t1, 'R', Wait			# if (diceResponse == R), then generate random dice value form 0 to 6.
	
	lw 	$t5, dicelfsr			# Loads dicelfsr to register $t5.
	
	li 	$v0, 4				# Prints the value from the dice roll.
	la 	$a0, dice
	syscall 
	li 	$v0, 1
	la 	$a0, ($t5)
	syscall 
	j 	goBack				# Jumps to goBack. 
	
Wait:						# If user is not ready for the dice roll sleep for 5 seconds.
	li 	$v0, 32				# Sleeps for 5000 milliseconds.
	la 	$a0, 5000
	syscall
	j	Roll				# Jumps to Roll.

goBack:
	lw 	$ra, 0($sp)			# Restores the return address. 
	jr 	$ra				# Returns to location called.
	
	
	
	
	
	
	
