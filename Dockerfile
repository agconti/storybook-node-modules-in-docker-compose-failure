FROM node:13.4.0

WORKDIR /app

# add `/admin/node_modules/.bin` to $PATH
ENV PATH /admin/node_modules/.bin:$PATH

COPY package*.json ./
RUN npm install --no-progress

COPY . .

RUN mkdir -p ./node_modules/.cache/storybook

EXPOSE 3000

CMD ["npm", "run", "storybook"]

USER node