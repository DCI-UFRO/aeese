func_guardado <- function(x,y,z,tabla){
  #Modificacion para la obtencion de la hora
  guardar=as.POSIXct(Sys.time(),format="%d/%m/%Y_%H_%M_%S");
  guardar = format(Sys.time(),"%Y-%m-%d_%H-%M-%S");
  #Union de nombres de archivos
  nombrecsv=paste(x,guardar,".txt",sep="_");
  nombreGA=paste(x,"GA",guardar,".txt",sep="_");
  
  #Archivo de los datos del algoritmo genetico.
  write.csv(dtset,file=nombrecsv);
  
  #Imagen valores de las pruebas del algoritmo genetico peso/corriente
  if(z==TRUE){
    nombrefoto=paste(x,guardar,".png",sep="_");
    png(nombrefoto);
    plot(valorx,p_c);
    dev.off;
  }
  #Archivo de optimo Genetico segun lo requerido.
  aux = func_matris_info_sumario(y);
  write.csv(aux,file=nombreGA);
  
}

#Estas funciones van de la mano porque para poder exportar la infomacion a csv es necesario tener la fun_matris_info_sumario

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