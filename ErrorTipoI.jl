using Statistics


n = 10000    #Genero diez mil pares de muestras.
tm = 101     #Genero 101 datos en cada muestra.

t1 = 1.984   #Valor crítico superior de t para ese tamaño de muestra.
t2 = -1.984  #Valor crítico inferior de t para ese tamaño de muestra.


v = zeros(n)

for j in 1:n
    
   muestra1 = rand(n,tm) #Genero las primeras diez mil muestras.
   muestra2 = rand(n,tm) #Genero las segundas diez mil muestras.
    
    medias1 = mean(muestra1,dims=2) #Obtengo las primeras diez mil medias.
    medias2 = mean(muestra2,dims=2) #Obtengo las segundas diez mil medias.
     
    var1 = var(muestra1, dims=2)    #Obtengo las primeras diez mil varianzas.
    var2 = var(muestra2, dims=2)    #Obtengo las segundas diez mil varianzas.
    
    numerador = (medias1-medias2)            #Obtengo el numerador del estadístico.
    denominador = sqrt.(var1/tm + var2/tm)   #Obtengo el denominador del estadístico.
    t = numerador ./ denominador             #Obtengo los diez mil estadísticos.
    
    
    var1 = let contador = 0
       
        for i in 1:n                        #Cuento el número de estadísticos que caen fuera del intervalo. 
            if(t[i]>t1 || t[i]<t2)
               
                #print(t[i])
                contador+=1
                
            end
            v[j]=contador
        end    
        
    end    
    
end 
    
    println("El número de significaciones para ",  n  ," corridas es= ",v) #Muestro los estadísticos
    
    media_v= mean(v,dims=1) #Se desnuda el supuesto de regularidad Estadística y en promedio se acerca a lo esperado.
    
    println(" ")

    println("El promedio de las significaciones es:", media_v) #Muestro el promedio.

    println("Observar que promedio empírico se acerca a lo esperado del error tipo I ")


