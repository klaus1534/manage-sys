package com.huanxink.msys.managesys.utils.exl;

import lombok.extern.slf4j.Slf4j;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.hssf.util.CellRangeAddress;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.xssf.usermodel.*;

import java.io.IOException;
import java.io.OutputStream;


@Slf4j
public class ExportExcelUtil {
    public static void exportExc(ExportExcel exportExcel, OutputStream out) {
        try {
            // 创建工作簿对象
            HSSFWorkbook workbook = new HSSFWorkbook();
            // 创建工作表
            HSSFSheet sheet = workbook.createSheet(exportExcel.getTitle());

            // 产生表格标题行
            HSSFRow rowm = sheet.createRow(0);
            HSSFCell cellTiltle = rowm.createCell(0);

             //获取列头样式对象
            HSSFCellStyle columnTopStyle = getColumnTopStyle(workbook);
            //单元格样式对象
            HSSFCellStyle style = getStyle(workbook);

            sheet.addMergedRegion(new CellRangeAddress(0, 1, 0, (exportExcel.getRowName().length - 1)));
            cellTiltle.setCellStyle(columnTopStyle);
            cellTiltle.setCellValue(exportExcel.getTitle());

            // 定义所需列数
            int columnNum = exportExcel.getRowName().length;
            // 在索引2的位置创建行(最顶端的行开始的第二行)
            HSSFRow rowRowName = sheet.createRow(2);

            // 将列头设置到sheet的单元格中
            for (int n = 0; n < columnNum; n++) {
                //创建列头对应个数的单元格
                HSSFCell cellRowName = rowRowName.createCell(n);
                //设置列头单元格的数据类型
                cellRowName.setCellType(HSSFCell.CELL_TYPE_STRING);
                HSSFRichTextString text = new HSSFRichTextString(exportExcel.getRowName()[n]);
                //设置列头单元格的值
                cellRowName.setCellValue(text);
                //设置列头单元格样式
                cellRowName.setCellStyle(columnTopStyle);
            }

            //将查询出的数据设置到sheet对应的单元格中
            for (int i = 0; i < exportExcel.getDataList().size(); i++) {
                //遍历每个对象
                Object[] obj = (Object[]) exportExcel.getDataList().get(i);
                //创建所需的行数
                HSSFRow row = sheet.createRow(i + 3);

                for (int j = 0; j < obj.length; j++) {
                    //设置单元格的数据类型
                    HSSFCell cell = null;
                    if (j == 0) {
                        cell = row.createCell(j, HSSFCell.CELL_TYPE_STRING);
                        cell.setCellValue(obj[0].toString());
                    } else {
                        cell = row.createCell(j, HSSFCell.CELL_TYPE_STRING);
                        if (!"".equals(obj[j]) && obj[j] != null) {
                            //设置单元格的值
                            cell.setCellValue(obj[j].toString());
                        } else {
                            //如果是CELL_TYPE_STRING,且没有赋值，获取getStringCellValue()会空指针异常！
                            cell.setCellType(HSSFCell.CELL_TYPE_BLANK);
                        }
                    }
                    //设置单元格样式
                    cell.setCellStyle(style);
                }
            }
            //让列宽随着导出的列长自动适应
            for (int colNum = 0; colNum < columnNum; colNum++) {
                int columnWidth = sheet.getColumnWidth(colNum) / 256;
                for (int rowNum = 0; rowNum < sheet.getLastRowNum(); rowNum++) {
                    HSSFRow currentRow;
                    //当前行未被使用过
                    if (sheet.getRow(rowNum) == null) {
                        currentRow = sheet.createRow(rowNum);
                    } else {
                        currentRow = sheet.getRow(rowNum);
                    }
                    if (currentRow.getCell(colNum) != null) {
                        HSSFCell currentCell = currentRow.getCell(colNum);
                        if (currentCell.getCellType() == HSSFCell.CELL_TYPE_STRING) {
                            int length = currentCell.getStringCellValue().getBytes().length;
                            if (columnWidth < length) {
                                columnWidth = length;
                            }
                        }
                    }
                }
                if (colNum == 0) {
                    sheet.setColumnWidth(colNum, (columnWidth - 2) * 256);
                } else {
                    sheet.setColumnWidth(colNum, (columnWidth + 4) * 256);
                }
            }

            if (workbook != null) {
                try {
                    workbook.write(out);
                } catch (IOException e) {
                    log.error("Excel写出到响应刘异常:", e);
                }
            }
        } catch (Exception e) {
            log.error("excel导出异常:", e);
        }
    }


    public static HSSFCellStyle getColumnTopStyle(HSSFWorkbook workbook) {

        // 设置字体  
        HSSFFont font = workbook.createFont();
        //设置字体大小  
        font.setFontHeightInPoints((short) 11);
        //字体加粗  
        font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        //设置字体名字   
        font.setFontName("Courier New");
        //设置样式;   
        HSSFCellStyle style = workbook.createCellStyle();
        //设置底边框;   
        style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        //设置底边框颜色;    
        style.setBottomBorderColor(HSSFColor.BLACK.index);
        //设置左边框;     
        style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        //设置左边框颜色;   
        style.setLeftBorderColor(HSSFColor.BLACK.index);
        //设置右边框;   
        style.setBorderRight(HSSFCellStyle.BORDER_THIN);
        //设置右边框颜色;   
        style.setRightBorderColor(HSSFColor.BLACK.index);
        //设置顶边框;   
        style.setBorderTop(HSSFCellStyle.BORDER_THIN);
        //设置顶边框颜色;    
        style.setTopBorderColor(HSSFColor.BLACK.index);
        //在样式用应用设置的字体;    
        style.setFont(font);
        //设置自动换行;   
        style.setWrapText(false);
        //设置水平对齐的样式为居中对齐;    
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        //设置垂直对齐的样式为居中对齐;   
        style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);

        return style;

    }

    /**
     * 列数据信息单元格样式
     * @param workbook
     * @return
     */
    public static HSSFCellStyle getStyle(HSSFWorkbook workbook) {
        // 设置字体
        HSSFFont font = workbook.createFont();
        //设置字体大小
        //font.setFontHeightInPoints((short)10);
        //字体加粗
        //font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        //设置字体名字
        font.setFontName("Courier New");
        //设置样式;
        HSSFCellStyle style = workbook.createCellStyle();
        //设置底边框;
        style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        //设置底边框颜色;
        style.setBottomBorderColor(HSSFColor.BLACK.index);
        //设置左边框;
        style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        //设置左边框颜色;
        style.setLeftBorderColor(HSSFColor.BLACK.index);
        //设置右边框;
        style.setBorderRight(HSSFCellStyle.BORDER_THIN);
        //设置右边框颜色;
        style.setRightBorderColor(HSSFColor.BLACK.index);
        //设置顶边框;
        style.setBorderTop(HSSFCellStyle.BORDER_THIN);
        //设置顶边框颜色;
        style.setTopBorderColor(HSSFColor.BLACK.index);
        //在样式用应用设置的字体;
        style.setFont(font);
        //设置自动换行;
        style.setWrapText(false);
        //设置水平对齐的样式为居中对齐;
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        //设置垂直对齐的样式为居中对齐;
        style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);

        return style;

    }
	public static void exportExcNoTitle(ExportExcel exportExcel, OutputStream out) {
		try{
            // 创建工作簿对象
			XSSFWorkbook workbook = new XSSFWorkbook();
            // 创建工作表
			XSSFSheet sheet = workbook.createSheet();
			// 定义所需列数
			int columnNum = exportExcel.getRowName().length;
            // 在索引2的位置创建行(最顶端的行开始的第二行)
			XSSFRow rowRowName = sheet.createRow(0);
			// 将列头设置到sheet的单元格中
			for(int n=0;n<columnNum;n++){
                //创建列头对应个数的单元格
				XSSFCell cellRowName = rowRowName.createCell(n);
                //设置列头单元格的数据类型
				cellRowName.setCellType(XSSFCell.CELL_TYPE_STRING);
				XSSFRichTextString text = new XSSFRichTextString(exportExcel.getRowName()[n]);
                //设置列头单元格的值
				cellRowName.setCellValue(text);
			}
			//将查询出的数据设置到sheet对应的单元格中
			for(int i=0;i<exportExcel.getDataList().size();i++){
                //遍历每个对象
				Object[] obj = (Object[]) exportExcel.getDataList().get(i);
                //创建所需的行数
				XSSFRow row;
				row = sheet.createRow(i+1);
				for(int j=0; j<obj.length; j++){
                    //设置单元格的数据类型
					XSSFCell cell = null;
					if(j == 0){
						cell = row.createCell(j,XSSFCell.CELL_TYPE_STRING);
						cell.setCellValue(obj[0].toString());
					}else{
						cell = row.createCell(j,XSSFCell.CELL_TYPE_STRING);
						if(!"".equals(obj[j]) && obj[j] != null){
                            //设置单元格的值
							cell.setCellValue(obj[j].toString());
						}else{
							//如果是CELL_TYPE_STRING,且没有赋值，获取getStringCellValue()会空指针异常！
							cell.setCellType(XSSFCell.CELL_TYPE_BLANK);
						}
					}
				}
			}
			//让列宽随着导出的列长自动适应
			for (int colNum = 0; colNum < columnNum; colNum++) {
				int columnWidth = sheet.getColumnWidth(colNum) / 256;
				for (int rowNum = 0; rowNum < sheet.getLastRowNum(); rowNum++) {
					XSSFRow currentRow;
					//当前行未被使用过
					if (sheet.getRow(rowNum) == null) {
						currentRow = sheet.createRow(rowNum);
					} else {
						currentRow = sheet.getRow(rowNum);
					}
					if (currentRow.getCell(colNum) != null) {
						XSSFCell currentCell = currentRow.getCell(colNum);
						if (currentCell.getCellType() == XSSFCell.CELL_TYPE_STRING) {
							int length = currentCell.getStringCellValue().getBytes().length;
							if (columnWidth < length) {
								columnWidth = length;
							}
						}
					}
				}
				if(colNum == 0){
					sheet.setColumnWidth(colNum, (columnWidth-2) * 256);
				}else{
					sheet.setColumnWidth(colNum, (columnWidth+4) * 256);
				}
			}
			if(workbook !=null){
				try
				{
					workbook.write(out);
				}
				catch (IOException e)
				{
					e.printStackTrace();
				}
			}

		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if (out != null) {
				try {
					out.close();
				} catch (Exception ex) {
					throw new RuntimeException(ex);
				}
			}
		}
	}
}
