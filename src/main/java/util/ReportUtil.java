package util;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.Serializable;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;

import net.sf.jasperreports.engine.JRExporter;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.export.JRXlsExporter;

@SuppressWarnings({"rawtypes", "unchecked"}) 
public class ReportUtil implements Serializable {

	private static final long serialVersionUID = 1L;
	
public byte[] geraRelatorioExcel(List listaDados, String nomeRelatorio, HashMap<String, Object> params, ServletContext servletContext) throws Exception {
		
		
		/*Cria a lista de dados que vem do nosso SQL da consulta feita*/
		JRBeanCollectionDataSource jrbcds = new JRBeanCollectionDataSource(listaDados);
		
		String caminhoJasper = servletContext.getRealPath("relatorio") + File.separator + nomeRelatorio + ".jasper";
		
		JasperPrint impressoaraJasper =  JasperFillManager.fillReport(caminhoJasper, params, jrbcds);
		
		JRExporter exporte = new JRXlsExporter();/*Excel*/
		
		exporte.setParameter(JRExporterParameter.JASPER_PRINT, impressoaraJasper);
		
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		exporte.setParameter(JRExporterParameter.OUTPUT_STREAM, baos);
		
		exporte.exportReport();
		return baos.toByteArray();
	};

	
	public byte[] geraRelatorioPDF(List listaDados, String nomeRelatorio, HashMap<String, Object> params, ServletContext servletContext) throws Exception {
		
		
		/*Cria a lista de dados que vem do nosso SQL da consulta feita*/
		JRBeanCollectionDataSource jrbcds = new JRBeanCollectionDataSource(listaDados);
		
		String caminhoJasper = servletContext.getRealPath("relatorio") + File.separator + nomeRelatorio + ".jasper";
		
		JasperPrint impressoaraJasper =  JasperFillManager.fillReport(caminhoJasper, params, jrbcds);
		
		
		return JasperExportManager.exportReportToPdf(impressoaraJasper);
	};
	
	
	
	public byte[] geraRelatorioPDF(List listaDados, String nomeRelatorio, ServletContext servletContext) throws Exception {
		
		
		/*Cria a lista de dados que vem do nosso SQL da consulta feita*/
		JRBeanCollectionDataSource jrbcds = new JRBeanCollectionDataSource(listaDados);
		
		String caminhoJasper = servletContext.getRealPath("relatorio") + File.separator + nomeRelatorio + ".jasper";
		
		JasperPrint impressoaraJasper =  JasperFillManager.fillReport(caminhoJasper, new HashMap(), jrbcds);
		
		
		return JasperExportManager.exportReportToPdf(impressoaraJasper);
	};
}
