package repository;

import java.util.List;
import org.apache.commons.logging.Log;
import java.sql.SQLException;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.simple.ParameterizedRowMapper;
import org.springframework.jdbc.core.simple.SimpleJdbcDaoSupport;

import model.Line;


public class JdbcLineDao implements LineDAO {
	
	 protected final Log logger = LogFactory.getLog(getClass());;
	
	
	@Override
	public List<Line> getLinelist() {
        logger.info("Getting lines!");
//        List<Line> lines = getSimpleJdbcTemplate().query(
//                "select * from lines;", 
//                new LineMapper());
//        return lines;
        return null;
	}

	@Override
	public void saveLine(Line line) {
        logger.info("Saving line: " + line.getLine_name() );
    /*    
        int count = getSimpleJdbcTemplate().update(
            "update lines set line_name = :line_name, user_id = :user_id, line_type_id = :line-type_id where line_id = :line_id",
            new MapSqlParameterSource().addValue("line_name", line.getLine_name() ))
                .addValue("user_id", line.getUser_id() )
                .addValue("line_type_id", line.getLine_type_id() )
                .addValue("line_id", line.getLine_id() )
        logger.info("Rows affected: " + count);
*/
	}

}
