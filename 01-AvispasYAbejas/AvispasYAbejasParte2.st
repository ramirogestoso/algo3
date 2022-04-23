!classDefinition: #ElHabitat category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #ElHabitat
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ElHabitat class' category: 'AvispasYAbejasParte2'!
ElHabitat class
	instanceVariableNames: 'polillas orugas huevosDeOriana huevosDePolly huevosDeLara'!

!ElHabitat class methodsFor: 'Reiniciar habitat' stamp: 'rg 4/23/2022 18:50:52'!
retrocederAlInicioDeLosTiempos
	huevosDeOriana := 0.
	huevosDeLara := 0.
	huevosDePolly := 0.
	orugas :=0.
	polillas :=0.! !


!ElHabitat class methodsFor: 'Manejo de recursos' stamp: 'rg 4/21/2022 19:49:24'!
agregarOruga
	
	orugas := orugas +1.! !

!ElHabitat class methodsFor: 'Manejo de recursos' stamp: 'rg 4/21/2022 20:09:40'!
agregarPolilla
	polillas := polillas +1.! !

!ElHabitat class methodsFor: 'Manejo de recursos' stamp: 'rg 4/21/2022 19:51:19'!
cantidadDeOrugas
	^orugas.! !

!ElHabitat class methodsFor: 'Manejo de recursos' stamp: 'rg 4/21/2022 20:10:51'!
cantidadDePolillas
	^polillas .! !


!ElHabitat class methodsFor: 'Manejo de huevos' stamp: 'rg 4/23/2022 19:04:32'!
agregarHuevoDeLara
	(huevosDeOriana = 0 ) ifFalse: [
		huevosDeOriana := huevosDeOriana - 1 .
		huevosDeLara := huevosDeLara + 1.
	] ifTrue: [ 
		( huevosDePolly = 0 ) ifFalse: [
		huevosDePolly := huevosDePolly - 1 .
		huevosDeLara := huevosDeLara + 1.
	]]! !

!ElHabitat class methodsFor: 'Manejo de huevos' stamp: 'rg 4/23/2022 19:05:01'!
agregarHuevoDeOriana
	( orugas > 0) ifTrue: [
		orugas := orugas - 1 .
		huevosDeOriana := huevosDeOriana + 1. ].! !

!ElHabitat class methodsFor: 'Manejo de huevos' stamp: 'rg 4/23/2022 19:05:15'!
agregarHuevoDePolly
	( polillas > 0) ifTrue: [
		polillas := polillas - 1 .
		huevosDePolly := huevosDePolly + 1. ].! !

!ElHabitat class methodsFor: 'Manejo de huevos' stamp: 'bq 4/23/2022 18:15:01'!
cantidadDeHuevosDeAvispas
	^ huevosDeOriana + huevosDeLara + huevosDePolly .! !

!ElHabitat class methodsFor: 'Manejo de huevos' stamp: 'bq 4/23/2022 18:18:16'!
cantidadDeHuevosDeLara
	^ huevosDeLara .! !

!ElHabitat class methodsFor: 'Manejo de huevos' stamp: 'rg 4/21/2022 20:27:07'!
cantidadDeHuevosDeOriana
	^huevosDeOriana .! !

!ElHabitat class methodsFor: 'Manejo de huevos' stamp: 'rg 4/21/2022 20:28:04'!
cantidadDeHuevosDePolly
	^huevosDePolly .! !


!ElHabitat class methodsFor: '--** private fileout/in **--' stamp: 'rg 4/23/2022 19:06:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	polillas := 0.
	orugas := 0.
	huevosDeOriana := 0.
	huevosDePolly := 0.
	huevosDeLara := 0.! !


!classDefinition: #Oriana category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #Oriana
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Oriana class' category: 'AvispasYAbejasParte2'!
Oriana class
	instanceVariableNames: ''!

!Oriana class methodsFor: 'as yet unclassified' stamp: 'rg 4/23/2022 19:05:01'!
intentarReproducirse
	ElHabitat agregarHuevoDeOriana .! !


!classDefinition: #Lara category: 'AvispasYAbejasParte2'!
Oriana subclass: #Lara
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Lara class' category: 'AvispasYAbejasParte2'!
Lara class
	instanceVariableNames: ''!

!Lara class methodsFor: 'as yet unclassified' stamp: 'rg 4/23/2022 19:04:35'!
intentarReproducirse
	ElHabitat agregarHuevoDeLara .! !


!classDefinition: #Ornella category: 'AvispasYAbejasParte2'!
Oriana subclass: #Ornella
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!


!classDefinition: #Polly category: 'AvispasYAbejasParte2'!
Oriana subclass: #Polly
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Polly class' category: 'AvispasYAbejasParte2'!
Polly class
	instanceVariableNames: ''!

!Polly class methodsFor: 'as yet unclassified' stamp: 'rg 4/23/2022 19:05:15'!
intentarReproducirse
	ElHabitat agregarHuevoDePolly .! !


!classDefinition: #PruebasReproduccionDeAvispas category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #PruebasReproduccionDeAvispas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasReproduccionDeAvispas class' category: 'AvispasYAbejasParte2'!
PruebasReproduccionDeAvispas class
	instanceVariableNames: ''!

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/18/2022 18:38:11'!
test01EnElInicioDeLosTiemposNoHayHuevos	
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:12:44'!
test02CuandoOrianaLaAvispaSeReproducePorPrimeraVezDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:12:11'!
test03CadaVezQueOrianaSeReproduceDejaUnHuevoMas
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 2.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:12:53'!
test04ParaDejarUnHuevoOrianaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaOrugaMas.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:13:43'!
test05ParaDejarUnHuevoOrianaLaAvispaDecrementaEnUnoLaPoblacionDeOrugasDelHabitat
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaDosOrugasMas.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:13:22'!
test06CuandoNoHayOrugasOrianaLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'JMB 4/21/2022 12:14:24'!
test07CuandoOrnellaLaAvispaSeReproduceDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'JMB 4/21/2022 12:14:18'!
test08ParaDejarUnHuevoOrnellaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaOrugaMas.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'JMB 4/21/2022 12:14:11'!
test09CuandoNoHayOrugasOrnellaLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:46'!
test10CuandoPollyLaAvispaSeReproduceDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:40'!
test11ParaDejarUnHuevoPollyLaAvispaReduceLaPoblacionDeUnaPolillaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaPolillaMas.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDePolillas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:36'!
test12ParaDejarUnHuevoPollyLaAvispaDecrementaEnUnoLaPoblacionDePolillasDelHabitat
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaDosPolillasMas.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDePolillas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:30'!
test13CuandoNoHayPolillasPollyLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:15:06'!
test14CuandoOrianaLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:15:02'!
test15CuandoOrianaLaAvispaAunNoSeReprodujoNoTieneHuevosConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:14:58'!
test16CuandoPollyLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDePolly isEqualTo: 1.
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:14:54'!
test17CuandoOrnellaLaAvispaSeReproduceDejaUnHuevoConLaMismaFirmaGeneticaQueOriana
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella isEqualTo: 1.
	Assert 
		that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella  
		isEqualTo: self cantidadDeHuevosConLaFirmaGeneticaDeOriana! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:27'!
test18CuandoLaraLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOrnella intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeLara isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:22'!
test19CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAOtraAvispa
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:18'!
test20CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAPolly
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaPolly intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDePolly isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:12'!
test21CuandoLaraLaAvispaNoTieneRecursosNoDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
		
	self laAvispaLara intentarReproducirse.
		
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeLara isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'bq 4/23/2022 18:18:03'!
cantidadDeHuevosConLaFirmaGeneticaDeLara
	^ElHabitat cantidadDeHuevosDeLara.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'rg 4/21/2022 20:25:54'!
cantidadDeHuevosConLaFirmaGeneticaDeOriana
	^ ElHabitat cantidadDeHuevosDeOriana.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'rg 4/21/2022 20:32:23'!
cantidadDeHuevosConLaFirmaGeneticaDeOrnella
	^ ElHabitat cantidadDeHuevosDeOriana.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'rg 4/21/2022 20:26:36'!
cantidadDeHuevosConLaFirmaGeneticaDePolly
	^ ElHabitat cantidadDeHuevosDePolly.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'rg 4/21/2022 19:21:58'!
habitat
	^ ElHabitat! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'rg 4/21/2022 20:14:01'!
hacerQueElHabitatTengaLosRecursosSuficientes
	self queElHabitatTengaDosOrugasMas .
	self queElHabitatTengaDosPolillasMas .! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'bq 4/23/2022 18:19:06'!
laAvispaLara
	^Lara.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'rg 4/21/2022 19:31:13'!
laAvispaOriana
	^Oriana.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'rg 4/23/2022 18:48:18'!
laAvispaOrnella
	^Ornella .! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'rg 4/21/2022 20:07:24'!
laAvispaPolly
	^Polly .! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'rg 4/21/2022 19:54:49'!
queElHabitatTengaDosOrugasMas
	ElHabitat agregarOruga .
	ElHabitat agregarOruga .! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'rg 4/21/2022 20:12:40'!
queElHabitatTengaDosPolillasMas
	ElHabitat agregarPolilla .
	ElHabitat agregarPolilla .! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'rg 4/21/2022 19:47:58'!
queElHabitatTengaUnaOrugaMas
	ElHabitat agregarOruga.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'rg 4/21/2022 20:09:11'!
queElHabitatTengaUnaPolillaMas
	ElHabitat agregarPolilla.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'rg 4/21/2022 19:44:55'!
retrocederElHabitatAlInicioDeLosTiempos
	ElHabitat retrocederAlInicioDeLosTiempos .! !

ElHabitat initializeAfterFileIn!