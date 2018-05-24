package cn.salon.utils;

import java.io.File;
import java.io.FileInputStream;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class ImportExcelToSqlUtil {
	/**
	 * 导入excel表格后，将表格中的数据插入到sql中
	 * 
	 * @param request
	 * @param response
	 * @param index
	 *            为当前文件所要开始读取的行号下标 注：该数字以零起始位置
	 * @param path
	 *            POI所要读取文件的路径 如（path =
	 *            request.getSession().getServletContext().getRealPath("/")+"/WEB-INF/upload/excel";）
	 * @param fileName
	 *            POI所要读取的文件名 如（fileName = "excel.xlsx";）
	 * @param sign
	 *            将excel表格行与行之间的数据分割开的标记
	 * @return 将表格中所要读取的数据全部封装到一个List集合中并返回该List集合
	 */
	public Map insertPOJOFromExcel07(HttpServletRequest request, HttpServletResponse response, int index, String path,
			String fileName, String sign) {
		List list = null;
		Map<String, List> map = new HashMap<>();
		try {

			FileInputStream is = new FileInputStream(new File(path + "/" + fileName));
			// 打开工作簿
			// HSSFWorkbook wb = new HSSFWorkbook(is); //支持excel 2003版本
			// HSSFSheet sheet = wb.getSheetAt(0); //支持excel 2003版本 获取第一个工作簿
			XSSFWorkbook wb = new XSSFWorkbook(is); // 支持excel 2007版本
			XSSFSheet sheet = wb.getSheetAt(0); // 支持excel 2007版本

			int colCount = 0; // 得到该sheet的列数
			int rowCount = 0; // 得到该sheet共有多少行
			list = new ArrayList();

			rowCount = sheet.getPhysicalNumberOfRows();

			colCount = sheet.getRow(1).getPhysicalNumberOfCells();
			
			
			
			// 去掉大标题行 与 字段列名所在行
			for (int i = index; i < rowCount; i++) {
				// HSSFRow row = sheet.getRow(i); //支持excel 2003版本
				XSSFRow row = sheet.getRow(i); // 支持excel 2007版本
				for (int j = 0; j < colCount; j++) {
					
					
					if(row.getCell(j)==null && row.getCell(j+1) == null)
						break;
					
					//判断是否被科学计算
					if(row.getCell(j).toString().contains(".") && row.getCell(j).toString().contains("E")) {
						
						DecimalFormat df = new DecimalFormat("0"); 
						String num  = df.format(row.getCell(j).getNumericCellValue());
						list.add(num);
					}else {
						//判断是否为日期类型
						String str = buildDate(row.getCell(j));
						list.add(str);
					}
					
				}
				if(list == null || list.size()<=0)
					break;
				map.put(sign + (i-index), list);
				
				list = new ArrayList();
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return map;
	}

	public Map insertPOJOFromExcel03(HttpServletRequest request, HttpServletResponse response, int index, String path,
			String fileName, String sign) {
		List list = null;
		Map<String, List> map = new HashMap<>();
		try {

			FileInputStream is = new FileInputStream(new File(path + "/" + fileName));
			// 打开工作簿
			HSSFWorkbook wb = new HSSFWorkbook(is); // 支持excel 2003版本
			HSSFSheet sheet = wb.getSheetAt(0); // 支持excel 2003版本 获取第一个工作簿
			// XSSFWorkbook wb = new XSSFWorkbook(is); //支持excel 2007版本
			// XSSFSheet sheet = wb.getSheetAt(0); //支持excel 2007版本

			int colCount = 0; // 得到该sheet的列数
			int rowCount = 0; // 得到该sheet共有多少行
			list = new ArrayList();

			rowCount = sheet.getPhysicalNumberOfRows();

			colCount = sheet.getRow(1).getPhysicalNumberOfCells();
			// 去掉大标题行 与 字段列名所在行
			for (int i = index; i < rowCount; i++) {
				HSSFRow row = sheet.getRow(i); // 支持excel 2003版本
				// XSSFRow row = sheet.getRow(i); //支持excel 2007版本
				for (int j = 0; j < colCount; j++) {
					if(row.getCell(j)==null && row.getCell(j+1) == null)
						break;
					
					//判断是否被科学计算
					if(row.getCell(j).toString().contains(".") && row.getCell(j).toString().contains("E")) {
						
						DecimalFormat df = new DecimalFormat("0"); 
						String num  = df.format(row.getCell(j).getNumericCellValue());
						list.add(num);
					}else {
						//判断是否为日期类型
						String str = buildDate(row.getCell(j));
						list.add(str);
					}
					
				}
				if(list == null || list.size()<=0)
					break;
				map.put(sign + (i-index), list);
				
				list = new ArrayList();
				}
			

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return map;
	}
	
	
	
	
	public static String buildDate(XSSFCell cell) {
        String result = new String();
        switch (cell.getCellType()) {
        case XSSFCell.CELL_TYPE_NUMERIC:
            if (DateUtil.isCellDateFormatted(cell)) {
                // 处理自定义日期格式：m月d日(通过判断单元格的格式id解决，id的值是58)
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                Date date = cell.getDateCellValue();
                //double value = cell.getNumericCellValue();
                //Date date = org.apache.poi.ss.usermodel.DateUtil.getJavaDate(value);
                result = sdf.format(date);
            } else {
                double value = cell.getNumericCellValue();
                CellStyle style = cell.getCellStyle();
                DecimalFormat format = new DecimalFormat();
                String temp = style.getDataFormatString();
                // 单元格设置成常规
                if (temp.equals("General")) {
                    format.applyPattern("#");
                }
                result = format.format(value);
            }
            break;
        case XSSFCell.CELL_TYPE_STRING:// String类型
            result = cell.getStringCellValue();
            break;
        default:
            result = "";
            break;
        }
        return result;
    }
	public static String buildDate(HSSFCell cell) {
		String result = new String();
		switch (cell.getCellType()) {
		case HSSFCell.CELL_TYPE_NUMERIC:
			if (HSSFDateUtil.isCellDateFormatted(cell)) {
				// 处理自定义日期格式：m月d日(通过判断单元格的格式id解决，id的值是58)
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//				double value = cell.getNumericCellValue();
				Date date = cell.getDateCellValue();
				//Date date = org.apache.poi.ss.usermodel.DateUtil.getJavaDate(value);
				result = sdf.format(date);
			} else {
				double value = cell.getNumericCellValue();
				CellStyle style = cell.getCellStyle();
				DecimalFormat format = new DecimalFormat();
				String temp = style.getDataFormatString();
				// 单元格设置成常规
				if (temp.equals("General")) {
					format.applyPattern("#");
				}
				result = format.format(value);
			}
			break;
		case HSSFCell.CELL_TYPE_STRING:// String类型
			result = cell.getStringCellValue();
			break;
		default:
			result = "";
			break;
		}
		return result;
	}


}
