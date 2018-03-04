#!/bin/bash
exec watch kubectl get --all-namespaces -o wide ingress,svc,ep,deploy,pods,pv,pvc,ds,statefulset,cm,job,nodes
