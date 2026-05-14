set -e

NAME="kubernete-demo-api"
USERNAME="ignisync"
IMAGE="$USERNAME/$NAME:latest"


echo "Building Docker image..."
docker build -t $IMAGE .

echo "Pushing Docker image to Docker Hub..."
docker push $IMAGE


echo "Deploying to Kubernetes..."
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml

echo "Getting pods..."
kubectl get pods

echo "Getting services..."
kubectl get services

echo "Fetching main service details..."
kubectl get service $NAME-service