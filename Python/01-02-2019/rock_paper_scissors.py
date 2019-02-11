def startGame():

		
		
	player1=int(input("Player1:Enter your choice(1.ROCK|2.PAPER|3.SCISSORS)\n\t"))
	player2=int(input("Player2:Enter your choice(1.ROCK|2.PAPER|3.SCISSORS)\n\t"))
		
	if player1==player2:
		print ("You both have chosen the same Try Again")
			
	elif player1==1:
		if player2==2:
			print ("Player2 Wins")
		else:
			print ("Player1 Wins")
	elif player1==2:
		if player2==1:
			print ("Player1 Wins")
		else:	
			print ("Player2 Wins")
	elif player1==3:
		if player2==1:
			print ("Player2 Wins")
		else:
			print ("Player1 Wins")

def exitGame():
	print 'GAME OVER'
	exit()


print("ROCK|PAPER|SCISSORS GAME \n Enter \n \t 1.Start Game \n \t 2.EndGame \n \t 3.Restart Game")
choice=input("Enter index of options to begin")

if choice==1:
	while True:
		startGame()
		con=int(input('Do you wish to continue? 1.YES or 2.NO'))
		if con==1:
			continue
		else:
			break
			
if choice==2:
	exitGame()
if choice==3:
	startGame()
	

	
