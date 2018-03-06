apply: build blue
	while ! \
		kubectl get svc/colours -o custom-columns=NAME:.metadata.name,InternalIP:.spec.clusterIP,ExternalIP:.status.loadBalancer.ingress[].ip; \
	do sleep 2; done

blue: service
	kubectl apply -f deploy-blue.yaml

green: service
	kubectl apply -f deploy-green.yaml

REPLICAS := 5
scale:
	kubectl scale deploy/colours --replicas=$(REPLICAS)
	while ! \
		kubectl get svc/colours -o custom-columns=NAME:.metadata.name,InternalIP:.spec.clusterIP,ExternalIP:.status.loadBalancer.ingress[].ip; \
	do sleep 2; done

service:
	kubectl apply -f svc.yaml

build:
	docker build -t registry.condi.me/colours:30-flask .
	docker push registry.condi.me/colours:30-flask

destroy:
	kubectl delete -f svc.yaml
	kubectl delete -f deploy-blue.yaml

.PHONY: build service apply blue green destroy
