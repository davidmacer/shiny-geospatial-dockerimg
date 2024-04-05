FROM rocker/shiny-verse:4.3.0
LABEL maintainer="USER <david.martinez@macer.tech>"

# Incluye los drivers para conectarse con la base de datos de PostgreSQL
RUN apt-get update && \
    apt-get upgrade --yes
RUN apt-get install --yes libpq-dev

# Librerías para manejo de datos espaciales
RUN apt-get install --yes \
    libgdal-dev \
    libgeos-dev \
    libgeos++-dev \
    # La librería libssl-dev instala el paquete sf de R
    libssl-dev \
    libudunits2-dev \
    libproj-dev \
    # Librería para poder instalar en R el paquete basemaps
    libmagick++-dev
# Instala LaTeX para renderizar PDF en R
RUN apt-get install --yes \
    texlive-latex-extra \
    lmodern
    
# Instala librerías necesarias para trabajar con datos espaciales y bases de datos en PostgreSQL
RUN R -e "install.packages(c('basemaps', 'DBI', 'flextable', 'ggplot2', 'gt', 'kableExtra', 'remotes', 'RPostgres', 'shinyjs', 'stringr'), dependencies = TRUE)"