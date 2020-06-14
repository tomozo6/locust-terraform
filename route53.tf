resource "aws_service_discovery_private_dns_namespace" "locust_internal" {
  name        = "locust-local"
  description = local.general_name
  vpc         = module.vpc.vpc_id
}

resource "aws_service_discovery_service" "master" {
  name = "master"

  dns_config {
    namespace_id   = aws_service_discovery_private_dns_namespace.locust_internal.id
    routing_policy = "MULTIVALUE"

    dns_records {
      ttl  = 10
      type = "A"
    }
  }

  health_check_custom_config {
    failure_threshold = 1
  }
}
