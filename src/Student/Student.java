package Student;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import Result.DB;

public class Student {
	
    public static List<HashMap<String, String>> Pagination(int pageSize,int page) 
            throws SQLException, ClassNotFoundException
    {
    	
        String sql = "SELECT COUNT(*) as total FROM `student`";        
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
    	
        String sql = "SELECT student.StudentId, class.NameClass,student.Name FROM student LEFT JOIN class ON student.ClassId = class.ClassId WHERE class.NameClass like '%"+keywork+"%' or student.Name like '%"+keywork+"%'";
        DB.open(); // Má»Ÿ káº¿t ná»‘i tá»›i CSDL
        ResultSet rs = DB.q(sql);

        // Dá»¯ liá»‡u tráº£ vá»�
        List<HashMap<String,String>> list = new ArrayList<>();
        
        // Ä�áº©y dá»¯ liá»‡u báº£ng MySQL sang Java List
        while(rs.next())
        {
            HashMap<String,String> row = new HashMap<>();
            row.put("StudentId", rs.getString("StudentId")) ;
            row.put("ClassId",       rs.getString("class.NameClass")) ;
            row.put("Name",   rs.getString("Name")) ;
            list.add(row);             
        }
        
        return list;
    }
	
    public static List<HashMap<String, String>> List(String keywork) 
            throws SQLException, ClassNotFoundException
    {
    	
        String sql = "SELECT student.StudentId, class.NameClass,student.Name FROM student LEFT JOIN class ON student.ClassId = class.ClassId WHERE class.NameClass like '%"+keywork+"%' or student.Name like '%"+keywork+"%'";
        DB.open(); // Má»Ÿ káº¿t ná»‘i tá»›i CSDL
        ResultSet rs = DB.q(sql);

        // Dá»¯ liá»‡u tráº£ vá»�
        List<HashMap<String,String>> list = new ArrayList<>();
        
        // Ä�áº©y dá»¯ liá»‡u báº£ng MySQL sang Java List
        while(rs.next())
        {
            HashMap<String,String> row = new HashMap<>();
            row.put("StudentId", rs.getString("StudentId")) ;
            row.put("ClassId",       rs.getString("class.NameClass")) ;
            row.put("Name",   rs.getString("Name")) ;
            row.put("Filter",  keywork) ;
            list.add(row);             
        }
        
        return list;
    }
    
    /**
     * Láº¥y ra chi tiáº¿t cá»§a 1 dÃ²ng báº£n ghi dá»¯ liá»‡u
     * @param id
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public static HashMap<String,String> Details(String StudentId) 
            throws SQLException, ClassNotFoundException
    {
        //String sql = "SELECT * FROM `student` ");
        String sql = 
                "SELECT * FROM `student` WHERE `StudentId`='"+StudentId+"'";
        
        DB.open(); // Má»Ÿ káº¿t ná»‘i tá»›i CSDL
        ResultSet rs = DB.q(sql);
            
        // Dá»¯ liá»‡u tráº£ vá»�
        HashMap<String,String> row  = new HashMap<>();
        
        // Ä�áº©y dá»¯ liá»‡u báº£ng MySQL sang Java List
        while(rs.next())
        {
            row.put("StudentId", rs.getString("StudentId")) ;
            row.put("ClassId",       rs.getString("ClassId")) ;
            row.put("Name",   rs.getString("Name")) ;
                
            break; // Láº¥y xong dá»¯ liá»‡u 1 dÃ²ng báº£n ghi rá»“i thÃ¬ thÃ´i        
        }
        
        DB.close(); // Ä�Ã³ng káº¿t ná»‘i sau khi dá»¯ liá»‡u ResultSet Ä‘Ã£ cháº¡y sang List
                    // Khi Ä‘Ã³ng DB thÃ¬ ResultSet cÅ©ng cháº¿t theo !!!
        
        return row;
    }
    
    /**
     * ThÃªm má»›i 1 dÃ²ng báº£n ghi
     * @param params
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public static void Add(HashMap<Integer,String> params) 
            throws SQLException, ClassNotFoundException
    {
        // CÃ¢u nÃ y paste trá»±c tiáº¿p vÃ o XAMPP PHP MySQL láº¡i ko viá»‡c gÃ¬ 
            //INSERT INTO ThuCung SET `Ten`='Doremon',`Tuoi`='3',`CanNang`='3.5',`NhomMau`='A',`GioiTinh`= '1'
            
        // the mysql insert statement
        // Ä�á»«ng cÃ³ Ä‘áº·t dáº¥u ? trong nhÃ¡y Ä‘Æ¡n, Java lÃ m há»™ mÃ¬nh rá»“i nhÃ© !
        String sql = "INSERT INTO `student`( `StudentId`,`ClassId`, `Name`) VALUES (?,?,?)";
                       
        // Thá»±c thi cÃ¢u SQL INSERT
        DB.exec(sql, params);
    }
    
    /**
     * Sá»­a 1 dÃ²ng báº£n ghi theo khoÃ¡ chÃ­nh: id
     * @param params
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public static void Edit(HashMap<Integer,String> params) 
            throws SQLException, ClassNotFoundException
    {
        // CÃ¢u nÃ y paste trá»±c tiáº¿p vÃ o XAMPP PHP MySQL láº¡i ko viá»‡c gÃ¬ 
            //INSERT INTO ThuCung SET `Ten`='Doremon',`Tuoi`='3',`CanNang`='3.5',`NhomMau`='A',`GioiTinh`= '1'
            
        // the mysql insert statement
        // Ä�á»«ng cÃ³ Ä‘áº·t dáº¥u ? trong nhÃ¡y Ä‘Æ¡n, Java lÃ m há»™ mÃ¬nh rá»“i nhÃ© !
        // Ä�á»«ng cÃ³ Ä‘áº·t dáº¥u ? trong nhÃ¡y Ä‘Æ¡n, Java lÃ m há»™ mÃ¬nh rá»“i nhÃ© !
        String sql = "UPDATE `student` SET `ClassId`=?,`Name`=? WHERE `StudentId`=?";
                       
        // Thá»±c thi cÃ¢u SQL UPDATE
        DB.exec(sql, params);
    }
    
    /**
     * XoÃ¡ 1 dÃ²ng báº£n ghi theo khoÃ¡ chÃ­nh id
     * @param params
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public static void Delete(HashMap<Integer,String> params) 
            throws SQLException, ClassNotFoundException
    {
        // CÃ¢u nÃ y paste trá»±c tiáº¿p vÃ o XAMPP PHP MySQL láº¡i ko viá»‡c gÃ¬ 
            //INSERT INTO ThuCung SET `Ten`='Doremon',`Tuoi`='3',`CanNang`='3.5',`NhomMau`='A',`GioiTinh`= '1'
            
        // the mysql insert statement
        // Ä�á»«ng cÃ³ Ä‘áº·t dáº¥u ? trong nhÃ¡y Ä‘Æ¡n, Java lÃ m há»™ mÃ¬nh rá»“i nhÃ© !
        // Ä�á»«ng cÃ³ Ä‘áº·t dáº¥u ? trong nhÃ¡y Ä‘Æ¡n, Java lÃ m há»™ mÃ¬nh rá»“i nhÃ© !
        // CÃ¢u nÃ y paste trá»±c tiáº¿p vÃ o XAMPP PHP MySQL láº¡i ko viá»‡c gÃ¬ 
            //INSERT INTO ThuCung SET `Ten`='Doremon',`Tuoi`='3',`CanNang`='3.5',`NhomMau`='A',`GioiTinh`= '1'
            

        String sql = " DELETE FROM `student` WHERE `StudentId` = ?";
                       
        // Thá»±c thi cÃ¢u SQL 
        DB.exec(sql, params);
    }
}
