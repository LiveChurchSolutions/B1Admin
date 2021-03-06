FROM node:12-alpine

RUN apk update && \
    apk add git

WORKDIR /app

RUN git clone https://github.com/LiveChurchSolutions/B1Admin.git .

RUN git submodule foreach git pull

RUN git submodule init && git submodule update

RUN npm install

CMD npm run $ENVIRONMENT

EXPOSE 3301
