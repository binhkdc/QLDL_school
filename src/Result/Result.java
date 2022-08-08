package Result;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class Result 
{
    public static List<HashMap<String, String>> Pagination(int pageSize,int page) 
            throws SQLException, ClassNotFoundException
    {
    	
        String sql = "SELECT COUNT(*) as total FROM `result`";        
        DB.open(); 
        ResultSet rs = DB.q(sql);
        List<HashMap<String,String>> list = new ArrayList<>();
        while(rs.next())
        {
            HashMap<String,String> row = new HashMap<>();
            int total= Integer.parseInt(rs.getString("total"));
            float allPage= total/pageSize;
            Math.ceil(allPage);
            for(int i=0;i<=allPage;i++){
            	row.put("PrePage",""+(page-1)+"");
            	row.put("PageHere",""+page+"");
            	row.put("Page", ""+i+"");
            	row.put("NextPage", ""+(page+1)+"");
            }
                
            list.add(row);             
        }
        
        DB.close();
        return list;
    }
	
    public static List<HashMap<String, String>> Search(String keywork) 
            throws SQLException, ClassNotFoundException
    {
        String sql = "SELECT result.ResultId, result.Point, student.Name, subject.NameSubject FROM result LEFT join student ON result.StudentId = student.StudentId LEFT JOIN subject on result.SubjectId=subject.SubjectId WHERE result.Point LIKE '%"+keywork+"%' or student.Name LIKE '%"+keywork+"%' or subject.NameSubject LIKE '%"+keywork+"%'";        
        DB.open(); 
        ResultSet rs = DB.q(sql);
        List<HashMap<String,String>> list = new ArrayList<>();
        while(rs.next())
        {
            HashMap<String,String> row = new HashMap<>();
            row.put("ResultId", rs.getString("ResultId")) ;
            row.put("Point",       rs.getString("Point")) ;
            row.put("StudentId",      rs.getString("student.Name")) ;
            row.put("SubjectId",   rs.getString("subject.NameSubject")) ;
                
            list.add(row);             
        }
        
        DB.close();
        return list;
    }

    public static List<HashMap<String, String>> List(String keywork,int Min,int Max) 
            throws SQLException, ClassNotFoundException
    {

    	String sql = "SELECT result.ResultId, result.Point, student.Name, subject.NameSubject,class.NameClass FROM result LEFT join student ON result.StudentId = student.StudentId LEFT join class on student.ClassId=class.ClassId  LEFT JOIN subject on result.SubjectId=subject.SubjectId WHERE result.Point LIKE '%"+keywork+"%'  and result.Point >= "+Min+" and result.Point <= "+Max+" or student.Name LIKE '%"+keywork+"%'  and result.Point >= "+Min+" and result.Point <= "+Max+" or subject.NameSubject LIKE '%"+keywork+"%' and result.Point >= "+Min+" and result.Point <= "+Max+" or class.NameClass LIKE '%"+keywork+"%' and result.Point >= "+Min+" and result.Point <= "+Max+"";  
        DB.open(); 
        ResultSet rs = DB.q(sql);
        List<HashMap<String,String>> list = new ArrayList<>();
        while(rs.next())
        {
            HashMap<String,String> row = new HashMap<>();
            row.put("ResultId", rs.getString("ResultId")) ;
            row.put("Point",       rs.getString("Point")) ;
            row.put("StudentId",      rs.getString("student.Name")) ;
            row.put("SubjectId",   rs.getString("subject.NameSubject")) ;
            row.put("NameClass",   rs.getString("class.NameClass")) ;
            row.put("Filter",   keywork) ;
                
            list.add(row);             
        }
        
        DB.close();
        return list;
    }

    public static HashMap<String,String> Details(String ResultId) 
            throws SQLException, ClassNotFoundException
    {
        String sql = 
        		"SELECT * FROM `result` WHERE `ResultId`='"+ResultId+"'"; 
        DB.open(); 
        ResultSet rs = DB.q(sql);    
        HashMap<String,String> row  = new HashMap<>();  
        while(rs.next())
        {
            row.put("ResultId", rs.getString("ResultId")) ;
            row.put("Point",       rs.getString("Point")) ;
            row.put("StudentId",   rs.getString("StudentId")) ;
            row.put("SubjectId",   rs.getString("SubjectId")) ;
                
            break;  
        }
        
        DB.close(); 
        return row;
    }
    

    public static void Add(HashMap<Integer,String> params) 
            throws SQLException, ClassNotFoundException
    {
        String sql = "INSERT INTO `result`( `Point`, `StudentId`, `SubjectId`) VALUES (?,?,?)";              

        DB.exec(sql, params);
    }
    

    public static void Edit(HashMap<Integer,String> params) 
            throws SQLException, ClassNotFoundException
    {
        String sql = "UPDATE `result` SET `Point`=?,`StudentId`=?,`SubjectId`=? WHERE `ResultId`=?";               
        DB.exec(sql, params);
    }
    
    public static void Delete(HashMap<Integer,String> params) 
            throws SQLException, ClassNotFoundException
    {
        String sql = " DELETE FROM `result` WHERE `ResultId` = ?";
        DB.exec(sql, params);
    }
}
