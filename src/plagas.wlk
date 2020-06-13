class Plagas 
{
	var property poblacion = 0
	method transmiteEnfermedades()
	{
		return poblacion >= 10
	}
	
	method efectoDeAtaque()
	{
		poblacion = (poblacion + (poblacion * 0.1)).truncate(0)
	}
	
}

class Cucarachas inherits Plagas
{
	var property pesoPromedio = 0
	
	method nivelDeDanio()
	{
		return poblacion / 2
	}
	
	override method transmiteEnfermedades()
	{
		return super() and  pesoPromedio >= 10
	}
	override method efectoDeAtaque()
	{
		super() 
		pesoPromedio = pesoPromedio + 2
	}	
}

class Mosquitos inherits Plagas
{
	method nivelDeDanio()
	{
		return poblacion
	}
	override method transmiteEnfermedades()
	{
		return super() and poblacion % 3 == 0
	}
}


class Pulgas inherits Plagas
{
	method nivelDeDanio()
	{
		return poblacion * 2
	}
}

class Garrapatas inherits Plagas
{
	method nivelDeDanio()
	{
		return poblacion * 2
	}
	override method efectoDeAtaque()
	{
		poblacion = (poblacion + (poblacion * 0.2)).truncate(0)
	}
}

