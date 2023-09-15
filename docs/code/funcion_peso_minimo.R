##Funcion peso minimo
func_peso_min <- function(x){
  print("Valor de x")
  print(x);
  # SE RESETEA LA CONEXION CON EL ARDUINO PARA LA LIMPIEZA DE LOS DATOS
  close(myArduino);
  open(myArduino);
  Sys.sleep(1.2);
  
  # SE ENVIA LA INFORMACION MEDIANTE LA CONEXION SERIAL
  write.serialConnection(myArduino, paste(x, collapse = ''));
  Sys.sleep(8.2);
  # SE CAPTURA LA RESPUESTA COMO UNA TABLA 
  prueba = capture.output(cat(read.serialConnection(myArduino,n=0)));
  arduinoinfo <<- tibble(prueba);
  
  Sys.sleep(0.1);
  # SE TRANSFORMA LA TALBA A VALORE Y SE PROCESAN PARA RETORNAR EL VALOR SOLICITADO
  p<-pull(arduinoinfo[1,1]);
  c<-pull(arduinoinfo[2,1]);
  valorx [i] <<- x;
  print("Peso");
  print(p);
  print("Corriente");
  print(c);
  p=(parse_double(p));
  c=-1*parse_double(c);
  # Se guardan los valores para posterior guardado.
  pg [i] <<- p;
  cg [i] <<- c;
  p_c [i] <<- p/c;
  print(p);
  Sys.sleep(0.005);
  i= i+1;
  i <<-i;
  # para asegurarse que 0 no sea el minimo
  if (p==0){
    print(-1000);
    return(-1000);
  }else
  {
    print(-p);
    return(-p);
  }
}

