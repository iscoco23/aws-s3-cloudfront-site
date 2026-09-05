variable "github_owner" {
  type        = string
  default     = "iscoco23"
  description = "GitHub user or org that owns the repo"
}

variable "github_repo" {
  type        = string
  description = "GitHub repository name (no .git)"
}
