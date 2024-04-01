## RBAC

```
cd RBAC
bash create_user.sh 
kubectl apply -f ClusterRoleandCRBinding.yaml
```
Cluster permissions can be given to users, groups, service accounts

### RoleBinding: 
- Grants permissions within a specific namespace. 
- The permissions are defined by a Role and are applied to users, groups, or service accounts within that namespace.

### ClusterRoleBinding: 
- Grants permissions cluster-wide. 
- The permissions are defined by a ClusterRole and are applied to users, groups, or service accounts across all namespaces in the cluster.