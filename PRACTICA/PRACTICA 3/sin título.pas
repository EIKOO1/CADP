{Una empresa importadora de microprocesadores desea implementar un sistema de software para analizar la
información de los productos que mantiene actualmente en stock. Para ello, se conoce la siguiente
información de los microprocesadores: marca (Intel, AMD, NVidia, etc), línea (Xeon, Core i7, Opteron, Atom,Centrino, etc.),
*  cantidad de cores o núcleos de procesamiento (1, 2, 4, 8), velocidad del reloj (medida en Ghz) y
tamaño en nanómetros (nm) de los transistores (14, 22, 32, 45, etc.). La información de los microprocesadores
se lee de forma consecutiva por marca de procesador y la lectura finaliza al ingresar un procesador con 0 cores
(que no debe procesarse). Se pide implementar un programa que lea información de los microprocesadores
de la empresa importadora e informe:
● Marca y línea de todos los procesadores de más de 2 cores con transistores de a lo sumo 22 nm.
● Las dos marcas con mayor cantidad de procesadores con transistores de 14 nm.
● Cantidad de procesadores multicore (de más de un core) de Intel o AMD, cuyos relojes alcancen
velocidades de al menos 2 Ghz}
program seis;
type
core = 0..8;
cpu = record
marca :string;
linea :string;
cores:core;
velocidad: real;
transitores:integer;
end;
procedure leer(var e:cpu);
begin
writeln('marca de cpu'); readln(e.marca);
writeln('linea de cpu'); readln(e.linea);
writeln ('cantidad de nucleos'); readln(e.cores);
if(e.cores>0 )then begin
writeln('velocidad de reloj');readln(e.velocidad);
writeln('transitores');readln(e.transitores);
end;
end;
var
e:cpu;
cant:integer;
actual:string;
lineaactual:string;
begin
leer(e);
 while (e.cores > 0 ) do begin
	cant:= 0;  				//● Marca y línea de todos los procesadores de más de 2 cores con transistores de a lo sumo 22 nm
	Actual:= e.marca;
	lineaactual:= e.linea;
	while (e.cores > 0 ) and (e.marca = actual) do begin
		if (e.cores > 2 ) and (e.transitores >= 22)then
			cant:= cant+1;
		leer(e);
		end;
	writeln (' la marca y linea con los procesedaores de mas de 2 cores con transitores de a lo sumo 22nm es : ' , cant);
	end;
end.
