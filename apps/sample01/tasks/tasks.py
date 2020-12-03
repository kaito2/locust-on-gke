from locust import HttpLocust, TaskSet, task

class SampleTasks(TaskSet):
  @task
  def status(self):
      self.client.get("/")

class SampleHttpLocust(HttpLocust):
  task_set = SampleTasks
  min_wait = 1000
  max_wait = 3000
