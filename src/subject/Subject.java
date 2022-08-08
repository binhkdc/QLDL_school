package subject;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class Subject 
{
    public static List<HashMap<String, String>> List(String keywork) 
            throws SQLException, ClassNotFoundException
    {
    	
        String sql = 
            "SELECT * FROM `subject` where NameSubject like '%"+keywork+"%'";
        
        DB.open(); 
        ResultSet rs = DB.q(sql);
            
       
        List<HashMap<String,String>> list = new ArrayList<>();
        
        while(rs.next())
        {
            HashMap<String,String> row = new HashMap<>();
            row.put("SubjectId", rs.getString("SubjectId")) ;
            row.put("NameSubject",       rs.getString("NameSubject")) ;
                            
            list.add(row);             
        }
        
        DB.close(); 
        return list;
    }
    
    /**
     * Lấy ra chi tiết của 1 dòng bản ghi dữ liệu
     * @param id
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public static HashMap<String,String> Details(String subjectid) 
            throws SQLException, ClassNotFoundException
    {
        //String sql = "SELECT * FROM `ThuCung` ");
        String sql = "SELECT * FROM `Subject` WHERE `SubjectId`='"+subjectid+"'";
        
        DB.open(); // Mở kết nối tới CSDL
        ResultSet rs = DB.q(sql);
            
        // Dữ liệu trả v�?
        HashMap<String,String> row  = new HashMap<>();
        
        // �?ẩy dữ liệu bảng MySQL sang Java List
        while(rs.next())
        {
            row.put("SubjectId", rs.getString("SubjectId")) ;
            row.put("NameSubject", rs.getString("NameSubject")) ;
            
                
            break; // Lấy xong dữ liệu 1 dòng bản ghi rồi thì thôi        
        }
        
        DB.close(); // �?óng kết nối sau khi dữ liệu ResultSet đã chạy sang List
                    // Khi đóng DB thì ResultSet cũng chết theo !!!
        
        return row;
    }
    
    /**
     * Thêm mới 1 dòng bản ghi
     * @param params
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public static void Add(HashMap<Integer,String> params) 
            throws SQLException, ClassNotFoundException
    {
        // Câu này paste trực tiếp vào XAMPP PHP MySQL lại ko việc gì 
            //INSERT INTO ThuCung SET `Ten`='Doremon',`Tuoi`='3',`CanNang`='3.5',`NhomMau`='A',`GioiTinh`= '1'
            
        // the mysql insert statement
        // �?ừng có đặt dấu ? trong nháy đơn, Java làm hộ mình rồi nhé !
        String sql = "INSERT INTO `subject`(`SubjectId`, `NameSubject`) VALUES (?,?)";
                       
        // Thực thi câu SQL INSERT
        DB.exec(sql, params);
    }
    
    /**
     * Sửa 1 dòng bản ghi theo khoá chính: id
     * @param params
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public static void Edit(HashMap<Integer,String> params) 
            throws SQLException, ClassNotFoundException
    {
        
        String sql = " UPDATE `subject` SET `NameSubject`=? WHERE `SubjectId`=? ";
                       
       
        DB.exec(sql, params);
    }
    
    /**
     * Xoá 1 dòng bản ghi theo khoá chính id
     * @param params
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    public static void Delete(HashMap<Integer,String> params) 
            throws SQLException, ClassNotFoundException
    {  

        String sql = "DELETE FROM `subject` WHERE `SubjectId`=?";
                       
        // Thực thi câu SQL 
        DB.exec(sql, params);
    }
}// end class
