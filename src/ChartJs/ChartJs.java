package ChartJs;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.google.gson.Gson;

public class ChartJs 
{
    public static List<String> GetClass() throws SQLException, ClassNotFoundException
    { 
        String sql = "SELECT * FROM `class`";
        DB.open(); 
        ResultSet rs = DB.q(sql);
        List<String> list = new ArrayList<>();
        while(rs.next())
        {
            list.add(rs.getString("NameClass"));                      
        }
           
        DB.close();
        return list;
    }
    
    public static List<String> GetScore_below_average() throws SQLException, ClassNotFoundException
    {
    	
        String sql = "SELECT ClassId, COUNT(StudentId) as total FROM student GROUP by ClassId;";
        DB.open(); 
        ResultSet rs = DB.q(sql);
        List<String> list = new ArrayList<>();
        while(rs.next())
        {
            list.add(rs.getString("Total"));                      
        }
           
        DB.close();
        return list;
    }
    
    public static List<String> GetMin_score() throws SQLException, ClassNotFoundException
    {
    	
        String sql = "SELECT student.ClassId,Min(result.point) as Total FROM result left join student on result.StudentId=student.StudentId group by student.ClassId;";
        DB.open(); 
        ResultSet rs = DB.q(sql);
        List<String> list = new ArrayList<>();
        while(rs.next())
        {
            list.add(rs.getString("Total"));                      
        }
           
        DB.close();
        return list;
    }
    
    
    public static List<String> GetMax_score() throws SQLException, ClassNotFoundException
    {
    	
        String sql = "SELECT student.ClassId,MAX(result.point) as Total FROM result left join student on result.StudentId=student.StudentId group by student.ClassId;";
        DB.open(); 
        ResultSet rs = DB.q(sql);
        List<String> list = new ArrayList<>();
        while(rs.next())
        {
            list.add(rs.getString("Total"));                      
        }
           
        DB.close();
        return list;
    }
}
