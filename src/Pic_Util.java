

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.*;
import java.sql.*;


public class Pic_Util {


	public static void main (String[] args) throws IOException{
					
	
			for(Integer i = 1; i<=10 ;i++){  //編號1~11
				
				String no = "P10000000" + String.format("%02d", i);  // P10000000 S10000000 A10000000
				String table = "PROD"; //  STORE PROD ACT  table名稱
				String index="1"; //  1 2 3 第幾張照片
				String path ="D:\\apache-tomcat-7.0.75\\webapps\\BeanLife_front\\res\\img\\p"+((i) % 3)+".jpg" ; //p0.jpg p1.jpg p2.jpg 三張圖片循環塞入 自己的圖片位置
				updateImg(no,table,index,getPictureByteArray(path));
				System.out.println("修改"+table+" "+no+"照片"+index);
			}
			
		}

	public static void updateImg(String no, String table ,String index,byte[] pic) {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		String userid = "ba103g4";
		String passwd = "123456";
		String MEM = "update mem set mem_pic =? where mem_ac like '%%'";

		Connection con = null;
		PreparedStatement pstmt = null;	
		
		try {		
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			
			pstmt = con.prepareStatement("UPDATE "+table+" SET "+table+"_PIC"+index+"=? WHERE "+table+"_NO =?");
			
			pstmt.setBytes(1, pic);
			pstmt.setString(2, no);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			throw new RuntimeException("A database error occured. "
					+ e.getMessage());
			
		}
		 catch (ClassNotFoundException e) {
				e.printStackTrace();
		}finally{
			if (pstmt != null) {
				try{
					pstmt.close();
				} catch (SQLException se){
					se.printStackTrace(System.err);
				}
			}
			if(con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}	
	}

	
	public static byte[] getPictureByteArray(String path) throws IOException {
		File file = new File(path);
		FileInputStream fis = new FileInputStream(file);
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		byte[] buffer = new byte[8192];
		int i;
		while ((i = fis.read(buffer)) != -1) {
			baos.write(buffer, 0, i);
		}
		baos.close();
		fis.close();

		return baos.toByteArray();
	}
}
