variable "aws_region" {
    description = "AWS region for all resources"
    type        = string
    default     = "eu-west-3"
}

variable "environment" {
    description = "Environment name"
    type        = string
    default     = dev
}

variable "project_name" {
    description = "Project name for resource naming"
    type        = string
    default     = "GHR"
}

variable "github_token" {
    description = "GitHub Personal Access Token"
    type        = string
    sensitive   = true
}

variable "runner_pool_size" {
    description = "Desired number of idle runners"
    type        = number
    default     = 2
}

variable "instance_type" {
    description = "EC2 instance type for runners"
    type        = string
    default     = "t3.micro"
}