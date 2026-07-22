# Prueba técnica PrestaShop — Tema Falcon

Personalización de una tienda **PrestaShop 8** utilizando el tema **Falcon 3.1.2** y una propuesta de diseño proporcionada en Figma.

El objetivo del proyecto ha sido adaptar la interfaz visual sin modificar el núcleo de PrestaShop y conservando las funcionalidades nativas del tema y de sus módulos.

## Vídeo de demostración

- **Vídeo demostrativo:** [enlace del video](https://youtu.be/gEe2hyvv5E8)

## Contenido

- [Características principales](#características-principales)
- [Tecnologías utilizadas](#tecnologías-utilizadas)
- [Módulos utilizados](#módulos-utilizados)
- [Requisitos previos](#requisitos-previos)
- [Instalación y compilación](#instalación-y-compilación)
- [Limpieza de caché](#limpieza-de-caché)
- [Estructura modificada](#estructura-modificada)
- [Personalizaciones realizadas](#personalizaciones-realizadas)
- [Dificultades encontradas y soluciones](#dificultades-encontradas-y-soluciones)
- [Criterios de desarrollo](#criterios-de-desarrollo)
- [Entorno local](#entorno-local)
- [Conclusiones](#conclusiones)

## Características principales

- Cabecera y navegación adaptadas al diseño de Figma.
- Buscador responsive integrado con el módulo de Falcon.
- Menú de categorías para escritorio y móvil.
- Tarjetas y listado de productos personalizados.
- Filtros de categoría y filtros activos adaptados.
- Paginación personalizada.
- Ficha de producto con galería, precios, metadatos y características.
- Breadcrumb con icono de inicio y comportamiento responsive.
- Footer responsive con información de contacto, enlaces y copyright.

## Tecnologías utilizadas

| Tecnología | Versión o uso |
| --- | --- |
| PrestaShop | 8 |
| Falcon | 3.1.2 |
| PHP | 8.1 |
| Node.js | 18.18.0 |
| npm | 9.8.1 |
| Smarty | Plantillas del tema |
| SCSS | Estilos personalizados |
| Bootstrap | Sistema responsive y utilidades |
| Webpack | Compilación de recursos |
| JavaScript | Comportamiento de componentes |
| WAMP64 | Entorno de desarrollo local |

## Módulos utilizados

El proyecto utiliza los módulos requeridos por Falcon:

- `is_imageslider`
- `is_searchbar`
- `is_shoppingcart`
- `is_themecore`

## Requisitos previos

Antes de compilar el tema es necesario disponer de:

- PrestaShop 8 instalado.
- Tema Falcon instalado y activado.
- PHP 8.1 o una versión compatible con la instalación.
- Node.js 18.
- npm 9.

> [!IMPORTANT]
> Falcon presentó incompatibilidades con Node.js 24. Durante el desarrollo se utilizó **Node.js 18.18.0** y **npm 9.8.1**.

## Instalación y compilación

El entorno de desarrollo del tema se encuentra en:

```text
themes/falcon/_dev
```

### 1. Acceder al directorio de desarrollo

```bash
cd themes/falcon/_dev
```

### 2. Instalar las dependencias

```bash
npm install
```

### 3. Inicializar el proyecto de Falcon

```bash
npm run project-init
```

### 4. Compilar los recursos

```bash
npm run build
```

Después de modificar archivos SCSS o JavaScript, vuelve a ejecutar:

```bash
npm run build
```

### Compilación rápida

```bash
cd themes/falcon/_dev
npm install
npm run project-init
npm run build
```

> [!NOTE]
> `npm run project-init` solo es necesario durante la configuración inicial o cuando sea necesario regenerar la configuración del proyecto.

## Limpieza de caché

Después de modificar plantillas Smarty, SCSS o JavaScript, puede ser necesario limpiar la caché de PrestaShop.

### Desde el back office

```text
Parámetros avanzados > Rendimiento > Borrar caché
```

### Desde la terminal

Ejecuta el siguiente comando desde la raíz de PrestaShop:

```bash
php -d memory_limit=512M bin/console cache:clear
```

Cuando un cambio visual no aparezca, se recomienda seguir este orden:

1. Guardar los archivos modificados.
2. Ejecutar `npm run build`.
3. Limpiar la caché de PrestaShop.
4. Recargar el navegador sin caché.

## Estructura modificada

Todos los archivos que se tocaron desde el primer commit dentro del tema Falcon:

```text
themes/falcon/
├── _dev/
│   └── css/
│       ├── custom/
│       │   ├── breadcrumb/
│       │   │   ├── _breadcrumb.scss
│       │   │   └── _index.scss
│       │   ├── footer/
│       │   │   ├── _footer.scss
│       │   │   └── _index.scss
│       │   ├── header/
│       │   │   ├── _header-nav.scss
│       │   │   ├── _header.scss
│       │   │   ├── _index.scss
│       │   │   └── _search-form.scss
│       │   ├── page-category/
│       │   │   ├── _active-filters.scss
│       │   │   ├── _category-heading.scss
│       │   │   ├── _cover-image.scss
│       │   │   ├── _filters.scss
│       │   │   ├── _index.scss
│       │   │   ├── _pagination.scss
│       │   │   └── _products.scss
│       │   └── page-product/
│       │       ├── _container.scss
│       │       ├── _index.scss
│       │       ├── _product-details.scss
│       │       ├── _product-tabs.scss
│       │       ├── _slider-image.scss
│       │       └── _slider-thumbs.scss
│       ├── fonts/
│       │   ├── montserrat-v31-latin-300.woff2
│       │   ├── montserrat-v31-latin-500.woff2
│       │   ├── montserrat-v31-latin-600.woff2
│       │   ├── montserrat-v31-latin-700.woff2
│       │   ├── montserrat-v31-latin-800.woff2
│       │   └── montserrat-v31-latin-900.woff2
│       ├── theme/
│       │   └── base/
│       │       ├── _fonts.scss
│       │       └── _typography.scss
│       └── theme.scss
├── assets/
│   └── fonts/
│       ├── montserrat-v31-latin-300-3b4db0dc4680141b3dd9f716f23ad9ad.woff2
│       ├── montserrat-v31-latin-500-51397ece37782604acef675eb9297677.woff2
│       ├── montserrat-v31-latin-600-d30160b75e24bbce5e90c765604224b7.woff2
│       ├── montserrat-v31-latin-700-9ced692b9436db6be1ffa841f90b0e6f.woff2
│       ├── montserrat-v31-latin-800-b0e762989c189fcce6c9798fe769faeb.woff2
│       └── montserrat-v31-latin-900-d04f8ff214f46e5409f0f67b858fa326.woff2
├── modules/
│   ├── ps_contactinfo/
│   │   └── ps_contactinfo.tpl
│   ├── ps_customersignin/
│   │   └── ps_customersignin.tpl
│   ├── ps_facetedsearch/
│   │   └── views/
│   │       └── templates/
│   │           └── front/
│   │               └── catalog/
│   │                   ├── active-filters.tpl
│   │                   └── facets.tpl
│   └── ps_linklist/
│       └── views/
│           └── templates/
│               └── hook/
│                   └── linkblock.tpl
└── templates/
    ├── _partials/
    │   ├── breadcrumb.tpl
    │   ├── footer.tpl
    │   ├── header.tpl
    │   └── pagination.tpl
    ├── catalog/
    │   ├── _partials/
    │   │   ├── miniatures/
    │   │   │   ├── _partials/
    │   │   │   │   ├── product-prices.tpl
    │   │   │   │   └── product-thumb.tpl
    │   │   │   └── product.tpl
    │   │   ├── category-header.tpl
    │   │   ├── product-add-to-cart.tpl
    │   │   ├── product-cover-thumbnails.tpl
    │   │   ├── product-prices.tpl
    │   │   ├── product-tabs.tpl
    │   │   └── products-top.tpl
    │   └── product.tpl
    └── layouts/
        └── layout-both-columns.tpl
```

> [!NOTE]
> La ubicación exacta de algunos archivos puede variar ligeramente según la versión de Falcon.

## Personalizaciones realizadas

### Cabecera

- Barra superior amarilla con horario, teléfono y mensaje de envío gratuito.
- Logo alineado a la izquierda.
- Buscador centrado en escritorio.
- Accesos de cuenta y carrito alineados a la derecha.
- Sustitución de algunos iconos por SVG.
- Adaptación responsive para escritorio, tablet y móvil.

### Menú principal

- Barra principal en color verde azulado.
- Botón de categorías con icono de menú.
- Integración con el hook `displayNavFullWidth`.
- Adaptación al modal móvil nativo de Falcon.
- Ajustes para evitar contenido duplicado entre escritorio y móvil.

### Buscador

- Adaptación visual al diseño de Figma.
- Ajustes del campo, botón, iconos y resultados.
- Corrección de alturas y alineación de precios en las tarjetas de resultados.

### Listado de productos

- Tarjetas con borde, radio y estado `hover` personalizados.
- Imágenes con proporción controlada mediante `object-fit`.
- Ajustes del título, precio actual y precio anterior.
- Badge de producto nuevo.
- Ocultación de elementos que no aparecían en el diseño.
- Grid responsive.

### Filtros de categoría

- Contenedor con borde y esquinas redondeadas en escritorio.
- Eliminación del borde en móvil.
- Ajustes de cabeceras, iconos y espaciados.
- Integración con los filtros activos de PrestaShop.

### Paginación

- Resumen de resultados alineado a la izquierda.
- Navegación de páginas alineada a la derecha.
- Estados activo, deshabilitado y `hover`.
- Adaptación responsive para pantallas pequeñas.

### Ficha de producto

- Galería principal con borde personalizado.
- Miniaturas con tamaño, separación y radio definidos.
- Ocultación del icono de ampliación.
- Reorganización del precio y el descuento.
- Texto de impuestos debajo del precio.
- Bloque con marca, referencia y disponibilidad.
- Tabla de características con dos características por fila.

### Breadcrumb

- Fondo personalizado.
- Ancho máximo alineado con el contenido principal.
- Icono SVG para el enlace de inicio.
- Separador personalizado.
- Desplazamiento horizontal en dispositivos móviles.

### Footer

- Información de contacto con teléfono, correo y dirección.
- Columnas de enlaces para productos, información y contenido legal.
- Tipografía, colores y espaciados adaptados al diseño.
- Distribución en una columna para móvil.
- Copyright con línea superior.

## Dificultades encontradas y soluciones

### Compatibilidad de Node.js con Falcon

**Problema:** el proyecto se intentó compilar inicialmente con Node.js 24, pero los scripts y dependencias de Falcon no funcionaban correctamente con esa versión.

**Solución:** se instaló Node.js `18.18.0` y npm `9.8.1`. Después se reinstalaron las dependencias y se volvió a inicializar el proyecto:

```bash
npm install
npm run project-init
npm run build
```

### Error 500 provocado por `.htaccess` en WAMP

**Problema:** durante la instalación local apareció un error 500 relacionado con directivas antiguas como `allow` y `deny`.

**Solución:** se revisó la configuración de Apache y la compatibilidad con `mod_authz_core`. También se adaptaron las reglas incompatibles del entorno local a las directivas admitidas por la versión actual de Apache.

### Problemas con OpenSSL y certificados

**Problema:** PrestaShop mostraba errores relacionados con `openssl_pkey_new` porque el entorno local no encontraba correctamente el archivo `cacert.pem`.

**Solución:** se revisó la configuración de PHP y OpenSSL, las extensiones activas y las rutas de los certificados en WAMP64.

### Bloqueo al limpiar la caché de Symfony

**Problema:** la limpieza de caché fallaba en algunas ocasiones por un archivo de bloqueo o por falta de memoria disponible para PHP.

**Solución:** se aumentó temporalmente el límite de memoria:

```bash
php -d memory_limit=512M bin/console cache:clear
```

También se revisó la ruta temporal utilizada por Symfony para guardar el archivo de bloqueo.

### Comportamiento responsive de Falcon

**Problema:** Falcon mueve determinados bloques entre los contenedores de escritorio y móvil mediante JavaScript. Duplicar el marcado podía generar IDs repetidos, contenido duplicado o contenedores vacíos.

**Solución:** se mantuvo la estructura responsive nativa del tema y se adaptaron sus contenedores en lugar de crear un sistema paralelo. Para ello se utilizaron:

- Clases BEM propias.
- Selectores SCSS limitados a cada componente.
- Hooks existentes de PrestaShop.
- Contenedores de escritorio y móvil proporcionados por Falcon.
- Ajustes responsive sin modificar la lógica PHP del núcleo.

### Sobrescritura de estilos de Bootstrap y Falcon

**Problema:** algunas reglas de Bootstrap o del tema sobrescribían colores, márgenes y tamaños de los nuevos componentes.

**Solución:** se aumentó la especificidad únicamente cuando era necesario, se evitó `!important` salvo en conflictos concretos y se separaron las personalizaciones en archivos SCSS por componente.

### Cambios que no aparecían después de compilar

**Problema:** algunos cambios realizados en Smarty o SCSS no aparecían inmediatamente en el navegador.

**Solución:** se comprobó siempre el flujo completo de compilación, limpieza de caché de PrestaShop y recarga del navegador sin caché.

### Características en dos columnas

**Problema:** el diseño requería mostrar dos características completas por fila, mientras que la plantilla original mostraba una sola característica.

**Solución:** se utilizó un contador en Smarty para abrir y cerrar cada fila después de dos características. Cuando el número de elementos es impar, se añaden celdas vacías para mantener la estructura.

## Criterios de desarrollo

- No modificar el núcleo de PrestaShop.
- Evitar cambios PHP cuando no fueran necesarios.
- Mantener hooks y funcionalidades nativas.
- Separar los estilos por componentes.
- Utilizar nombres de clase claros y consistentes.
- Mantener el diseño responsive.
- Reducir reglas SCSS duplicadas o innecesarias.
- Priorizar soluciones compatibles con futuras modificaciones del tema.

## Entorno local

El proyecto se desarrolló con WAMP64 y un virtual host similar a:

```text
http://prestashop-falcon.test:3505
```

Esta URL corresponde únicamente al entorno local utilizado durante el desarrollo y debe adaptarse a la configuración de cada equipo.

## Conclusiones

Este proyecto fue mi primera personalización completa utilizando Falcon.

La principal dificultad fue comprender su sistema de compilación y la forma en la que gestiona los bloques responsive entre escritorio y móvil. Mantener la estructura nativa del tema y extender sus componentes permitió conservar la compatibilidad con los módulos, hooks, buscador, carrito y navegación de PrestaShop.
