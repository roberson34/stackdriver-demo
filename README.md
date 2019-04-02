# stackdriver-demo

First create cluster

```
gcloud container clusters create app-cluster-one --num-nodes=1 --preemptible
```

Apply config with

```
kubectl apply -f app.yaml
```
I made the image in the container public so hopefully it can be downloaded ok.

```
gcr.io/amx-instance-1/app-img:efae6bd
```

Othwise you can run the cloudbuild.yaml file on [Cloud Build](https://console.cloud.google.com/cloud-build).


Fork this repo on github, add it as a trigger and run it.
