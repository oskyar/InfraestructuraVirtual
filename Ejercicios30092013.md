# EJERCICIO 1

> **Enunciado:** Consultar en el catálogo de alguna tienda de informática el precio de un ordenador tipo servidor y calcular su coste de amortización a cuatro y siete años.

### Enlace del servidor escogido:

[Servidor HP Proliant ml110-g7-Xeon](http://www.acuista.com/servidor-hp-proliant-ml110-g7-xeon-e3-1220-639260-075-991943.html)
Precio con IVA: **376.95€**

-En primer lugar calculamos la base imponible del precio (precio sin IVA), ya que en éste viene incluido el IVA.

Sabemos que el IVA es el 21%, por lo que el IVA será **79.15€**
Base imponible: **297.79€**

### Calculamos la amortización a **4** años:
_**Primer año:**_ Es un 26% sobre la base imponible + el 100% del IVA.
Por lo tanto el precio en un primer año de amortización sería:
  **77.43€** + **79.15€**, total **156.57€**

_**Segundo año:**_ Estimamos un **26%** y ahora no se le suma el IVA ya que se incluyó en el _primer año_.
297.79 x 0.26 = **77.43€**

_**Tercer año:**_ Estimamos un **25%** que lo calculamos en la base imponible.
297.79 x 0.25 = **74.45€**

_**Cuarto año:**_ Estimamos un **23**.
297.79 x 0.23 = **68,50€**

Por lo tanto, la amortización sería el valor total de los **4** años, es decir, 156.57 + 77.43 + 74.45 + 68,50 = **376.95€**

-------------------------------------------------------------------------
### Calculamos la amortización a **7** años:
Base imponible: **297.79€**
IVA: **79.15€**

_**Primer año:**_ Estimamos 26% _(Base imponible)_ + 100% del IVA -> **77.43€** + **79.15€** =  **156.57€**

_**Segundo año:**_ Estimamos 21% _(Base imponible)_ -> **62,54€**

_**Tercero año:**_ Estimamos 18% _(Base imponible)_ -> **53,60€**

_**Cuarto año:**_ Estimamos 15% _(Base imponible)_ -> **44,67€**

_**Quinto año:**_ Estimamos 10% _(Base imponible)_ -> **29,78€**

_**Sexto año:**_ Estimamos 8% _(Base imponible)_ -> **23,82€**

_**Séptimo año:**_ Estimamos 2% _(Base imponible)_ -> **5,96€**

El total (suma de todos los años) debe de ser el 100% = **376.95€**

***
***

# EJERCICIO 2

> **Enunciado:** Usando las tablas de precios de servicios de alojamiento en Internet y de proveedores de servicios en la nube, Comparar el coste durante un año de un ordenador con un procesador estándar (escogerlo de forma que sea el mismo tipo de procesador en los dos vendedores) y con el resto de las características similares (tamaño de disco duro equivalente a transferencia de disco duro) si la infraestructura comprada se usa sólo el 1% o el 10% del tiempo.

Sabemos que un año tiene 8.760 horas (si no es bisiesto y suponiendo que no lo sea).
+ El 1% de 8760 es **87.60** horas.
+ El 10% será **876** horas.

## Servidores virtualizados:

### [Windows Azure (Linux)](http://msdn.microsoft.com/es-es/library/windowsazure/dn197896.aspx)
<table>
    <tbody>
        <tr>
            <th>Tipo</th>
            <th>vCPU</th>
            <th>RAM</th>
            <th>Disco</th>
            <th>€/hora</th>
            <th>€/mes</th>
            <th>Precio uso 1% (€)</th>
            <th>Precio uso 10% (€)</th>
        </tr>
        <tr>
            <td>
                <p> <strong>Small</strong>

                </p>
            </td>
            <td>
                <p>1</p>
            </td>
            <td>
                <p>1.75 GB</p>
            </td>
            <td>
                <p>70 GB</p>
            </td>
            <td>
                <p>0,0671</p>
            </td>
            <td>
                <p>49,90</p>
            </td>
            <td>
                <p>5,87</p>
            </td>
            <td>
                <p>58,77</p>
            </td>
        </tr>
        <tr>
            <td>
                <p> <strong>Medium</strong>

                </p>
            </td>
            <td>
                <p>2</p>
            </td>
            <td>
                <p>3.5 GB</p>
            </td>
            <td>
                <p>135 GB</p>
            </td>
            <td>
                <p>0,1341</p>
            </td>
            <td>
                <p>99,79</p>
            </td>
            <td>
                <p>11,74</p>
            </td>
            <td>
                <p>117,47</p>
            </td>
        </tr>
        <tr>
            <td>
                <p> <strong>Large</strong>

                </p>
            </td>
            <td>
                <p>4</p>
            </td>
            <td>
                <p>7 GB</p>
            </td>
            <td>
                <p>285 GB</p>
            </td>
            <td>
                <p>0,2681</p>
            </td>
            <td>
                <p>199,58</p>
            </td>
            <td>
                <p>23,48</p>
            </td>
            <td>
                <p>234,85</p>
            </td>
        </tr>
        <tr>
            <td>
                <p> <strong>ExtraLarge</strong>

                </p>
            </td>
            <td>
                <p>8</p>
            </td>
            <td>
                <p>14 GB</p>
            </td>
            <td>
                <p>605 GB</p>
            </td>
            <td>
                <p>0,5362</p>
            </td>
            <td>
                <p>399,16</p>
            </td>
            <td>
                <p>46,97</p>
            </td>
            <td>
                <p>469,71</p>
            </td>
        </tr>
    </tbody>
</table>


### [Tabla de precios en Acens:](http://www.acens.com/cloud/instant-servers/precios/)

<table class="ta_gral" width="100%" border="0" cellspacing="0" cellpadding="0">
    <colgroup>
        <col>
            <col>
                <col>
                    <col>
                        <col>
                            <col>
    </colgroup>
    <thead>
        <tr>
            <th>Tipo</th>
            <th>vCPU</th>
            <th>RAM</th>
            <th>Disco</th>
            <th>€/hora&nbsp;</th>
            <th>€/mes&nbsp;</th>
            <th>Precio uso 1% (€)</th>
            <th>Precio uso 10% (€)</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Small 1,5 <strong>(S-)</strong>
            </td>
            <td>1</td>
            <td>1,5 GB</td>
            <td>45 GB</td>
            <td>0,089</td>
            <td>64,97</td>
            <td>7,79</td>
            <td>77,96</td>
        </tr>
        <tr>
            <td>Small&nbsp;<strong>(S)</strong>
            </td>
            <td>2</td>
            <td>2 GB</td>
            <td>60 GB</td>
            <td>0,109</td>
            <td>95,57</td>
            <td>9,54</td>
            <td>95,48</td>
        </tr>
        <tr>
            <td>Medium&nbsp;<strong>(M)</strong>
            </td>
            <td>4</td>
            <td>4 GB</td>
            <td>120 GB</td>
            <td>0,192</td>
            <td>140,16</td>
            <td>16,81</td>
            <td>168,19</td>
        </tr>
        <tr>
            <td>Large&nbsp;<strong>(L)</strong>
            </td>
            <td>8</td>
            <td>8 GB</td>
            <td>240 GB</td>
            <td>0,338</td>
            <td>246,74</td>
            <td>29,60</td>
            <td>296,08</td>
        </tr>
    </tbody>
</table>

## Servidores dedicados:

### [Servidores Arsys](http://www.arsys.es/servidores/dedicados?gclid=CPC76pHHhLoCFTPItAodh0QA8Q)

| Tipo | Procesador | RAM | Disco Duro | €/mes | €/año | 
| :----------: | :----------: | :----------: | :----------: | :----------: | :----------: | 
| Servidor S2 | 1 x 2 Core x 1,87 GHz   | 2 GB | 2 x 160 GB SATA | 125 | 1500 |
| Servidor S4 | 1 x 4 Core x 2 GHz   | 4 GB | 2 x 500 GB SATA | 125 | 1500 |
| Servidor S6 | 1 x 6 Core x 2,3 GHz   | 8 GB | 2 x 300 GB SAS | 225 | 2700 |
| Servidor S8 | 2 x 4 Core x 1,8 GHz   | 8 GB | 2 x 600 GB SAS | 275 | 3300 |


#### Conclusiones:

Observamos que utilizar servidores virtualizados es una opción mucho más económica cuando no se va a dar un uso intensivo al servidor.

