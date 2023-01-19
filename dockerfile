FROM node:17 AS Build

ENV NODE_ENV="production"

WORKDIR /usr/src/app

COPY rollup.config.js ./
COPY package*.json ./

RUN yarn install

COPY ./src ./src
COPY ./public ./public

RUN yarn build

EXPOSE 5000

CMD [ "yarn", "start" ]