/*
 *  1. �U�νƦX�d��-�i�ѫȤ���H�N�W�����Q�d�ߪ����
 *  2. ���F�קK�v�T�į�:
 *        �ҥH�ʺA���͸U��SQL������,���d�ҵL�N�ĥ�MetaData���覡,�]�u�w��ӧO��Table�ۦ���ݭn�ӭӧO�s�@��
 * */


package jdbc.util.CompositeQuery;

import java.util.*;

public class jdbcUtil_CompositeQuery_Emp2 {

	public static String get_aCondition_For_Oracle(String columnName, String value) {

		String aCondition = null;
		
		if ("bean_contry".equals(columnName) || "proc".equals(columnName) || "roast".equals(columnName) || "prod_no".equals(columnName) || "store_no".equals(columnName)) // �Ω��L
			aCondition = columnName + "=" + " '" + value + "' ";
		else if ("prod_name".equals(columnName) || "bean_type".equals(columnName)|| "bean_grade".equals(columnName)|| "bean_region".equals(columnName)
				|| "bean_farm".equals(columnName)|| "bean_farmer".equals(columnName)|| "prod_cont".equals(columnName)|| "prod_stat".equals(columnName)|| "bean_aroma".equals(columnName)) // �Ω�varchar
			aCondition = columnName + " like '%" + value + "%'";
		else if ("".equals(columnName))                          // �Ω�Oracle��date
			aCondition = "to_char(" + columnName + ",'yyyy-mm-dd')='" + value + "'";

		return aCondition + " ";
	}

	public static String get_WhereCondition(Map<String, String[]> map) {
		Set<String> keys = map.keySet();
		StringBuffer whereCondition = new StringBuffer();
		int count = 0;
		for (String key : keys) {
			String value = map.get(key)[0];
			if (value != null && value.trim().length() != 0	&& !"action".equals(key)) {
				count++;
				String aCondition = get_aCondition_For_Oracle(key, value.trim());

				if (count == 1)
					whereCondition.append(" where " + aCondition);
				else
					whereCondition.append(" and " + aCondition);

				System.out.println("���e�X�d�߸�ƪ�����count = " + count);
			}
		}
		
		return whereCondition.toString();
	}
	
	public static String get_ElseCondition(Map<String, String[]> map){
		Set<String> keys = map.keySet();
		StringBuffer whereCondition = new StringBuffer();
		int count = 0;
		for (String key : keys) {
			String value = map.get(key)[0];
			if (value != null && value.trim().length() != 0	&& !"action".equals(key)) {
				count++;
				String aCondition = get_aCondition_For_Oracle(key, value.trim());
				
				if (count == 1)
					whereCondition.append(aCondition);
				else
				whereCondition.append( " or " + aCondition);

			}
		}
		return whereCondition.toString();
	}

	public static void main(String argv[]) {

		// �t�X req.getParameterMap()��k �^�� java.util.Map<java.lang.String,java.lang.String[]> ������
		Map<String, String[]> map = new TreeMap<String, String[]>();
		map.put("bean_contry", new String[] { "" });
		map.put("proc", new String[] { "����" });
		map.put("roast", new String[] { "�L�H" });

		map.put("action", new String[] { "searchProds" }); // �`�NMap�̭��|�t��action��key
		
		String ser = "%%";
		Map<String, String[]> map2 = new TreeMap<String, String[]>();
		map2.put("prod_no", new String[] {ser });
		map2.put("store_no", new String[] {ser });
		map2.put("prod_name", new String[] {ser });
		map2.put("bean_type", new String[] {ser });
		map2.put("bean_grade", new String[] {ser });
		map2.put("bean_region", new String[] {ser });
		map2.put("bean_farm", new String[] {ser });
		map2.put("bean_farmer", new String[] {ser });
		map2.put("bean_aroma", new String[] {ser });
		map2.put("prod_stat", new String[] {ser });
		

		String finalSQL = "select * from prod "
				          + jdbcUtil_CompositeQuery_Emp2.get_WhereCondition(map)
				          + "and ("
				          + jdbcUtil_CompositeQuery_Emp2.get_ElseCondition(map2)
				          + ")"
				          + "order by prod_no desc";
		System.out.println(finalSQL);

	}
}
