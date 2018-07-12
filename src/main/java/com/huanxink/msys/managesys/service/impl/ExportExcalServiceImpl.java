package com.huanxink.msys.managesys.service.impl;

import com.huanxink.msys.managesys.service.ExportExcalService;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;

import java.io.*;

public class ExportExcalServiceImpl implements ExportExcalService {

   public void export(String OutputStream){
        String path = "";//自己定义excel的路径
       // File file = new File(path);
       try {
          // file.createNewFile();//创建一个空的excel
         /*  FileInputStream fileIn = new FileInputStream(path);//path为excel
           POIFSFileSystem fs = new POIFSFileSystem(fileIn);
           HSSFWorkbook wb = new HSSFWorkbook(fs);
           HSSFSheet sheet = wb.getSheetAt(0);//获得第一张sheet
//下面给表的第一行第一列赋值
           HSSFRow row = sheet.getRow(0);//第一行对应0
           HSSFCell cell = row.getCell(0);//第一列对应0
           cell.setCellValue("值");*/
//写回到excel
           ByteArrayOutputStream baos = new ByteArrayOutputStream();
          // wb.write(baos);
           File files = new File(path);
           FileOutputStream fo = new FileOutputStream(files);
           baos.writeTo(fo);
           fo.flush();
           fo.close();
       } catch (IOException e) {
           e.printStackTrace();
       }
    }
}
