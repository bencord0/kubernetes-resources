#!/bin/bash
exec watch kubectl get nodes,ingress,svc,ep,rc,rs,deploy,pods,pv,pvc,ds,statefulset,cm,secret,job
