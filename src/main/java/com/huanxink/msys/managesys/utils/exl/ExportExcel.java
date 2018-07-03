package com.huanxink.msys.managesys.utils.exl;

import lombok.Data;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Data
public class ExportExcel {
    /**显示的导出表的标题  */
    private String title;  
    /** 导出表的列名  */
    private String[] rowName ;  
      
    private List<Object[]>  dataList;
      
    HttpServletResponse response;
      
    public ExportExcel(String title, String[] rowName, List<Object[]>  dataList){
        this.dataList = dataList;  
        this.rowName = rowName;  
        this.title = title;
    }

	public ExportExcel(String[] rowName, List<Object[]>  dataList){
		this.dataList = dataList;
		this.rowName = rowName;
	}
}
