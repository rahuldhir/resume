FROM blang/latex:ctanfull

WORKDIR /

RUN apt-get update -y
RUN apt-get install unzip
RUN wget https://www.tug.org/fonts/getnonfreefonts/install-getnonfreefonts
RUN texlua install-getnonfreefonts
RUN getnonfreefonts --sys classico
