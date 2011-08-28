package repository;

import java.util.List;

import model.Line;

public interface LineDAO {
	public List<Line> getLinelist();
	
	public void saveLine(Line line);
}
