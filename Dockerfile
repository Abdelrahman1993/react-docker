FROM node:alpine as buildstage

WORKDIR /app

COPY package.json .

RUN npm install


COPY . .

RUN  npm run build

FROM nginx

WORKDIR /usr/share/nginx/html

COPY --from=buildstage /app/build .