package util;

import java.io.InputStream;
import java.lang.reflect.Field;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.multipart.MultipartFile;

import entity.User;

public class POIUtil {
	//批量导出
	public static void exportAll (List<User> list ,HttpServletResponse response) throws Exception{
		HSSFWorkbook workbook = new HSSFWorkbook();
		HSSFSheet sheet = workbook.createSheet("first-sheet");
		HSSFRow row1 = sheet.createRow(0);
		Field[] fields = User.class.getDeclaredFields();
		for (int i = 0; i < fields.length; i++) {
			if(i==1){
				continue;
			}
			HSSFCell createCell = row1.createCell(i);
			String name = fields[i].getName();
			createCell.setCellValue(name);
		}
		for (int i = 0; i < list.size(); i++) {
			HSSFRow row2 = sheet.createRow(i+1);
			for (int j = 0; j < fields.length; j++) {
				HSSFCell cell = row2.createCell(j);
				fields[j].setAccessible(true);
				Object val = fields[j].get(list.get(i));
/*				System.out.println(val.toString());*/
				if(val!=null){
					if(val instanceof Date){
						Date birth = (Date) val;
						String format = new SimpleDateFormat("yyyy-MM-dd").format(birth);
						cell.setCellValue(format);
					}else{
						cell.setCellValue(val.toString());
					}
				}
			}
		}
		response.setHeader("Content-Disposition", "attachment;filename="
				  +"user-info.xls");
				   //+ "用户信息表.xls");
		ServletOutputStream outputStream = response.getOutputStream();
		workbook.write(outputStream);
		outputStream.close();
	}

	//导出模板
	public static void exportTitle(HttpServletResponse response) throws Exception{
		HSSFWorkbook workbook = new HSSFWorkbook();
		HSSFSheet sheet = workbook.createSheet("first-sheet");
		HSSFRow row1 = sheet.createRow(0);
		Field[] fields = User.class.getDeclaredFields();
		for (int i = 1; i < fields.length; i++) {
			HSSFCell createCell = row1.createCell(i-1);
			String name = fields[i-1].getName();
			createCell.setCellValue(name);
		}
		response.setHeader("Content-Disposition", "attachment;filename="
				 + "user-module.xls");
		ServletOutputStream outputStream = response.getOutputStream();
		workbook.write(outputStream);
		outputStream.close();
	}

	//批量导入数据
	public static  List<User> importUsers(MultipartFile upload) throws Exception{
		InputStream inputStream =  upload.getInputStream();
		Workbook workbook = new HSSFWorkbook(inputStream);
		Sheet sheet = workbook.getSheet("first-sheet");
		int rowNum = sheet.getLastRowNum();
		List<User> list = new ArrayList<User>();
		Row row = null;
		//跳过标题行
		for (int i = 1; i <= rowNum; i++) {
			User user = new User();
			//获得第2行数据
			row = sheet.getRow(i);
			//获得单元格数据
			//id
//			Cell cell = row.getCell(0);
//			String stringCellValue = cell.getStringCellValue();
//			user.setUid(null);
			//用户名
			Cell cell1 = row.getCell(0);
			cell1.setCellType(Cell.CELL_TYPE_STRING);
			String stringCellValue1 = cell1.getStringCellValue();
			user.setUser_name(stringCellValue1);
			//密码
			Cell cell2 = row.getCell(1);
			cell2.setCellType(Cell.CELL_TYPE_STRING);
			String stringCellValue2 = cell2.getStringCellValue();
			user.setUser_pwd(stringCellValue2);
			//qq
			Cell cell3 = row.getCell(2);
			cell3.setCellType(Cell.CELL_TYPE_STRING);
			String stringCellValue3 = cell3.getStringCellValue();
			user.setQq(stringCellValue3);			
			//省份
			Cell cell4 = row.getCell(3);
			cell4.setCellType(Cell.CELL_TYPE_STRING);
			String stringCellValue4 = cell4.getStringCellValue();
			user.setProvince(stringCellValue4);
			//城市
			Cell cell5 = row.getCell(4);
			cell5.setCellType(Cell.CELL_TYPE_STRING);
			String stringCellValue5 = cell5.getStringCellValue();
			user.setCity(stringCellValue5);
			//性别
			Cell cell6 = row.getCell(5);
			cell6.setCellType(Cell.CELL_TYPE_STRING);
			String stringCellValue6 = cell6.getStringCellValue();
			user.setSex(stringCellValue6);
			//注册时间
			Cell cell7 = row.getCell(6);
			//Date dateCellValue7 = cell7.getDateCellValue();
			user.setRegister_time(new Date());
			//最后登录时间
			//Cell cell8 = row.getCell(7);
			//Date dateCellValue8 = cell8.getDateCellValue();
			user.setLast_time(new Date());
			list.add(user);
		}
		return list;
	}
}
