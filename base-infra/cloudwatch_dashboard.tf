#module "cloudwatch_dashboard_prod" {
#  source         = "./modules/cloudwatch_dashboard"
#  dashboard_name = "Prod-Health"
#  dashboard_body = <<EOF
#{
#	"widgets": [{
#		"height": 6,
#		"width": 12,
#		"y": 6,
#		"x": 0,
#		"type": "metric",
#		"properties": {
#			"metrics": [
#				[{
#					"expression": "m3+m4",
#					"label": "Total Disk Ops",
#					"id": "e1",
#					"region": "us-west-2"
#				}],
#				["AWS/EBS", "VolumeReadOps", "VolumeId", "vol-078473d9d77201b53", {
#					"id": "m3"
#				}],
#				[".", "VolumeWriteOps", ".", ".", {
#					"id": "m4"
#				}]
#			],
#			"region": "us-west-2",
#			"title": "Studio Disk Ops",
#			"copilot": true,
#			"view": "timeSeries",
#			"stacked": false,
#			"stat": "Sum",
#			"period": 300,
#			"yAxis": {
#				"left": {
#					"min": 0
#				}
#			},
#			"legend": {
#				"position": "bottom"
#			}
#		}
#	}, {
#		"height": 6,
#		"width": 12,
#		"y": 0,
#		"x": 0,
#		"type": "metric",
#		"properties": {
#			"view": "timeSeries",
#			"stacked": false,
#			"metrics": [
#				["AWS/EC2", "CPUUtilization", "InstanceId", "i-0b72cc317b56cfbda"]
#			],
#			"region": "us-west-2",
#			"title": "Studio CPU",
#			"period": 300,
#			"yAxis": {
#				"left": {
#					"min": 0,
#					"max": 100
#				}
#			}
#		}
#	}, {
#		"height": 6,
#		"width": 12,
#		"y": 6,
#		"x": 12,
#		"type": "metric",
#		"properties": {
#			"view": "timeSeries",
#			"stacked": false,
#			"metrics": [
#				["AWS/EC2", "NetworkIn", "InstanceId", "i-0b72cc317b56cfbda"],
#				[".", "NetworkOut", ".", "."]
#			],
#			"region": "us-west-2",
#			"title": "Studio network",
#			"period": 300
#		}
#	}, {
#		"height": 6,
#		"width": 12,
#		"y": 18,
#		"x": 0,
#		"type": "metric",
#		"properties": {
#			"metrics": [
#				["CWAgent", "disk_used_percent", "path", "/", "InstanceId", "i-0b72cc317b56cfbda", "ImageId", "ami-0f1888aafe303afea", "InstanceType", "m5a.xlarge", "device", "nvme0n1p1", "fstype", "ext4"]
#			],
#			"view": "timeSeries",
#			"stacked": false,
#			"region": "us-west-2",
#			"title": "Disk Used Percent",
#			"period": 300,
#			"yAxis": {
#				"left": {
#					"min": 80,
#					"max": 100
#				}
#			},
#			"liveData": true,
#			"stat": "Average"
#		}
#	}, {
#		"height": 2,
#		"width": 6,
#		"y": 12,
#		"x": 12,
#		"type": "alarm",
#		"properties": {
#			"title": "",
#			"alarms": ["arn:aws:cloudwatch:us-west-2:939375546786:alarm:Production Server disk full"]
#		}
#	}, {
#		"height": 6,
#		"width": 12,
#		"y": 12,
#		"x": 0,
#		"type": "metric",
#		"properties": {
#			"metrics": [
#				[{
#					"expression": "SELECT AVG(VolumeQueueLength) FROM \"AWS/EBS\" WHERE VolumeId = 'vol-078473d9d77201b53'",
#					"label": "Disk Queue Length",
#					"id": "q1",
#					"region": "us-west-2"
#				}]
#			],
#			"region": "us-west-2",
#			"title": "Studio Disk Volume Queue Length (Avg)",
#			"copilot": true,
#			"view": "timeSeries",
#			"stacked": false,
#			"stat": "Sum",
#			"period": 300,
#			"yAxis": {
#				"left": {
#					"min": 0
#				}
#			},
#			"legend": {
#				"position": "bottom"
#			}
#		}
#	}, {
#		"height": 6,
#		"width": 12,
#		"y": 0,
#		"x": 12,
#		"type": "metric",
#		"properties": {
#			"metrics": [
#				["CWAgent", "mem_used_percent", "InstanceId", "i-0b72cc317b56cfbda", "ImageId", "ami-0f1888aafe303afea", "InstanceType", "m5a.xlarge"]
#			],
#			"view": "timeSeries",
#			"stacked": false,
#			"region": "us-west-2",
#			"title": "mem_used_percent",
#			"period": 300,
#			"stat": "Average"
#		}
#	}]
#}
#EOF
#}
#module "cloudwatch_dashboard_cloudfront_codegen" {
#  source         = "./modules/cloudwatch_dashboard"
#  dashboard_name = "Cloudfront-Codegen"
#  dashboard_body = <<EOF
#{
#	"widgets": [{
#		"type": "metric",
#		"x": 0,
#		"y": 0,
#		"width": 12,
#		"height": 12,
#		"properties": {
#			"view": "timeSeries",
#			"stacked": false,
#			"metrics": [
#				["AWS/CloudFront", "Requests", "Region", "Global", "DistributionId", "E215HX39ICFSK7"]
#			],
#			"region": "us-east-1",
#			"title": "Requests (sum)",
#			"yAxis": {
#				"left": {
#					"showUnits": false
#				},
#				"right": {
#					"showUnits": false
#				}
#			},
#			"stat": "Sum"
#		}
#	}, {
#		"type": "metric",
#		"x": 12,
#		"y": 0,
#		"width": 12,
#		"height": 12,
#		"properties": {
#			"view": "timeSeries",
#			"stacked": false,
#			"metrics": [
#				["AWS/CloudFront", "BytesUploaded", "Region", "Global", "DistributionId", "E215HX39ICFSK7"],
#				[".", "BytesDownloaded", ".", ".", ".", "."]
#			],
#			"region": "us-east-1",
#			"title": "Data transfer",
#			"yAxis": {
#				"left": {
#					"showUnits": false
#				},
#				"right": {
#					"showUnits": false
#				}
#			}
#		}
#	}, {
#		"type": "metric",
#		"x": 0,
#		"y": 12,
#		"width": 12,
#		"height": 12,
#		"properties": {
#			"view": "timeSeries",
#			"stacked": false,
#			"metrics": [
#				["AWS/CloudFront", "TotalErrorRate", "Region", "Global", "DistributionId", "E215HX39ICFSK7"],
#				[".", "4xxErrorRate", ".", ".", ".", ".", {
#					"label": "Total4xxErrors"
#				}],
#				[".", "5xxErrorRate", ".", ".", ".", ".", {
#					"label": "Total5xxErrors"
#				}],
#				[{
#					"expression": "(m4+m5+m6)/m7*100",
#					"label": "5xxErrorByLambdaEdge",
#					"id": "e1"
#				}],
#				["AWS/CloudFront", "LambdaExecutionError", "Region", "Global", "DistributionId", "E215HX39ICFSK7", {
#					"id": "m4",
#					"stat": "Sum",
#					"visible": false
#				}],
#				[".", "LambdaValidationError", ".", ".", ".", ".", {
#					"id": "m5",
#					"stat": "Sum",
#					"visible": false
#				}],
#				[".", "LambdaLimitExceededErrors", ".", ".", ".", ".", {
#					"id": "m6",
#					"stat": "Sum",
#					"visible": false
#				}],
#				[".", "Requests", ".", ".", ".", ".", {
#					"id": "m7",
#					"stat": "Sum",
#					"visible": false
#				}]
#			],
#			"region": "us-east-1",
#			"title": "Error rate (as a percentage of total requests)",
#			"yAxis": {
#				"left": {
#					"showUnits": false
#				},
#				"right": {
#					"showUnits": false
#				}
#			}
#		}
#	}, {
#		"type": "metric",
#		"x": 12,
#		"y": 12,
#		"width": 12,
#		"height": 12,
#		"properties": {
#			"view": "timeSeries",
#			"stacked": false,
#			"metrics": [
#				["AWS/CloudFront", "4xxErrorRate", "Region", "Global", "DistributionId", "E215HX39ICFSK7", {
#					"label": "Total4xxErrors"
#				}],
#				[".", "401ErrorRate", ".", ".", ".", "."],
#				[".", "403ErrorRate", ".", ".", ".", "."],
#				[".", "404ErrorRate", ".", ".", ".", "."]
#			],
#			"region": "us-east-1",
#			"title": "4xx Error rate breakdown (as a percentage of total requests)",
#			"yAxis": {
#				"left": {
#					"showUnits": false
#				},
#				"right": {
#					"showUnits": false
#				}
#			}
#		}
#	}, {
#		"type": "metric",
#		"x": 0,
#		"y": 24,
#		"width": 12,
#		"height": 12,
#		"properties": {
#			"view": "timeSeries",
#			"stacked": false,
#			"metrics": [
#				["AWS/CloudFront", "5xxErrorRate", "Region", "Global", "DistributionId", "E215HX39ICFSK7", {
#					"label": "Total5xxErrors"
#				}],
#				[".", "502ErrorRate", ".", ".", ".", "."],
#				[".", "503ErrorRate", ".", ".", ".", "."],
#				[".", "504ErrorRate", ".", ".", ".", "."]
#			],
#			"region": "us-east-1",
#			"title": "5xx Error rate breakdown (as a percentage of total requests)",
#			"yAxis": {
#				"left": {
#					"showUnits": false
#				},
#				"right": {
#					"showUnits": false
#				}
#			}
#		}
#	}, {
#		"type": "metric",
#		"x": 12,
#		"y": 24,
#		"width": 12,
#		"height": 12,
#		"properties": {
#			"view": "timeSeries",
#			"stacked": false,
#			"metrics": [
#				["AWS/CloudFront", "OriginLatency", "Region", "Global", "DistributionId", "E215HX39ICFSK7"]
#			],
#			"region": "us-east-1",
#			"title": "Origin latency",
#			"yAxis": {
#				"left": {
#					"showUnits": false
#				},
#				"right": {
#					"showUnits": false
#				}
#			}
#		}
#	}, {
#		"type": "metric",
#		"x": 0,
#		"y": 36,
#		"width": 12,
#		"height": 12,
#		"properties": {
#			"view": "timeSeries",
#			"stacked": false,
#			"metrics": [
#				["AWS/CloudFront", "CacheHitRate", "Region", "Global", "DistributionId", "E215HX39ICFSK7"]
#			],
#			"region": "us-east-1",
#			"title": "Cache hit rate",
#			"yAxis": {
#				"left": {
#					"showUnits": false
#				},
#				"right": {
#					"showUnits": false
#				}
#			}
#		}
#	}]
#	}]
#}
#EOF
#}
module "cloudwatch_dashboard_cloudfront_studio" {
  source         = "./modules/cloudwatch_dashboard"
  dashboard_name = "Cloudfront-Studio"
  dashboard_body = <<EOF
  {
	"widgets": [{
		"height": 6,
		"width": 12,
		"y": 0,
		"x": 0,
		"type": "metric",
		"properties": {
			"metrics": [
				[{
					"expression": "m0r0+m1",
					"label": "gerrit - IOps",
					"id": "e1",
					"region": "us-west-2"
				}],
				["AWS/EBS", "VolumeReadOps", "VolumeId", "vol-05369d753930426b4", {
					"id": "m0r0",
					"label": "gerrit - VolumeReadOps",
					"yAxis": "left"
				}],
				[".", "VolumeWriteOps", ".", ".", {
					"label": "gerrit - VolumeWriteOps",
					"id": "m1"
				}]
			],
			"region": "us-west-2",
			"title": "Gerrit Disk Ops",
			"copilot": true,
			"view": "timeSeries",
			"stacked": false,
			"stat": "Sum",
			"period": 300,
			"yAxis": {
				"left": {
					"min": 0
				}
			}
		}
	}, {
		"height": 6,
		"width": 12,
		"y": 0,
		"x": 12,
		"type": "metric",
		"properties": {
			"metrics": [
				["AWS/EBS", "BurstBalance", "VolumeId", "vol-05369d753930426b4", {
					"id": "m2"
				}]
			],
			"region": "us-west-2",
			"title": "Gerrit Burst Balance",
			"copilot": true,
			"view": "timeSeries",
			"stacked": false,
			"stat": "Minimum",
			"period": 300,
			"yAxis": {
				"left": {
					"min": 0
				}
			}
		}
	}, {
		"height": 6,
		"width": 12,
		"y": 6,
		"x": 0,
		"type": "metric",
		"properties": {
			"view": "timeSeries",
			"stacked": false,
			"metrics": [
				["AWS/EC2", "CPUUtilization", "InstanceId", "i-021318e2db48ddbb4"]
			],
			"region": "us-west-2",
			"title": "Gerrit CPU",
			"period": 300,
			"yAxis": {
				"left": {
					"min": 0
				}
			}
		}
	}, {
		"height": 15,
		"width": 24,
		"y": 12,
		"x": 0,
		"type": "explorer",
		"properties": {
			"metrics": [{
				"metricName": "CPUUtilization",
				"resourceType": "AWS::EC2::Instance",
				"stat": "Average"
			}],
			"labels": [{
				"key": "Name",
				"value": "jenkins-agent"
			}, {
				"key": "Name",
				"value": "gerrit"
			}],
			"widgetOptions": {
				"legend": {
					"position": "bottom"
				},
				"view": "timeSeries",
				"stacked": false,
				"rowsPerPage": 50,
				"widgetsPerRow": 2
			},
			"period": 300,
			"splitBy": "",
			"region": "us-west-2",
			"title": "Agent Utilization"
		}
	}, {
		"height": 15,
		"width": 24,
		"y": 27,
		"x": 0,
		"type": "explorer",
		"properties": {
			"metrics": [{
				"metricName": "VolumeReadOps",
				"resourceType": "AWS::EC2::Volume",
				"stat": "Sum"
			}, {
				"metricName": "VolumeWriteOps",
				"resourceType": "AWS::EC2::Volume",
				"stat": "Sum"
			}, {
				"metricName": "BurstBalance",
				"resourceType": "AWS::EC2::Volume",
				"stat": "Average"
			}],
			"labels": [{
				"key": "Name",
				"value": "jenkins-agent"
			}, {
				"key": "Name",
				"value": "gerrit"
			}],
			"widgetOptions": {
				"legend": {
					"position": "bottom"
				},
				"view": "timeSeries",
				"stacked": false,
				"rowsPerPage": 50,
				"widgetsPerRow": 2
			},
			"period": 300,
			"splitBy": "",
			"region": "us-west-2",
			"title": "Devops Disk"
		}
	}]
  }
  EOF
}
module "cloudwatch_dashboard_devops_health" {
  source         = "./modules/cloudwatch_dashboard"
  dashboard_name = "Devops-Health"
  dashboard_body = <<EOF
{
	"widgets": [{
		"height": 6,
		"width": 12,
		"y": 0,
		"x": 0,
		"type": "metric",
		"properties": {
			"metrics": [
				[{
					"expression": "m0r0+m1",
					"label": "gerrit - IOps",
					"id": "e1",
					"region": "us-west-2"
				}],
				["AWS/EBS", "VolumeReadOps", "VolumeId", "vol-05369d753930426b4", {
					"id": "m0r0",
					"label": "gerrit - VolumeReadOps",
					"yAxis": "left"
				}],
				[".", "VolumeWriteOps", ".", ".", {
					"label": "gerrit - VolumeWriteOps",
					"id": "m1"
				}]
			],
			"region": "us-west-2",
			"title": "Gerrit Disk Ops",
			"copilot": true,
			"view": "timeSeries",
			"stacked": false,
			"stat": "Sum",
			"period": 300,
			"yAxis": {
				"left": {
					"min": 0
				}
			}
		}
	}, {
		"height": 6,
		"width": 12,
		"y": 0,
		"x": 12,
		"type": "metric",
		"properties": {
			"metrics": [
				["AWS/EBS", "BurstBalance", "VolumeId", "vol-05369d753930426b4", {
					"id": "m2"
				}]
			],
			"region": "us-west-2",
			"title": "Gerrit Burst Balance",
			"copilot": true,
			"view": "timeSeries",
			"stacked": false,
			"stat": "Minimum",
			"period": 300,
			"yAxis": {
				"left": {
					"min": 0
				}
			}
		}
	}, {
		"height": 6,
		"width": 12,
		"y": 6,
		"x": 0,
		"type": "metric",
		"properties": {
			"view": "timeSeries",
			"stacked": false,
			"metrics": [
				["AWS/EC2", "CPUUtilization", "InstanceId", "i-021318e2db48ddbb4"]
			],
			"region": "us-west-2",
			"title": "Gerrit CPU",
			"period": 300,
			"yAxis": {
				"left": {
					"min": 0
				}
			}
		}
	}, {
		"height": 15,
		"width": 24,
		"y": 12,
		"x": 0,
		"type": "explorer",
		"properties": {
			"metrics": [{
				"metricName": "CPUUtilization",
				"resourceType": "AWS::EC2::Instance",
				"stat": "Average"
			}],
			"labels": [{
				"key": "Name",
				"value": "jenkins-agent"
			}, {
				"key": "Name",
				"value": "gerrit"
			}],
			"widgetOptions": {
				"legend": {
					"position": "bottom"
				},
				"view": "timeSeries",
				"stacked": false,
				"rowsPerPage": 50,
				"widgetsPerRow": 2
			},
			"period": 300,
			"splitBy": "",
			"region": "us-west-2",
			"title": "Agent Utilization"
		}
	}, {
		"height": 15,
		"width": 24,
		"y": 27,
		"x": 0,
		"type": "explorer",
		"properties": {
			"metrics": [{
				"metricName": "VolumeReadOps",
				"resourceType": "AWS::EC2::Volume",
				"stat": "Sum"
			}, {
				"metricName": "VolumeWriteOps",
				"resourceType": "AWS::EC2::Volume",
				"stat": "Sum"
			}, {
				"metricName": "BurstBalance",
				"resourceType": "AWS::EC2::Volume",
				"stat": "Average"
			}],
			"labels": [{
				"key": "Name",
				"value": "jenkins-agent"
			}, {
				"key": "Name",
				"value": "gerrit"
			}],
			"widgetOptions": {
				"legend": {
					"position": "bottom"
				},
				"view": "timeSeries",
				"stacked": false,
				"rowsPerPage": 50,
				"widgetsPerRow": 2
			},
			"period": 300,
			"splitBy": "",
			"region": "us-west-2",
			"title": "Devops Disk"
		}
	}]
}
EOF
}