## ASG Node Roller

The update methodology is simple:

- Find the node in cluster longer than 48 hours (By default TTL is 48 hours).
- Terminate the selected node via ASG (As drain node logic has been covered by AWS ManagedNodeGroups)

## How to run test
- ./bin/test.sh

## How to deploy
- ./bin/release.sh v1.1.0
- ./bin/deploy.sh alpha-apse2-v1 v1.1.0

## How to compile env files
- ./bin/compile.sh alpha-apse2-v1 v1.1.0


## TODO list
- add metrics support
- add tests for
  - ./services/kube/kube.go IsLongerThanTTL
