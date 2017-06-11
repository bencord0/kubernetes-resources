apply: apply-blue
	while ! \
		kubectl get svc/colours -o custom-columns=NAME:.metadata.name,clusterIP:.spec.clusterIP; \
	do sleep 2; done

apply-blue: service
	kubectl apply -f deploy-blue.yaml

apply-green: service
	kubectl apply -f deploy-green.yaml

service:
	kubectl apply -f svc.yaml

build:
	docker build -t colours:30-flask .

destroy:
	kubectl delete -f svc.yaml
	kubectl delete -f deploy-blue.yaml

.PHONY: build service apply apply-blue apply-green destroy
