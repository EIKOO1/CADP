program JugamosConListas;
type
lista = ^nodo;
nodo = record
num : integer;
sig : lista;
end;
procedure eliminar (var l:lista; v:integer);
var
anterior:lista;
actual:lista;
begin
anterior:=l;
actual:=l;
	while (actual <> nil ) and (v <> actual^.num) do 
	begin
	anterior:=actual;
	actual:= actual^.sig;
	end;
	if (actual <> nil) then
		begin
		if (actual=l)then
			l:=l^.sig
		else
		anterior^.sig:= actual^.sig;
dispose(actual);
			
		end;
end;
{recibe como parámetros la lista y un valor entero, y elimina dicho valor de la lista (si existe) NO ESTA ORDENADA}
procedure armarNodo(var L: lista; v: integer);
var
aux : lista;
begin
new(aux);
aux^.num := v;
aux^.sig := L;
L := aux;
end;
procedure estaordenada (l:lista);
var
ok:boolean;
aux:lista;
begin
ok:=true;
aux:= l;

while (l <> nil ) and(aux^.sig <> nil) and (ok ) do
begin
aux:= aux^.sig;
if (l^.num > aux^.num) then
ok:= true
else
ok:=false;
l:= l^.sig;
end;
		
	
if (ok = true)then
	writeln ('ESTA ORDENADA')
	ELSE
		WRITELN ('NO ESTA ORDENADA');
	
end;
procedure mostrarlista (pri:lista);
var
aux:lista;
begin
aux:= pri;
	while (aux <> nil) do 	
		begin
			writeln (aux^.num);
			aux:= aux^.sig;
		end;
end;
var
pri : lista;
valor : integer;
v:integer;
begin
pri := nil;
writeln('Ingrese un numero');
read(valor);
while (valor <> 0) do
begin
armarNodo(pri, valor);
writeln('Ingrese un numero');
read(valor);
end;
estaordenada(pri);
writeln ('ingrese un valor para eliminar');
readln(v);
eliminar(pri,v);
mostrarlista(pri);
end.
{EstáOrdenada: recibe la lista como parámetro y retorna true si la misma se encuentra ordenada, o
false en caso contrario.
b. Eliminar: recibe como parámetros la lista y un valor entero, y elimina dicho valor de la lista (si
existe). Nota: la lista podría no estar ordenada.
c. Sublista: recibe como parámetros la lista L y dos valores enteros A y B, y retorna una nueva lista
con todos los elementos de la lista L mayores que A y menores que B.
d. Modifique el módulo Sublista del inciso anterior, suponiendo que la lista L se encuentra ordenada
de manera ascendente.
e. Modifique el módulo Sublista del inciso anterior, suponiendo que la lista L se encuentra ordenada
de manera descendente}
