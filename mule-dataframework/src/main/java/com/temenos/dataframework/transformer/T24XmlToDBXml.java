package com.temenos.dataframework.transformer;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.StringReader;
import java.io.StringWriter;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

import org.mule.api.transformer.TransformerException;
import org.mule.transformer.AbstractTransformer;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.xml.sax.SAXException;

public class T24XmlToDBXml extends AbstractTransformer {

	public Object doTransform(Object src, String encoding)
			throws TransformerException {

		TransformerFactory tFactory = TransformerFactory.newInstance();
		StringWriter outWriter = new StringWriter();

		try {
			StreamResult result = new StreamResult(outWriter);
			System.out.println("xsl/"+getRootElement((String) src)+"ToDB.xsl");
			InputStream input = this.getClass().getClassLoader()
                    .getResourceAsStream("xsl/"+getRootElement((String) src)+"ToDB.xsl");
			System.out.println(input);
			Transformer transformer = tFactory.newTransformer(new StreamSource(input));
			transformer.transform(new StreamSource(new StringReader(
					(String) src)), result);

		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(outWriter.toString());
		return outWriter.toString();
	}

	private String getRootElement(String str) throws ParserConfigurationException, SAXException, IOException {
			DocumentBuilderFactory fact = DocumentBuilderFactory.newInstance();
			DocumentBuilder builder = fact.newDocumentBuilder();
			Document doc = builder.parse(new ByteArrayInputStream(str.getBytes("UTF-8")));
			Node node = doc.getDocumentElement();
			String root = node.getNodeName();
			System.out.println(root);
			return root;

	}
}
