apply: build
	kubectl apply -f pod.yaml
	while ! \
		kubectl get po/hello -o custom-columns=NAME:.metadata.name,podIP:.status.podIP; \
  do sleep 2; done

build:
	docker build -t registry.condi.me/hello:10-hello .
	docker push registry.condi.me/hello:10-hello

destroy:
	kubectl delete -f pod.yaml

.PHONY: build apply destroy
