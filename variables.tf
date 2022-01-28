# default

variable "build_location" {
  type = string
  description = "Location where the resource will be stored"
}

variable "service" {
  type = string
  description = "A service name to assign the resource"
}

variable "resource_group" {
  type = string
  description = "Resource group where the resource will be stored"
}

variable "prefix" {
  type = string
  description = "Prefix name that will be used to named the resource"
}

variable "tags" {
  type = map(string)
  description = "A mapping of tags to assign to the resource."
}

# app service plan

variable "service_plan_tier" {
  type = string
  description = "Specifies the plan's pricing tier."
}

variable "service_plan_size" {
  type = string
  description = "Specifies the plan's instance size."
}

# function app

variable "storage_account_name" {
  type = string
  description = "The backend storage account name which will be used by this Function App."
}

variable "storage_account_access_key" {
  type = string
  description = "The access key which will be used to access the backend storage account for the Function App."
}

variable "cosmosdb_connection_string" {
  type = string
  description = "CosmosDB Connection String"
}

