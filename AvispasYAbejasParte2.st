!classDefinition: #ElHabitat category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #ElHabitat
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ElHabitat class' category: 'AvispasYAbejasParte2'!
ElHabitat class
	instanceVariableNames: 'huevos huevosDeOriana huevosDeOrnella huevosDePolly orugas polillas'!

!ElHabitat class methodsFor: 'as yet unclassified' stamp: 'rg 4/21/2022 20:21:23'!
agregarHuevoDeOriana
	huevosDeOriana := huevosDeOriana + 1.! !

!ElHabitat class methodsFor: 'as yet unclassified' stamp: 'rg 4/21/2022 20:21:45'!
agregarHuevoDeOrnella
	huevosDeOrnella := huevosDeOrnella +1 .! !

!ElHabitat class methodsFor: 'as yet unclassified' stamp: 'rg 4/21/2022 20:21:57'!
agregarHuevoDePolly
	huevosDePolly := huevosDePolly + 1.! !

!ElHabitat class methodsFor: 'as yet unclassified' stamp: 'rg 4/21/2022 19:49:24'!
agregarOruga
	
	orugas := orugas +1.! !

!ElHabitat class methodsFor: 'as yet unclassified' stamp: 'rg 4/21/2022 20:09:40'!
agregarPolilla
	polillas := polillas +1.! !

!ElHabitat class methodsFor: 'as yet unclassified' stamp: 'rg 4/21/2022 20:22:43'!
cantidadDeHuevosDeAvispas
	^ huevosDeOriana + huevosDeOrnella + huevosDePolly .! !

!ElHabitat class methodsFor: 'as yet unclassified' stamp: 'rg 4/21/2022 20:27:07'!
cantidadDeHuevosDeOriana
	^huevosDeOriana .! !

!ElHabitat class methodsFor: 'as yet unclassified' stamp: 'rg 4/21/2022 20:27:37'!
cantidadDeHuevosDeOrnella
	^huevosDeOrnella .! !

!ElHabitat class methodsFor: 'as yet unclassified' stamp: 'rg 4/21/2022 20:28:04'!
cantidadDeHuevosDePolly
	^huevosDePolly .! !

!ElHabitat class methodsFor: 'as yet unclassified' stamp: 'rg 4/21/2022 19:51:19'!
cantidadDeOrugas
	^orugas.! !

!ElHabitat class methodsFor: 'as yet unclassified' stamp: 'rg 4/21/2022 20:10:51'!
cantidadDePolillas
	^polillas .! !

!ElHabitat class methodsFor: 'as yet unclassified' stamp: 'rg 4/21/2022 19:53:24'!
matarOruga
	orugas := orugas-1.! !

!ElHabitat class methodsFor: 'as yet unclassified' stamp: 'rg 4/21/2022 20:11:53'!
matarPolilla
	polillas := polillas-1.! !

!ElHabitat class methodsFor: 'as yet unclassified' stamp: 'rg 4/21/2022 20:23:30'!
retrocederAlInicioDeLosTiempos
	huevosDeOriana := 0.
	huevosDeOrnella := 0.
	huevosDePolly := 0.
	orugas :=0.
	polillas :=0.! !


!ElHabitat class methodsFor: '--** private fileout/in **--' stamp: 'rg 4/21/2022 20:49:59'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	huevos := 0.
	huevosDeOriana := 1.
	huevosDeOrnella := 0.
	huevosDePolly := 0.
	orugas := 1.
	polillas := 2.! !


!classDefinition: #Lara category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #Lara
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Lara class' category: 'AvispasYAbejasParte2'!
Lara class
	instanceVariableNames: ''!

!Lara class methodsFor: 'as yet unclassified' stamp: 'rg 4/21/2022 20:32:55'!
intentarReproducirse
	( ElHabitat cantidadDePolillas = 0 ) ifFalse: [
		ElHabitat matarPolilla.
		ElHabitat agregarHuevoDePolly.
	]! !


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

!Oriana class methodsFor: 'as yet unclassified' stamp: 'rg 4/21/2022 20:17:40'!
intentarReproducirse
	( ElHabitat cantidadDeOrugas = 0 ) ifFalse: [
		ElHabitat matarOruga.
		ElHabitat agregarHuevoDeOriana.
	]! !


!classDefinition: #Ornella category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #Ornella
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Ornella class' category: 'AvispasYAbejasParte2'!
Ornella class
	instanceVariableNames: ''!

!Ornella class methodsFor: 'as yet unclassified' stamp: 'rg 4/21/2022 20:31:38'!
intentarReproducirse
	( ElHabitat cantidadDeOrugas = 0 ) ifFalse: [
		ElHabitat matarOruga.
		ElHabitat agregarHuevoDeOriana.
	]! !


!classDefinition: #Polly category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #Polly
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Polly class' category: 'AvispasYAbejasParte2'!
Polly class
	instanceVariableNames: ''!

!Polly class methodsFor: 'as yet unclassified' stamp: 'rg 4/21/2022 20:19:31'!
intentarReproducirse
	( ElHabitat cantidadDePolillas = 0 ) ifFalse: [
		ElHabitat matarPolilla.
		ElHabitat agregarHuevoDePolly.
	]! !


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


!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JMB 4/19/2022 19:14:52'!
cantidadDeHuevosConLaFirmaGeneticaDeLara
	Assert isTrue: false description: 'Reemplazar esto por la implementación correspondiente'.! !

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

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JMB 4/19/2022 19:14:28'!
laAvispaLara
	Assert isTrue: false description: 'Reemplazar esto por la implementación correspondiente'.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'rg 4/21/2022 19:31:13'!
laAvispaOriana
	^Oriana.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'rg 4/21/2022 20:05:10'!
laAvispaOrnella
	^Ornella ! !

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