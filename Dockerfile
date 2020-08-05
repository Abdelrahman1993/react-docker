FROM node:alpine as buildstage

WORKDIR /app

COPY package.json .

RUN npm install


COPY . .

RUN  npm run build

FROM nginx

WORKDIR /usr/share/nginx/html

EXPOSE 80

COPY --from=buildstage /app/build .