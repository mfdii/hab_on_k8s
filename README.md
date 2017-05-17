# Habitat on Kubernetes

This repo gives you some useful examples on how to get Habitat built applications running on Kubernetes. Any plans used for the resulting containers are in the `habitat-plans` folder. 

## hab-mgmt-sup/hab-mgmt-sup.yaml

`kubectl create -f hab-mgmt-sup/hab-mgmt-sup.yaml`

A Daemon Set to deploy a service group of Habitat Supervisors for bootstrapping other applicatons. Start this Daemon Set before starting other examples.

Will will create a service `habitat-mgmt-supervisor` and Pods running a Habitat built container. The Habitat supervisor runs an "empty" service that is built with the `hab-mgmt-sup` plan. 

If you're running this on a Kubernetes cluster with less than 3 nodes (minikube), you'll need edit the file to remove the `--topology leader` lines. 

## redis/redis.yml

`kubectl create -f redis/redis.yml`

Redis a good example to show off the automatic clustering ability of a Habitat service group. This `yaml` deploys a service for the `redis-follower` pods and a service for the `redis-leader` instance. A replica set is deployed with five pods running a Habitat built Redis container. 

The Habitat Supervisors are brought up in a `leader` topology. After an election is performed, the Supervisor labels the pods with either a `leader` or `follower` role. This allows the Kubernetes services to select the right pods to route traffic to based on their role and the election results.


## national-parks/

`kubectl create -f national-parks/`

The national parks demo is a sample three tier application. It consists of MongoDB for persistence, Tomcat/Java for the app tier, and an HAProxy load balancer. Of course, the HAProxy load balancer can be eliminated in a Kubernetes setup, however it does provide a useful example of how Habitat Supervisors react to members joining and leaving bound service groups.

To scale the app tier, first deploy the entire stack. Then edit the `national-parks-deployment.yaml`, changing the `replicas` line to a number > 1. HAProxy will automatically detect this scaling event, and add the new Tomcat instances. 



