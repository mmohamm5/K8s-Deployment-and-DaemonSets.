#!/bin/bash
#Note: Don't execute this script. Run one by one commands.

$ kubectl create -f def-deploy.yaml

$ kubectl create deployment nginx-deployment \
--image=nginx:1.20.2 --port=80 --replicas=3

$ kubectl create deployment nginx-deployment \
--image=nginx:1.20.2 --port=80 --replicas=3 \
--dry-run=client -o yaml > nginx-deploy.yaml

$ kubectl create deployment nginx-deployment \
--image=nginx:1.20.2 --port=80 --replicas=3 \
--dry-run=client -o json > nginx-deploy.json

$ kubectl create -f nginx-deploy.yaml

$ kubectl create -f nginx-deploy.json

$ kubectl apply -f nginx-deploy.yaml --record

$ kubectl get deployments

$ kubectl get deploy -o wide

$ kubectl scale deploy nginx-deployment --replicas=4

$ kubectl get deploy nginx-deployment -o yaml

$ kubectl get deploy nginx-deployment -o json

$ kubectl describe deploy nginx-deployment

$ kubectl rollout status deploy nginx-deployment

$ kubectl rollout history deploy nginx-deployment

$ kubectl rollout history deploy nginx-deployment --revision=1

$ kubectl set image deploy nginx-deployment nginx=nginx:1.21.5 --record

$ kubectl rollout history deploy nginx-deployment --revision=2

$ kubectl rollout undo deploy nginx-deployment --to-revision=1

$ kubectl get all -l app=nginx -o wide

$ kubectl delete deploy nginx-deployment

$ kubectl get deploy,rs,po -l app=nginx

kubectl create deployment mynginx --image=nginx:1.15-alpine

kubectl get deploy,rs,po -l app=mynginx

kubectl scale deploy mynginx --replicas=3

kubectl describe deploy mynginx

kubectl rollout history deploy mynginx

kubectl rollout history deploy mynginx --revision=1

kubectl set image deployment mynginx nginx=nginx:1.16-alpine

kubectl rollout history deploy mynginx

kubectl rollout history deploy mynginx --revision=1

kubectl get deploy,rs,po -l app=mynginx

kubectl rollout undo deployment mynginx --to-revision=1

kubectl rollout history deploy mynginx

kubectl rollout history deploy mynginx --revision=3

kubectl get deploy,rs,po -l app=mynginx

#DaemonSets

$ kubectl create -f fluentd-ds.yaml

$ kubectl apply -f fluentd-ds.yaml --record

$ kubectl get daemonsets
$ kubectl get ds -o wide
$ kubectl get ds fluentd-agent -o yaml
$ kubectl get ds fluentd-agent -o json
$ kubectl describe ds fluentd-agent
$ kubectl rollout status ds fluentd-agent
$ kubectl rollout history ds fluentd-agent
$ kubectl rollout history ds fluentd-agent --revision=1
$ kubectl set image ds fluentd-agent fluentd=quay.io/fluentd_elasticsearch/fluentd:v4.6.2 --record
$ kubectl rollout history ds fluentd-agent --revision=2
$ kubectl rollout undo ds fluentd-agent --to-revision=1
$ kubectl get all -l k8s-app=fluentd-agent -o wide
$ kubectl delete ds fluentd-agent
$ kubectl get ds,po -l k8s-app=fluentd-agent
