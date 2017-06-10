package bootsample.dao;

import org.springframework.data.repository.CrudRepository;

import bootsample.model.Task;

public interface TaskRepository extends CrudRepository<Task, Integer>{

}
