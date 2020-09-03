docker build -t fanmixco/complex-fibonacci-docker-edition-client:latest -t fanmixco/complex-fibonacci-docker-edition-client:$SHA -f ./client/Dockerfile ./client
docker build -t fanmixco/complex-fibonacci-docker-edition-server:latest -t fanmixco/complex-fibonacci-docker-edition-server:$SHA -f ./server/Dockerfile ./server
docker build -t fanmixco/complex-fibonacci-docker-edition-worker:latest -t fanmixco/complex-fibonacci-docker-edition-worker:$SHA -f ./worker/Dockerfile ./worker

docker push fanmixco/complex-fibonacci-docker-edition-client:latest
docker push fanmixco/complex-fibonacci-docker-edition-server:latest
docker push fanmixco/complex-fibonacci-docker-edition-worker:latest

docker push fanmixco/complex-fibonacci-docker-edition-client:$SHA
docker push fanmixco/complex-fibonacci-docker-edition-server:$SHA
docker push fanmixco/complex-fibonacci-docker-edition-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=fanmixco/complex-fibonacci-docker-edition-server:$SHA
kubectl set image deployments/client-deployment client=fanmixco/complex-fibonacci-docker-edition-client:$SHA
kubectl set image deployments/worker-deployment worker=fanmixco/complex-fibonacci-docker-edition-worker:$SHA