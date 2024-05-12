kubectl exec -ti mongors1-0 -- mongosh --port 27018 --eval \
"rs.initiate({_id: 'rs1', members: [{ _id: 0, host: 'mongors1-0.mongosvc.default.svc.cluster.local:27018', priority: 2 }, { _id: 1, host: 'mongors1-1.mongosvc.default.svc.cluster.local:27018', priority: 1 }, { _id: 2, host: 'mongors1-2.mongosvc.default.svc.cluster.local:27018', priority: 1 }]})"
