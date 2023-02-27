resource "aws_cloudfront_distribution" "viewer_response_cf" {
  default_cache_behavior {
    allowed_methods = ["HEAD", "GET"]
    cache_policy_id = "658327ea-f89d-4fab-a63d-7e88639e58f6"
    cached_methods  = ["GET", "HEAD"]
    compress        = "false"
    default_ttl     = "0"

    function_association {
      event_type   = "viewer-response"
      function_arn = "arn:aws:cloudfront::939375546786:function/noCacheRedirect"
    }

    max_ttl                = "0"
    min_ttl                = "0"
    smooth_streaming       = "false"
    target_origin_id       = "S3-Website-plasmic-public-static.s3-website-us-west-2.amazonaws.com"
    viewer_protocol_policy = "allow-all"
  }

  enabled         = "true"
  http_version    = "http2"
  is_ipv6_enabled = "true"

  ordered_cache_behavior {
    allowed_methods = ["GET", "HEAD"]
    cache_policy_id = "4135ea2d-6df8-44a3-9df3-4b5a84be39ad"
    cached_methods  = ["HEAD", "GET"]
    compress        = "false"
    default_ttl     = "0"

    function_association {
      event_type   = "viewer-response"
      function_arn = "arn:aws:cloudfront::939375546786:function/noCacheRedirect"
    }

    max_ttl                = "0"
    min_ttl                = "0"
    path_pattern           = "js/*"
    smooth_streaming       = "false"
    target_origin_id       = "S3-Website-plasmic-public-static.s3-website-us-west-2.amazonaws.com"
    viewer_protocol_policy = "allow-all"
  }

  origin {
    connection_attempts = "3"
    connection_timeout  = "10"

    custom_origin_config {
      http_port                = "80"
      https_port               = "443"
      origin_keepalive_timeout = "5"
      origin_protocol_policy   = "http-only"
      origin_read_timeout      = "30"
      origin_ssl_protocols     = ["TLSv1", "TLSv1.2", "TLSv1.1"]
    }

    domain_name = "plasmic-public-static.s3-website-us-west-2.amazonaws.com"
    origin_id   = "S3-Website-plasmic-public-static.s3-website-us-west-2.amazonaws.com"
  }

  price_class = "PriceClass_All"

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  retain_on_delete = "false"

  viewer_certificate {
    cloudfront_default_certificate = "true"
    minimum_protocol_version       = "TLSv1"
  }
}

resource "aws_cloudfront_distribution" "gerrit_cf" {
  aliases = ["gerrit.aws.plasmic.app"]

  default_cache_behavior {
    allowed_methods          = ["GET", "PATCH", "DELETE", "HEAD", "OPTIONS", "POST", "PUT"]
    cache_policy_id          = "4135ea2d-6df8-44a3-9df3-4b5a84be39ad"
    cached_methods           = ["HEAD", "GET"]
    compress                 = "false"
    default_ttl              = "0"
    max_ttl                  = "0"
    min_ttl                  = "0"
    origin_request_policy_id = "216adef6-5c7f-47e4-b989-5492eafa07d3"
    smooth_streaming         = "false"
    target_origin_id         = "Custom-gerrit.aws.plasmic.app"
    viewer_protocol_policy   = "allow-all"
  }

  enabled         = "true"
  http_version    = "http2"
  is_ipv6_enabled = "true"

  origin {
    connection_attempts = "3"
    connection_timeout  = "10"

    custom_origin_config {
      http_port                = "80"
      https_port               = "443"
      origin_keepalive_timeout = "5"
      origin_protocol_policy   = "http-only"
      origin_read_timeout      = "30"
      origin_ssl_protocols     = ["TLSv1.1", "TLSv1.2", "TLSv1"]
    }

    domain_name = "gerrit-origin.aws.plasmic.app"
    origin_id   = "Custom-gerrit.aws.plasmic.app"
  }

  price_class = "PriceClass_All"

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  retain_on_delete = "false"

  viewer_certificate {
    acm_certificate_arn            = "arn:aws:acm:us-east-1:939375546786:certificate/59defb4d-177e-4437-a04e-ee4667311c28"
    cloudfront_default_certificate = "false"
    minimum_protocol_version       = "TLSv1.2_2019"
    ssl_support_method             = "sni-only"
  }
}

resource "aws_cloudfront_distribution" "studio_cf" {
  aliases = ["studio-cloudfront.plasmic.app"]

  default_cache_behavior {
    allowed_methods          = ["GET", "DELETE", "PUT", "OPTIONS", "PATCH", "POST", "HEAD"]
    cache_policy_id          = "4135ea2d-6df8-44a3-9df3-4b5a84be39ad"
    cached_methods           = ["GET", "HEAD"]
    compress                 = "true"
    default_ttl              = "0"
    max_ttl                  = "0"
    min_ttl                  = "0"
    origin_request_policy_id = "216adef6-5c7f-47e4-b989-5492eafa07d3"
    smooth_streaming         = "false"
    target_origin_id         = "Custom-www.plasmic.app"
    viewer_protocol_policy   = "redirect-to-https"
  }

  enabled         = "false"
  http_version    = "http2"
  is_ipv6_enabled = "true"

  origin {
    connection_attempts = "3"
    connection_timeout  = "10"

    custom_origin_config {
      http_port                = "80"
      https_port               = "443"
      origin_keepalive_timeout = "5"
      origin_protocol_policy   = "https-only"
      origin_read_timeout      = "60"
      origin_ssl_protocols     = ["TLSv1.2", "TLSv1.1", "TLSv1"]
    }

    domain_name = "studio-origin.plasmic.app"
    origin_id   = "Custom-www.plasmic.app"
  }

  price_class = "PriceClass_All"

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  retain_on_delete = "false"

  viewer_certificate {
    acm_certificate_arn            = "arn:aws:acm:us-east-1:939375546786:certificate/054ba373-5042-4451-aaf0-08c3cfc90bc8"
    cloudfront_default_certificate = "false"
    minimum_protocol_version       = "TLSv1.2_2019"
    ssl_support_method             = "sni-only"
  }
}

resource "aws_cloudfront_distribution" "static1_cf" {
  aliases = ["static1.plasmic.app"]

  default_cache_behavior {
    allowed_methods = ["HEAD", "GET"]
    cached_methods  = ["HEAD", "GET"]
    compress        = "true"
    default_ttl     = "86400"

    forwarded_values {
      cookies {
        forward = "none"
      }

      query_string = "false"
    }

    max_ttl                = "31536000"
    min_ttl                = "0"
    smooth_streaming       = "false"
    target_origin_id       = "S3-plasmic-static1"
    viewer_protocol_policy = "redirect-to-https"
  }

  enabled         = "true"
  http_version    = "http2"
  is_ipv6_enabled = "true"

  origin {
    connection_attempts = "3"
    connection_timeout  = "10"
    domain_name         = "plasmic-static1.s3-us-west-2.amazonaws.com"
    origin_id           = "S3-plasmic-static1"
  }

  price_class = "PriceClass_All"

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  retain_on_delete = "false"

  viewer_certificate {
    acm_certificate_arn            = "arn:aws:acm:us-east-1:939375546786:certificate/d86b72f5-db77-4179-9e45-05b8912509fc"
    cloudfront_default_certificate = "false"
    minimum_protocol_version       = "TLSv1.2_2019"
    ssl_support_method             = "sni-only"
  }
}

resource "aws_cloudfront_distribution" "codegen_cf" {
  aliases = ["codegen.plasmic.app"]

  default_cache_behavior {
    allowed_methods          = ["GET", "POST", "PUT", "PATCH", "DELETE", "HEAD", "OPTIONS"]
    cache_policy_id          = "4135ea2d-6df8-44a3-9df3-4b5a84be39ad"
    cached_methods           = ["HEAD", "GET"]
    compress                 = "true"
    default_ttl              = "0"
    max_ttl                  = "0"
    min_ttl                  = "0"
    origin_request_policy_id = "216adef6-5c7f-47e4-b989-5492eafa07d3"
    smooth_streaming         = "false"
    target_origin_id         = "Custom-codegen-origin.plasmic.app"
    viewer_protocol_policy   = "redirect-to-https"

  }
  enabled         = "true"
  http_version    = "http2"
  is_ipv6_enabled = "true"

  logging_config {
    bucket          = "codegen-logs.s3.amazonaws.com"
    include_cookies = "false"
  }

  ordered_cache_behavior {
    allowed_methods          = ["OPTIONS", "GET", "HEAD"]
    cache_policy_id          = "4d2313d0-9dd0-414f-9af6-75e870571525"
    cached_methods           = ["HEAD", "GET", "OPTIONS"]
    compress                 = "true"
    default_ttl              = "0"
    max_ttl                  = "0"
    min_ttl                  = "0"
    origin_request_policy_id = "216adef6-5c7f-47e4-b989-5492eafa07d3"
    path_pattern             = "/api/v1/loader/*"
    smooth_streaming         = "false"
    target_origin_id         = "Custom-codegen-origin.plasmic.app"
    viewer_protocol_policy   = "redirect-to-https"
  }
  ordered_cache_behavior {
    allowed_methods        = ["OPTIONS", "GET", "HEAD"]
    cached_methods         = ["HEAD", "GET", "OPTIONS"]
    path_pattern           = "/__cloudfront-test/*"
    target_origin_id       = "ezbxijua3zkl5dl4hhp4ridqsi0qqtgw.lambda-url.us-west-2.on.aws"
    viewer_protocol_policy = "redirect-to-https"
    cache_policy_id        = "4d2313d0-9dd0-414f-9af6-75e870571525"
    default_ttl            = 0
    compress               = true
    max_ttl                = 0
    min_ttl                = 0
    smooth_streaming       = false
    trusted_key_groups     = []
    trusted_signers        = []
  }
  origin {
    domain_name         = "ezbxijua3zkl5dl4hhp4ridqsi0qqtgw.lambda-url.us-west-2.on.aws"
    origin_id           = "ezbxijua3zkl5dl4hhp4ridqsi0qqtgw.lambda-url.us-west-2.on.aws"
    connection_attempts = 3
    connection_timeout  = 10
    custom_origin_config {
      http_port                = 80
      https_port               = 443
      origin_protocol_policy   = "https-only"
      origin_ssl_protocols     = ["TLSv1.2"]
      origin_keepalive_timeout = 5
      origin_read_timeout      = 180
    }
  }

  origin {
    connection_attempts = "3"
    connection_timeout  = "10"

    custom_origin_config {
      http_port                = "80"
      https_port               = "443"
      origin_keepalive_timeout = "5"
      origin_protocol_policy   = "http-only"
      origin_read_timeout      = "180"
      origin_ssl_protocols     = ["TLSv1.1", "TLSv1", "TLSv1.2"]
    }

    domain_name = "codegen-origin.plasmic.app"
    origin_id   = "Custom-codegen-origin.plasmic.app"

    origin_shield {
      enabled              = "true"
      origin_shield_region = "us-west-2"
    }
  }

  price_class = "PriceClass_All"

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  retain_on_delete = "false"

  viewer_certificate {
    acm_certificate_arn            = "arn:aws:acm:us-east-1:939375546786:certificate/890280fe-9e90-4865-8b2f-569900a9f952"
    cloudfront_default_certificate = "false"
    minimum_protocol_version       = "TLSv1.2_2021"
    ssl_support_method             = "sni-only"
  }
}

resource "aws_cloudfront_distribution" "static_assets_cf" {
  aliases = ["site-assets.plasmic.app"]

  default_cache_behavior {
    allowed_methods            = ["HEAD", "GET"]
    cache_policy_id            = "658327ea-f89d-4fab-a63d-7e88639e58f6"
    cached_methods             = ["GET", "HEAD"]
    compress                   = "true"
    default_ttl                = "0"
    max_ttl                    = "0"
    min_ttl                    = "0"
    origin_request_policy_id   = "88a5eaf4-2fd4-4709-b370-b4c650ea3fcf"
    response_headers_policy_id = "60669652-455b-4ae9-85a4-c4c02393f86c"
    smooth_streaming           = "false"
    target_origin_id           = "S3-plasmic-site-assets"
    viewer_protocol_policy     = "redirect-to-https"
  }

  enabled         = "true"
  http_version    = "http2"
  is_ipv6_enabled = "true"

  origin {
    connection_attempts = "3"
    connection_timeout  = "10"
    domain_name         = "plasmic-site-assets.s3-us-west-2.amazonaws.com"
    origin_id           = "S3-plasmic-site-assets"
  }

  price_class = "PriceClass_All"

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  retain_on_delete = "false"

  viewer_certificate {
    acm_certificate_arn            = "arn:aws:acm:us-east-1:939375546786:certificate/5e98fb77-b445-44b8-b5c2-5dce9998bffa"
    cloudfront_default_certificate = "false"
    minimum_protocol_version       = "TLSv1.2_2019"
    ssl_support_method             = "sni-only"
  }
}

resource "aws_cloudfront_distribution" "host_dev_cf" {
  aliases = ["host.plasmic.dev"]

  default_cache_behavior {
    allowed_methods          = ["POST", "GET", "HEAD", "PUT", "DELETE", "OPTIONS", "PATCH"]
    cache_policy_id          = "4135ea2d-6df8-44a3-9df3-4b5a84be39ad"
    cached_methods           = ["HEAD", "GET"]
    compress                 = "true"
    default_ttl              = "0"
    max_ttl                  = "0"
    min_ttl                  = "0"
    origin_request_policy_id = "216adef6-5c7f-47e4-b989-5492eafa07d3"
    smooth_streaming         = "false"
    target_origin_id         = "studio-origin.plasmic.app"
    viewer_protocol_policy   = "allow-all"
  }

  enabled         = "true"
  http_version    = "http2"
  is_ipv6_enabled = "true"

  ordered_cache_behavior {
    allowed_methods          = ["HEAD", "GET"]
    cache_policy_id          = "4135ea2d-6df8-44a3-9df3-4b5a84be39ad"
    cached_methods           = ["HEAD", "GET"]
    compress                 = "true"
    default_ttl              = "0"
    max_ttl                  = "0"
    min_ttl                  = "0"
    origin_request_policy_id = "216adef6-5c7f-47e4-b989-5492eafa07d3"
    path_pattern             = "/.well-known/acme-challenge/*"
    smooth_streaming         = "false"
    target_origin_id         = "acme-http-studio-origin.plasmic.app"
    viewer_protocol_policy   = "allow-all"
  }

  origin {
    connection_attempts = "3"
    connection_timeout  = "10"

    custom_origin_config {
      http_port                = "80"
      https_port               = "443"
      origin_keepalive_timeout = "5"
      origin_protocol_policy   = "http-only"
      origin_read_timeout      = "30"
      origin_ssl_protocols     = ["TLSv1.2", "TLSv1.1", "TLSv1"]
    }

    domain_name = "studio-origin.plasmic.app"
    origin_id   = "acme-http-studio-origin.plasmic.app"
  }

  origin {
    connection_attempts = "3"
    connection_timeout  = "10"

    custom_origin_config {
      http_port                = "80"
      https_port               = "443"
      origin_keepalive_timeout = "5"
      origin_protocol_policy   = "https-only"
      origin_read_timeout      = "60"
      origin_ssl_protocols     = ["TLSv1.2", "TLSv1.1", "TLSv1"]
    }

    domain_name = "plasmic.dev"
    origin_id   = "Custom-plasmic.dev"
  }

  origin {
    connection_attempts = "3"
    connection_timeout  = "10"

    custom_origin_config {
      http_port                = "80"
      https_port               = "443"
      origin_keepalive_timeout = "5"
      origin_protocol_policy   = "https-only"
      origin_read_timeout      = "30"
      origin_ssl_protocols     = ["TLSv1.2", "TLSv1", "TLSv1.1"]
    }

    domain_name = "studio-origin.plasmic.app"
    origin_id   = "studio-origin.plasmic.app"
  }

  price_class = "PriceClass_All"

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  retain_on_delete = "false"

  viewer_certificate {
    acm_certificate_arn            = "arn:aws:acm:us-east-1:939375546786:certificate/dd07fe7e-183f-4ebb-b178-621f6faf6dac"
    cloudfront_default_certificate = "false"
    minimum_protocol_version       = "TLSv1.2_2019"
    ssl_support_method             = "sni-only"
  }
}

resource "aws_cloudfront_distribution" "host_plasmic_dev_cf" {
  aliases = ["host.plasmicdev.com"]

  default_cache_behavior {
    allowed_methods          = ["PATCH", "OPTIONS", "DELETE", "HEAD", "PUT", "GET", "POST"]
    cache_policy_id          = "4135ea2d-6df8-44a3-9df3-4b5a84be39ad"
    cached_methods           = ["GET", "HEAD"]
    compress                 = "true"
    default_ttl              = "0"
    max_ttl                  = "0"
    min_ttl                  = "0"
    origin_request_policy_id = "216adef6-5c7f-47e4-b989-5492eafa07d3"
    smooth_streaming         = "false"
    target_origin_id         = "Custom-studio-origin.plasmic.app"
    viewer_protocol_policy   = "redirect-to-https"
  }

  enabled         = "true"
  http_version    = "http2"
  is_ipv6_enabled = "true"

  ordered_cache_behavior {
    allowed_methods          = ["HEAD", "GET"]
    cache_policy_id          = "4135ea2d-6df8-44a3-9df3-4b5a84be39ad"
    cached_methods           = ["HEAD", "GET"]
    compress                 = "true"
    default_ttl              = "0"
    max_ttl                  = "0"
    min_ttl                  = "0"
    origin_request_policy_id = "216adef6-5c7f-47e4-b989-5492eafa07d3"
    path_pattern             = "/.well-known/acme-challenge/*"
    smooth_streaming         = "false"
    target_origin_id         = "acme-http-studio-origin.plasmic.app"
    viewer_protocol_policy   = "allow-all"
  }

  origin {
    connection_attempts = "3"
    connection_timeout  = "10"

    custom_origin_config {
      http_port                = "80"
      https_port               = "443"
      origin_keepalive_timeout = "5"
      origin_protocol_policy   = "https-only"
      origin_read_timeout      = "30"
      origin_ssl_protocols     = ["TLSv1.2", "TLSv1.1", "TLSv1"]
    }

    domain_name = "studio-origin.plasmic.app"
    origin_id   = "Custom-studio-origin.plasmic.app"
  }

  origin {
    connection_attempts = "3"
    connection_timeout  = "10"

    custom_origin_config {
      http_port                = "80"
      https_port               = "443"
      origin_keepalive_timeout = "5"
      origin_protocol_policy   = "http-only"
      origin_read_timeout      = "30"
      origin_ssl_protocols     = ["TLSv1", "TLSv1.2", "TLSv1.1"]
    }

    domain_name = "studio-origin.plasmic.app"
    origin_id   = "acme-http-studio-origin.plasmic.app"
  }

  price_class = "PriceClass_All"

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  retain_on_delete = "false"

  viewer_certificate {
    acm_certificate_arn            = "arn:aws:acm:us-east-1:939375546786:certificate/693f259a-dc41-4f76-8019-2d61e1223296"
    cloudfront_default_certificate = "false"
    minimum_protocol_version       = "TLSv1.2_2021"
    ssl_support_method             = "sni-only"
  }
}

resource "aws_cloudfront_distribution" "jenkins_cf" {
  aliases = ["jenkins.aws.plasmic.app"]

  default_cache_behavior {
    allowed_methods          = ["OPTIONS", "HEAD", "DELETE", "GET", "PATCH", "PUT", "POST"]
    cache_policy_id          = "4135ea2d-6df8-44a3-9df3-4b5a84be39ad"
    cached_methods           = ["HEAD", "GET"]
    compress                 = "false"
    default_ttl              = "0"
    max_ttl                  = "0"
    min_ttl                  = "0"
    origin_request_policy_id = "216adef6-5c7f-47e4-b989-5492eafa07d3"
    smooth_streaming         = "false"
    target_origin_id         = "Custom-jenkins-origin.aws.plasmic.app"
    viewer_protocol_policy   = "allow-all"
  }

  enabled         = "true"
  http_version    = "http2"
  is_ipv6_enabled = "true"

  origin {
    connection_attempts = "3"
    connection_timeout  = "10"

    custom_origin_config {
      http_port                = "80"
      https_port               = "443"
      origin_keepalive_timeout = "5"
      origin_protocol_policy   = "http-only"
      origin_read_timeout      = "30"
      origin_ssl_protocols     = ["TLSv1.2", "TLSv1", "TLSv1.1"]
    }

    domain_name = "jenkins-origin.aws.plasmic.app"
    origin_id   = "Custom-jenkins-origin.aws.plasmic.app"
  }

  price_class = "PriceClass_100"

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  retain_on_delete = "false"

  viewer_certificate {
    acm_certificate_arn            = "arn:aws:acm:us-east-1:939375546786:certificate/af417a95-5e4f-46ea-87e1-bdd4bceb3213"
    cloudfront_default_certificate = "false"
    minimum_protocol_version       = "TLSv1.2_2019"
    ssl_support_method             = "sni-only"
  }
}

resource "aws_cloudfront_distribution" "img_cf" {
  aliases = ["img.plasmic.app"]

  default_cache_behavior {
    allowed_methods          = ["OPTIONS", "GET", "DELETE", "POST", "HEAD", "PUT", "PATCH"]
    cache_policy_id          = "4135ea2d-6df8-44a3-9df3-4b5a84be39ad"
    cached_methods           = ["HEAD", "GET"]
    compress                 = "true"
    default_ttl              = "0"
    max_ttl                  = "0"
    min_ttl                  = "0"
    origin_request_policy_id = "216adef6-5c7f-47e4-b989-5492eafa07d3"
    smooth_streaming         = "false"
    target_origin_id         = "Custom-img-origin.plasmic.app"
    viewer_protocol_policy   = "redirect-to-https"
  }

  enabled         = "true"
  http_version    = "http2"
  is_ipv6_enabled = "true"

  ordered_cache_behavior {
    allowed_methods          = ["GET", "OPTIONS", "HEAD"]
    cache_policy_id          = "4d2313d0-9dd0-414f-9af6-75e870571525"
    cached_methods           = ["HEAD", "OPTIONS", "GET"]
    compress                 = "true"
    default_ttl              = "0"
    max_ttl                  = "0"
    min_ttl                  = "0"
    origin_request_policy_id = "216adef6-5c7f-47e4-b989-5492eafa07d3"
    path_pattern             = "/img-optimizer/v1/img/*"
    smooth_streaming         = "false"
    target_origin_id         = "Custom-img-origin.plasmic.app"
    viewer_protocol_policy   = "redirect-to-https"
  }

  origin {
    connection_attempts = "3"
    connection_timeout  = "10"

    custom_origin_config {
      http_port                = "80"
      https_port               = "443"
      origin_keepalive_timeout = "5"
      origin_protocol_policy   = "http-only"
      origin_read_timeout      = "60"
      origin_ssl_protocols     = ["TLSv1.1", "TLSv1", "TLSv1.2"]
    }

    domain_name = "img-origin.plasmic.app"
    origin_id   = "Custom-img-origin.plasmic.app"
  }

  price_class = "PriceClass_All"

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  retain_on_delete = "false"

  viewer_certificate {
    acm_certificate_arn            = "arn:aws:acm:us-east-1:939375546786:certificate/a76e2244-31cc-4a31-803e-69ee0a0c02fe"
    cloudfront_default_certificate = "false"
    minimum_protocol_version       = "TLSv1.2_2019"
    ssl_support_method             = "sni-only"
  }
}

resource "aws_cloudfront_distribution" "studio_app_cf" {
  aliases = ["studio.plasmic.app"]

  default_cache_behavior {
    allowed_methods          = ["PATCH", "HEAD", "GET", "OPTIONS", "PUT", "DELETE", "POST"]
    cache_policy_id          = "4135ea2d-6df8-44a3-9df3-4b5a84be39ad"
    cached_methods           = ["GET", "OPTIONS", "HEAD"]
    compress                 = "true"
    default_ttl              = "0"
    max_ttl                  = "0"
    min_ttl                  = "0"
    origin_request_policy_id = "216adef6-5c7f-47e4-b989-5492eafa07d3"
    smooth_streaming         = "false"
    target_origin_id         = "Custom-studio-origin.plasmic.app"
    viewer_protocol_policy   = "redirect-to-https"
  }

  enabled         = "true"
  http_version    = "http2"
  is_ipv6_enabled = "true"

  logging_config {
    bucket          = "plasmic-studio-logs.s3.amazonaws.com"
    include_cookies = "false"
  }

  custom_error_response {
    error_code            = 400
    error_caching_min_ttl = 10
    response_code         = 0
  }

  ordered_cache_behavior {
    allowed_methods          = ["HEAD", "OPTIONS", "GET"]
    cache_policy_id          = "4d2313d0-9dd0-414f-9af6-75e870571525"
    cached_methods           = ["HEAD", "OPTIONS", "GET"]
    compress                 = "false"
    default_ttl              = "0"
    max_ttl                  = "0"
    min_ttl                  = "0"
    origin_request_policy_id = "216adef6-5c7f-47e4-b989-5492eafa07d3"
    path_pattern             = "/api/v1/loader/*"
    smooth_streaming         = "false"
    target_origin_id         = "Custom-studio-origin.plasmic.app"
    viewer_protocol_policy   = "redirect-to-https"
  }

  ordered_cache_behavior {
    allowed_methods          = ["HEAD", "GET"]
    cache_policy_id          = "4135ea2d-6df8-44a3-9df3-4b5a84be39ad"
    cached_methods           = ["HEAD", "GET"]
    compress                 = "true"
    default_ttl              = "0"
    max_ttl                  = "0"
    min_ttl                  = "0"
    origin_request_policy_id = "216adef6-5c7f-47e4-b989-5492eafa07d3"
    path_pattern             = "/.well-known/acme-challenge/*"
    smooth_streaming         = "false"
    target_origin_id         = "acme-http-studio-origin.plasmic.app"
    viewer_protocol_policy   = "allow-all"
  }

  ordered_cache_behavior {
    allowed_methods          = ["POST", "GET", "DELETE", "OPTIONS", "PUT", "PATCH", "HEAD"]
    cache_policy_id          = "d4806f0d-384c-415c-84bf-36e0a2fd86eb"
    cached_methods           = ["HEAD", "GET", "OPTIONS"]
    compress                 = "true"
    default_ttl              = "0"
    max_ttl                  = "0"
    min_ttl                  = "0"
    origin_request_policy_id = "216adef6-5c7f-47e4-b989-5492eafa07d3"
    path_pattern             = "/api/v1/cms/*"
    smooth_streaming         = "false"
    target_origin_id         = "data-origin.plasmic.app"
    viewer_protocol_policy   = "redirect-to-https"
  }

  ordered_cache_behavior {
    allowed_methods        = ["OPTIONS", "HEAD", "GET"]
    cache_policy_id        = "91a62c7e-9e27-4fd2-bf81-44f752aa6083"
    cached_methods         = ["GET", "OPTIONS", "HEAD"]
    compress               = "true"
    default_ttl            = "0"
    max_ttl                = "0"
    min_ttl                = "0"
    path_pattern           = "/static/*"
    smooth_streaming       = "false"
    target_origin_id       = "Custom-studio-origin.plasmic.app"
    viewer_protocol_policy = "redirect-to-https"
  }

  origin {
    connection_attempts = "3"
    connection_timeout  = "10"

    custom_origin_config {
      http_port                = "80"
      https_port               = "443"
      origin_keepalive_timeout = "5"
      origin_protocol_policy   = "http-only"
      origin_read_timeout      = "30"
      origin_ssl_protocols     = ["TLSv1.1", "TLSv1", "TLSv1.2"]
    }

    domain_name = "studio-origin.plasmic.app"
    origin_id   = "acme-http-studio-origin.plasmic.app"
  }

  origin {
    connection_attempts = "3"
    connection_timeout  = "10"

    custom_origin_config {
      http_port                = "80"
      https_port               = "443"
      origin_keepalive_timeout = "5"
      origin_protocol_policy   = "https-only"
      origin_read_timeout      = "180"
      origin_ssl_protocols     = ["TLSv1", "TLSv1.1", "TLSv1.2"]
    }

    domain_name = "studio-origin.plasmic.app"
    origin_id   = "Custom-studio-origin.plasmic.app"

    origin_shield {
      enabled              = "true"
      origin_shield_region = "us-west-2"
    }
  }
  origin {
    connection_attempts = "3"
    connection_timeout  = "10"

    custom_origin_config {
      http_port                = "80"
      https_port               = "443"
      origin_keepalive_timeout = "5"
      origin_protocol_policy   = "http-only"
      origin_read_timeout      = "180"
      origin_ssl_protocols     = ["TLSv1", "TLSv1.1", "TLSv1.2"]
    }

    domain_name = "data-origin.plasmic.app"
    origin_id   = "data-origin.plasmic.app"

    origin_shield {
      enabled              = "true"
      origin_shield_region = "us-west-2"
    }
  }

  price_class = "PriceClass_All"

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  retain_on_delete = "false"

  viewer_certificate {
    acm_certificate_arn            = "arn:aws:acm:us-east-1:939375546786:certificate/47e6c434-2588-4399-8990-5181de511223"
    cloudfront_default_certificate = "false"
    minimum_protocol_version       = "TLSv1.2_2021"
    ssl_support_method             = "sni-only"
  }
}
