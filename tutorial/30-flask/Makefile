apply: blue
	while ! \
		kubectl get svc/colours -o custom-columns=NAME:.metadata.name,clusterIP:.spec.clusterIP; \
	do sleep 2; done

blue: service
	kubectl apply -f deploy-blue.yaml

green: service
	kubectl apply -f deploy-green.yaml

REPLICAS := 5
scale:
	kubectl scale deploy/colours --replicas=$(REPLICAS)
	while ! \
		kubectl get svc/colours -o custom-columns=NAME:.metadata.name,clusterIP:.spec.clusterIP; \
	do sleep 2; done

service:
	kubectl apply -f svc.yaml

build:
	docker build -t colours:30-flask .

destroy:
	kubectl delete -f svc.yaml
	kubectl delete -f deploy-blue.yaml

.PHONY: build service apply blue green destroy
