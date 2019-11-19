		.data
T:		.word 4,2,10,1

str:		.asciz "valeur: =%d\n"

		.text
		.globl main

swap:
		

	

							//swap 	T[r0] et T[r1]

				
		ldr r4,=T
		add r4,r4,r0,asl#2			//l'adresse de T[r0]
		ldr r2,[r4]				//valeur de T[r0]

		ldr r5,=T
		add r5,r5,r1,asl#2			//l'adresse de T[r1]
		ldr r3,[r5]				//valeur de T[r1]

							//swap T[r0] et T[r1] 


		str r3,[r4]				  
		str r2,[r5]

	

		
		mov pc,lr
						

		

boucle:

						//premier index =r0  dernier index =r1  index du pivot=r4 valeur du pivot=r2
		
	
		ldr r3,=T
		add r3,r3,r0,asl#2
		ldr r3,[r3]			//r3=la valeur à comparé = T[r0]
		
		
		cmp r2,r3			//comparer la valeur de r2=pivot avec r3= T[r0]
				

		
		stmfd sp!,{r0-r6,lr}		//swap  Tr[r0] et Tr[r4] si la valeur du pivot est plus grande
		mov r1,r4
		blgt swap
		ldmfd sp!,{r0-r6,lr}
		
		cmp r2,r3			//comparer la valeur de r2=pivot avec r3= T[r0]

		addgt r4,r4,#1			//incremente r4	
	 
		add r0,r0,#1			//prochaine case dans le tableau 
				
	
		
		cmp r0,r1



		blt boucle

		mov pc,lr
partition: 
		

		ldr r2,=T			//sauvegarde de la valeur du pivot
		add r2,r2,r1,asl#2
		ldr r2,[r2]			//r2 le pivot
		
		
		mov r4,r0			//r4 sera l'index du pivot
	
		stmfd sp!,{r0-r3,lr}
		bl boucle
		ldmfd sp!,{r0-r3,lr}

		stmfd sp!,{r0-r6,lr}
		mov r0,r4			//swap T[r4] avec T[r1]				
		bl swap					
		ldmfd sp!,{r0-r6,lr}

		mov pc,lr
quicksort:
	

		stmfd sp!,{r0-r6,lr}
		cmp r1,r0
		blgt quick  
		ldmfd sp!,{r0-r6,lr}
		

		
		mov pc,lr
	
		
quick:
		
		stmfd sp!,{r0-r3,lr}
		bl partition			//mettre la position du pivot à r4
		ldmfd sp!,{r0-r3,lr}
		
		stmfd sp!,{r0-r6,lr}		//ne pas oublier la valeur de r1
		sub r5,r4,#1
		mov r1,r5
		bl quicksort			//appeler quick sur r0,r4
		ldmfd sp!,{r0-r6,lr}



		stmfd sp!,{r0-r6,lr}
		add r5,r4,#1
		mov r0,r5
		bl quicksort			//appeler quick sur r4,r1
		ldmfd sp!,{r0-r6,lr}

	
		mov pc,lr
		
main:	
		
		
		mov r0,#0			//le premier index
		mov r1,#3			//le dernier index
		
	
		stmfd sp!,{r0-r6,lr}
		bl quicksort
		ldmfd sp!,{r0-r6,lr}

		
		stmfd sp!,{r0-r6,lr}
		ldr r0,=str
		ldr r1,=T
		add r1,r1,#0
		ldr r1,[r1]
		bl printf
		ldmfd sp!,{r0-r6,lr}

		stmfd sp!,{r0-r6,lr}
		ldr r0,=str
		ldr r1,=T
		add r1,r1,#4
		ldr r1,[r1]
		bl printf
		ldmfd sp!,{r0-r6,lr}

		stmfd sp!,{r0-r6,lr}
		ldr r0,=str
		ldr r1,=T
		add r1,r1,#8
		ldr r1,[r1]
		bl printf
		ldmfd sp!,{r0-r6,lr}

		stmfd sp!,{r0-r6,lr}
		ldr r0,=str
		ldr r1,=T
		add r1,r1,#12
		ldr r1,[r1]
		bl printf
		ldmfd sp!,{r0-r6,lr}
	
				
		
						//retour dans l'environnement
		
		mov r0,#0
		mov pc,lr
		
		
