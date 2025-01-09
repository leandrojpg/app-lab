## Essa e a imagem base que vou utilizar para construir minha imagem
FROM nginx

## Aqui eu estou copiando um arquivo index.html do diretorio local  para o diretorio /usr/share/nginx/html/index.html dentro do container 
COPY . /usr/share/nginx/html




