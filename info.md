# Análisis Tiempos de Viaje en el Teleférico

<img src="teleferico.png"  width="600">

IDB https://www.iadb.org
International Development Bank

Para el presente trabahjo se utilizo la base de datos disponible en https://mydata.iadb.org/Transport/An-lisis-modal-y-tiempos-de-viaje-en-el-sistema-Mi/3c9c-dny7

## Objetivo
Encontrar las principales razones de uso del teleferico para determinar politicas sociales

## Datos de la base de datos
El BID realizo una encuesta de movilidad urbana que constituye la fuente principal de datos para el presente análisis. Dentro de este marco reunimos información sobre los patrones de viaje y características socioeconómicas de los residentes, en junio y julio de 2015. Para obtener datos comparables y determinar los viajes más comunes, tales como de la casa al lugar de trabajo o la escuela y de regreso, recogimos datos de las 6 p.m. a las 9 p.m. en días laborables y fines de semana. La muestra fue recogida a nivel sub-distrital (manzanos) para cubrir los distritos de La Paz y El Alto, siguiendo un proceso de selección aleatorio. Un total de 6,720 habitantes de La Paz (4,208) y El Alto (2,512) fueron entrevistados de entre un total de 6,208 hogares (3,892 y 2,316 en La Paz y El Alto respectivamente). Se encuestó a los participantes sobre los dos últimos viajes que habían hecho antes de la fecha de la entrevista

El trabajo utiliza los registro de El Alto, esto debido a la disponibilidad, los datos de La Paz no se encuetran disponibles


## Datasets
- Hogares
  - "LUGAR", "MAQ", "ENCUESTADOR", "MES", "DIA", "ENC2", "NUMDAT", "HORA", "CHOGAR", "CODIGO_HOGAR_SIMPLE", "ZONA", "MANZANA", "NFAM", "NPERS", "NKIDS", "PPOSIB", "NTRABAJAN", "NESTUDIAN", "NPMR", "TIPOVIV", "PROPVIV", "ANTIGENVIV", "IDIOMA", "PLANES.MUDAR", "NSE.DECL", "NSE.OBS", "NUM.AUTO", "NUM.AUT.GARAGE", "NUMBIC", "USOBICI", "X100TPUB", "X10TPUB2.NOCTURNO", "SE.REFIERE", "ORIGEN.HAB", "A.DONDE.SE.MUDA", "NUM.HOGAR", "DIST.HOGAR"

- Viajes
  - "LUGAR", "MAQ", "ENCUESTADOR", "MES", "DIA", "CODIGO_HOGAR_SIMPLE", "ZONA", "CUADRA", "NPERS", "NUMVIAJ", "X10.MOTORI", "MOTDES", "HHMM.SALE", "HHMMLLEG", "X10.MOD1", "PORQUE", "TEF_PUMA_ANTES1", "TAR1", "X10.MOD2", "PORQUE.1", "TEF_PUMA_ANTES1.1", "TAR2", "X10.MOD3", "PORQUE.2", "TEF_PUMA_ANTES1.2", "TAR3", "X10.MOD4", "PORQUE.3", "TEF_PUMA_ANTES4", "TEF_PUMA_ANTES1.3", "TAR4", "X10.MOD5", "PORQUE.4", "TEF_PUMA_ANTES1.4", "TAR5", "cod.ori", "cod.des" 

- Personas
  - "LUGAR", "MAQ", "MES", "DIA", "CODIGO_HOGAR_SIMPLE", "ZONA", "MANZANA", "NPERSONA", "X10SEXO", "EDAD", "X10OCUP", "AUTO", "X10SEGUR.TELEFERICO", "INCIDENTE.TELEFERICO", "X10ESTUDIOS", "INGRESOS", "VIAJO", "cod.est", "cod.tra"


