package bootsample.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import bootsample.model.Task;
import bootsample.service.TaskService;

@RestController
public class SampleRestController {
	
		@Autowired
		private TaskService taskService;

		@GetMapping("/hello")
		public String hellp(){
			return "Hello World!!!";
		}
		
		/*
		@GetMapping("/all-tasks")
		public String allTasks(){
			return taskService.findAll().toString();
		}
		
		@GetMapping("/save-task")
		public String saveTask(@RequestParam String name, @RequestParam String desc){
			Task task=new Task(name,desc,new Date(),false);
			taskService.saveTask(task);
			return "Task Saved!";
		}
		
		@GetMapping("/delete-task")
		public String deleteTask(@RequestParam int id){
			taskService.deleteTask(id);
			return "Taks Deleted Successfully!";
		}
		*/
}
