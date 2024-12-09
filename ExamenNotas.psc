Funcion Menu(Default)
	Escribir "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
	Escribir "|                             Menu                            |"
	Escribir "| 1. Asignar 3 notas parciales a cada estudiante.             |"
	Escribir "| 2. Registrar el número de inasistencias de cada estudiante. |"
	Escribir "| 3. Mostrar el listado de estudiantes.                       |"
	Escribir "| 4. Calcular nota final.                                     |"
	Escribir "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
FinFuncion

Funcion RegistrarEstudiantes(BD)
	Para i<-1 Hasta 10 Hacer
		Escribir "Digite el codigo de el estudiante ", i
		Leer BD[i,1]
		Escribir "Digite el nombre del estudiante ", i
		Leer BD[i,2]
	FinPara
FinFuncion

Funcion id<-Buscar(BD,cod)
	Escribir "Digite el codigo del estudiante"
	Leer cod
	id =""
	encontrado = Falso
	Para i<-1 Hasta 10 Hacer
		si cod=BD[i,1] Entonces
			id = BD[i,1]
		FinSi
	FinPara
FinFuncion

Funcion RegistrarNotas(BD,Notas)

	id=Buscar(BD,cod)
	Si id <> "" Entonces
		Para x<-1 Hasta 3 Hacer
			Escribir "Digite la nota ", x," de el estudiante: ", BD[id,2] 
			Leer Notas[id,x]
		FinPara
		
	SiNo
		Escribir "Codigo no encontrado"
	FinSi


FinFuncion

Funcion RegistrarInasistencias(BD,Notas)
	id=Buscar(BD,cod)
	Si id <> "" Entonces
		Escribir "Digite la cantidad de inasistencias del estudiante: ", BD[id,2] 
		Leer Notas[id,4]
	SiNo
		Escribir "Codigo no encontrado"
	FinSi
FinFuncion

Funcion MostrarEstudiantes(BD)
	Escribir "Codigo	|   Nombre"
	Para i<-1 Hasta 10 Hacer
		Escribir BD[i,1] ,"	|  ", BD[i,2]
	FinPara
FinFuncion

Funcion MostrarNotas(BD,Notas)
	Escribir "Codigo	| Nombre	| Nota1	| Nota2	| Nota3	| Asistencia	| NotaTotal	|"
	Para i<-1 Hasta 10 Hacer
		inasistencia=0
		Si Notas[i,4]>=15 Entonces
			inasistencia = 1
		SiNo
			Si Notas[i,4]>=10 Entonces
				inasistencia = 0.5
			FinSi
		FinSi
		Notas[i,5] = ((Notas[i,1]+Notas[i,2]+Notas[i,3])/3)-inasistencia
		Escribir  BD[i,1] ,"	| ", BD[i,2],"		| ", Notas[i,1] ,"	| ", Notas[i,2],"	| ", Notas[i,3] ,"	| ", Notas[i,4],"		| ", Notas[i,5],"		|"
	FinPara
FinFuncion

Algoritmo sin_titulo
	Dimension BD[10,2]
	Dimension Notas[10,5]
	Definir Notas Como Real
	RegistrarEstudiantes(BD)
	Repetir
		Menu(1)
		Leer op
		Segun op Hacer
			1:
				RegistrarNotas(BD,Notas)
			2:
				RegistrarInasistencias(BD,Notas)
			3:
				MostrarEstudiantes(BD)
			4:
				MostrarNotas(BD,Notas)
		FinSegun
	Hasta Que op=0

FinAlgoritmo
