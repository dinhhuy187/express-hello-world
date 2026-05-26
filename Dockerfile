FROM node:20-alpine

WORKDIR /app

RUN chown -R node:node /app

COPY --chown=node:node package.json yarn.lock ./
USER node
RUN yarn install --frozen-lockfile --production

COPY --chown=node:node . .

ENV NODE_ENV=production
EXPOSE 3001

CMD ["node", "app.js"]
