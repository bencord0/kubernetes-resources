apply: build
	kubectl apply -f deploy.yaml
	while ! \
		kubectl get pod $$(kubectl get pod --show-labels|awk '/app=hello/ {print $$1}') \
			-o custom-columns=NAME:.metadata.name,podIP:.status.podIP ;\
	do sleep 2; done

build:
	docker build -t hello:21-upgrade .

destroy:
	kubectl delete -f deploy.yaml

.PHONY: build apply destroy
