output "hostname" {
  value = length(var.ports) > 0 ? kubernetes_service_v1.stateful_set.metadata[0].name : ""
}

output "ports" {
  value = length(var.ports) > 0 ? {
    for port in kubernetes_service_v1.stateful_set.spec[0].port :
    port.name => port.port
  } : {}
}

output "ip" {
  value = length(var.ports) > 0 ? length(kubernetes_service_v1.stateful_set.status.0.load_balancer.0.ingress) > 0 ? kubernetes_service_v1.stateful_set.status.0.load_balancer.0.ingress.0.ip : "" : ""
}

output "selector_labels" {
  value = local.selector_labels
}
