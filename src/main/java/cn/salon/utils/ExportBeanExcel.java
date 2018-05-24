package cn.salon.utils;

import org.apache.poi.hssf.usermodel.*;

import java.io.File;
import java.io.FileOutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.*;

/**
 * 导出实体类到Excel文件中
 *
 * @author super
 * @create 2018-03-16 12:56
 */

public class ExportBeanExcel<T> {
    /**
     * @param fileName    save file name
     * @param title       sheet name
     * @param headersName field title
     * @param headersId   field name
     * @param dtoList     result List
     */
    public String exportExcel(String fileName, String title, List<String> headersName, List<String> headersId, List<T> dtoList) {
        //表头 标题栏
        Map<Integer, String> headersNameHashMap = new HashMap<>();

        for (int i = 0; i < headersName.size(); i++) {
            if (!headersName.get(i).equals(null)) {
                headersNameHashMap.put(i, headersName.get(i));
            }
        }

        //字段
        Map<Integer, String> fieldHashMap = new HashMap<>();
        for (int i = 0; i < headersId.size(); i++) {
            if (!headersName.get(i).equals(null)) {
                fieldHashMap.put(i, headersId.get(i));
            }
        }

        //声明一个工作簿，（构建工作簿，表格，样式)
        HSSFWorkbook wb = new HSSFWorkbook();
        HSSFSheet sheet = (title == null ? wb.createSheet() : wb.createSheet(title));
        sheet.setDefaultColumnWidth(20);
        //生成样式
        HSSFCellStyle style = wb.createCellStyle();
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER);//水平居中
        style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);//上下居中
        HSSFFont font = wb.createFont();
        font.setFontName("宋体");
        font.setFontHeightInPoints((short) 14);
        style.setFont(font);
        HSSFRow row = sheet.createRow(0);
        Collection<String> collection = headersNameHashMap.values();//表格所有标题的值的集合
        HSSFCell cell;
        int size = 0;
        //表格标题迭代器
        //根据选择的字段生成表头
        for (Iterator<String> iterator = collection.iterator(); iterator.hasNext(); ) {
            cell = row.createCell(size);
            cell.setCellValue(iterator.next().toString());
            cell.setCellStyle(style);
            size++;
        }

        //正文字段
        Collection<String> fieldCollection = fieldHashMap.values();
        Iterator<T> iterator = dtoList.iterator();//总记录 数的迭代器
        int rowNo = 0; //行坐标
        while (iterator.hasNext()) { //迭代总记录数
            int fieldCell = 0;
            rowNo++;
            row = sheet.createRow(rowNo);
            T javaBean = iterator.next();
            //利用反射 根据javaBean属性的先后顺序，动态调用get方法，以获取属性值
            Field[] fields = javaBean.getClass().getDeclaredFields();
            for (int i = 0; i < fields.length; i++) {
                Field field = fields[i];
                String fieldName = field.getName();
                for (Iterator<String> fieldIterator = fieldCollection.iterator(); fieldIterator.hasNext(); ) {
                    if (fieldIterator.next().equals(fieldName)) {
                        String methodName = "get" + fieldName.substring(0, 1).toUpperCase() + fieldName.substring(1);
                        Class bean = javaBean.getClass();     //得到JavaBean的对象
                        try {
                            Method method = bean.getDeclaredMethod(methodName, new Class[]{});
                            Object val = method.invoke(javaBean, new Object[]{});
                            String value = null;
                            if (val != null) {
                                value = String.valueOf(val);
                            }

                            row.setRowStyle(style);
                            row.createCell(fieldCell).setCellValue(value);
                            fieldCell++;

                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }

                }
            }
        }


        try {
            fileName = new String(fileName.getBytes("iso-8859-1"),"utf-8");


            fileName += ".xls";
            File file = new File(fileName);

            if(!file.exists()){
                file.createNewFile();
            }

            FileOutputStream fileOutputStream = new FileOutputStream(fileName);

            wb.write(fileOutputStream);
            fileOutputStream.flush();
            fileOutputStream.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return fileName;

    }

    private void makeDir(File file){
        if(!file.getParentFile().exists()){
            file.mkdirs();
        }
    }


}
