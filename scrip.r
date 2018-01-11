#la matriz de ponderación y el vector de activación

act.vec <- data.frame(1, 1, 1, 0.5, 1, 1, 1, 0, 0, 0)    # Create the activation vector
colnames(act.vec) <- c("C1", "C2", "C3", "C4", "C5", "C6", "C7", "C8", "C9", "C10")  # Change the column names

C1 = c(0.0, 0.584, 0.553, 0.544, 0.0, 0.0, 0.0, 0.0, 0.0, 0.777)
C2 = c(0.0, 0.0, 0.577, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.766)
C3 = c(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.82)
C4 = c(0.0, 0.584, 0.619, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.771)
C5 = c(0.0, 0.0, 0.0, 0.584, 0.0, 0.0, 0.0, 0.0, 0.0, 0.824)
C6 = c(0.0, 0.584, 0.0, 0.553, 0.0, 0.0, 0.0, 0.0, 0.0, 0.816)
C7 = c(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.788)
C8 = c(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.84) 
C9 = c(0.0, -0.202, -0.212, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -0.226) 
C10 = c(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)


w.mat <- matrix(c(C1, C2, C3, C4, C5, C6, C7, C8, C9, C10), nrow =10, ncol=10, byrow=TRUE)   # Create the weight matrix
w.mat <- as.data.frame(w.mat)    # Transform w.mat as a dataframe
colnames(w.mat) <- c("C1", "C2", "C3", "C4", "C5", "C6", "C7", "C8", "C9", "C10") 
w.mat       # View the weight matrix

#Estime la inferencia de FCM (utilizando los valores predeterminados de la función)

output1 <- fcm.infer(act.vec, w.mat) 
output1$values 

 #Estime la inferencia de FCM (cambiando los valores predeterminados)
 
output2 <- fcm.infer(act.vec, w.mat, 500, "r", "s", lambda = 2, e = 0.0001)
output2$values 

 #Visualiza los valores de los conceptos para cada iteración
 
library (reshape2)
library (ggplot2)

 #Ejemplo 1:
 
iterations <- as.numeric(rownames(output1$values))  # create a numeric vector named "iterations"
df <- data.frame(iterations, output1$values)   # add "iterations" in the "output1$values" dataframe
df2 <- melt(df, id="iterations")              # transform the dataframe df into long formats
ggplot(data=df2,                              # Visualize the concepts' values 
       aes(x=iterations, y=value, group=variable, colour=variable)) +
       theme_bw() + geom_line(size=0.7) + geom_point(size = 3)
	   
 #Ejemplo 2
iterations <- as.numeric(rownames(output2$values))  
df <- data.frame(iterations, output2$values)   
df2 <- melt(df, id="iterations")              
ggplot(data=df2,
       aes(x=iterations, y=value, group=variable, colour=variable)) +
       theme_bw() + geom_line(size=0.7) + geom_point(size = 3)

