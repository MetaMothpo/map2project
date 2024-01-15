from prefect import Flow, task
import subprocess

@task
def run_dbt():
    dbt_command = ['dbt', 'run', '--profiles-dir', 'C:\\Users\\Admin\\.dbt\\profiles.yml']
    subprocess.run(dbt_command, check=True)

# Create a Prefect flow
with Flow("dbt_workflow") as flow:
    dbt_task = run_dbt()

if __name__ == "__main__":
    flow.run()


