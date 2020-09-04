FROM node:alpine
WORKDIR '/app'
COPY ./package.json ./
RUN npm install
COPY . .
#related to nodemon and volumes
CMD ["npm", "run", "start"]
#nodemon is a tool that helps develop node.js based applications by automatically restarting the node application when file changes in the directory are detected.