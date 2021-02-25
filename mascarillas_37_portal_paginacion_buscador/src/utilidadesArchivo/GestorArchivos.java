package utilidadesArchivo;

import java.io.File;
import java.io.IOException;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import modelo.Mascarilla;

public class GestorArchivos {
	
	public static void guardarPortadaMascarilla(Mascarilla m, String rutaReal) {
		String nombreArchivo = m.getId()+".jpg";
		CommonsMultipartFile mf = m.getPortada();
		String rutaSubidas = rutaReal + "/subidas";
		//Si no existe la ruta la creo
		File fileRutaSubidas = new File(rutaSubidas);
		if (! fileRutaSubidas.exists()) {
			fileRutaSubidas.mkdirs();
		}
		//Ahora copio la información de la portada en un archivo con el nombre/ruta indicada
		byte[] infoPortada = mf.getBytes();
		if (infoPortada.length > 0) {
			String ruta = rutaSubidas + "/" + nombreArchivo ;
			try {
				FileCopyUtils.copy(infoPortada, new File(ruta));
				System.out.println("Archivo subido en: " + ruta);
			} catch (IOException e) {
				System.out.println("Error al subir un archivo." + e.getMessage());
				e.printStackTrace();
			}
			
		}
	}//end guardarPortadaMascarilla
	
}//end class
