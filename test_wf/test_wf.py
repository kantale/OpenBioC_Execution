#!/usr/bin/env python3
from cwl_airflow.extensions.cwldag import CWLDAG
dag = CWLDAG(
            workflow="/usr/local/airflow/dags/test_wf/workflow.cwl",
                dag_id="my_dag_name"
                )
