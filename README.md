title: "Inference of Fuzzy Cognitive Maps (FCMs)"
<br>

author: "Zoumpoulia Dikopoulou, Elpiniki Papageorgiou"

---

<br>

###The fcm package

Estimates the Inference of a Fuzzy Cognitive Map. Moreover, the "**fcm**" package provides a selection of **3 different inference rules** and **4 threshold functions** in order to obtain the FCM inference. It returns a dataframe of the concepts' values of each state after the inference procedure. FCM is proven to be capable of causal inference and is applicable to modeling complex decision problems where numerous interlinked dependent variables influence one another. 

<br>
 
####Fuzzy Cognitive Maps (FCMs)

Fuzzy Cognitive Map is a combination of fuzzy logic and cognitive mapping, and it is a way to represent knowledge of systems which are characterized of uncertainty and complex processes. FCMs were introduced by Kosko and since then they have gradually emerged as a powerful paradigm for knowledge representation. FCMs are ideal causal cognition tools for modeling and simulating dynamic systems. 

FCMs are fuzzy signed directed graphs with feedback. Each interconnection between two concepts $C_{i}$ and $C_{j}$ has a weight, a directed edge $w_{ij}$, which indicates the strength of the causal relationships between concepts $C_{i}$ and $C_{j}$. The value of the weight $w_{ij}$ indicates how strongly the concept $C_{i}$ influences concept $C_{j}$.The time varying concept function $C_{i}(t)$ measures the non negative occurrence of some fuzzy event. There are three possible types of causal relationship between concept $C_{i}$ and concept $C_{j}$, according to the sign of the weight $w_{ij}$:

1. $w_{ij}>0$ indicates a positive causality between concept $C_{i}$ and concept $C_{j}$. This means that an increase/decrease in the value of concept $C_{i}$ leads to the increase/decrease of the value of concept $C_{j}$. (positive causality)
2. $w_{ij}<0$ indicates a negative (inverse) causality between concept $C_{i}$ and concept $C_{j}$. This means that an increase in the value of concept $C_{i}$ leads to a decrease of the value of concept $C_{j}$ and a decrease of the value of concept $C_{i}$ leads to an increase of the value of concept $C_{j}$. ( negative causality)
3. $w_{ij}=0$ indicates no relationship between concept $C_{i}$ and $C_{j}$. (zero causality) 

<br>

#### Inference Rules
Every concept in the FCM graph has a value $A_{i}$ that expresses the quantity of its corresponding physical value and it is derived by the transformation of the fuzzy values assigned by the experts to numerical values. The value $A_{i}$ of each concept $C_{i}$ is calculated during each simulation step, computing the influence of other concepts to the specific concept by selecting one of the following equations (inference rules): 


| **Inference Rule**         |      **Equation**                                                                |
|----------------------------|:--------------------------------------------------------------------------------:|
| Kosko's  inference:        | $A_{i}(k+1)=f\left(\sum_{j=1,j\neq1}^Nw_{ji}\times A_{j}(k)\right)$              |
| modified Kosko's inference:| $A_{i}(k+1)=f\left(A_{i}(k)+\sum_{j=1,j\neq1}^Nw_{ji}\times A_{j}(k)\right)$      |
| Rescale inference:         | $A_{i}(k+1)=f\left((2\times A_{i}(k)-1)+\sum_{j=1,j\neq1}^Nw_{ji}\times (2\times A_{j}(k)-1)\right)$ |
|                            |                                                                                    |

where $A_{i}(k+1)$ is the value of concept $C_{i}$ at simulation step $k+1$, $A_{j}(k)$ is the value of concept $C_{j}$ at the simulation step $k$, $w_{ij}$ is the weight of the interconnection between concept $C_{j}$ and concept $C_{i}$, $k$ is the interaction index an every simulation step and $f(·)$ is the threshold (activation) function:


| **Threshold function** |      **Equation**                                                                      |
|------------------------|:--------------------------------------------------------------------------------------:|
| Bivalent:              | \[f(x)= \left\{\begin{array}{ll} 1 & x > 0 \\0 & x\leq 0 \\\end{array} \right.\]       |
| Trivalent:             | \[f(x)= \left\{\begin{array}{ll} 1 & x > 0 \\0 & x=0 \\-1 & x<0 \\\end{array} \right.\]|
| Sigmoid:               | $f(x)=\frac{1}{1+e^{-\lambda\times x}}$                                                |
| Hyperbolic tangent:    |  $f(x)=\tanh(\lambda\times x)$                                                         |
|                        |                                                                                        |

       
where $\lambda$ is a real positive number ($\lambda>0$) which determines the steepness of the continuous function $f$ and $x$ is the value $A_{i}(k)$ on the equilibrium point. The sigmoid threshold function ensures that the calculated value of each concept will belong to the interval [0,1]. When the values of concepts can be negative and their values belong to the interval [-1,1], the following function is used: $f(x)=tanh(x)$. The FCM model of the system takes the initial values of concepts and weights based on experts knowledge and experience for the real system and then it is free to interact. At each step, the value $A_{i}$ of a concept is influenced by the values of concepts connected to it and it is updated according to the inference rule.

<br>

> **NOTE**: Except the inference rules that mentioned above, the clamping types of these rules are determined (Kosko-clamped, modified Kosko-clamped and Rescale-clamped). In this case, the activated concepts (concept's value equals to 1) are activated in all states in the FCM simulation until the output is stabilized.

<br><br>


## How is it possible to obtain the FCM inference using R?

### Step 1: Load the fcm package
```{r}
library(fcm)
```

<br><br>

### Step 2: Create (or import) the weight matrix and the activation vector 

The **weight matrix** stores the weights assigned to the pairs of concepts which are usually normalized to the interval $[0, 1]$ or $[-1, +1]$. The dimension of the weight matrix is *m x m*, where m denotes the number of the columns (nodes). 

The **activation vector** contains the initial concept values which each concept is turned on or activated by making its vector element 1 or 0 or in $[0, 1]$. The dimension of the activation matrix is *1 x m*.

> **NOTE**: Both of these input arguments should be transformed as **dataframes**.


```{r }
act.vec <- data.frame(1, 1, 1, 0, 0, 0)    # Create the activation vector
colnames(act.vec) <- c("C1", "C2", "C3", "C4", "C5", "C6")  # Change the column names

C1 = c(0.0, 0.0, 0.6, 0.9, 0.0, 0.0)
C2 = c(0.1, 0.0, 0.0, 0.0, 0.0, 0.0)
C3 = c(0.0, 0.7, 0.0, 0.0, 0.9, 0.0)
C4 = c(0.0, 0.0, 0.0, 0.0, 0.0, 0.9)
C5 = c(0.0, 0.0, 0.0, 0.0, 0.0, -0.9)
C6 = c(-0.3, 0.0, 0.0, 0.0, 0.0, 0.0)


w.mat <- matrix(c(C1, C2, C3, C4, C5, C6), nrow =6, ncol=6, byrow=TRUE)   # Create the weight matrix
w.mat <- as.data.frame(w.mat)    # Transform w.mat as a dataframe
colnames(w.mat) <- c("C1", "C2", "C3", "C4", "C5", "C6") 
w.mat       # View the weight matrix
```

> **NOTE**: It is possible to import a file (for instance a .csv file), typing the file path. <br>
> `w.mat <- read.csv("C://type_the_file_path//name_of_file.csv")` <br>
> 
> *For more information about reading **.csv** files, type in R console:* `?read.csv`.


<br><br>

### Step 3: Use the fcm.infer function 

There are seven input arguments in the `fcm.infer` function: 


| **Arguments**    |      **Explanation**                                                                   |
|------------------|-------------------------------------------------------------------------------------- |
| **activation_vec**  | The activation vector contains the initial concept values which each concept is turned on or activated by making its vector element 1 or 0 or in $[0,1]$      |
| **weight_mat**      | The weight matrix stores the weights assigned to the pairs of concepts which are usually normalized to the interval $[0, 1]$ or $[-1, +1]$ 
| **iter**            | The number of iterations is a positive number ($iter > 0$). *Default value: $iter = 20$* |
| **infer**           | Six different inference rules are available (Kosko: `'k'`, modified Kosko: `'mk'`,  Rescale: `'r'`, Kosko-clamped: `'kc'`, modified Kosko-clamped: `'mkc'` or Rescale-clamped: `'rc'`).         *Default value: `infer = 'k'` *  |
| **transform**       | Four transformation functions (Bivalent: `'b'`,  Trivalent: `'tr'`,  Sigmoid: `'s'` or Hyperbolic tangent: `'t'`). *Default value: transform = `'s'`* |
| **lambda**           | The lambda ($\lambda$) parameter is a positive number, higher than zero and lower-equal to ten, $0<\lambda\leq10$. *Default value: $lambda = 1$ *|
| **e**                | Epsilon ($\epsilon$) is a residual, describing the minimum error difference among the subsequent concepts. Its value depends on the application type. The possible $e$ value is determined between `0.01` and `0.000001`. *Default value: $e = 0.001$*  |
|                  |                                                                                        |



<br>

The `fcm.infer` function prints a message to inform the user if the convergence has been reached or not.

* If the convergence has been reached then the converged state (fixed point) is printed: 

*`"The concepts' values are converged in the ith state"`*.

<br>

* If the convergence has not been reached a message informs the user that more iterations required: 

*`"More iterations are required to reach the convergence"`*.

<br><br>


#### Examples to obtain the FCM Inference  

**Example 1: Estimate the FCM Inference (using the default values of the function)**

```{r }
output1 <- fcm.infer(act.vec, w.mat)
```

<br>

**Example 2: Estimate the FCM Inference (changing the default values)**

The FCM Inference (fcm.infer) function is using the rescale `'r'` inference rule, the sigmoid `'s'` transformation function, the lambda parameter equals to 2 `lambda = 2` and the e parameter `e = 0.0001`.

```{r }
output2 <- fcm.infer(act.vec, w.mat, 35, "r", "s", lambda = 2, e = 0.0001)
output2$values          # View the concepts' values for each iteration
```

<br><br>

### Step 4: Visualize the concepts' values for each iteration

For the visualization of the concepts' values for each iteration after the inference process, it is crucial to load the libraries: `reshape` and `ggplot2`. 

```{r }
# load the libraries
library (reshape2)
library (ggplot2)
```
<br>


**Visualization of Example 1:**
```{r, fig.width=7,fig.height=4}
iterations <- as.numeric(rownames(output1$values))  # create a numeric vector named "iterations"
df <- data.frame(iterations, output1$values)   # add "iterations" in the "output1$values" dataframe
df2 <- melt(df, id="iterations")              # transform the dataframe df into long formats
ggplot(data=df2,                              # Visualize the concepts' values 
       aes(x=iterations, y=value, group=variable, colour=variable)) +
       theme_bw() + geom_line(size=0.7) + geom_point(size = 3)

```

<br><br>

**Visualization of Example 2:**
```{r, fig.width=7,fig.height=4}
iterations <- as.numeric(rownames(output2$values))  
df <- data.frame(iterations, output2$values)   
df2 <- melt(df, id="iterations")              
ggplot(data=df2,
       aes(x=iterations, y=value, group=variable, colour=variable)) +
       theme_bw() + geom_line(size=0.7) + geom_point(size = 3)

```

<br>

###References

1. B. Kosko, "Fuzzy cognitive maps", International Journal of Man-Machine Studies 24,  65-75, 1986.
2. C.D. Stylios, P.P, Groumpos, "A Soft Computing Approach for Modelling the Supervisor of Manufacturing Systems", Intelligent and Robotic Systems, VOl. 26, p.p. 389–403, 1999. 
3. E.I. Papageorgiou, "A new methodology for Decisions in Medical Informatics using fuzzy cognitive maps based on fuzzy rule-extraction techniques", Applied Soft Computing, Vol. 11, Issue 1, p.p. 500–513, 2011.
4. E.I. Papageorgiou, "Fuzzy Cognitive Maps for Applied Sciences and Engineering From Fundamentals to Extensions and Learning Algorithms", Intelligent Systems Reference Library, Volume 54, 2014.

<br><br>


# FCM
Fuzzy Cognitive Maps - R
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

