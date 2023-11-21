
resource "databricks_job" "job_integration_test" {
  depends_on = [ databricks_repo.demo_in_staging,  databricks_cluster.databricks_demo  ]

  name = "Databricks Demo 01 Integration Test TF"

  task {
    task_key = "setup_test"

    existing_cluster_id = databricks_cluster.databricks_demo.id

    notebook_task {
      notebook_path = "${data.databricks_current_user.me.repos}/demo01-tf-stg/tests/integration-tests/demo-integration-test-setup"
    }
  }

  task {
    task_key = "run_integration_test"
    depends_on {
      task_key = "setup_test"
    }

    existing_cluster_id = databricks_cluster.databricks_demo.id

    notebook_task {
      notebook_path = "${data.databricks_current_user.me.repos}/demo01-tf-stg/tests/integration-tests/demo-integration-test-exec"
    }
  }

  task {
    task_key = "validate_test"

    depends_on {
      task_key = "run_integration_test"
    }

    existing_cluster_id = databricks_cluster.databricks_demo.id

    notebook_task {
      notebook_path = "${data.databricks_current_user.me.repos}/demo01-tf-stg/tests/integration-tests/demo-integration-test-validate"
    }
  }
}