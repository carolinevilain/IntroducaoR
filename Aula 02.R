###### Aula 2: Manipula��o de dados. ######

#Define o Working Directory:
setwd("C:\\Users\\Pedro Albuquerque\\Dropbox\\Departamento de Administra��o\\Cursos\\Introdu��o � Computa��o Cient�fica\\Dados")

#L� os dados do arquivo Pobreza.csv
pobre.df<-read.csv("pobreza.csv")

##Exemplo 1:
#Cria o vetor logical
gini<- (pobre.df$Var08<=40)
#Obt�m somente a base cujo Gini � menor do que 40
novo.df<-pobre.df[gini,]

#Exemplo 2
#observa��es tais que �ndice de Gini seja menor ou igual a 40 
#e o Incid�ncia da Pobreza Subjetiva n�o seja maior do que 30.
bool<- (pobre.df$Var08<=40) & !(pobre.df$Var08>30)
#Obt�m os dados
novo2.df<-pobre.df[bool,]

##Exemplo 3:
#Cria o vetor logical
indices1<- which(pobre.df$Var08<=40)
#Obt�m somente a base cujo Gini � menor do que 40
novo.df<-pobre.df[indices1,]

#observa��es tais que �ndice de Gini seja menor ou igual a 40 
#e o Incid�ncia da Pobreza Subjetiva n�o seja maior do que 30.
indices2<- which((pobre.df$Var08<=40) & !(pobre.df$Var08>30))
#Obt�m os dados
novo2.df<-pobre.df[indices2,]

##Exemplo 4:
#Obt�m somente a base cujo Gini � menor do que 40
novo.df<-subset(pobre.df,Var08<=40)

#observa��es tais que �ndice de Gini seja menor ou igual a 40 
#e o Incid�ncia da Pobreza Subjetiva n�o seja maior do que 30.
#Obt�m os dados
novo2.df<-subset(pobre.df,Var08<=40 & !(Var08>30))

##Exemplo 5:
df<-read.csv2("reshape.csv")
df
#Chama a biblioteca
library("reshape2")
df.wide<-melt(df,id="Municipio")
df.wide

##Exemplo 6:
#Coloca no formato long
df2<-dcast(df.wide,Municipio~variable)
df2

##Exemplo 7:
#Cria a base A
base.A<-data.frame(ID=c(1,3,5,7,9),
                   Name=c('A','B','C','D','E'),
                   Height=c(1,2,2,2,2))

#Cria a base B
base.B<-data.frame(ID=c(2,4,5,7),
                   Name=c('A','B','C','D'),
                   Weight=c(2,3,4,5))

#Interse��o
int<-merge(base.A,base.B,by="ID",all=FALSE)
#left outer join
left<-merge(base.A,base.B,by="ID",all.x=TRUE)
#right outer join
right<-merge(base.A,base.B,by="ID",all.y=TRUE)
#full outer join
all<-merge(base.A,base.B,by="ID",all=TRUE)

##Exemplo 8:
base1<-data.frame(Var1=c(1,2,3,4),
                  Var2=c(4,5,5,6),
                  Var3=c('A','A','B','B'))

base2<-data.frame(Var1=c(5,6,7,8),
                  Var2=c('1','2','3','4'),
                  Var3=c('A','A','B','B'))

#Tenta fazer a uni�o vertical
base<-rbind(base1,base2)
#Mostra os valores
base

##Exemplo 9:
summary(base$Var1)
summary(base$Var3)

##Exemplo 10:
#Configura o R para apresentar todas
#as casas decimais
options(scipen=100)
options(digits=4)

#Incoca o pacote
library(pastecs)

#Faz as estat�sticas descritivas
stat.desc(pobre.df)

##Exemplo 11:

#Item 1: Lendo a base
inf<-read.csv("infert.csv")
#Item 2: Instalando e lendo o pacote
#install.packages("gmodels")
library(gmodels)
#Item 3: Liste as vari�veis existentes na base de dados.
colnames(inf)
#Item 4: Liste os formatos das vari�veis.
str(inf)

#Cria a tabela cruzada
CrossTable(inf$education, inf$induced) 


##Exemplo 12:
#Convertendo para factor
inf$induced <- factor(inf$induced,labels=c("Nenhum aboto",
                                           "Um aborto","Dois ou mais"))
CrossTable(inf$education, inf$induced) 
