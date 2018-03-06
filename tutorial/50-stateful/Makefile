apply: build service deploy
	while ! \
		kubectl get svc/stateful-web -o custom-columns=NAME:.metadata.name,InternalIP:.spec.clusterIP,ExternalIP:.status.loadBalancer.ingress[].ip; \
	do sleep 2; done

deploy: service
	kubectl apply -f deploy-db.yaml
	kubectl apply -f deploy-web.yaml

redeploy:
	-kubectl delete -f deploy-web.yaml
	kubectl apply -f deploy-web.yaml

REPLICAS := 3
scale: deploy
	kubectl scale deploy/stateful-web --replicas=$(REPLICAS)
	while ! \
		kubectl get svc/stateful-web -o custom-columns=NAME:.metadata.name,InternalIP:.spec.clusterIP,ExternalIP:.status.loadBalancer.ingress[].ip; \
	do sleep 2; done

service:
	kubectl apply -f svc-db.yaml
	kubectl apply -f svc-web.yaml

build:
	docker build -t registry.condi.me/stateful:50-stateful .
	docker push registry.condi.me/stateful:50-stateful

destroy:
	-kubectl delete -f svc-web.yaml
	-kubectl delete -f svc-db.yaml
	-kubectl delete -f deploy-web.yaml
	-kubectl delete -f deploy-db.yaml

.PHONY: build deploy service apply destroy
