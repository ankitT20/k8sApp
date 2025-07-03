docker build -t tayalankit20/multi-client:latest -t tayalankit20/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t tayalankit20/multi-server:latest -t tayalankit20/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t tayalankit20/multi-worker:latest -t tayalankit20/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push tayalankit20/multi-client:latest
docker push tayalankit20/multi-server:latest
docker push tayalankit20/multi-worker:latest

docker push tayalankit20/multi-client:$SHA
docker push tayalankit20/multi-server:$SHA
docker push tayalankit20/multi-worker:$SHA

# kubectl apply -f k8s
# kubectl set image deployments/server-deployment server=tayalankit20/multi-server:$SHA
# kubectl set image deployments/client-deployment client=tayalankit20/multi-client:$SHA
# kubectl set image deployments/worker-deployment worker=tayalankit20/multi-worker:$SHA
