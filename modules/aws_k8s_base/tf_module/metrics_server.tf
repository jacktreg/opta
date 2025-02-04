resource "helm_release" "metrics_server" {
  chart           = "metrics-server"
  name            = "metrics-server"
  repository      = "https://raw.githubusercontent.com/bitnami/charts/archive-full-index/bitnami"
  namespace       = "kube-system"
  version         = "5.11.3"
  atomic          = true
  cleanup_on_fail = true
  values = [
    yamlencode({
      rbac : {
        create : true
      }
      serviceAccount : {
        create : true
      }
      apiService : {
        create : true
      }
    })
  ]
}
