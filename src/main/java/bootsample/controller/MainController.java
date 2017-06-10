package bootsample.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import bootsample.model.Task;
import bootsample.service.TaskService;

@Controller
public class MainController {
	
	@Autowired
	private TaskService taskService;
	
	@Autowired
	private HttpServletResponse response;
	
	@GetMapping("/")
	public String home(HttpServletRequest request){
		request.setAttribute("mode", "MODE_HOME");
		return "index";
	}
	
	
	@GetMapping("/all-tasks")
	public String allTasks(HttpServletRequest request){
		request.setAttribute("tasks", taskService.findAll());
		request.setAttribute("mode", "MODE_TASKS");
		return "index";
	}
	
	@GetMapping("/new-task")
	public String newTask(HttpServletRequest request){
		request.setAttribute("mode", "MODE_NEW");
		return "index";
	}
	
	@GetMapping("/update-task")
	public String updateTask(@RequestParam int id, HttpServletRequest request){
		request.setAttribute("tasks", taskService.findTask(id));
		request.setAttribute("mode", "MODE_UPDATE");
		return "index";
	}
	
	@GetMapping("/delete-task")
	public String deleteTask(@RequestParam int id, HttpServletRequest request){
		taskService.deleteTask(id);
		request.setAttribute("tasks", taskService.findAll());
		request.setAttribute("mode", "MODE_TASKS");
		return "index";
	}
	
	@PostMapping("/save-task")
	public String saveTask(@ModelAttribute Task task,BindingResult bindingResult, HttpServletRequest request){
		task.setDateCreated(new Date());
		taskService.saveTask(task);
		request.setAttribute("tasks", taskService.findAll());
		request.setAttribute("mode", "MODE_TASKS");
		return "index";
	}
	
	public String taskClear(String task){
		if(task.equals("clear")){
			try {
				response.sendRedirect("/all-tasks");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return "/";
	}

}

