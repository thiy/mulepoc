package com.temenos.dataframework.transformer;

import java.io.StringReader;
import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;

import org.mule.api.transformer.TransformerException;
import org.mule.transformer.AbstractTransformer;

import com.temenos.dataframework.database.Database;
import com.temenos.dataframework.database.Table;
import com.temenos.dataframework.database.Table.Column;

public class T24XmlToDBXml extends AbstractTransformer {

	public Object doTransform(Object src, String encoding)
			throws TransformerException {
		
		Database database = null;
		JAXBContext jaxbContext;
		try {
			jaxbContext = JAXBContext.newInstance(Database.class);
		Unmarshaller unmarshaller = jaxbContext.createUnmarshaller();

		StringReader reader = new StringReader((String)src);
		database = (Database) unmarshaller.unmarshal(reader);
		
		} catch (JAXBException e) {
			throw new TransformerException(this, e);
		}

		List<String> dmlStatement = new ArrayList<String>();
		for(Table table: database.getTable()) {
			
						
			if("insert".equalsIgnoreCase(table.getAction())) {
				dmlStatement.add(generateInsertStatement(table));
			} else if("update".equalsIgnoreCase(table.getAction())) {
				dmlStatement.add(generateUpdateStatement(table));
			} else if("delete".equalsIgnoreCase(table.getAction())) {
				dmlStatement.add(generateDeleteStatement(table));
			}
			
		}
		return dmlStatement;
	}

	private String generateInsertStatement(Table table) {
		StringBuffer buffer = new StringBuffer();
		buffer.append("INSERT INTO ").append(table.getTableName());
		StringBuffer columnNames = new StringBuffer();
		StringBuffer columnValues = new StringBuffer();
		boolean firstElement = true;
		
		for(Column column : table.getColumn()) {
			if(!firstElement){
				columnNames.append(", ");
				columnValues.append(", ");
			} else {
				firstElement = false;
			}
			columnNames.append(column.getColumnName());
			columnValues.append("'").append(column.getValue()).append("'");
		}
		
		buffer.append(" (").append(columnNames).append(") VALUES (").append(columnValues).append(")");

		return buffer.toString();
	}

	private String generateUpdateStatement(Table table) {
		StringBuffer buffer = new StringBuffer();
		buffer.append("UPDATE ").append(table.getTableName()).append(" SET ");
		boolean firstElement = true;
		
		for(Column column : table.getColumn()) {
			if(!firstElement){
				buffer.append(", ");
			} else {
				firstElement = false;
			}
			buffer.append(column.getColumnName()).append("=").append("'").append(column.getValue()).append("'");
		}
		
		buffer.append(" WHERE ").append(table.getWhere().getColumnName()).append("='").append(table.getWhere().getValue()).append("'");
		
		return buffer.toString();
	}

	private String generateDeleteStatement(Table table) {
		StringBuffer buffer = new StringBuffer();
		buffer.append("DELETE FROM ").append(table.getTableName());
		buffer.append(" WHERE ").append(table.getWhere().getColumnName()).append("='").append(table.getWhere().getValue()).append("'");
		return buffer.toString();
	}

}
