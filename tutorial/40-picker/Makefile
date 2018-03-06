apply: build service deploy
	while ! \
		kubectl get svc/picker -o custom-columns=NAME:.metadata.name,InternalIP:.spec.clusterIP,ExternalIP:.status.loadBalancer.ingress[].ip; \
	do sleep 2; done

deploy: service
	kubectl apply -f deploy.yaml

redeploy: service
	-kubectl delete -f deploy.yaml
	kubectl apply -f deploy.yaml

REPLICAS := 3
scale: deploy
	kubectl scale deploy/picker --replicas=$(REPLICAS)
	while ! \
		kubectl get svc/picker -o custom-columns=NAME:.metadata.name,InternalIP:.spec.clusterIP,ExternalIP:.status.loadBalancer.ingress[].ip; \
	do sleep 2; done

service:
	kubectl apply -f svc.yaml

build:
	docker build -t registry.condi.me/picker:40-picker .
	docker push registry.condi.me/picker:40-picker

destroy:
	-kubectl delete -f svc.yaml
	-kubectl delete -f deploy.yaml

.PHONY: build deploy service apply destroy
