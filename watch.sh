#!/bin/bash
exec watch kubectl get nodes,ingress,svc,ep,rc,deploy,pods,pv,pvc,ds,cm,job
