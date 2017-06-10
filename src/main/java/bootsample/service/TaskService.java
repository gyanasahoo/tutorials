package bootsample.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import bootsample.dao.TaskRepository;
import bootsample.model.Task;

@Service
@Transactional
public class TaskService {
	private final TaskRepository taskRepository;

	public TaskService(TaskRepository taskRepository) {
		this.taskRepository = taskRepository;
	}
	
	public List<Task> findAll(){
		List<Task> tasks=new ArrayList<Task>();
		for(Task task:taskRepository.findAll()){
			tasks.add(task);
		}
		return tasks;
	}
	public Task findTask(int id){
		return taskRepository.findOne(id);
	}
	
	public void saveTask(Task task){
		taskRepository.save(task);
	}
	
	public void deleteTask(int id){
		taskRepository.delete(id);
	}
}
