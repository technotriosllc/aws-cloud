resource "aws_glue_catalog_database" "default" {
  catalog_id = var.aws_account_id

  create_table_default_permission {
    permissions = ["ALL"]

    principal {
      data_lake_principal_identifier = "IAM_ALLOWED_PRINCIPALS"
    }
  }

  description  = "Default Hive database"
  location_uri = "hdfs://ip-172-20-75-116.us-west-2.compute.internal:8020/user/hive/warehouse"
  name         = "default"
}

resource "aws_glue_catalog_table" "default_003A_codegen_cloudfront_logs" {
  catalog_id    = var.aws_account_id
  database_name = "default"
  name          = "codegen_cloudfront_logs"
  owner         = "hadoop"

  parameters = {
    EXTERNAL                 = "TRUE"
    "skip.header.line.count" = "2"
    transient_lastDdlTime    = "1632257561"
  }
  retention = "0"

  storage_descriptor {
    columns {
      name = "date"
      type = "date"

    }

    columns {
      name = "time"
      type = "string"
    }

    columns {
      name = "location"
      type = "string"
    }

    columns {
      name = "bytes"
      type = "bigint"
    }

    columns {
      name = "request_ip"
      type = "string"
    }

    columns {
      name = "method"
      type = "string"
    }

    columns {
      name = "host"
      type = "string"
    }

    columns {
      name = "uri"
      type = "string"
    }

    columns {
      name = "status"
      type = "int"
    }

    columns {
      name = "referrer"
      type = "string"
    }

    columns {
      name = "user_agent"
      type = "string"
    }

    columns {
      name = "query_string"
      type = "string"
    }

    columns {
      name = "cookie"
      type = "string"
    }

    columns {
      name = "result_type"
      type = "string"
    }

    columns {
      name = "request_id"
      type = "string"
    }

    columns {
      name = "host_header"
      type = "string"
    }

    columns {
      name = "request_protocol"
      type = "string"
    }

    columns {
      name = "request_bytes"
      type = "bigint"
    }

    columns {
      name = "time_taken"
      type = "float"
    }

    columns {
      name = "xforwarded_for"
      type = "string"
    }

    columns {
      name = "ssl_protocol"
      type = "string"
    }

    columns {
      name = "ssl_cipher"
      type = "string"
    }

    columns {
      name = "response_result_type"
      type = "string"
    }

    columns {
      name = "http_version"
      type = "string"
    }

    columns {
      name = "fle_status"
      type = "string"
    }

    columns {
      name = "fle_encrypted_fields"
      type = "int"
    }

    columns {
      name = "c_port"
      type = "int"
    }

    columns {
      name = "time_to_first_byte"
      type = "float"
    }

    columns {
      name = "x_edge_detailed_result_type"
      type = "string"
    }

    columns {
      name = "sc_content_type"
      type = "string"
    }

    columns {
      name = "sc_content_len"
      type = "bigint"
    }

    columns {
      name = "sc_range_start"
      type = "bigint"
    }

    columns {
      name = "sc_range_end"
      type = "bigint"
    }

    compressed        = "false"
    input_format      = "org.apache.hadoop.mapred.TextInputFormat"
    location          = "s3://codegen-logs/"
    number_of_buckets = "-1"
    output_format     = "org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat"

    ser_de_info {
      parameters = {
        "field.delim"          = "\t"
        "serialization.format" = "\t"
      }

      serialization_library = "org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe"
    }

    stored_as_sub_directories = "false"
  }

  table_type = "EXTERNAL_TABLE"
}

resource "aws_glue_catalog_table" "default_studio_cloudfront_logs" {
  catalog_id    = var.aws_account_id
  database_name = "default"
  name          = "studio_cloudfront_logs"
  owner         = "hadoop"

  parameters = {
    EXTERNAL                 = "TRUE"
    "skip.header.line.count" = "2"
    transient_lastDdlTime    = "1643657588"
  }

  retention = "0"

  storage_descriptor {
    columns {
      name = "date"
      type = "date"
    }

    columns {
      name = "time"
      type = "string"
    }

    columns {
      name = "location"
      type = "string"
    }

    columns {
      name = "bytes"
      type = "bigint"
    }

    columns {
      name = "request_ip"
      type = "string"
    }

    columns {
      name = "method"
      type = "string"
    }

    columns {
      name = "host"
      type = "string"
    }

    columns {
      name = "uri"
      type = "string"
    }

    columns {
      name = "status"
      type = "int"
    }

    columns {
      name = "referrer"
      type = "string"
    }

    columns {
      name = "user_agent"
      type = "string"
    }

    columns {
      name = "query_string"
      type = "string"
    }

    columns {
      name = "cookie"
      type = "string"
    }

    columns {
      name = "result_type"
      type = "string"
    }

    columns {
      name = "request_id"
      type = "string"
    }

    columns {
      name = "host_header"
      type = "string"
    }

    columns {
      name = "request_protocol"
      type = "string"
    }

    columns {
      name = "request_bytes"
      type = "bigint"
    }

    columns {
      name = "time_taken"
      type = "float"
    }

    columns {
      name = "xforwarded_for"
      type = "string"
    }

    columns {
      name = "ssl_protocol"
      type = "string"
    }

    columns {
      name = "ssl_cipher"
      type = "string"
    }

    columns {
      name = "response_result_type"
      type = "string"
    }

    columns {
      name = "http_version"
      type = "string"
    }

    columns {
      name = "fle_status"
      type = "string"
    }

    columns {
      name = "fle_encrypted_fields"
      type = "int"
    }

    columns {
      name = "c_port"
      type = "int"
    }

    columns {
      name = "time_to_first_byte"
      type = "float"
    }

    columns {
      name = "x_edge_detailed_result_type"
      type = "string"
    }

    columns {
      name = "sc_content_type"
      type = "string"
    }

    columns {
      name = "sc_content_len"
      type = "bigint"
    }

    columns {
      name = "sc_range_start"
      type = "bigint"
    }

    columns {
      name = "sc_range_end"
      type = "bigint"
    }

    compressed        = "false"
    input_format      = "org.apache.hadoop.mapred.TextInputFormat"
    location          = "s3://plasmic-studio-logs/"
    number_of_buckets = "-1"
    output_format     = "org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat"

    ser_de_info {
      parameters = {
        "field.delim"          = "\t"
        "serialization.format" = "\t"
      }

      serialization_library = "org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe"
    }

    stored_as_sub_directories = "false"
  }

  table_type = "EXTERNAL_TABLE"
}
