package ClassR;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.google.gson.Gson;

public class ClassR 
{
    public static List<String> ChartJs() throws SQLException, ClassNotFoundException
    {
        String sql = "SELECT * FROM `class` ";
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

    public static List<HashMap<String, String>> List(String keywork) 
            throws SQLException, ClassNotFoundException
    {
        String sql = "SELECT * FROM `class` where NameClass like '%"+keywork+"%'";
        DB.open(); 
        ResultSet rs = DB.q(sql);
        List<HashMap<String,String>> list = new ArrayList<>();
        while(rs.next())
        {
            HashMap<String,String> row = new HashMap<>();
            row.put("ClassId", rs.getString("ClassId")) ;
            row.put("NameClass",       rs.getString("NameClass")) ;
            row.put("ClassHere",       keywork);
            list.add(row);             
        }
        
        DB.close();
        return list;
    }

    public static HashMap<String,String> Details(String CLassId) 
            throws SQLException, ClassNotFoundException
    {
        String sql = 
        		"SELECT * FROM `class` WHERE `ClassId`='"+CLassId+"'"; 
        DB.open(); 
        ResultSet rs = DB.q(sql);    
        HashMap<String,String> row  = new HashMap<>();  
        while(rs.next())
        {
            row.put("ClassId", rs.getString("ClassId")) ;
            row.put("NameClass",       rs.getString("NameClass")) ;
                
            break;  
        }
        
        DB.close(); 
        return row;
    }
    

    public static void Add(HashMap<Integer,String> params) 
            throws SQLException, ClassNotFoundException
    {
        String sql = "INSERT INTO `Class`( `ClassId`, `NameClass`) VALUES (?,?)";              

        DB.exec(sql, params);
    }
    

    public static void Edit(HashMap<Integer,String> params) 
            throws SQLException, ClassNotFoundException
    {
        String sql = "UPDATE `class` SET `NameClass`=? WHERE `ClassId`=?";               
        DB.exec(sql, params);
    }
    
    public static void Delete(HashMap<Integer,String> params) 
            throws SQLException, ClassNotFoundException
    {
        String sql = " DELETE FROM `class` WHERE `ClassId` = ?";
        DB.exec(sql, params);
    }
}
