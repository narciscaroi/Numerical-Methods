CAROI NARCIS FLORIN 313CD

** Pe checker in dlmread a trebuit indicele(care reprezinta coloana) din 1 in 0 (pe local trebuia cu 1) **

-> read_input_data.m
	Functia primeste ca parametru doua fisiere.
	Pentru fiecare din cele 2 fisiere am folosit functi "fopen" pentru a deschide
le deschide, apoi am facut verificarea in cazul in care unul din acestea nu s-a 
deschis. NC am citit cu ajutorul lui "fscanf" deoarece aveam de citit un singur
numar, iar apoi m-am folosit de functia "dlmread" deoarece am putut da ca parametru
de unde sa inceapa cu citirea(fisierele aveau la inceput comentarii). Am folosit 
fclose pt a inchide fisierele.



->clustering_pc.m
	Aceasta primeste ca parametru "points" si "NC", valori primite de la functia
prezentata anterior. Am dat centroizilor valorile random(acestea nefiind similare)
cu ajutorul functiei randperm, pentru a extrage linii aleatorii din matricea
"points". Am facut un while care se opreste atunci cand greutatile sunt egale
la doi pasi consecutivi. Am initializat(aceasta se face dupa fiecare pas deoarce
greutatile se modifica) cu 0 greutatile, Gx, Gy, Gz reprezentand coordoanatele "x", 
"y" respectiv "z" ale greutatii. Functia norm calculeaza distanta dintre 2 puncte
la care am adaugat functia min pentru a-mi returna cea mai mica distanta si indicele
clusterului (1, 2,3 ...max(NC) ) si am salvat intr-un vector coloana de "n" linii
indicii. 
	In primul for parcurg liniile matricei points , iar in cel de-al doilea
verific tipul indicelui pentru a incrementa numarul de puncte dintr-un cluster
si pentru a face suma pentru greutatile fiecarul cluster.
	In cel de-al treilea for, parcurg fiecare linie din greutati si le impart
la numarul de puncte corespuncator pentru a afla centrul de greutate.
	In cel de-al patrulea for atribui noilor centroizi, centrele de greutate
ale clusterelor calculate anterior. Vx, Vy si Vz imi retin centrele de greutate
calculate anterior (acestea sunt initalizate cu 0 deoarece primul pas nu conteaza,
de la al doilea vedem daca sunt egale). Daca sunt egale,returnez, daca nu, atribui
lui Vx, Vy si Vz noile valori ale centrelor de greutate si repet pasii din
while-ul cu k>0 pana cand sunt centrele de greutate sunt egale la doi pasi
consecutivi.



->view_cluster.m
	Initializez "NC" egal cu numarul de linii ale matricei "centroids" pentru
a retine numarul de centroizi, "n" egal cu numarul de linii ale matricei 
"points" pentru a retine numarul de puncte, si x,y,z pentru a retine
coordonatele punctelor.
	Cu for-ul de la i la n parcurg "toate liniile din points", iar cu j
numarul de centroids pentru a vedea tipul punctelor din "points". Daca 
j == 1,atunci punctul apartine primului centroid s.a.m.d. Cu ajutorul
lui scatter3 creez graficul care primeste coordonatele x,y,z ale unui
punct, si culorile aferente centroidului(rosu pentru 1, blue pentru 2
si green pentru 3). Apeland de mai multe ori functia scatter3,
dar dorind ca punctele sa se puna pe acelasi grafic, am folosit
"hold on".
	Cu "title" am pus un titlu graficului, cu "view" am facut ca
graficul 3d sa se vada dintr-o anumita parte incat punctele
sa se deosebeasca bine, iar cu xlabel, ylabel si zlabel am denumit
axele graficului.



->compute_cost_pc
	Am initializat variablile pentru a retine anumite date : "NC" pentru
numarul de centroizi, "n" pentru numarul de puncte, apoi array_cost pentru
suma dinstatelor fiecarui centroiid. 
	In primul for calculez distanta dintre un centroid si un punct si 
verific carui cluster ii apartine un punct(am explicat cum functioneaza
si la clustering_pc).
	In cele doua foruri consecutive verific carui centroid ii apartiene
un anumit punct si il atribui distanta pe linia corespunzatoare din
vectorul coloana array_cost.
	Cu un for pentru a parcurge liniile vectorului coloana array_cost
fac suma dintre cost(initializat cu 0) si fiecare distanta dintr-un
cluster.



->view_cost_vs_nc
	Citirea este explicata la read_input_data.
	Initializez doivectori "x" si "NC", "x" retinand costul pentru 
un anumit numar de clustere, iar "NC" numarul acesotra.
	In for initializez cu 0 de fiecare data o matrice centroids de 3
coloane,care reprezinta cele 3 coordoante, iar j coloane in functie
de numarul de centroizi care variaza intre 1 si 10.
	Apelez functia compute_cost_pc prezentata anterior pentru a
calcula costul pentru un numar "j" de centroizi, retinand fiecare
cost in vecotrul x.
	Apelez functia plot cu argumentele NC si x pentru a face
graficul corespunzator.