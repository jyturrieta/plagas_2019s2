import plagas.*

class Elementos 
{
	method recibeAtaqueDe(unaPlaga)
	{
		unaPlaga.efectoDeAtaque()
	}
}

class Hogar inherits Elementos
{
	var property mugre = 0
	var property confort = 0
	
	method esBueno()
	{
		return mugre < confort / 2  
	}
	
	override method recibeAtaqueDe(unaPlaga)
	{
		mugre = mugre + unaPlaga.nivelDeDanio()
		super(unaPlaga)
	}
}

object nivelASuperar
{
	var property cantidad = 0
}
class Huerta inherits Elementos
{
	var property capacidadDeProduccion = 0
			
	method esBueno() 
	{
		return capacidadDeProduccion > nivelASuperar.cantidad()
	}
	
	override method recibeAtaqueDe(unaPlaga)
	{
		if (unaPlaga.transmiteEnfermedades())
		{
			capacidadDeProduccion = capacidadDeProduccion - (capacidadDeProduccion * 0.1) - 10
		}
		else
		{
			capacidadDeProduccion = capacidadDeProduccion - (capacidadDeProduccion * 0.1)
		}
		super(unaPlaga)
	}
}


class Mascota inherits Elementos
{
	var property nivelDeSalud = 0
	
	method esBueno()
	{
		return nivelDeSalud > 250
	}
	
	override method recibeAtaqueDe(unaPlaga)
	{
		if (unaPlaga.transmiteEnfermedades())
		{
			nivelDeSalud = nivelDeSalud - unaPlaga.nivelDeDanio()
		}
		super(unaPlaga)
	}
}

class Barrio
{
	var property elementos = []
	
	method agregarElemento(elemento)
	{
		elementos.add(elemento)
	}
	
	method sumarBuenos()
	{
		return elementos.filter({elemento => elemento.esBueno()}).size()	
	}
	method sumarNoBuenos()
	{
		return elementos.filter({elemento => not elemento.esBueno()}).size()	
	}
	method esCopado()
	{
		return self.sumarBuenos() > self.sumarNoBuenos()
	}
}