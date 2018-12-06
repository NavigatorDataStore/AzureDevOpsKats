# Add Kubernetes Stable Helm charts repo
resource "helm_repository" "stable" {
  name = "stable"
  url  = "https://kubernetes-charts.storage.googleapis.com"
}

# Install Nginx Ingress using Helm Chart
# https://github.com/Azure/AKS/issues/326
resource "helm_release" "nginx_ingress" {
  name       = "nginx-ingress"
  repository = "${helm_repository.stable.metadata.0.name}"
  chart      = "nginx-ingress"

  set {
    name  = "rbac.create"
    value = "false"
  }

  set {
    name  = "controller.service.externalTrafficPolicy"
    value = "Local"
  }

  set {
    name  = "controller.service.loadBalancerIP"
    value = "${azurerm_public_ip.nginx_ingress.ip_address}"
  }

  depends_on = [
    "dnsimple_record.test"
  ]
}

resource "helm_release" "cert_manager" {
  name       = "cert-manager"
  repository = "${helm_repository.stable.metadata.0.name}"
  chart      = "cert-manager"

  set {
    name  = "rbac.create"
    value = "false"
  }

  set {
    name  = "ingressShim.defaultIssuerName"
    value = "letsencrypt-prod"
  }

  set {
    name  = "ingressShim.defaultIssuerName"
    value = "letsencrypt-prod"
  }

  depends_on = [
    "dnsimple_record.test",
    "helm_release.nginx_ingress",
  ]
}

resource "helm_release" "example_dokuwiki" {
  name       = "dokuwiki"
  repository = "${helm_repository.stable.metadata.0.name}"
  chart      = "dokuwiki"

  set {
    name  = "dokuwikiUsername"
    value = "admin"
  }

  set {
    name  = "dokuwikiPassword"
    value = "Hm2m2A9A"
  }

  set {
    name  = "ingress.enabled"
    value = "true"
  }

  set {
    name  = "ingress.hosts[0].name"
    value = "${dnsimple_record.test.hostname}"
  }

  set {
    name  = "ingress.hosts[0].annotations[0].kubernetes.io/ingress.class"
    value = "nginx"
  }

  set {
    name  = "ingress.hosts[0].annotations[1].certmanager.k8s.io/certificate-name"
    value = "dokuwiki-tls"
  }

  set {
    name  = "ingress.hosts[0].annotations[2].certmanager.k8s.io/common-name"
    value = "${dnsimple_record.test.hostname}"
  }

  set {
    name  = "ingress.hosts[0].annotations[3].certmanager.k8s.io/issuer-kind"
    value = "Issuer"
  }

  set {
    name  = "ingress.hosts[0].annotations[4].certmanager.k8s.io/issuer-name"
    value = "letsencrypt-prod"
  }

  depends_on = [
    "dnsimple_record.test",
    "helm_release.cert_manager",
  ]
}
