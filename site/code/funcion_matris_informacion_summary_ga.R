#Funcion para extraer informacion del summary(GA)
func_matris_info_sumario <- function(x){
  
  #Destacar que si posee mas variables a enviar se crearan mas datos en la tabla y pueden haber duplicados, porfavor de ser asi modificar los datos segun correspondan antes de ingresarlo a la tabla.
  sumario_GA<-summary(x);
  types<-sumario_GA[["type"]];
  popSize<-sumario_GA[["popSize"]];
  maxiter<-sumario_GA[["maxiter"]];
  elitism<-sumario_GA[["elitism"]];
  pcrossover<-sumario_GA[["pcrossover"]];
  pmutation<-sumario_GA[["pmutation"]];
  
  #En este caso solo domain contiene 2 datos asi que requiere modificacion
  domain<-sumario_GA[["domain"]]
  domainarreglado<-tibble(domain[1],domain[2]);
  domainarreglado = rename(domainarreglado,c(lower="domain[1]",upper="domain[2]"));
  
  suggestions<-sumario_GA[["suggestions"]];
  iterations<-sumario_GA[["iter"]];
  fitness<-sumario_GA[["fitness"]];
  solution<-sumario_GA[["solution"]];
  aux1<-tibble(types,popSize,maxiter,elitism,pcrossover,pmutation,domainarreglado,suggestions,iterations,fitness,solution);
  return(aux1);
}