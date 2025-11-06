FROM node:20-alpine
WORKDIR /app
COPY public/ ./public
RUN npm i -g serve
ENV PORT=8080
WORKDIR /app/public
CMD ["sh","-c","serve -s -l $PORT ."]
